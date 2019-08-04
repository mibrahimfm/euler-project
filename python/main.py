#coding: utf-8

#author: Matheus Ibrahim

import math

def gcd(m, n):
    while(m!= 0):
        c = m
        m = n % m
        n = c
    return n

def lcm(x, y):
    return x * (y / gcd(x,y))

def P(limit, streak):
    multiple = streak
    for i in range(2, streak):
        multiple = lcm(multiple, i)
    
    limit-=2

    minimum = limit // multiple
    multiple = lcm(multiple, streak + 1)
    maximum = limit // multiple
    
    return minimum - maximum



def findResult():
    limit = 31
    result = 0
    pow = 4
    for i in range(1, limit+1):
        result += P(pow, i)
        pow *= 4
    print(math.floor(result))

findResult()
