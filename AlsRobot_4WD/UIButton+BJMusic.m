//
//  UIButton+BJMusic.m
//  AlsRobot_4WD
//
//  Created by RainPoll on 16/6/21.
//  Copyright © 2016年 RainPoll. All rights reserved.
//

#import "UIButton+BJMusic.h"
#import <objc/runtime.h>
#import "XYAudio.h"

static void *item;
static void *enbleAnimate;

@implementation UIButton (BJMusic)



//-(instancetype)init
//{
//    if (self = [super init]) {
//        
//    }
//    return self;
//}

-(void)playMusicByUrl:(NSURL *)url
{
   //objc_setAssociatedObject(self, &item, [XYAudio shareXYAudion], OBJC_ASSOCIATION_ASSIGN);
}

//-(void)setSelected:(BOOL)selected
//{
//    [super setSelected:selected];
//    
//    NSLog(@"调用了 uibutton 的分类");
//    NSLog(@"select number %d,class Number is %d",selected, (BOOL)[self valueForKey:@"selected"]);
//    [[XYAudio shareXYAudion]playMusicAtIndex:1];
//}


//-(void)setHighlighted:(BOOL)highlighted
//{
//    [super setHighlighted:highlighted];
//
//    [self addExternAnimation];
//}
- (BOOL)beginTrackingWithTouch:(UITouch *)touch withEvent:(nullable UIEvent *)event
{
      NSLog(@"test   ----");
    
    [self addExternAnimation];
    return   [super beginTrackingWithTouch:touch withEvent:event];


}


//-(BOOL)getDisableAnimation
//{
//
//}

-(void)setDisableAnimation:(BOOL)disableAnimation
{

    NSNumber *animationN = [NSNumber numberWithBool:disableAnimation];
    objc_setAssociatedObject(self, &enbleAnimate,animationN,OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


-(void)addExternAnimation
{
   NSNumber *n = objc_getAssociatedObject(self, &enbleAnimate);
    
    if (!n.boolValue) {
        
        [[XYAudio shareXYAudion]playMusicAtIndex:1];  //播放音乐

        CALayer *externLayer = [CALayer layer];
        externLayer.backgroundColor = [[[UIColor whiteColor] colorWithAlphaComponent:0.2] CGColor ];
        
        //   [self.layer addSublayer:externLayer];
        CGRect orFrame = self.layer.frame;
        
        CGFloat minRadiusX = CGRectGetWidth(orFrame);
        CGFloat minRadiusY = CGRectGetHeight(orFrame);
        
        externLayer.frame = CGRectMake(0, 0, minRadiusX, minRadiusX);
        externLayer.cornerRadius = minRadiusX *0.5;
        externLayer.masksToBounds = YES;
        
        externLayer.anchorPoint = CGPointMake(0.5, 0.5);
        
        //   [self.layer addSublayer: externLayer];
        
        
        
        [UIView animateWithDuration:0.2 animations:^{
            
            self.layer.transform = CATransform3DMakeScale(1.5, 1.5, 0.5);
            externLayer.transform = CATransform3DMakeScale(1.3, 1.3, 0);
            
            // self.layer.transform = CATransform3DMakeRotation(M_2_PI, 0, 0, 0);
        }completion:^(BOOL finished) {
            
            self.layer.transform = CATransform3DIdentity;
            //      [externLayer removeFromSuperlayer];
        }];

    }
    
}




-(void)dealloc
{
    objc_removeAssociatedObjects(self);
//    [super dealloc];
}

@end
