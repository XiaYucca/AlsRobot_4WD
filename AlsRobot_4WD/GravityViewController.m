//
//  GravityViewController.m
//  AlsRobot_4WD
//
//  Created by RainPoll on 16/6/7.
//  Copyright © 2016年 RainPoll. All rights reserved.
//

#import "GravityViewController.h"
#import "SteeringWheel.h"
#import "ExperienceViewSplit.h"


#import "XYQueue.h"

#define backBtnTag 10
#define setBtnTag 20

#define STEERINGWHEEL_GAT 1010

#define LABLE_FIRST_TAG 101
#define LABLE_SECOND_TAG 102
#define LABLE_THIRD_TAG 103

@interface GravityViewController ()

@property(nonatomic ,strong)XYQueue *que;

@end


@implementation GravityViewController


-(void)viewDidLoad
{
    [self setupView];
    
    [self setupQue:@"停止"];
}

-(void)setupQue:(NSString *)str
{
    self.que = [XYQueue xyQueueWithQueSize:3];
    [self pop:str];
}

-(void)pop:(NSString *)str
{
    [self.que push:str withPolicy:QUEUE_ASSOCIATION_COPY_NONATOMIC];
    
 //   [self testLabel];
}

-(void)testLabel:str
{
    UILabel *label = [self.view viewWithTag:LABLE_FIRST_TAG];
    UILabel *label2 = [self.view viewWithTag:LABLE_SECOND_TAG];
    UILabel *label3 = [self.view viewWithTag:LABLE_THIRD_TAG];

    if (str) {
        label3.text = label2.text;
        label2.text = label.text;
        label.text = str;
    }
}


-(void)setupView
{
    UIButton *btn = [self.view viewWithTag:backBtnTag];
    UIButton *stn = [self.view viewWithTag: setBtnTag];
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [stn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    UIView *stview = [self.view viewWithTag:STEERINGWHEEL_GAT];
    stview.backgroundColor = [UIColor clearColor];
    
    SteeringWheel *wheel = [[SteeringWheel alloc]initWithFrame:CGRectMake(0,0,stview.frame.size.width , stview.frame.size.height)];
    wheel.backgroundColor = [UIColor clearColor];
    wheel.bgImage = [UIImage imageNamed:@"摇杆-点击背景"];
    wheel.btnDrgImage = [UIImage imageNamed:@"摇杆运动的圆"];
    [stview addSubview:wheel];
    
    
    __weak GravityViewController* weakself = self;
    
    [wheel didDidDrag:^(DERICTION der) {
        
        NSLog(@"%d",der);
        NSString *str;
        switch (der) {
            case 0:
                str = @"机器人 停止";
                break;
            case 1:
                str = @"机器人 前进";
                break;
            case 2:
                str = @"机器人 左前";
                break;
            case 3:
                str = @"机器人 左转";
                break;
            case 4:
                str = @"机器人 左后";
                break;
            case 5:
                str = @"机器人 后退";
                break;
            case 6:
                str = @"机器人 右后";
                break;
            case 7:
                str = @"机器人 右转";
                break;
            case 8:
                str = @"机器人 右前";
                break;
            default:
                break;
        }
        
        [weakself testLabel:str];
    }];
    
    
    [self loadTheme];
}

-(void)btnClick:(UIButton *)sender
{
    switch (sender.tag) {
        case backBtnTag:
            
            [self dismissViewControllerAnimated:YES completion:nil];
            break;
            
        case setBtnTag:
            
            break;
    }
}


-(void)loadTheme
{
    
    ExperienceViewSplit *EV= [ExperienceViewSplit experienceProgressView];
    
    EV.experienceProgress = 0.5;
    EV.batteryProgress = 0.15;

    
    UIView *exView= [self.view viewWithTag:1000];
    exView.backgroundColor = [UIColor clearColor];
    [exView addSubview: EV];
}


@end
