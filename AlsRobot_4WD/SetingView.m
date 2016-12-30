//
//  SetingView.m
//  AlsRobot_4WD
//
//  Created by RainPoll on 16/5/23.
//  Copyright © 2016年 RainPoll. All rights reserved.
//

#import "SetingView.h"
#import "XYAudio.h"

@interface SetingView ()

@property(nonatomic,copy) void(^dissmissComplete)();


@end

@implementation SetingView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

static BOOL canPlayMusic = YES;
static BOOL canPlayEffect = YES;

+(instancetype)setingView{
    
    return (SetingView *)[[[NSBundle mainBundle]loadNibNamed:@"SetingView" owner:self options:nil]firstObject];
}


-(IBAction)btnClick:(UIButton *)sender
{
    sender.selected = !sender.selected;
    
    switch (sender.tag) {
        case 10:
            
            break;
        case 20:
  
            
            break;
        case 30:
            
            break;
        case 40:

            break;
        case 50:
               !sender.selected ? [[XYAudio shareXYAudion]playMusicAtIndex:0] : [[XYAudio shareXYAudion]stopMusicAtIndex:0] ;
            canPlayMusic = !canPlayMusic;
            
            break;
        case 60:
               !sender.selected ? [[XYAudio shareXYAudion] setEnable:YES]: [[XYAudio shareXYAudion] setEnable:NO] ;
            canPlayEffect = !canPlayEffect;
            
            break;
        case 70:
            [self dismiss];
            break;
            
        default:
            [self dismiss];
            break;
    }
}

-(void)show
{
    [self upData];
    self.transform = CGAffineTransformMakeScale(0.01, 0.01);
    
    
   // self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:1];
    
    [UIView animateWithDuration:0.1 animations:^{
        
        self.backgroundColor = [UIColor clearColor] ;
        
       self.transform = CGAffineTransformMakeScale(1, 0.01);

    } completion:^(BOOL finished) {
//        !compliment ?:compliment(&_state);
//        self.stateBtn.selected = _state;
        
        [UIView animateWithDuration:0.25 animations:^{
            
//            self.transform = CGAffineTransformMakeScale(0.01, 0.01);
      //      self.backgroundColor = [[UIColor whiteColor]colorWithAlphaComponent:1];
            
                 self.transform = CGAffineTransformIdentity;
            
        }completion:^(BOOL finished){
            
            //  [self removeFromSuperview];
            
        }];

    }];
    
}

-(void)upData
{
    UIButton *opreatBtn = [self viewWithTag:10];
    UIButton *gravetBtn = [self viewWithTag:20];
    UIButton *lagBtn = [self viewWithTag:30];
    
    UIButton *musicBtn = [self viewWithTag:50];
    UIButton *effectBtn = [self viewWithTag:60];
    
    
    musicBtn.selected = !canPlayMusic;
    effectBtn.selected = !canPlayEffect;
}

-(void)dismiss
{
    self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:1.0];
    
    [UIView animateWithDuration:0.25 animations:^{
        
                self.backgroundColor = [[UIColor whiteColor]colorWithAlphaComponent:0.8];
        
        self.transform = CGAffineTransformMakeScale(1, 0.01);
        
    } completion:^(BOOL finished) {
        //        !compliment ?:compliment(&_state);
        //        self.stateBtn.selected = _state;
            [UIView animateWithDuration:0.25 animations:^{
                
                  self.transform = CGAffineTransformMakeScale(0.01, 0.01);
                 self.backgroundColor = [[UIColor whiteColor]colorWithAlphaComponent:1];
                
            }completion:^(BOOL finished){
                 [self removeFromSuperview];
                 !self.dissmissComplete ?: self.dissmissComplete();
            }];
    }];
}

-(void)dismissWithCompletion:(void(^)())complete
{
    [self didDismissCompletion:complete];
    
    [self dismiss];
}

-(void)didDismissCompletion:(void(^)())complete
{
    self.dissmissComplete = complete;
}



-(void)awakeFromNib
{
    [self show];
}


@end
