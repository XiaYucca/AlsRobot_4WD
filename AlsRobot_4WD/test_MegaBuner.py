from ctypes import *

dllPath = "/Users/rainpoll/Desktop/mega1280Protect.dylib"

dll = CDLL(dllPath)

print dllPath

import serial


def getListFromMessage(message):
    x = [];
    for i in range(0, message.size, 1):
        x.append(message.data[i])
    print x
    return x;

def getMessageFromList(l):
    return (c_ubyte *len(l))(*l)

'''
    like structure From c
    POINTER(c_ubyte)  likes c code char *
    '''
class Message (Structure):
    _fields_= [('data',POINTER(c_ubyte)),
               ('size',c_uint)]

'''
    this can turn ordinary list to special list like c_byte and represent data type of char From c
    '''
sd = [1,2,3]
let = (c_ubyte *len(sd))(*sd)


'''
    defind args or returns data type
    '''
#dll.testarr.restype = c_char_list
dll.testarr.restype = POINTER(c_ubyte)

dll.test.argtype = Message
dll.test.restype = POINTER(c_ubyte)

'''
    using function
    '''
res = dll.testarr(getMessageFromList([10,20,30,40]))

message = Message(let,c_uint(3))
re = dll.test(message)

dll.printMessage(message)




getListFromMessage(message)



print re[2]











