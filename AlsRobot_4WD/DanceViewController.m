//
//  DanceViewController.m
//  AlsRobot_4WD
//
//  Created by RainPoll on 16/5/24.
//  Copyright © 2016年 RainPoll. All rights reserved.
//

#import "DanceViewController.h"
#import "iCarousel.h"
#import "CubeAnimation.h"
#import "XYAudio.h"

#import "ExperienceProgressView.h"
#import "MusicProgressView.h"


#define URL_AngryBirds [NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"bj" ofType:@"mp3"]]



@interface DanceViewController ()

@property (nonatomic, strong)AVAudioPlayer *audioPlay;
@property(nonatomic ,weak)IBOutlet iCarousel *icarousView;
@property (weak, nonatomic) IBOutlet UIView *progressV;


@property (weak, nonatomic) IBOutlet NSLayoutConstraint *titleTopConstraint;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *tipConstraint;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *leftConstraint;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *leftSubConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *rightSubConstraint;

@end



@implementation DanceViewController
{
    UIView *mainV;
}

-(void)leftButtonClick{
    
    
    [self topDisappearAnimation:^(BOOL finish) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.icarousView.type = iCarouselTypeCustom;
    
    self.icarousView.backgroundColor = [UIColor clearColor];
    
   // self.icarousView.perspective = -0.05;
    self.icarousView.stopAtItemBoundary = YES;
    
    self.progressV.backgroundColor = [UIColor clearColor];
    MusicProgressView *mv = [MusicProgressView musicProgresssView];
    
    NSLog(@"pprogres----%@",mv);
    
    mv.frame = self.progressV.bounds;
    
    mv.center = CGPointMake(self.progressV.frame.size.width * 0.5, self.progressV.frame.size.height * 0.5);
    
    [self.progressV addSubview: mv];
    
    [self loadTheme];
    
    mainV = [self.view viewWithTag:1111];

    
    
}

-(void)topAnimation{
    [UIView animateWithDuration:0.01 animations:^{
        self.leftConstraint.constant = 800;
        self.bottomConstraint.constant = -100;
        self.topConstraint.constant = -100;
        [mainV layoutIfNeeded];
        
    } completion:^(BOOL finished) {
        
        [UIView animateWithDuration:0.4 delay:0 usingSpringWithDamping:0.5 initialSpringVelocity:0.5 options:UIViewAnimationOptionCurveLinear animations:^{
            self.topConstraint.constant = 0;
            self.bottomConstraint.constant = 0 ;

            
            [mainV layoutIfNeeded];
        } completion:^(BOOL finished) {
              [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:0.7 initialSpringVelocity:0.7 options:UIViewAnimationOptionCurveLinear animations:^{
                  self.leftConstraint.constant = 0;
                  
                    [mainV layoutIfNeeded];
              } completion:nil];
        }];
        
    }];
}

//-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
//{
//    if ([[touches anyObject] locationInView: self.view].x > CGRectGetMaxX(self.view.frame)*0.5) {
//        
//        [self topDisappearAnimation];
//        
//    }else{
//        [self topAnimation];
//    }
//    
//}
-(void)topDisappearAnimation:(void(^)(BOOL finish))completion
{
    [UIView animateWithDuration:2 delay:0 usingSpringWithDamping:0.5 initialSpringVelocity:0.5 options:UIViewAnimationOptionCurveLinear  animations:^{
        
        self.leftConstraint.constant = 800;
        self.bottomConstraint.constant = -100;
        self.topConstraint.constant = -100;
        
        [self.view layoutIfNeeded];
    } completion:^(BOOL finished) {
        
          }];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        !completion ? : completion(YES);

    });
}

-(void)topDisappearAnimation{
    [self topDisappearAnimation:nil];
}



-(void)viewDidAppear:(BOOL)animated{

  

}

-(void)viewWillAppear:(BOOL)animated{
    [self topAnimation];
}
-(void)viewWillDisappear:(BOOL)animated{
    NSLog(@"%s",__func__);
    [self topDisappearAnimation];
}



-(IBAction)resumPlay:(id)sender
{
    
}


-(IBAction)randomPlay:(id)sender
{
    
}


-(void)loadTheme
{
    
    ExperienceProgressView *EV= [ExperienceProgressView experienceProgressView];
    
    EV.experienceProgress = 0.5;
    
    EV.batteryProgress = 0.15;
    
    EV.frame = CGRectMake(0, 0, 240, 72);
    
    UIView *exView= [self.view viewWithTag:1000];
    exView.backgroundColor = [UIColor clearColor];
    [exView addSubview: EV];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - icarouseldatasource

- (NSUInteger)numberOfItemsInCarousel:(iCarousel *)carousel
{
    return 6;
}
- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSUInteger)index reusingView:(UIView *)view
{
    NSLog(@"index %d",index);
    
    if (view == nil) {
        CGFloat viewWidth = self.icarousView.frame.size.height * 0.9;
        
        view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, viewWidth, viewWidth)];
        
        UIImageView *view1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, viewWidth, viewWidth)];
        UIImageView *view2 = [[UIImageView alloc] initWithFrame:CGRectMake(0, viewWidth*0.5, viewWidth, viewWidth)];
  //      UIImageView *view3 = [[UIImageView alloc] initWithFrame:CGRectMake(0, viewWidth*0.5, viewWidth, viewWidth)];
        
        //添加播放图标
        UIImageView *view4 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"跳舞_播放.png"]];
        view4.frame = CGRectMake(0, 0, 60, 60);
        view4.center = view1.center;
        [view1 addSubview:view4];
        
//        UILabel *lable = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(view1.frame)-50, CGRectGetWidth(view1.frame), 33)];
//        lable.text  =@"歌曲名称";
//        lable.textColor = [UIColor whiteColor];
//        [view1 addSubview:lable];
        
        //view2.transform = CGAffineTransformMakeRotation(M_PI);
        view2.layer.anchorPoint = CGPointMake(0.5, 1);
   //     view3.layer.anchorPoint = CGPointMake(0.5, 1);
        
        // view2.layer.anchorPointZ = 2;
        //旋转倒影
        CATransform3D t = CATransform3DRotate(view2.layer.transform, (120 / 180.0 * M_PI), 0.9, 0, -0.05);
        
        view2.layer.transform = t;
  //      view3.layer.transform = t;
        
        [view addSubview: view1];
        [view addSubview: view2];
 //       [view addSubview: view3];
        
        view.tag = 10;
        
        view1.tag = 1;
        view2.tag = 2;
  //      view3.tag = 3;
        
        view1.layer.cornerRadius = 5;
        view1.layer.masksToBounds = YES;
        
        view2.layer.cornerRadius = 5;
        view2.layer.masksToBounds = YES;
        
    }
    UIImageView *view1 =[view viewWithTag:1];
    UIImageView *view2 = [view viewWithTag:2];
  //  UIImageView *view3 = [view viewWithTag:3];
    
       UIImage *image = [UIImage imageNamed:@"跳舞_图"];
    ((UIImageView *)view1).image = image;
 
    
 //   UIImage *imageM = [UIImage imageNamed:@"蒙板.png"];
    
    ((UIImageView *)view2).image = image;
  //   view3.image = imageM;
  //  view3.alpha = 0.5;
    
    view2.backgroundColor = [UIColor blackColor];
    view2.alpha = 0.08;
    
    return view;
}

-(CATransform3D)carousel:(iCarousel *)carousel itemTransformForOffset:(CGFloat)offset baseTransform:(CATransform3D)transform{
    static CGFloat max_sacle = 1.3f;
    static CGFloat min_scale = 0.7;

    if (offset <= 1 && offset >= -1) {
        float tempScale = offset < 0 ? 1+offset : 1-offset;
        float slope = (max_sacle - min_scale) / 1;
        
        CGFloat scale = min_scale + slope*tempScale;
        transform = CATransform3DScale(transform, scale, scale, 1);
    
    }else{
        
        transform = CATransform3DScale(transform, min_scale, min_scale, 1);
    }
    
  //   NSLog(@"offset %f",offset);

  //  UIView *viewV = [carousel viewWithTag:10];
    
  //  UIImageView *imageV = [viewV viewWithTag:2];
  //  imageV.hidden = YES;
    
    return CATransform3DTranslate(transform, offset * self.icarousView.itemWidth * 1.5, 0.0, 0.0);
}


-(void)carousel:(iCarousel *)carousel didSelectItemAtIndex:(NSInteger)index
{
    NSLog(@"点击了 %ld",index);
    NSError *error;
    
    self.audioPlay = [[AVAudioPlayer alloc]initWithContentsOfURL:URL_AngryBirds error:&error];
    
    if (!error) {
        
        [self.audioPlay prepareToPlay];
        [self.audioPlay play];
        
    }else
    {
        NSLog(@"播放文件错误");
    }
    [[XYAudio shareXYAudion]addMusicFileURL:URL_AngryBirds];
}


-(void)presentViewController:(UIViewController *)viewControllerToPresent animated:(BOOL)flag completion:(void (^)(void))completion
{

}


//-(CGFloat)carousel:(iCarousel *)carousel valueForOption:(iCarouselOption)option withDefault:(CGFloat)value
//{
//    option = iCarouselOptionShowBackfaces;
//}

//-(BOOL)carouselShouldWrap:(iCarousel *)carousel
//{
//    return YES;
//}

//
//-(id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
//{
//    return [[CubeAnimation alloc]init];
//}
//

//- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
//{
//    return [[CubeAnimation alloc]init];
//
//}

//
//- (nullable id <UIViewControllerInteractiveTransitioning>)interactionControllerForPresentation:(id <UIViewControllerAnimatedTransitioning>)animator
//{
//     return [[CubeAnimation alloc]init];
//}

@end
