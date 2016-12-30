//
//  SetingView.h
//  AlsRobot_4WD
//
//  Created by RainPoll on 16/5/23.
//  Copyright © 2016年 RainPoll. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SetingView : UIView

+(instancetype)setingView;

-(void)show;

-(void)dismissWithCompletion:(void(^)())complete;


-(void)didDismissCompletion:(void(^)())complete;

@end
