//
//  KGView.m
//  BasicImage
//
//  Created by NowOrNever on 13/10/2017.
//  Copyright © 2017 NowOrNever. All rights reserved.
//

/*上下文变换*/

#import "KGView.h"

@implementation KGView


- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    [self drawImage2:context];
}

#pragma mark 图形上下文形变
- (void)drawImage:(CGContextRef)context{
    //保存初始状态
    CGContextSaveGState(context);
    
    //形变第一步：图形上下文向右平移40
    CGContextTranslateCTM(context, 100, 0);
    
    //形变第二部：缩放0.8
    CGContextScaleCTM(context, 0.8, 0.8);
    
    //形变第三部：旋转
    CGContextRotateCTM(context, M_PI_4/4);
    
    UIImage *image = [UIImage imageNamed:@"beaty.jpg"];
    [image drawInRect:CGRectMake(0, 50, 240, 300)];
    
    //恢复到初始状态
    CGContextRestoreGState(context);
}

#pragma mark 使用Core Graphics绘制图像
- (void)drawImage2:(CGContextRef)context{
    UIImage *image = [UIImage imageNamed:@"beaty.jpg"];
    CGSize size = [UIScreen mainScreen].bounds.size;
    CGContextSaveGState(context);
    CGFloat height = 450, y = 50;
    //上下文形变
    CGContextScaleCTM(context, 1.0, -1.0);//在y轴缩放-1相当于沿着x轴旋转180度
    CGContextTranslateCTM(context, 0, -(size.height-(size.height-2*y-height)));//向上平移
    
    //图像绘制
    CGRect rect = CGRectMake(10, 50, 300, 450);
    CGContextDrawImage(context, rect, image.CGImage);
    
    CGContextRestoreGState(context);
}


@end
