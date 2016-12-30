//
//  XYAudio.m
//  XYCoreBlueToothDemo
//
//  Created by RainPoll on 15/12/31.
//  Copyright © 2015年 RainPoll. All rights reserved.
//

#import "XYAudio.h"

@interface XYAudio ()
@property (strong ,nonatomic)AVAudioPlayer *audio;
@property (strong ,nonatomic)NSMutableArray *URLArray;
@property (strong ,nonatomic)NSMutableArray *playArray;


@end

@implementation XYAudio

+(instancetype)xyAudion
{
    static XYAudio * instance;
    if (!instance) {
        instance = [[XYAudio alloc]init];
        
        instance.URLArray = [@[]mutableCopy];
        instance.playArray = [@[]mutableCopy];
        
        instance.enable = YES;
        [instance  addObserver:instance forKeyPath:@"URLArray"options:NSKeyValueObservingOptionNew context:NULL];
     //   [instance addObserver:instance forKeyPath:@"volume" options:NSKeyValueObservingOptionNew context:nil];
    }
    return instance;
}
+(instancetype)shareXYAudion
{
    return [XYAudio xyAudion];
}

+(instancetype)xyAudioWith:(NSURL *)fileURL
{
    XYAudio *temp = [XYAudio xyAudion];
    
    [[temp mutableArrayValueForKey:@"URLArray"] addObject:fileURL];
    return temp;
}

+(void)addMusicFileURL:(NSURL *)fileURL
{
    [[[self shareXYAudion] mutableArrayValueForKey:@"URLArray"]addObject:fileURL];
}

-(void)addMusicFileURL:(NSURL *)fileURL
{
    [[self mutableArrayValueForKey:@"URLArray"]addObject:fileURL];
    //[self.URLArray addObject:fileURL];
}


-(void)setVolume:(CGFloat)volume
{
    if (_volume != volume) {
        for (AVAudioPlayer *play in self.playArray) {
            play.volume = volume;
        }
        _volume = volume;
    }
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    NSLog(@"添加歌曲");
//    if ([keyPath isEqualToString:@"change"]) {
//    
//        NSMutableArray *arrM = [@[]mutableCopy];
//        for (NSURL *url in self.URLArray) {
//            NSError *error = nil;
//            AVAudioPlayer *audio = [[AVAudioPlayer alloc]initWithContentsOfURL:url error:&error];
//            
//            if (error) {
//              NSLog(@"创建录音机对象时发生错误，错误信息：%@",error.localizedDescription);
//                return;
//            }
//            [arrM addObject:audio];
//        }
//        self.playArray = arrM;
//    
//    
//        NSURL *fileUrl = [self.URLArray lastObject];
//    
//        NSError *error = nil;
//    
//        AVAudioPlayer *audioPlay = [[AVAudioPlayer alloc]initWithContentsOfURL:fileUrl error:&error];
//    
//        if (error) {
//           NSLog(@"创建录音机对象时发生错误，错误信息：%@",error.localizedDescription);
//           return;
//        }
//    
//       [self.playArray addObject: audioPlay];
//    }
//    
    
    if ([keyPath isEqualToString:@"URLArray"]) {
        
        NSURL *url = [change[@"new"]firstObject];
 //       NSLog(@"url --%@",url);
        
        NSError *error = nil;
        AVAudioPlayer *audio = [[AVAudioPlayer alloc]initWithContentsOfURL:url error:&error];
        NSLog(@"avaudioplayer --%@",audio);
        if (error) {
            NSLog(@"创建录音机对象时发生错误，错误信息：%@",error.localizedDescription);
            return;
        }else
        {
            [self.playArray addObject:audio];
        }
    }
}

-(void)setEnable:(BOOL)enable
{
    if (_enable != enable) {
        _enable = enable;
        
        if (!_enable) {
            for (AVAudioPlayer *play in self.playArray) {
                [play stop];
            }
        }
        
    }
}

+(void)playMusicAtIndex:(NSInteger)index
{
    [[self shareXYAudion] playMusicAtIndex:index];
}

-(AVAudioPlayer *)enumeAudioAtIndex:(NSInteger)index
{
    if (index < self.URLArray.count) {
      
       return  [self.playArray objectAtIndex:index];
     
    }
 
     NSLog(@"歌曲索引超出范围");
    return nil;
}

-(void)playMusicAtIndex:(NSInteger)index
{
    if (index < self.URLArray.count) {
        if (self.isEnable) {
            AVAudioPlayer *Play = [self.playArray objectAtIndex:index];
            NSLog(@"++++%@",Play);
            if (Play) {
             //   if (![Play isPlaying]) {
                    [Play play];
              //  }
             //   [play stop];
              //  [play prepareToPlay];
              //  [play play];
            }
        
        }else
        {
            NSLog(@"没有权限");
        }

    }else
    {
        NSLog(@"歌曲索引超出范围");
    }
}

-(void)replayMusicAtIndex:(NSInteger)index
{
    if (index < self.URLArray.count) {
        if (self.isEnable) {
           
            AVAudioPlayer *oldPlay = [self.playArray objectAtIndex:index];
            AVAudioPlayer * play = [[AVAudioPlayer alloc]initWithContentsOfURL:self.URLArray[index]  error:nil];
            [self.playArray replaceObjectAtIndex:index withObject:play];
            
            oldPlay = nil;
            
        //    [oldPlay play];
            
           [play play];
        }else
        {
            NSLog(@"没有权限");
        }
        
    }else
    {
        NSLog(@"歌曲索引超出范围");
    }
}

+(void)stopMusicAtIndex:(NSInteger)index
{
    [[self shareXYAudion]stopMusicAtIndex:index];
}
-(void)stopMusicAtIndex:(NSInteger)index
{
    if (index < self.URLArray.count) {
        if (self.isEnable) {
            AVAudioPlayer *play = [self.playArray objectAtIndex:index];
            [play stop];
        }else
        {
            NSLog(@"没有权限");
        }
        
    }else
    {
        NSLog(@"歌曲索引超出范围");
    }
}
-(AVAudioPlayer *)audio
{
    if (!_audio) {
        NSError *error=nil;
        AVAudioPlayer *audio = [[AVAudioPlayer alloc]initWithContentsOfURL:self.fileURL error:&error];
      //  audio.numberOfLoops = INT32_MAX;
        if (error) {
            NSLog(@"创建录音机对象时发生错误，错误信息：%@",error.localizedDescription);
            return nil;
        }
        _audio = audio;
    }
    return _audio;
}

+(void)setMusicPlayTime:(NSInteger)times AtIndex:(NSInteger)index
{
    [[self shareXYAudion]setMusicPlayTime:times AtIndex:index];
}
-(void)setMusicPlayTime:(NSInteger)times AtIndex:(NSInteger)index
{
    AVAudioPlayer *paly = [self enumeAudioAtIndex:index];
    paly.numberOfLoops = times;
}

-(void)dealloc
{
    [self removeObserver:self forKeyPath:@"URLArray"];
     [self removeObserver:self forKeyPath:@"volume"];
}


@end
