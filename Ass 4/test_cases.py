#For 2 variable k map
from random import randint
from ass3 import *
from K_map_gui_tk import *

k1=[[1,'x'],[0,1]]

print("1.FOR 2 VARIABLE KMAP")
print("\n",end="")

t1=is_legal_region(k1,[None,None])

if(t1[2]==False and t1[0][0]==0 and t1[0][1]==0 and t1[1][0]==1 and t1[1][1]==1):
    print("Test case 1 passed")
    print("Term=[None,None], Expected output= ((0, 0),(1, 1), False)","Your output=",t1)
    print("\n",end="")


else:
    print("Test case 1 Failed!!")
    print("Term=[None,None], Expected output= ((0, 0),(1, 1), False)","Your output=",t1)
    print("\n",end="")
    
t2=is_legal_region(k1,[1,1])

if(t2[2]==True and t2[0][0]==1 and t2[0][1]==1 and t2[1][0]==1 and t2[1][1]==1):
    print("Test case 2  passed")
    print("Term=[1,1], Expected output= ((1, 1),(1, 1), True)","Your output=",t2)
    print("\n",end="")

else:
    print("Test case 2  Failed!!")
    print("Term=[1,1], Expected output= ((1, 1),(1, 1), True)","Your output=",t2)
    print("\n",end="")

t3=is_legal_region(k1,[0,None])

if(t3[2]==False and t3[0][0]==0 and t3[0][1]==0 and t3[1][0]==1 and t3[1][1]==0):
    print("Test case 3 passed")
    print("Term=[0,None], Expected output= ((0, 0),(1, 0), False)","Your output=",t3)
    print("\n",end="")

else:
    print("Test case 3 Failed!!")
    print("Term=[0,None], Expected output= ((0, 0),(1, 0), False)","Your output=",t3)
    print("\n",end="")

print("")
# For 3 variable kmap
print("2.FOR 3 VARIABLE KMAP")
print("\n",end="")


k2=[[1,'x',0,1],['x',1,0,'x']]

t4=is_legal_region(k2,[None,0,None])

if(t4[2]==True and t4[0][0]==0 and t4[0][1]==3 and t4[1][0]==1 and t4[1][1]==0):
    print("Test case 1  passed")
    print("Term=[None,0,None], Expected output= ((0, 3),(1, 0), True)","Your output=",t4)
    print("\n",end="")

else:
    print("Test case 1  Failed!!")
    print("Term=[None,0,None], Expected output= ((0, 3),(1, 0), True)","Your output=",t4)
    print("\n",end="")

t5=is_legal_region(k2,[None,None,None])
if(t5[2]==False and t5[0][0]==0 and t5[0][1]==0 and t5[1][0]==1 and t5[1][1]==3):
    print("Test case 2  passed")
    print("Term=[None,None,None], Expected output= ((0, 0),(1, 3), False)","Your output=",t5)
    print("\n",end="")

else:
    print("Test case 2  Failed!!")
    print("Term=[None,None,None], Expected output= ((0, 0),(1, 3), False)","Your output=",t5)
    print("\n",end="")

t6=is_legal_region(k2,[0,1,0])
if(t6[2]==True and t6[0][0]==0 and t6[0][1]==1 and t6[1][0]==0 and t6[1][1]==1):
    print("Test case 3 passed")
    print("Term=[0,1,0], Expected output= ((0, 1),(0, 1), True)","Your output=",t6)
    print("\n",end="")

else:
    print("Test case 3 Failed!!")
    print("Term=[0,1,0], Expected output= ((0, 1),(0, 1), True)","Your output=",t6)
    print("\n",end="")

print("")
# For 4 variable kmap
print("3.FOR 4 VARIABLE KMAP")
print("\n",end="")

k3=[[1,0,'x',0],[1,1,1,0],[1,'x','x',0],[1,0,1,0]]

t7=is_legal_region(k3,[None,0,None,0])
if(t7[2]==False and t7[0][0]==3 and t7[0][1]==3 and t7[1][0]==0 and t7[1][1]==0):
    print("Test case 1 passed")
    print("Term=[None,0,None,0], Expected output= ((3, 3),(0, 0), False)","Your output=",t7)
    print("\n",end="")

else:
    print("Test case 1 Failed!!")
    print("Term=[None,0,None,0], Expected output= ((3, 3),(0, 0), False)","Your output=",t7)
    print("\n",end="")

t8=is_legal_region(k3,[None,None,None,0])
if(t8[2]==False and t8[0][0]==3 and t8[0][1]==0 and t8[1][0]==0 and t8[1][1]==3):
    print("Test case 2 passed")
    print("Term=[None,None,None,0], Expected output= ((3, 0),(0, 3), False)","Your output=",t8)
    print("\n",end="")

else:
    print("Test case 2 Failed!!")
    print("Term=[None,None,None,0], Expected output= ((3, 0),(0, 3), False)","Your output=",t8)
    print("\n",end="")


t9=is_legal_region(k3,[1,1,0,0])
if(t9[2]==True and t9[0][0]==0 and t9[0][1]==2 and t9[1][0]==0 and t9[1][1]==2):
    print("Test case 3 passed")
    print("Term=[1,1,0,0], Expected output= ((0, 2),(0, 2), True)","Your output=",t9)
    print("\n",end="")

else:
    print("Test case 3 Failed!!")
    print("Term=[1,1,0,0], Expected output= ((0, 2),(0, 2), True)","Your output=",t9)
    print("\n",end="")

t10=is_legal_region(k3,[None,None,None,None])
if(t10[2]==False and t10[0][0]==0 and t10[0][1]==0 and t10[1][0]==3 and t10[1][1]==3):
    print("Test case 4 passed")
    print("Term=[None,None,None,None], Expected output= ((0, 0),(3, 3), False)","Your output=",t10)
    print("\n",end="")

else:
    print("Test case 4 Failed!!")
    print("Term=[None,None,None,None], Expected output= ((0, 0),(3, 3), False)","Your output=",t10)
    print("\n",end="")


