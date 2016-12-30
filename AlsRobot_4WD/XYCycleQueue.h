//
//  XYCycleQueue.h
//  CycleQueque
//
//  Created by RainPoll on 16/1/15.
//  Copyright © 2016年 RainPoll. All rights reserved.
//

#ifndef XYCycleQueue_h
#define XYCycleQueue_h

#include <stdio.h>
#include <stdlib.h>

typedef void * id_c;

typedef struct cycleQueue{
    int headIndex;
    int tailIndex;
    id_c *arry;
    int quequeLength;
    
}cycleQueue;

typedef cycleQueue * CycleQueue;

typedef enum {No,Yes} Bool;




CycleQueue createCycleQueue(int n);

void freeCycleQueue(CycleQueue cQueue);

Bool isFull(CycleQueue cQueue);

Bool isEmpty(CycleQueue cQueue);

void print(CycleQueue cQueue);

Bool push(CycleQueue cQueue,id_c obj);

id_c pop (CycleQueue cQueue);

int count(CycleQueue cQueue);

#endif /* XYCycleQueue_h */
