//
//  SignInViewController.m
//  AlsRobot_4WD
//
//  Created by RainPoll on 16/5/25.
//  Copyright © 2016年 RainPoll. All rights reserved.
//

#import "SignInViewController.h"
#import "UIView+Extension.h"

@interface SignInViewController ()
@property (nonatomic ,strong)UIImageView *imageStampV;

@property (nonatomic ,assign)NSInteger receivedIndex;


@end

@implementation SignInViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *btn = [self.view viewWithTag:100];
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
}

-(CGPoint)changleState:(BOOL)state WithIndex:(NSInteger)index
{
    UIView *view = [self.view viewWithTag: (index+1) * 10];
    
    NSArray *subArr = [view subviews];
    

    
    [subArr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj isKindOfClass:[UIImageView class]]) {
            
            NSString *imageName = state ? @"已领取": @"未领取";
            UIImage *image =  [UIImage imageNamed:imageName];
            
            ((UIImageView *)obj).image = image;
            
           
        }
        if ([obj isKindOfClass:[UILabel class]]) {
            
            UIColor *color = state ? [UIColor whiteColor]:[UIColor lightGrayColor];
            
            ((UILabel *)obj).textColor  = color;
     }
        
    }];
    
    UIView *viewback = [self.view viewWithTag:80];
    float x = CGRectGetMinX(viewback.frame);
    float y = CGRectGetMinY(viewback.frame);
    
    CGPoint p =  CGPointMake(view.center.x+x, view.center.y+y - 15);
    
    return p;
    
}



-(void)btnClick:(UIButton *)btn
{
    NSLog(@"%s",__func__);
    [self animateStamp];
}

-(void)animateStamp
{
    UIImageView *imageV = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 40, 20)];
    
    imageV.image = [UIImage imageNamed:@"领取章.png"];
    
    self.imageStampV = imageV;
    
    imageV.center =  self.view.center;
    
    [self.view addSubview:imageV];
    
    imageV.transform = CGAffineTransformMakeScale(0.1, 0.1);
    
    static int tag ;
    tag = tag % 7;
    
    CGPoint center_t = [self changleState:YES WithIndex:tag++];

    
    
    [UIView animateWithDuration:0.1 animations:^{
        imageV.transform = CGAffineTransformMakeScale(5, 5);
    } completion:^(BOOL finished) {
        
        [UIView animateWithDuration:0.05 delay:0.3 options: UIViewAnimationOptionLayoutSubviews  animations:^{
            
             imageV.transform = CGAffineTransformMakeScale(1, 1);
            
            imageV.center = center_t;
            
        } completion:^(BOOL finished) {
            
            
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                
                [self dismiss];

            });
            
        }];
    }];
    
}

-(void)dismiss
{
    [self dismissViewControllerAnimated:YES completion:nil];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
