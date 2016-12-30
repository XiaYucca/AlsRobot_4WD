//
//  MegaBurner.m
//  AlsRobot_4WD
//
//  Created by RainPoll on 16/7/15.
//  Copyright © 2016年 RainPoll. All rights reserved.
//

#import "MegaBurner.h"
#import "mega1280Protect.h"
#import "XYSerialManage.h"

@interface MegaBurner ()
@property (nonatomic, strong)XYSerialManage *manage;
@end

@implementation MegaBurner


-(void)sendData:(NSData *)data{

    [self.manage writeData:data];
    
}

-(NSData *)dataWithMessage:(Message)message
{
    return [NSData dataWithBytes:message.data length:message.size];
}




@end
