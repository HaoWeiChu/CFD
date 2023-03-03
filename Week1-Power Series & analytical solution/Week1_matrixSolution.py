# -*- coding: utf-8 -*-
"""
Created on Wed Sep 21 10:21:27 2022

@author: howger
"""

import numpy as np
import matplotlib.pyplot as plt
import math

X = np.arange(-3.14,3.14,0.01)
def f(x):
    y = math.cos(x)+math.sin(x)
    return y 
Y = np.vectorize(f)
plt.plot(X,Y(X),label=' Analyticaal')

def Powerseries(x):
    y1 =  1+ x + (-1/2)*x**2 + (-1/6)*x**3 +(1/24)*x**4+ (1/120)*x**5
    return y1
Ps = np.vectorize(Powerseries)
plt.plot(X,Ps(X),label=' Power Series')
plt.legend(loc='best')
