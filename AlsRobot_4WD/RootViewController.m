//
//  RootViewController.m
//  AlsRobot_4WD
//
//  Created by RainPoll on 16/6/21.
//  Copyright © 2016年 RainPoll. All rights reserved.
//

#import "RootViewController.h"
#import "SetingView.h"
#import "UIButton+BJMusic.h"

#import "XYAudio.h"
#import "Interpolation.h"


#import "mega1280Protect.h"
#import "Burnerinterfaces.h"

#import "SteeringWheel.h"


#import "MusicProgressView.h"



@interface RootViewController ()

@property (nonatomic ,strong)NSTimer *timer;
@property (nonatomic ,copy)void(^updataCallBack)(float);
@property (nonatomic ,strong)Interpolation *intp;

@end

#define backBtnTag 10
#define setBtnTag 20

@implementation RootViewController
{

}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupView];

//    [self setValue:@1 forKey:@"test"];

   
    UIButton *btn = [self.view viewWithTag:backBtnTag];
    CGFloat with = btn.frame.size.width ;
  //  btn.bounds = CGRectMake(0, 0, 1, 1);
    /*
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [Interpolation interpolationwithFromValue:1 ToValue:300 Duration:1 Frequency:40 DataMode:S_LineModeCureve UploadEvent:^(float value) {

            NSLog(@"----%.5lf",value);
            
            //btn.transform = CGAffineTransformMakeScale(value, value);
           btn.frame = CGRectMake(0, value, 50, 50);
          //  self.view.bounds = CGRectMake(0, value, value, value);
        }];
   
    });
    */
    [self test];
    
}

Message testRecv()
{
    //unsigned char data[8] ={0x1b ,0x01, 0x00 ,0x01 ,0x0e ,0x01 ,0x6b};
//    Message m = {data,8};
    printf("testrecive");
    Message m = messageFormatByMessage(messageFromString("AVRISP_2"));
   
    printMessage(m);
    return m;
}

void testSend(Message m)
{
    printf("testSend ---> ");
    printMessage(m);
    printf("\r\n");
}

-(void)test
{
    uint8_t data[2]= {0x00,0x01};
    uint8_t data2[4]= {0x80,0x00,0x20,0x30};
    
    Message m1 = { data, 2};
    Message m2 = { data, 2};
    
    Message m3 = messageApendMessage(m1,m2);
    
    printMessage(messageSub(m3, 1 ,3));
    
    printMessage(sign_on());
    
    printMessage( messageApendMessage(m1,m2));
    
    printMessage(load_address(data2));
    
    printMessage(spi_multi(1,m1,0x80) );
    
//    MusicProgressView *m = [MusicProgressView musicProgresssView];
//    
//    m.frame = CGRectMake(0, 0, self.view.frame.size.width, 100);
//    
//    m.value = 0.5;
//    
//    [self.view addSubview: m];
//
    printf("test Protoct """"""""""""\r\n");
    
    regestFunc(testSend, testRecv);
    
    signOn();
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)setupView
{
    UIButton *btn = [self.view viewWithTag:backBtnTag];
    UIButton *stn = [self.view viewWithTag: setBtnTag];
    
    
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [stn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    
//    FaceView *face = [[FaceView alloc]initWithFrame:CGRectMake(50, 50, 300, 300)];
//    [self.view addSubview:face];
    [[XYAudio shareXYAudion]playMusicAtIndex:0];

    
}


-(IBAction)btnClick:(UIButton *)sender
{
    switch (sender.tag) {
            
        case backBtnTag:
            
//           [sender setDisableAnimation:YES];
             sender.disableAnimation = YES;
             [self dismissViewControllerAnimated:YES completion:nil];
             break;
            
        case setBtnTag:
            
            [self setingView];
            break;
            
    }
}


-(void)setingView
{
    SetingView *stV = [SetingView setingView];
    
    stV.bounds = CGRectMake(0, 0, 403, 376);
    
    stV.center = self.view.center;
    
    UIView *stBV = [[UIView alloc]initWithFrame:self.view.frame];
    
    stBV.backgroundColor = [[UIColor blackColor]colorWithAlphaComponent:0.9];
    
    [self.view addSubview:stBV];
    
    
    [stBV addSubview: stV];
    
    [stV show];
    
    __weak UIView * weakstBV = stBV;
    
    [stV didDismissCompletion:^{
        
        [weakstBV removeFromSuperview];
    }];
    
    NSLog(@"subView%@",[self.view subviews]);
}




@end
