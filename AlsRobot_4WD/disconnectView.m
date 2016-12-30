//
//  disconnectView.m
//  AlsRobot_4WD
//
//  Created by RainPoll on 16/8/1.
//  Copyright © 2016年 RainPoll. All rights reserved.
//

#import "disconnectView.h"

#define MARK_TAG 100

@interface disconnectView ()

@property (nonatomic, strong)NSTimer *timer;
@property (nonatomic ,strong)UIImageView *imgeV;

@end

@implementation disconnectView

+(instancetype) disconnectView
{
    return [[[NSBundle mainBundle]loadNibNamed:@"disconnectView" owner:nil options:nil]firstObject];
}

-(void)awakeFromNib
{
    UIImageView *imgV = (UIImageView *)[self viewWithTag:MARK_TAG];
    self.imgeV = imgV;
    
    [self configAnimateMark];
}

-(void)configAnimateMark
{
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(animateMark) userInfo:nil repeats:YES];
    self.timer = timer;
    [[UIApplication sharedApplication].keyWindow addSubview: self];
    
}

-(void)animateMark
{
    static index = 0;
    index ++;
    
    if (index % 2) {
        
        [UIView animateWithDuration:0.4 animations:^{
            self.imgeV.transform = CGAffineTransformMakeScale(1.2, 1.2);
        }];
    }
    else
    {
        [UIView animateWithDuration:0.4 animations:^{
            self.imgeV.transform = CGAffineTransformMakeScale(0.8, 0.8);
        }];
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
