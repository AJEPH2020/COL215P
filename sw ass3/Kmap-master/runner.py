#!/usr/bin/env python3
# -*- coding: utf-8 -*-

from Kmap import Minterms
from utils import Term
from ass4 import *


def test_result(strterms):


    str_terms = []



    t_minterms = []
    for term in str_terms:
        t_minterms.append(Term(term))
    minterms = Minterms(t_minterms)

    return minterms.simplify()



def opt_function_reduce(func_TRUE,func_DC):
    x = ['0110', '1000', '1001', '1010', '1011', '1100', '1101', '1110']
    return test_result(x)


# if __name__ == "__main__":
#     x = ['0110', '1000', '1001', '1010', '1011', '1100', '1101', '1110']
#     test_result(x)
