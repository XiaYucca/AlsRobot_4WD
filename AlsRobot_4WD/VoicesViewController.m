//
//  VoicesViewController.m
//  AlsRobot_4WD
//
//  Created by RainPoll on 2017/1/10.
//  Copyright © 2017年 RainPoll. All rights reserved.
//

#import "VoicesViewController.h"

@interface VoicesViewController ()

@property(nonatomic , strong)NSTimer *timer;

@property(nonatomic , strong)UIImageView *btnIm;

@property(nonatomic , strong)UIImageView *voiceIm;

@end

@implementation VoicesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

@end
