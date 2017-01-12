//
//  OperateViewController.m
//  AlsRobot_4WD
//
//  Created by RainPoll on 2017/1/10.
//  Copyright © 2017年 RainPoll. All rights reserved.
//

#import "OperateViewController.h"
#import "SteeringWheel.h"

#import "ExperienceViewSplit.h"
#import "XYQueue.h"


#define STEERINGWHEEL_GAT 1010

#define LABLE_FIRST_TAG 101
#define LABLE_SECOND_TAG 102
#define LABLE_THIRD_TAG 103


@interface OperateViewController ()

@end

@implementation OperateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setupView
{
//    UIButton *btn = [self.view viewWithTag:backBtnTag];
//    UIButton *stn = [self.view viewWithTag: setBtnTag];
//    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
//    [stn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    UIView *stview = [self.view viewWithTag:STEERINGWHEEL_GAT];
    stview.backgroundColor = [UIColor clearColor];
    
    SteeringWheel *wheel = [[SteeringWheel alloc]initWithFrame:CGRectMake(0,0,stview.frame.size.width , stview.frame.size.height)];
    wheel.backgroundColor = [UIColor clearColor];
    wheel.bgImage = [UIImage imageNamed:@"摇杆-点击背景"];
    wheel.btnDrgImage = [UIImage imageNamed:@"摇杆运动的圆"];
    [stview addSubview:wheel];
    
    
    __weak OperateViewController* weakself = self;
    
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
        
    //    [weakself testLabel:str];
    }];
    
    
//    [self loadTheme];
}

@end
