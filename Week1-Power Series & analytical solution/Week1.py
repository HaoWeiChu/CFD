# -*- coding: utf-8 -*-
"""
Created on Mon Sep 19 17:37:52 2022

@author: howger
"""

import numpy as np
import matplotlib.pyplot as plt
import math

'''
首先給定一個空集合串列，再使用for 迴圈進行 -PI > PI 的運算，並且將每次的結果加入串列，最後在製圖
'''
# Analytical solution
A = []
for i in np.arange(-3.14,3.14,0.01):
    def f(x):
        y = math.cos(x)+math.sin(x)
        return y 
    print(f(i))
    A.append(f(i))
X = np.linspace(0,628,628)
plt.plot(X,A,c='red',label= 'analytical')


#Power series solution
Ps =[]
for i in np.arange(-3.14,3.14,0.01):
    def Powerseries(x):
        y1 =  1+ x + (-1/2)*x**2 + (-1/6)*x**3 +(1/24)*x**4+ (1/120)*x**5
        return y1
    print(Powerseries(i))
    Ps.append(Powerseries(i))
plt.xlabel('number')
plt.ylabel(' value')
plt.plot(X,Ps,c ='blue',label='power series')
plt.legend(loc ='upper left')
plt.ylim(-1.5,2)
plt.show()

# A = []   
# for i in range(10):
#     A.append(i)
    

