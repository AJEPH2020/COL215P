def duplicate_remover(l):
    d=dict()
    result=[]
    for i in range(len(l)):
        if l[i] in d.keys():
            continue
        else:
            result.append(l[i])
            d[l[i]]=i
    
    d.clear()
    d=None
    return result



def gray_tb(s):
    s2=""
    i=0
    
    while(i<len(s)):
        if(i+1<len(s) and s[i+1]=="'"):
                s2=s2+"0"
                i=i+2
                continue
        else:
          s2=s2+"1"
        
        i=i+1
    return s2


def b_one_finder(string):
    count=0
    for i in range(len(string)):
        if(string[i]=='1'):
            count=count+1
    
    return count


def selection(chart,prime_implicants):
    temp=[]
    select=[0]*len(chart)
    for i in range(len(chart[0])):
        count=0
        rem=-1
        
        for j in range(len(chart)):
            if chart[j][i]==1:
             count += 1
             rem=j
        if(count==1):
            select[rem]=1
        
    
    for i in range(len(select)):
        if select[i]==1:
            for j in range(len(chart[0])):
                if(chart[i][j])==1:
                    for k in range(len(chart)):
                        chart[k][j]=0
            temp.append(prime_implicants[i])
    
    while 1:
        # print("yess")
        max_n=0
        rem=-1
        count_n=0
        for i in range(len(chart)):
            count_n=chart[i].count(1)

            if(count_n>max_n):
              max_n=count_n
              rem=i
        
        if(max_n)==0:
            return temp
        
        temp.append(prime_implicants[rem])

        
        for i in range(len(chart[0])):
            if(chart[rem][i]==1):
                for j in range(len(chart)):
                    chart[j][i]=0



def is_expansion_of(string1, string2, count):
       l1 = list(string1);l2=list(string2)
       count_n = 0
       for i in range(len(l1)):
            if l1[i] != l2[i]:
                  count_n += 1

       if count_n == count:
             return True
       else:
           return False


def prime_implicant_chart(prime_implicants, binary):
        #  print("Yes22222:",prime_implicants)
         chart = [[0 for x in range(len(binary))] for x in range(len(prime_implicants))]
         for i in range(len(prime_implicants)):
            count = prime_implicants[i].count('_')
            for j in range(len(binary)):
               if(is_expansion_of(prime_implicants[i], binary[j], count)):
                   chart[i][j] = 1

         return chart



def var_count(s):
    count=0
    for i in range(0,len(s)):
        if(s[i]!="'"):
            count=count+1
    
    return count



def bit_checker(s1, s2):
 l1 = (s1); l2 = (s2)
 count = 0
 for i in range(len(l1)):
    if l1[i] != l2[i]:
        count =count+ 1
        if count > 1:
         return -1
        else:
         l1 = l1[:i]+'_'+l1[i+1:]
   
 return((l1))



def prim_implicants_finder(term_list):

#   print(dic1)
  prime_implicants_list = []
#   print("Test:",term_list)
  while 1:
    term_marking = ['&']*len(term_list)
    table_at_present = []
    for i in range(len(term_list)):
        for j in range(i+1, len(term_list)):
            k=bit_checker(term_list[i], term_list[j])
            if k != -1:
                term_marking[i] = '@'
                term_marking[j] = '@'
                table_at_present.append(k) 
                # list3=dic1[btod(term_list[i])]
                # list3.append(j)
                # dic1[btod(term_list[i])]=list3
                
                #  print("k:",k)
            

    for  i in range(len(term_list)):
        if term_marking[i] == '&':
            prime_implicants_list.append(term_list[i])
    # print("prime_chart:",prime_implicants_list)
    if len(table_at_present) == 0:
        return prime_implicants_list
    term_list =duplicate_remover(table_at_present)
    # print(term_list)
    


def bin_text(s):
    j=97
    st=""
    for i in range(0,len(s)):
        if(s[i]=="1"):
            st=st+chr(j)
            j=j+1
        
        elif(s[i]=="0"):
            st=st+chr(j)+"'"
            j=j+1
        
        else:
            j=j+1
    
    return st

    

def opt_function_reduce(func_TRUE,func_DC):
 
 if(len(func_TRUE)==0 and len(func_DC)==0):
    return []
 if(len(func_TRUE)!=0):
  total_literals=var_count(func_TRUE[0])

 else:
    return []


  

 Minterms_list=[]

 for i in range(len(func_TRUE)):
    Minterms_list.append(gray_tb(func_TRUE[i]))

 DontCare_list=[]
 for i in range(len(func_DC)):
    DontCare_list.append(gray_tb(func_DC[i]))


 Total_terms=Minterms_list+DontCare_list

 final_grouped_list=[]
   
 k=0
 while(k<=total_literals):
    for i in range(len(Total_terms)):
        if(b_one_finder(Total_terms[i])==k):
            final_grouped_list.append(Total_terms[i])
    
    k=k+1


#  print(list(map(btod,final_grouped_list)))

 func_DC=prim_implicants_finder(final_grouped_list)
 
 chart = prime_implicant_chart(func_DC, Minterms_list)

 
 final_prime_implicants_in_text=[]
 
 for i in range(len(func_DC)):
    final_prime_implicants_in_text.append(bin_text(func_DC[i]))

#  print("Chart:")
#  for i in range(len(chart)):
    # print(chart[i])
  
 necessary_min_terms=selection(chart,func_DC)

 final_essential_prime_implicants_in_text=[]
 
 for i in range(len(necessary_min_terms)):
    final_essential_prime_implicants_in_text.append(bin_text(necessary_min_terms[i]))
#  print("Minterms list:",final_prime_implicants_in_text)
#  print("Necessary min terms:",necessary_min_terms)

 return final_essential_prime_implicants_in_text
 
 



