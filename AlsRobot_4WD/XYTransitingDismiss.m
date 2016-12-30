//
//  XYTransitingDismiss.m
//  AlsRobot_4WD
//
//  Created by RainPoll on 16/5/30.
//  Copyright © 2016年 RainPoll. All rights reserved.
//

#import "XYTransitingDismiss.h"

@implementation XYTransitingDismiss

-(NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return 0.25f;
}

//-(void)dismiss
//{
//    self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:1.0];
//    
//    [UIView animateWithDuration:0.25 animations:^{
//        
//        self.backgroundColor = [[UIColor whiteColor]colorWithAlphaComponent:0.8];
//        
//        self.transform = CGAffineTransformMakeScale(1, 0.01);
//        
//    } completion:^(BOOL finished) {
//        //        !compliment ?:compliment(&_state);
//        //        self.stateBtn.selected = _state;
//        [UIView animateWithDuration:0.25 animations:^{
//            
//            self.transform = CGAffineTransformMakeScale(0.01, 0.01);
//            self.backgroundColor = [[UIColor whiteColor]colorWithAlphaComponent:1];
//            
//        }completion:^(BOOL finished){
//            
//            //  [self removeFromSuperview];
//        }];
//    }];
//    
//    
//    
//}

-(void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    
    //Create the differents 3D animations
    CATransform3D viewFromTransform;
    CATransform3D viewToTransform;
    
    UIView *generalContentView = [transitionContext containerView];
    
    UIView *fromView = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey].view;
    UIView * toView = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey].view;
    
    NSLog(@"%@ +++++++++++%@",[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey],[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey]);
    
    
  //  toView.transform = CGAffineTransformMakeScale(0.01, 0.01);
    fromView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:1];
    
    fromView.tintColor = [UIColor blackColor];
    
    fromView.layer.backgroundColor = [UIColor blackColor].CGColor;
    
    
    //Add the to- view

   [generalContentView addSubview:fromView];
//    [generalContentView sendSubviewToBack:toView];
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext]* 0.5 animations:^{
        
        fromView.backgroundColor = [[UIColor blackColor]colorWithAlphaComponent:0.8];
        fromView.transform = CGAffineTransformMakeScale(1, 0.01);
        fromView.layer.backgroundColor = [UIColor blackColor].CGColor;
        
    } completion:^(BOOL finished) {
        
        [UIView animateWithDuration:[self transitionDuration:transitionContext]* 0.5 animations:^{
            
            fromView.transform =  CGAffineTransformMakeScale(0.01, 0.01);
            fromView.backgroundColor = [[UIColor blackColor]colorWithAlphaComponent:1];
               fromView.layer.backgroundColor = [UIColor blackColor].CGColor;
            
        }completion:^(BOOL finished){
            
            //  [self removeFromSuperview];
            [fromView removeFromSuperview];
            
            [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
            
        }];
    }];
}


@end
