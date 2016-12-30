//
//  XYCycleQueue.c
//  CycleQueque
//
//  Created by RainPoll on 16/1/15.
//  Copyright © 2016年 RainPoll. All rights reserved.
//

#include "XYCycleQueue.h"

CycleQueue createCycleQueue(int n)
{
    CycleQueue temp = (CycleQueue)malloc(sizeof(cycleQueue));
    temp->arry = malloc(n*sizeof(void *));
    temp->headIndex = 0;
    temp->tailIndex = 0;
    temp->quequeLength = n+1;
    
    return temp;
}

void freeCycleQueue(CycleQueue cQueue){
    free(cQueue->arry);  
    free(cQueue);
}

Bool push(CycleQueue cQueue, id_c obj)
{
    
    if(isFull(cQueue))
    {
        return No;
        
    }
    else
    {
        cQueue->arry[cQueue->tailIndex]=obj;
        cQueue->tailIndex = (cQueue->tailIndex+1)%(cQueue->quequeLength);
        return Yes;
    }
}

id_c pop(CycleQueue cQueue)
{
    if(isEmpty(cQueue))
    {
        return NULL;
    }
    else
    {
        id_c val=cQueue->arry[cQueue->headIndex];
        cQueue->headIndex = (cQueue->headIndex+1)%cQueue->quequeLength;
        return val;
    }
}

Bool isEmpty(CycleQueue cQueue){
    
    if(cQueue->headIndex==cQueue->tailIndex)    //判断是否为空
    {   printf("arry is empty!\n");
        return Yes;
    }
    else
        return No;
}
Bool isFull(CycleQueue cQueue)
{
    if (cQueue->headIndex==(cQueue->tailIndex+1)%cQueue->quequeLength) {
        printf(" arry is full!\n");
        return Yes;
        
    }
    else return No;
}



void print(CycleQueue cQueue)
{   //printf("cqueue->headindex = %d , cqueue->tailindex = %d\n",cQueue->headIndex,cQueue->tailIndex);
    int i = cQueue->headIndex;
    while (i%cQueue->quequeLength != cQueue->tailIndex) {
        printf("%d <-- ",cQueue->arry[i]);
        i++;
    }
    printf("\n");
}