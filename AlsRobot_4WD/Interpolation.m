//
//  Interpolation.m
//  AlsRobot_4WD
//
//  Created by RainPoll on 16/6/23.
//  Copyright © 2016年 RainPoll. All rights reserved.
//

#import "Interpolation.h"

#define S_MODE_K 1.0
#define S_MODE_A 8.0
#define S_MODE_B 16.0

#define XY_MIN(a,b) (a)>(b)? (b):(a)

@interface Interpolation ()

@property (nonatomic ,assign)float frequency;
@property (nonatomic ,strong)NSTimer *timer;

@property (nonatomic ,copy)void(^updataCallBack)(float);

@property (nonatomic ,copy)void(^endValueCallBack)(float);

@property (nonatomic ,assign)DataMode mode;

@end

@implementation Interpolation
{
    float startValue;
    float endValue;
    
    float temp;
    float dValue;
    float dDruation;
    
    float k,a,b;
    float g;
    
}

+(instancetype)interpolationwithFromValue:(float)fromValue
                                  ToValue:(float) toValue
                                 Duration:(float)duration
                                Frequency:(float)frequency
                                 DataMode:(DataMode)mode
                              UploadEvent:(void (^)(float value))callback
{

    Interpolation *temp = [[self alloc]init];
    temp.mode = mode;
    [temp interpolationFromValue:fromValue
                         ToValue:toValue
                        Duration:duration
                       Frequency:frequency
                     UploadEvent:callback];
    
    [temp startInterpolation];
    
    return temp;
}

+(instancetype)interpolationwithFromValue:(float)fromValue
                                  ToValue:(float) toValue
                                 Duration:(float)duration
                                Frequency:(float)frequency
                                 DataMode:(DataMode)mode
                              UploadEvent:(void (^)(float value))callback
                               Compliment:(void(^)(float endValue))compliment
{
    
    Interpolation *temp = [self interpolationwithFromValue:fromValue
                                                   ToValue:toValue
                                                  Duration:duration
                                                 Frequency:frequency
                                                  DataMode:mode
                                               UploadEvent:callback];
    temp.endValueCallBack = compliment;
    return temp;
}

-(void)startInterpolation
{
    [self testBackgroundChangleValue];
}


-(void)testBackgroundChangleValue
{
    dispatch_queue_t t =  dispatch_queue_create("test", DISPATCH_QUEUE_SERIAL);
    
    dispatch_async(t, ^{
        self.timer = [NSTimer timerWithTimeInterval:dDruation target:self selector:@selector(timeInterval:) userInfo:nil repeats:YES];
        [[NSRunLoop currentRunLoop] addTimer:_timer forMode:NSDefaultRunLoopMode];
        [[NSRunLoop currentRunLoop] run];
    });
    
}

-(void)timeInterval:(NSTimer *)timer
{
    static int times = 0;
//    static float orginValue = 0;
    
    float y = [self resultFormMode: (times++ / _frequency)];
    
    if (times >= _frequency) {
         [self.timer invalidate];
         self.timer = nil;
        
    dispatch_async(dispatch_get_main_queue(), ^{
            
            if (self.updataCallBack) {
                _updataCallBack(endValue);
            }
            if (self.endValueCallBack) {
                _endValueCallBack(endValue);
            }
        });
        return ;
    }
    float result = y * (temp) + startValue;
    dispatch_async(dispatch_get_main_queue(), ^{
        if (self.updataCallBack) {
            _updataCallBack(result);
        }
    });

}


-(float)resultFormMode :(float)x
{
    float result ;
    switch (self.mode) {
        case LineModeCurve:
            result = [self line_modecurve:x];
            break;
        case AccelerateModeCurve:
             result = [self accelerate_modecurve:x];
            break;
        case DelerateModeCureve:
             result = [self decelerate_modecurve:x];
            break;
        case S_LineModeCureve:
            result = [self s_modeCurve:x];
            break;
    }
    return result;
}

-(float)s_modeCurve:(float)x
{
    float y;
    y = 1.0 + expf(a-b*x);
    y = k / y;
    return  y;
}

-(float)line_modecurve:(float)x{
    return x;
}

-(float)accelerate_modecurve:(float)x
{
    return powf(x, 2);
}
-(float)decelerate_modecurve:(float)x
{
    return powf(x, 0.5);
}


-(float)interpolationFromValue:(float)fromValue ToValue:(float) toValue Duration:(float)duration Frequency:(float)frequency UploadEvent:(void (^)(float value))callback;
{
    startValue = fromValue;
    temp = toValue - fromValue;
    endValue = toValue;
    
    self.frequency = frequency * duration;
 
    float totalValue = temp / _frequency;
    
    dValue = totalValue;
    dDruation = duration / _frequency;
    
    k = S_MODE_K;
    a = S_MODE_A;
    b = S_MODE_B;
    
    self.updataCallBack = callback;
    return totalValue;
}



-(void)dealloc
{
    NSLog(@"delloc --");
}



@end
