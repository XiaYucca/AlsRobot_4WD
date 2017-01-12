//
//  SetingViewController.m
//  AlsRobot_4WD
//
//  Created by RainPoll on 2017/1/6.
//  Copyright © 2017年 RainPoll. All rights reserved.
//

#import "SetingViewController.h"
#import "XYAudio.h"


@interface SetingViewController ()

@property(nonatomic,weak)IBOutlet NSLayoutConstraint* top;

@end

@implementation SetingViewController

-(void)leftButtonClick{
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)viewAppearAnimate{
    [UIView animateWithDuration:0.3 delay:0 usingSpringWithDamping:0.5 initialSpringVelocity:0.5 options:UIViewAnimationOptionCurveEaseIn animations:^{
        
        _top.constant = 0;
        [self.view layoutIfNeeded];
        
    } completion:^(BOOL finished) {
        
    }];
    
}

-(void)viewDisappearAnimate{
    [UIView animateWithDuration:0.3 delay:0 usingSpringWithDamping:0.5 initialSpringVelocity:0.5 options:UIViewAnimationOptionCurveEaseIn animations:^{
        
        _top.constant = -90;
        [self.view layoutIfNeeded];
        
    } completion:^(BOOL finished) {
        
    }];
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated{
    NSLog(@"%s",__func__);
    [super viewWillAppear:YES];
    
    [XYAudio playMusicAtIndex:2];
    [self viewAppearAnimate];
    
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    NSLog(@"%s",__func__);
    [self viewDisappearAnimate];
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
