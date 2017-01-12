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
#import "XYAudio.h"

#import "NSMutableArray+Queue.h"





@interface HomeViewController ()<UIViewControllerTransitioningDelegate>

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *titleTopConstraint;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *tipConstraint;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *leftConstraint;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *leftSubConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *rightSubConstraint;

@end

@implementation HomeViewController{
    BOOL isShow;
}

-(void)testArr{
    
    NSMutableArray *arr = [@[] mutableCopy];
    [arr unshift:@1];
    [arr unshift:@2];
    
    NSLog(@"%@----%@---%@",[arr pop],[arr pop],[arr pop]);
    
    [arr push:@3];
    [arr push:@4];
    
    NSLog(@"%@----%@---%@",[arr pop],[arr pop],[arr pop]);
}


-(void)leftButtonClick{
 //   [super leftButtonClick];
}

-(void)rightButtonClick{
    [super rightButtonClick];
    
    [self pressAnimationHide:^{
        [self custumSetingViewSkip];
    }];
}


-(void)TitleAnimation
{
   [UIView animateWithDuration:1 delay:0 usingSpringWithDamping:0.6 initialSpringVelocity:0.5 options:UIViewAnimationOptionLayoutSubviews animations:^{
       if (isShow) {
           self.titleTopConstraint.constant = 0;

       }else{
           self.titleTopConstraint.constant = 50;
       }
       
        [self.view layoutIfNeeded];
        
    } completion:nil];
}

-(void)topAnimation{
    
    [UIView animateWithDuration:1 delay:0 usingSpringWithDamping:0.6 initialSpringVelocity:0.5 options:UIViewAnimationOptionLayoutSubviews animations:^{
        self.topConstraint.constant = isShow ? 0 : -90;

        
        [self.view layoutIfNeeded];
        
    } completion:nil];

}

-(void)bottomAnimation{

    if(isShow){
        [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:0.6 initialSpringVelocity:0.5 options:UIViewAnimationOptionLayoutSubviews animations:^{
            
            self.bottomConstraint.constant = 0;
            
            [self.view layoutIfNeeded];
            
        } completion:^(BOOL b){
            [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:0.6 initialSpringVelocity:0.5 options:UIViewAnimationOptionLayoutSubviews animations:^{
                self.leftSubConstraint.constant = isShow ? 16 : -200;
                self.rightSubConstraint.constant =  10;
                [self.view layoutIfNeeded];
                
            } completion:nil];
            
        }];
    }else{
        [UIView animateWithDuration:0.2 delay:0 usingSpringWithDamping:0.6 initialSpringVelocity:0.5 options:UIViewAnimationOptionLayoutSubviews animations:^{
             self.leftSubConstraint.constant = -200;
             self.rightSubConstraint.constant = 300;
             [self.view layoutIfNeeded];
            
        } completion:^(BOOL b){
            [UIView animateWithDuration:0.8 delay:0 usingSpringWithDamping:0.6 initialSpringVelocity:0.5 options:UIViewAnimationOptionLayoutSubviews animations:^{
                
                self.bottomConstraint.constant = -300;
                [self.view layoutIfNeeded];
                
            } completion:nil];
            
        }];
    }

}
-(void)leftAnimation{
    [UIView animateWithDuration:1 delay:0 usingSpringWithDamping:0.6 initialSpringVelocity:0.5 options:UIViewAnimationOptionLayoutSubviews animations:^{
        self.leftConstraint.constant = isShow ? -40 : -200;
        
        [self.view layoutIfNeeded];
        
    } completion:nil];

}

-(void)tipsAnimation{
 
    [UIView animateWithDuration:2.5 delay:0 usingSpringWithDamping:0.7 initialSpringVelocity:0.1 options:UIViewAnimationOptionCurveEaseOut animations:^{
        self.tipConstraint.constant = isShow ? -40 : -350;
        
        [self.view layoutIfNeeded];
        
    } completion:^(BOOL b){
        
//        [UIView animateWithDuration:1 delay:0 usingSpringWithDamping:0.1 initialSpringVelocity:0.5 options:UIViewAnimationOptionLayoutSubviews animations:^{
//            self.tipConstraint.constant = 0;
//            
//            [self.view layoutIfNeeded];
//            
//        } completion:nil];
    }];
    
}

-(void) testAnimation {
   
    [[XYAudio shareXYAudion]playMusicAtIndex:5];

    [self pressAnimationHide:nil];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3* NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [[XYAudio shareXYAudion]playMusicAtIndex:4];
        [self pressAnimationShow:nil];
    });
}

-(void)pressAnimationShow:(void(^)(void))compliment{
    [[XYAudio shareXYAudion]playMusicAtIndex:4];
    isShow = YES;
    [self tipsAnimation];
    [self topAnimation];
    [self bottomAnimation];
    [self leftAnimation];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.6 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        !compliment? : compliment();
    });
}

-(void)pressAnimationHide:(void(^)(void))compliment{
    
    [[XYAudio shareXYAudion]playMusicAtIndex:5];
    isShow = NO;
    [self tipsAnimation];
    [self topAnimation];
    [self bottomAnimation];
    [self leftAnimation];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.6 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        !compliment? : compliment();
    });
}


-(void)viewWillAppear:(BOOL)animated
{    NSLog(@"%s",__func__);

        isShow = YES;
        [self tipsAnimation];
        [self topAnimation];
        [self bottomAnimation];
        [self leftAnimation];
}

-(void)viewWillDisappear:(BOOL)animated
{
    NSLog(@"%s",__func__);
 //   dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1* NSEC_PER_SEC)), dispatch_get_main_queue(), ^{

            isShow = NO;
            [self tipsAnimation];
            [self topAnimation];
            [self bottomAnimation];
            [self leftAnimation];
  //  });
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self testArr];
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
            
         //   [self testAnimation];
            
           // [self custumDanceViewSkip];
            
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

-(void)custumSetingViewSkip
{
    UIViewController *toController = [[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]] instantiateViewControllerWithIdentifier:@"SetingViewController"];
    
    toController.transitioningDelegate = self;
    
    toController.modalPresentationStyle = UIModalPresentationCustom;
    
    [self presentViewController:toController animated:YES completion:nil];
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

//
//-(BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender
//{
//    NSLog(@"%@",identifier);
//    NSLog(@"%@",sender);
//    UIStoryboardSegue *se = [UIStoryboard storyboardWithName:@"main" bundle:[NSBundle mainBundle]]
//    
//    if () {
//        <#statements#>
//    }
//    return NO;
//}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/





@end
