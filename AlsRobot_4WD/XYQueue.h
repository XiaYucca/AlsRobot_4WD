//
//  KZDCycleQueue.h
//  test
//
//  Created by RainPoll on 16/7/5.
//  Copyright © 2016年 RainPoll. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef OBJC_ENUM(uintptr_t, queue_AssociationPolicy) {
    
    QUEUE_ASSOCIATION_ASSIGN = 0,           /**< Specifies a weak reference to the associated object. */
    QUEUE_ASSOCIATION_RETAIN_NONATOMIC = 1, /**< Specifies a strong reference to the associated object.
                                             *   The association is not made atomically. */
    QUEUE_ASSOCIATION_COPY_NONATOMIC = 3,   /**< Specifies that the associated object is copied.
                                             *   The association is not made atomically. */
    QUEUE_ASSOCIATION_RETAIN = 01401,       /**< Specifies a strong reference to the associated object.
                                             *   The association is made atomically. */
    QUEUE_ASSOCIATION_COPY = 01403          /**< Specifies that the associated object is copied.
                                             *   The association is made atomically. */
    };




@interface XYQueue : NSObject

+(instancetype)xyQueueWithQueSize:(int)queSize;
-(instancetype)initWithQueSize:(int)queSize;

//对于生命周期需要 队列管理的 调用该方法
-(BOOL)push:(id)obj withPolicy:(queue_AssociationPolicy) policy;
-(id)popWithPolicy;

//对于生命周期不需要 队列进行管理的 可以使用该方法
-(void)push:(id)obj;
-(id)pop;


@end
