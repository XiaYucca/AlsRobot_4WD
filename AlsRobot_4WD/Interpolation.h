//
//  Interpolation.h
//  AlsRobot_4WD
//
//  Created by RainPoll on 16/6/23.
//  Copyright © 2016年 RainPoll. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Interpolation : NSObject

#warning s曲线 电脑模拟器可以运行 但是手机有问题 可能是手机cpu 和 电脑cpu计算能力的问题
//计算数据模型 线性
//           加速
//           减速
//           s型曲线
typedef enum : NSUInteger {
    LineModeCurve,
    AccelerateModeCurve,
    DelerateModeCureve,
    S_LineModeCureve
} DataMode;

//插值异步调用
//开始值
//结束值
//刷新频率
//更新回调
+(instancetype)interpolationwithFromValue:(float)fromValue
                                  ToValue:(float) toValue
                                 Duration:(float)duration
                                Frequency:(float)frequency
                                 DataMode:(DataMode)mode
                              UploadEvent:(void (^)(float value))callback;
//-(void)startInterpolation;

//插值调用 子线程compliment
//插值异步调用
//开始值
//结束值
//刷新频率
//更新回调
//完成回调
+(instancetype)interpolationwithFromValue:(float)fromValue
                                  ToValue:(float) toValue
                                 Duration:(float)duration
                                Frequency:(float)frequency
                                 DataMode:(DataMode)mode
                              UploadEvent:(void (^)(float value))callback
                               Compliment:(void(^)(float endValue))compliment;
@end
