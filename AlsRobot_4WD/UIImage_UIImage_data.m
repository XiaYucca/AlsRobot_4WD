//
//  UIImage_UIImage_NSData.h
//  ALSHandle_swift
//
//  Created by RainPoll on 2016/10/28.
//  Copyright © 2016年 RainPoll. All rights reserved.
//

#import <UIKit/UIKit.h>

@implementation UIImage(contex)

-(void)bitcontext:(void(^)(void * data))callback{
    //UIImage* ImageA;
    CGImageRef temp = [self CGImage];
    
    CGSize image_size = self.size;
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    void* data = malloc(image_size.width * image_size.height * 4);
    CGContextRef context =
    CGBitmapContextCreate(data, image_size.width, image_size.height, 8, 4 * image_size.width, colorSpace,
                          kCGImageAlphaPremultipliedLast | kCGBitmapByteOrder32Big);
    
    CGContextDrawImage(context, CGRectMake(0, 0, image_size.width, image_size.height), temp);
    /*
     data中就是你要得原始bmp图了, 没有文件头
     */
    callback(data);
    
    CGContextRelease(context);
    free(data);
}

@end
