//
//  ViewController.m
//  AlsRobot_4WD
//
//  Created by RainPoll on 16/5/23.
//  Copyright © 2016年 RainPoll. All rights reserved.
//

#import "ViewController.h"
#import "SetingView.h"

#import "ExperienceProgressView.h"

@interface ViewController ()

@property(nonatomic, weak)IBOutlet SetingView* setingView;
@property(nonatomic, weak)IBOutlet SetingView* setV;

@property(nonatomic,weak)IBOutlet ExperienceProgressView *exV;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    self.setV = [SetingView setingView];
//    
//    _setV.frame = CGRectMake(0, 0,374, 317);
//    
//    [self.setingView addSubview:_setV];
//    
//    self.setingView.backgroundColor = [UIColor clearColor];
  //  [self loadTheme];
}
-(void)loadTheme
{

    ExperienceProgressView *EV= [ExperienceProgressView experienceProgressView];
    
    EV.experienceProgress = 0.5;
    
    EV.batteryProgress = 0.08;
    
    EV.frame = CGRectMake(0, 0, 240, 72);

    [self.view addSubview: EV];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.setV show];
}


@end
