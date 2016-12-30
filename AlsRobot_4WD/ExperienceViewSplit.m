//
//  ExperienceViewSplit.m
//  AlsRobot_4WD
//
//  Created by RainPoll on 16/8/3.
//  Copyright © 2016年 RainPoll. All rights reserved.
//


#import "ExperienceViewSplit.h"
#import "UIView+Extension.h"


@interface ExperienceViewSplit ()

@property (nonatomic ,weak)UIView *experienceV;

@property (nonatomic ,weak)UIView *batteryV;

@property (nonatomic ,weak)UILabel *numberLaber;

@property (nonatomic ,weak)UILabel *gradeLaber;
@end


@implementation ExperienceViewSplit

+(instancetype)experienceProgressView
{
    return  [[[NSBundle mainBundle]loadNibNamed:@"ExperienceViewSplit" owner:self options:nil]firstObject] ;
}

-(void)awakeFromNib
{
    [self setUpUI];
}


-(void)setUpUI{
    
    self.experienceV = [self viewWithTag:100];
    self.batteryV = [self viewWithTag:200];
    self.gradeLaber = [self viewWithTag:10];
    self.numberLaber = [self viewWithTag:20];
    
    _warningProgress = 0.2;
}


-(void)drawRect:(CGRect)rect
{
    [self drawExperienceView];
    
    [self drawbatteryView];
}

-(void)drawbatteryView
{
    CGFloat interval = 4;
    
    CGFloat start_X = 0;
    CGFloat start_Y = interval;
    CGFloat with = (self.experienceV.width - 2 * interval) * _batteryProgress;
    CGFloat height = self.experienceV.height - 2 * interval;
    
    //self.experienceV.frame = CGRectMake(0, start_Y , with , height);
    
    UIView *subV = [self.batteryV viewWithTag:1000];
    
    if (!subV) {
        subV = [[UIView alloc]init];
        subV.tag = 1000;
    }
    
    subV.frame = CGRectMake(interval, start_Y , with , height);
    
    
    
    if (_batteryProgress > _warningProgress) {
        
        subV.backgroundColor =[UIColor colorWithRed:217/255.0 green:140/255.0 blue:19/255.0 alpha:1];
        subV.layer.cornerRadius = 4;
        subV.layer.masksToBounds = YES;
    }
    else
    {
        subV.backgroundColor = [UIColor redColor];
    }
    
    [self.batteryV addSubview:subV];
    
    _batteryV.layer.borderWidth = 2;
    _batteryV.layer.borderColor = [UIColor colorWithRed:63/255.0 green:191/255.0 blue:254/255.0 alpha:1].CGColor;
    
    
}


-(void)drawExperienceView
{
    CGFloat interval = 4;
    
    CGFloat start_X = 0;
    CGFloat start_Y = interval;
    CGFloat with = (self.experienceV.width - 2 * interval) * _experienceProgress;
    CGFloat height = self.experienceV.height - 2 * interval;
    
    //self.experienceV.frame = CGRectMake(0, start_Y , with , height);
    
    
    UIView *subV = [self.batteryV viewWithTag:2000];
    
    if (!subV) {
        subV = [[UIView alloc]init];
        subV.tag = 2000;
    }
    subV.frame = CGRectMake(interval, start_Y , with , height);
    
    
    
    if (_experienceProgress > _warningProgress) {
        
        subV.backgroundColor = [UIColor colorWithRed:217/255.0 green:140/255.0 blue:19/255.0 alpha:1];
        
        subV.layer.cornerRadius = 4;
        subV.layer.masksToBounds = YES;
    }
    else
    {
        subV.backgroundColor = [UIColor redColor];
    }
    
    [self.experienceV addSubview:subV];
    
    _experienceV.layer.borderWidth = 2;
    _experienceV.layer.borderColor = [UIColor colorWithRed:63/255.0 green:191/255.0 blue:254/255.0 alpha:1].CGColor;
    
    
}




-(void)setExperienceProgress:(CGFloat)experienceProgress
{
    if (_experienceProgress != experienceProgress) {
        _experienceProgress = experienceProgress;
        
        [self setNeedsDisplay];
    }
}

-(void)setBatteryProgress:(CGFloat)batteryProgress
{
    if (_batteryProgress != batteryProgress) {
        _batteryProgress = batteryProgress;
        
        [self setNeedsDisplay];
        
    }
}






/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

@end



