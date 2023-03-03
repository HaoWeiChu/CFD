import numpy as np
import matplotlib.pyplot as plt


'''
Boundary condition: {x=0, y= 100;  x=0.5, y=500}

Energy equation: (∂^2*T)/(∂X^2) =0

integral: T = Cx + D   =>  Y = a*X+b


'''

def f(x):
    y = 800*x +100 
    return y

x = np.linspace(0,0.5,100)
plt.plot(x,f(x))
plt.xlabel('length')
plt.ylabel('Temp')
plt.title('Week2')
plt.show()