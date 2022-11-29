from K_map_gui_tk import *
from math import *
import random

def region(term,reg):                   # generalizing region find for n variables::
    n=len(term)                         # n-  number of variables
    k1=ceil(n/2)                        # k1- number of column variables
    k2=floor(n/2)                       # k2- number of row variables
    col=int(pow(2,k1))                  # col-number of columns
    row=int(pow(2,k2))                  # row-number of rows
    dict={}                             # dictionary of dictionaries of variables and their compliment's regions                
    for i in range(1,k1+k2+1):         
        reglist0=[]                     # variable's compliment region
        reglist1=[]                     # variable's region    
        temp={}                         # dictionary of a variable and it's compliment's regions
        if(i<k1+1):                     # first k1 iterations for column variables
            x=int(pow(2,k1-i))          # x is the partition length, explained in report
            var1=col
            var2=row
        else:                           # next k2 iterations for row variables
            x=int(pow(2,k1+k2-i))
            var1=row
            var2=col    
        for j in range(0,x):            # Out of col/row iterations, first x iterations for variable's compliment region 
            for k in range(0,var2):
                if(i<k1+1):
                    reglist0.append((k,j))
                else:
                    reglist0.append((j,k))    
        sum=x 
        alt=1                           # alt 1-denotes variable's region, alt 0-denotes variable's compliment region  
        while(sum+2*x < var1):          # next 2-2 partitions alternate between variable and it's compliment regions 
            for j in range(sum,sum+2*x):
                for k in range(0,var2):
                    if(i<k1+1):
                        if(alt==1):
                            reglist1.append((k,j))
                        else:
                            reglist0.append((k,j))
                    else:
                        if(alt==1):
                            reglist1.append((j,k))
                        else:
                            reglist0.append((j,k))        
            alt=(alt+1)%2
            sum=sum+2*x

        for j in range(sum,sum+x):      # the last partition
                for k in range(0,var2):
                    if(i<k1+1):
                        if(alt==1):
                            reglist1.append((k,j))
                        else:
                            reglist0.append((k,j))
                    else:
                        if(alt==1):
                            reglist1.append((j,k))
                        else:
                            reglist0.append((j,k))        
        sum=sum+x 
        temp[0]=set(reglist0)
        temp[1]=set(reglist1)
        dict[i]=temp
    for i in range(0,n):
        if(term[i]==None):
            continue
        elif(term[i]==0):
            reg=reg & dict[i+1][0]
        else:
            reg=reg & dict[i+1][1]

    return reg


def is_legal_region(kmap_function, term):
    
    # your code here
    #------------------------------------------------------------
    # for 2,3,4 variables
    regList=[]                                                  # list of all co-ordinates
    var=len(term)                                               # number of variables
    rowVar=floor(var/2)                                         # row variables
    colVar=ceil(var/2)                                          # column variables   
    row=int(pow(2,rowVar))                                      # number of rows
    col=int(pow(2,colVar))                                      # number of columns
    for i in range(0,row):
        for j in range(0,col):
            regList.append((i,j))

    reg=set(regList)                                            # initial set of all coordiates
    # call region function to get the region corresponding to the term 
    reg=region(term,reg)                                        
    
    #top-left and bottom-right coordinate finding 
    size=len(reg)                                               # reg is the required region
    count=0
    for val in reg:
        if(count==0):
            count=1
            min=val
            max=val
        else:
            if((min[0]-val[0])>=0 and (min[1]-val[1])>=0):
                min=val
            elif((val[0]-max[0])>=0 and (val[1]-max[1])>=0):
                max=val

    full=(max[1]-min[1]+1)*(max[0]-min[0]+1)                    # ideal, no-wrap case, element count
    if(size !=full):
        # wrap around case
        minDouble=min                                           # minDouble, a copy of min
        maxDouble=max                                           # maxDouble, a copy of max
        if(max[0]-min[0]==row-1 and max[1]-min[1]==col-1):      # min, max- top-left and bottom-right extremities of k-map 
            if(var==4 and size==4):                             # region is only the 4 extremities of the k-map, 4 variable 
                min=maxDouble                                   # complete swap 
                max=minDouble
            elif(var==4 and size==8):
                if(len(reg.intersection({(0,1)}))==0):          # wrap around full 1st and 4th column, 4 variable 
                    min=(minDouble[0],maxDouble[1])             # partial swap 
                    max=(maxDouble[0],minDouble[1])
                else:                                           # wrap around full 1st and 4th row, 4 variable
                    min=(maxDouble[0],minDouble[1])
                    max=(minDouble[0],maxDouble[1])
            elif(var==3):                                       # wrap around full 1st and 4th column, 3 variable
                min=(minDouble[0],maxDouble[1])
                max=(maxDouble[0],minDouble[1])    
        elif(max[0]-min[0]==row-1):                             # wrap around 1st and last row, k variables (2,3 or 4)
            min=(maxDouble[0],minDouble[1])
            max=(minDouble[0],maxDouble[1])
        else:                                                   # wrap around 1st and last column, k variables (2,3 or 4) 
            min=(minDouble[0],maxDouble[1])
            max=(maxDouble[0],minDouble[1])    

    # we have the min and max co-ordinates now  
    # min- top left coordinate, max- bottom right coordinate of the square/rectangular region formed
    
    # for checking legality      
    bol=True
    for val in reg:
        if(kmap_function[val[0]][val[1]]==0):
            bol=False
            break
    return (min,max,bol)    

    #-----------------------------------------------------


mp = {}

def expand_term(kmap_function, term, reg, index):

    # print('|  '*index, end = '')
    # print(term)

    if(index >= len(term)):
        return term.copy()
    
    if mp.__contains__(str(term)):
        return mp[str(term)]

    x = term.copy()
    a = expand_term(kmap_function, x, reg, index+1)

    if (term[index]!=None):
        x = term.copy()
        x[index] = None

        if (is_legal_region(kmap_function, x)[2] == True):
            b = expand_term(kmap_function, x, reg, index+1)

            if ((len(a)-a.count(None)) > (len(b)-b.count(None))):
                # print("Current term expansion: " + str(term))
                # print("Next Legal Terms for Expansion: " + str(x))
                # print("Expanded Term: " + str(b), end = "\n\n")
                mp[str(term)] = b
                return b

    mp[str(term)] = a
    return a



def str_to_term(stri, no_of_variables):
    term = [1]*no_of_variables

    char_no = 0
    for j in range(1,len(stri)):
        if (stri[j] == "'"):
            term[char_no] = 0
        else:
            char_no += 1

    return term


def term_to_str(final_term):
    stri = ""

    for j in range(len(final_term)):
        if (final_term[j]==1):
            stri += chr(ord('a') + j)
        if (final_term[j]==0):
            stri += chr(ord('a') + j) + "'"
        else:
            pass
    
    return stri


def all_combinations(final_term, index, combs):
    
    if(index >= len(final_term)):
        combs.insert(len(combs),final_term)
        return

    if(final_term[index] == None):
        x = final_term.copy()
        x[index] = 0

        all_combinations(x, index+1, combs)


        y = final_term.copy()
        y[index] = 1

        all_combinations(y, index+1, combs)
    else:
        x = final_term.copy()

        all_combinations(x, index+1, combs)


def comb_function_expansion(func_TRUE, func_DC):
    """
        determines the maximum legal region for each term in the K-map function
        Arguments:
            func_TRUE: list containing the terms for which the output is '1'
            func_DC: list containing the terms for which the output is 'x'
        Return:
            a list of terms: expanded terms in form of boolean literals
    """
    # your code here

    test_str = func_TRUE[0]
    dash = test_str.count('\'')
    no_of_variables = len(test_str)-dash

    rowVar=floor(no_of_variables/2)                                         # row variables
    colVar=ceil(no_of_variables/2)                                          # column variables   
    row=int(pow(2,rowVar))                                      # number of rows
    col=int(pow(2,colVar))                                      # number of columns

    arr = [[0 for x in range(col)] for y in range(row)] 

    # ----

    regList=[] 
    for i in range(0,row):
        for j in range(0,col):
            regList.append((i,j))

    reg=set(regList)                                            # initial set of all coordiates

    # call region function to get the region corresponding to the term 
    for i in range(len(func_TRUE)):

        stri = func_TRUE[i]

        term = str_to_term(stri, no_of_variables)

        crd = region(term,reg)
        courd = random.sample(crd, 1)[0]

        arr[courd[0]][courd[1]] = 1


    for i in range(len(func_DC)):

        stri = func_DC[i]

        term = str_to_term(stri, no_of_variables)

        crd = region(term,reg)
        courdinate = random.sample(crd, 1)[0]

        arr[courdinate[0]][courdinate[1]] = None

    # ----

    ans = ["" for x in range(len(func_TRUE))]

    mp.clear()

    for i in range(len(func_TRUE)):

        stri = func_TRUE[i]

        # print("Current term expansion: " + stri)

        initial_term = str_to_term(stri, no_of_variables)
        
        final_term = expand_term(arr,initial_term,reg,0) # ----

        combs = [] 
        all_combinations(final_term, 0, combs)

        combs.remove(initial_term)

        for j in range(len(combs)):
            combs[j] = term_to_str(combs[j])

        # print("Next Legal Terms for Expansion: ", end = '')

        # for j in range(len(combs)):
        #     print(combs[j], end=',  ')

        # print('')

        # progress bar
        # print((i+1)*100//len(func_TRUE), end="% \r")


        stri = term_to_str(final_term)

        # print("Expanded Term: " + stri, end = "\n\n")

        ans[i] = stri


    return ans
    