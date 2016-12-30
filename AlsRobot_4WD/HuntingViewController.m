//
//  HuntingViewController.m
//  AlsRobot_4WD
//
//  Created by RainPoll on 16/5/26.
//  Copyright © 2016年 RainPoll. All rights reserved.
//

#import "HuntingViewController.h"
#import "ExperienceProgressView.h"

#import "HMView.h"


@interface HuntingViewController ()

@property(nonatomic,weak) IBOutlet HMView * hmView;

@end

@implementation HuntingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
     [self loadTheme];
    [self loadHMView];
}



-(void)loadTheme
{
    
    ExperienceProgressView *EV= [ExperienceProgressView experienceProgressView];
    
    EV.experienceProgress = 0.5;
    
    EV.batteryProgress = 0.15;
    
    EV.frame = CGRectMake(0, 0, 240, 72);
    
    UIView *exView= [self.view viewWithTag:1000];
    exView.backgroundColor = [UIColor clearColor];
    [exView addSubview: EV];
}

-(void)loadHMView
{
    self.hmView.lineColor = [UIColor blueColor];
    
    self.hmView.lineWidth = 8;
    
   // self.hmView.speed = 0.5;
}


-(IBAction)btnClick:(UIButton *)sender
{
    switch (sender.tag) {
            
        case 10:
            [self dismissViewControllerAnimated:YES completion:nil];
            
            break;
        case 20:
            
            
            break;
        case 30:
            break;
        case 100:
            
            [self.hmView reStart];
            
            break;
        case 200:
            
            break;
        case 300:
            [self.hmView clear];
            break;
            
        default:
            break;
    }
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
