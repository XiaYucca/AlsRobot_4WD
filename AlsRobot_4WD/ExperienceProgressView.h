//
//  ExperienceProgressView.h
//  AlsRobot_4WD
//
//  Created by RainPoll on 16/5/26.
//  Copyright © 2016年 RainPoll. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ExperienceProgressView : UIView

+(instancetype)experienceProgressView;

@property (nonatomic ,assign)CGFloat experienceProgress;

@property (nonatomic ,assign)CGFloat batteryProgress;

@property (nonatomic ,assign)CGFloat warningProgress;



@end
