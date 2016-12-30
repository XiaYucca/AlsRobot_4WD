//
//  KZDCycleQueue.m
//  test
//
//  Created by RainPoll on 16/7/5.
//  Copyright © 2016年 RainPoll. All rights reserved.
//

#import "XYQueue.h"
#include "XYCycleQueue.h"
#import <objc/runtime.h>

@interface XYQueue ()
@property (nonatomic ,assign)CycleQueue queue;
@end

@implementation XYQueue

+(instancetype)xyQueueWithQueSize:(int)queSize
{
    return [[self alloc]initWithQueSize:queSize];
}

-(instancetype)initWithQueSize:(int)queSize;
{
    if (self = [super init]) {
        [self setupQueueWithSize:queSize];
    }
    return self;
}

-(void)setupQueueWithSize:(int)size
{
   
    CycleQueue que2 = createCycleQueue(size);
    self.queue = que2;
}


//管理生命周期
-(void)push:(id)obj
{
    if(push(self.queue,(__bridge void*)obj))
    {
        NSLog(@"添加成功 %@",obj);
    }
}

-(BOOL)push:(id)obj withPolicy:(queue_AssociationPolicy) policy
{
    if (!isFull(self.queue) )
    {
        void *dataIndex = malloc(sizeof(void *));
        
        objc_setAssociatedObject(self, dataIndex, obj, policy);
        
        push(self.queue, dataIndex);
        return YES;
    }
    else
        return NO;
}


-(id)pop
{
    void* obj_c = pop(self.queue);
    id obj =  (__bridge id)obj_c;
    NSLog(@" pop ---> %@",obj);
    return obj;
}

-(id)popWithPolicy
{
    if (! isEmpty(self.queue) )
    {
        void *dataIndex = pop(self.queue);
        
        id obj = objc_getAssociatedObject(self, dataIndex);
        
        free(dataIndex);
        
        return obj;
    }
    else
        return nil;
}


-(void)dealloc
{
    freeCycleQueue(self.queue);
}
@end
