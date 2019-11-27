# -*- coding: utf-8 -*-

"""
Goal: Solve dXt = b(t, Xt)dt + sigma(t, Xt)dWt

Variable Description:
    
num_sims: number of simulations
t_init: start time
t_end: end time
t_step: size of the time step
x_init: initial value of x
b: function b(t, xt)
sigma: function sigma(t, xt)

"""

import numpy as np
import matplotlib.pyplot as plt


def SDE(num_sims, t_init, t_end, t_step, x_init, b, sigma):
    
    def dW(delta_t): 
        """Sample the increment of Wiener Process"""
        return np.random.normal(loc=0.0, scale=np.sqrt(delta_t))
    
    ts = np.arange(t_init, t_end, t_step) # t array
    xs = np.zeros(ts.size) # x array
    
    xs[0] = x_init # initial value of x
    
    for _ in range(num_sims):
        for i in range(1, ts.size):
            t = (i-1) * t_step
            x = xs[i-1]
            xs[i] = x + b(t,x) * t_step + sigma(t,x) * dW(t_step)
        plt.plot(ts, xs)
    
    plt.show()


## Test Case (Geometric Brownian Motion)
num_sims = 10  # number of simulations
t_init = 0
t_end  = 1
t_step = 0.001
x_init = 1 # initial condition

# function b and sigma
def b(t, x):
    return 0.8*x

def sigma(t,x):
    return 0.5*x

SDE(num_sims, t_init, t_end, t_step, x_init, b, sigma)