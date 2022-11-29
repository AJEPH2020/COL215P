from ass4 import *

tests=[
[["a'b'c'd'e'f", "a'b'c'de'f'", "a'b'cd'e'f", "a'b'cde'f'", "a'bc'd'e'f", "a'bc'd'ef", "a'bc'de'f'", "a'bc'def", "a'bcd'e'f", "a'bcd'ef'", "a'bcd'ef", "a'bcde'f'", "ab'c'd'e'f", "ab'cd'e'f'", "ab'cd'e'f", "ab'cd'ef'", "ab'cd'ef", "ab'cde'f'", "ab'cde'f", "ab'cdef'", "ab'cdef", "abc'd'e'f", "abc'de'f", "abcd'e'f"], ["a'b'c'd'e'f'", "abc'def'"]], # 3
[["abcdefghijklmno", "abcdefghijklm'n'o'", "abcdefghijklmn'o", "abcdefghijklm'n'o", "abcdefghijklm'no'"], ["abcdefghijklm'no", "abcdefghijklmn'o'", "abcdefghijklmno'"]] # 4
]


for test in tests:
  ans = comb_function_expansion(test[0],test[1])
  print(ans, end='\n\n')
