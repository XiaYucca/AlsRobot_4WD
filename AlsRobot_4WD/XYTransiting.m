//
//  XYTransiting.m
//  AlsRobot_4WD
//
//  Created by RainPoll on 16/5/30.
//  Copyright © 2016年 RainPoll. All rights reserved.
//

#import "XYTransiting.h"

@implementation XYTransiting

-(NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return 0.25f;
}

-(void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    
    //Create the differents 3D animations
    
    [self test1Animation:transitionContext];
}

-(void)test1Animation:(id<UIViewControllerContextTransitioning>)transitionContext
{
    CATransform3D viewFromTransform;
    CATransform3D viewToTransform;
    
    UIView *generalContentView = [transitionContext containerView];
    UIView *fromView = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey].view;
    UIView *toView = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey].view;
    
    
    toView.transform = CGAffineTransformMakeScale(0.01, 0.01);
    toView.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:1];
    
    
    
    //Add the to- view
    [generalContentView addSubview:toView];
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext]* 0.5 animations:^{
        
        toView.backgroundColor = [UIColor whiteColor];
        
        toView.transform = CGAffineTransformMakeScale(1, 0.01);
        
    } completion:^(BOOL finished) {
        
        [UIView animateWithDuration:[self transitionDuration:transitionContext]* 0.5 animations:^{
            
            toView.transform = CGAffineTransformIdentity;
            toView.backgroundColor = [[UIColor whiteColor]colorWithAlphaComponent:1];
            
        }completion:^(BOOL finished){
            
           //   [self removeFromSuperview];
            
            [fromView removeFromSuperview];
            [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
            
            
        }];
    }];

    
}

-(void)test2Animation:(id<UIViewControllerContextTransitioning>)transitionContext
{
    CATransform3D viewFromTransform;
    CATransform3D viewToTransform;
    
    UIView *generalContentView = [transitionContext containerView];
    UIView *fromView = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey].view;
    UIView *toView = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey].view;
    //Add the to- view
    [generalContentView addSubview:toView];
    
    viewFromTransform = CATransform3DMakeScale(0, 0.5, 0);
    
    viewFromTransform.m34 = -1.0 / 200.0;
    
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
       
        fromView.layer.transform = viewFromTransform;
        
    }completion:^(BOOL finished){
        
//      [self removeFromSuperview];
        if (finished) {
            fromView.layer.transform = CATransform3DIdentity;
            [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
        }
        
    }];
}









@end
