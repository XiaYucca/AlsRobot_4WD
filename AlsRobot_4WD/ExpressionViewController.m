//
//  Expression ViewController.m
//  AlsRobot_4WD
//
//  Created by RainPoll on 16/8/3.
//  Copyright © 2016年 RainPoll. All rights reserved.
//

#import "ExpressionViewController.h"
#import "FaceView.h"

#define FACEVIEW_LEFT 1001
#define FACEVIEW_RIGHT 1002

@interface ExpressionViewController ()

@property (nonatomic, strong)FaceView *lfaceV;
@property (nonatomic, strong)FaceView *rfaceV;

@property (weak, nonatomic) IBOutlet UIView *leftFace;

@end

@implementation ExpressionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

-(void)viewWillAppear:(BOOL)animated
{
   [self setupUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

-(void)setupUI
{
    NSLog(@"%@",_leftFace);
    
   UIView *l  = [self.view viewWithTag:FACEVIEW_LEFT];
   UIView *r  = [self.view viewWithTag:FACEVIEW_RIGHT];
    
    l.frame = CGRectMake(0, 0, 226, 226);
    r.frame = CGRectMake(0, 0, 226, 226);
    
    l.backgroundColor = [UIColor clearColor];
    r.backgroundColor = [UIColor clearColor];
    
    NSLog(@"%@",l);

    self.lfaceV = [[FaceView alloc]initWithFrame:CGRectMake(0, 0, l.frame.size.width, l.frame.size.height) ];
    self.rfaceV = [[FaceView alloc]initWithFrame:CGRectMake(0, 0, r.frame.size.width, r.frame.size.height) ];
    
    [l addSubview:_lfaceV];
    [r addSubview:_rfaceV];
    
}

- (IBAction)backBtn:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)helpBtn:(id)sender {
}

- (IBAction)clear:(id)sender {
    [_lfaceV clear];
    [_rfaceV clear];
}
- (IBAction)send:(id)sender {
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
