//
//  XunxianViewController.m
//  AlsRobot_4WD
//
//  Created by RainPoll on 16/8/1.
//  Copyright © 2016年 RainPoll. All rights reserved.
//

#import "XunxianViewController.h"
#import "ExperienceViewSplit.h"


@interface XunxianViewController ()
@end

@implementation XunxianViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self loadTheme];
  
}
-(void)viewWillAppear:(BOOL)animated
{

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)loadTheme
{
    
    ExperienceViewSplit *EV= [ExperienceViewSplit experienceProgressView];
    
    EV.experienceProgress = 0.5;
    EV.batteryProgress = 0.15;
    EV.frame = CGRectMake(0, 0, 575, 128);
    
    UIView *exView= [self.view viewWithTag:1000];
    
    exView.backgroundColor = [UIColor clearColor];
    [exView addSubview: EV];
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
