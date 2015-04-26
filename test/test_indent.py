#!/usr/bin/env python
# -*- coding: utf-8 -*-

#####################################################
#    File Name : test_indent.py
#       Author : @ytjiang
# Created Time : 2015-04-26 17:15:46
#        Usage : 
#
#     Revision : 
#####################################################

def printHelloWord():
    i = 5
    while(i):
        print "hello world"
        i -= 1
    for word in ('hello','world'):
        print "%s" %(word)
    print "Finihsed!"

if __name__ == "__main__":
    printHelloWord()
