//
//  VoiceViewController.m
//  AlsRobot_4WD
//
//  Created by RainPoll on 16/6/7.
//  Copyright © 2016年 RainPoll. All rights reserved.
//

#import "VoiceViewController.h"
#import "ExperienceViewSplit.h"


@interface VoiceViewController ()

@property(nonatomic , strong)NSTimer *timer;

@property(nonatomic , strong)UIImageView *btnIm;

@property(nonatomic , strong)UIImageView *voiceIm;

@end


@implementation VoiceViewController

-(void)viewDidLoad
{   [super viewDidLoad];
    [self setupView];
}
-(void)setupView
{
    UIButton *ytn = [self.view viewWithTag:100];
    [ytn addTarget:self action:@selector(voiceStart) forControlEvents:UIControlEventTouchDown];
    [ytn addTarget:self action:@selector(voiceEnd) forControlEvents:UIControlEventTouchUpInside];
    
    self.btnIm = [self.view viewWithTag:200];
    
//    [self.btnIm.layer setAnchorPoint:CGPointMake(0.5, 1)];
    
//    self.btnIm.center = ytn.center;
    

    
    NSLog(@"开始加载%@ ",self.btnIm);
}

-(void)voiceEnd
{
    [_timer invalidate];
    _timer = nil;
    
    UIImageView *im = [self.view viewWithTag:300];
    im.image = [UIImage imageNamed:@"语音-点击"];
  //      self.btnIm.image = [UIImage imageNamed:@"语音-点击"];
  //       [self.btnIm.layer setAnchorPoint:CGPointMake(0, 0)];
}

-(void)voiceStart
{
    if (_timer) {
        [_timer invalidate];
        
    }
    self.btnIm.image = [UIImage imageNamed:@"语音-动画"];
    [self.btnIm.layer setAnchorPoint:CGPointMake(0.5, 1)];
    
    UIImageView *im = [self.view viewWithTag:300];
    
    self.btnIm.center = im.center;
    im.image = [UIImage imageNamed:@"语音-未点击"];
   
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.025 target:self selector:@selector(voiceAnimate) userInfo:nil repeats:YES];
}

-(void)voiceAnimate
{
    self.btnIm.transform = CGAffineTransformRotate(_btnIm.transform, M_PI_2 / 8.0);

}

//-(void)loadTheme
//{
//    
//    ExperienceViewSplit *EV= [ExperienceViewSplit experienceProgressView];
//    
//    EV.experienceProgress = 0.5;
//    
//    EV.batteryProgress = 0.15;
//    
//    UIView *exView= [self.view viewWithTag:1000];
//    exView.backgroundColor = [UIColor clearColor];
//    [exView addSubview: EV];
//}
//



//-(void)btnClick:(UIButton *)sender
//{
//    switch (sender.tag) {
//        case backBtnTag:
//            
//            [self dismissViewControllerAnimated:YES completion:nil];
//            
//            break;
//            
//        case setBtnTag:
//            
//            break;
//    }
//}


@end
