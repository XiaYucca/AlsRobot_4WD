//
//  HomeViewController.m
//  AlsRobot_4WD
//
//  Created by RainPoll on 16/5/24.
//  Copyright © 2016年 RainPoll. All rights reserved.
//

#import "HomeViewController.h"
#import "ExperienceProgressView.h"
#import "SetingView.h"

#import "CubeAnimation.h"
#import "DismissAnimation.h"
#import "InteractAnimation.h"
#import "PresentAnimation.h"

#import "XYTransiting.h"
#import "XYTransitingDismiss.h"


@interface HomeViewController ()<UIViewControllerTransitioningDelegate>

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *titleTopConstraint;


@end

@implementation HomeViewController

-(void)TitleAnimation
{
  
//    
    [UIView animateWithDuration:1 delay:0 usingSpringWithDamping:0.1 initialSpringVelocity:0.5 options:UIViewAnimationOptionLayoutSubviews animations:^{
          self.titleTopConstraint.constant = 50;
        
        [self.view layoutIfNeeded];
        
    } completion:nil];
    
//
   // self.titleTopConstraint.constant = 0;
//      self.titleTopConstraint.constant = 50;
//
//    [UIView animateWithDuration:1 animations:^{
//        [self.view layoutIfNeeded];
//
//    }];
    
}
-(void)orginAnimation
{
     self.titleTopConstraint.constant = 0;
    [UIView animateWithDuration:1 delay:0 usingSpringWithDamping:0.1 initialSpringVelocity:0.5 options:UIViewAnimationOptionLayoutSubviews animations:^{

        [self.view layoutIfNeeded];
        
    } completion:nil];
}

-(void)viewWillAppear:(BOOL)animated
{
   // [self TitleAnimation];
}

-(void)viewWillDisappear:(BOOL)animated
{
   // [self TitleAnimation];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    ExperienceProgressView *EV= [ExperienceProgressView experienceProgressView];
    
    EV.experienceProgress = 0.5;
    
    EV.batteryProgress = 0.15;
    
    EV.frame = CGRectMake(0, 0, 240, 72);
    
    UIView *exView= [self.view viewWithTag:1000];
    exView.backgroundColor = [UIColor clearColor];
    [exView addSubview: EV];

}



-(IBAction)btnCilck:(UIButton *)sender
{
    switch (sender.tag) {
        case 10:
         //   back();
            break;
        case 20:
         //   [self setingView];
            break;
        case 30:
            
            break;
        case 40:
            
            break;
        case 50:
            
            break;
        case 60:
            
            break;
        case 70:
            
            break;
        case 80:
            
            break;
        case 100:
            
            
            [self custumDanceViewSkip];
            
            break;
        case 200:
          //  [self custumXunxianViewSkip];
          //  [self TitleAnimation];
            
            break;
        case 300:
          //  [self orginAnimation];
       //     [self custumHuntingViewSkip];
            
            break;
        case 400:
            
            break;
        case 500:
            NSLog(@"编程");
           
            [self openURL];
            
            break;
            
        case 600:
            
            break;
        case 700:
            
            break;
            
        default:
            break;
    }
}

-(void)openURL
{
    NSURL * myURL_APP_A = [NSURL URLWithString:@"googleBlock://"];
    
    if ([[UIApplication sharedApplication] canOpenURL:myURL_APP_A]) {
        NSLog(@"canOpenURL");
        [[UIApplication sharedApplication] openURL:myURL_APP_A];
    }
}

-(void)setingView
{
    SetingView *stV = [SetingView setingView];
    
    stV.bounds = CGRectMake(0, 0, 403, 376);
    
    stV.center = self.view.center;
    
    UIView *stBV = [[UIView alloc]initWithFrame:self.view.frame];
    
    stBV.backgroundColor = [[UIColor blackColor]colorWithAlphaComponent:0.9];
    
    [self.view addSubview:stBV];
    
    
    [stBV addSubview: stV];
    
    [stV show];
    
    __weak UIView * weakstBV = stBV;
    
    [stV didDismissCompletion:^{
        
        [weakstBV removeFromSuperview];
    }];
    
    NSLog(@"subView%@",[self.view subviews]);
}

-(void)custumDanceViewSkip
{
    UIViewController *toController = [[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]] instantiateViewControllerWithIdentifier:@"DanceViewController"];
    
    toController.transitioningDelegate = self;
    
    toController.modalPresentationStyle = UIModalPresentationCustom;
    
    [self presentViewController:toController animated:YES completion:nil];
}

-(void)custumXunxianViewSkip
{
    UIViewController *toController = [[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]] instantiateViewControllerWithIdentifier:@"XunxianViewController"];
    
    toController.transitioningDelegate = self;
    
    toController.modalPresentationStyle = UIModalPresentationCustom;
    
    [self presentViewController:toController animated:YES completion:nil];
}

-(void)custumHuntingViewSkip
{
    UIViewController *toController = [[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]] instantiateViewControllerWithIdentifier:@"HuntingViewController"];
    
    toController.transitioningDelegate = self;
    
    toController.modalPresentationStyle = UIModalPresentationCustom;
    
    [self presentViewController:toController animated:YES completion:nil];
}

//#pragma mark - animatedtransitioning delegate
//
//
//- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext
//{
//    return  2;
//}
//
//- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext
//{
//    
//    CATransform3D viewFromTransform;
//    CATransform3D viewToTransform;
//    
//    UIView *generalContentView = [transitionContext containerView];
//    
//    UIView *fromView = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey].view ;
//    
//    UIView *toView = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey].view;
//    
//    viewFromTransform = CATransform3DMakeRotation(M_PI, 0, 1, 0);
//    
//    viewToTransform = CATransform3DMakeRotation(-M_PI, 0, 1, 0);
//    
//
//    
//    
//    fromView.layer.transform = viewFromTransform;
//    
//    //fromView.layer.transform = viewFromTransform;
//    toView.layer.transform = viewToTransform;
//    
//    [generalContentView addSubview:toView];
//    
//}


-(id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    return [[XYTransiting alloc]init];
}

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    return [[XYTransitingDismiss alloc]init];
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
