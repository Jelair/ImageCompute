//
//  KEView.m
//  BasicImage
//
//  Created by NowOrNever on 13/10/2017.
//  Copyright © 2017 NowOrNever. All rights reserved.
//

/*
 *图形绘制
 */
#import "KEView.h"

@implementation KEView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    CGContextRef context = UIGraphicsGetCurrentContext();
    //[self drawRectWithContext:context];
    //[self drawRectByUIKitWithContext:context];
    //[self drawEllipse:context];
    //[self drawArc:context];
    //[self drawCurve:context];
    //[self drawText:context];
    [self drawImage:context];
}

#pragma mark 绘制矩形
- (void)drawRectWithContext:(CGContextRef)context{
    //添加矩形对象
    CGRect rect = CGRectMake(20, 50, 280.0, 50.0);
    CGContextAddRect(context, rect);
    //设置属性
    [[UIColor blueColor] set];
    //绘制
    CGContextDrawPath(context, kCGPathFillStroke);
}

#pragma mark 绘制矩形（利用UIKit的封装方法）
- (void)drawRectByUIKitWithContext:(CGContextRef)context{
    CGRect rect = CGRectMake(20, 150, 280.0, 50.0);
    CGRect rect2 = CGRectMake(20, 250, 280.0, 50.0);
    //设置属性
    [[UIColor yellowColor] set];
    //绘制矩形，相当于创建对象，添加对象到上下文、绘制三个步骤
    UIRectFill(rect);//绘制矩形（只有填充）
    
    [[UIColor redColor] setStroke];
    UIRectFrame(rect2);//绘制矩形（只有边框）
}

#pragma mark 绘制椭圆
- (void)drawEllipse:(CGContextRef)context{
    //添加对象，绘制椭圆（圆形）的过程也是先创建一个矩形
    CGRect rect = CGRectMake(50, 50, 220.0, 200.0);
    CGContextAddEllipseInRect(context, rect);
    //设置属性
    [[UIColor purpleColor] set];
    //绘制
    CGContextDrawPath(context, kCGPathFillStroke);
}

#pragma mark 绘制弧形
- (void)drawArc:(CGContextRef)context{
    /*添加弧形对象
     x:中心点x坐标
     y:中心点y坐标
     radius:半径
     startAngle:起始弧度
     endAngle:终止弧度
     closewise:是否逆时针绘制，0则顺时针绘制
     */
    CGContextAddArc(context, 160, 160, 100.0, 0.0, M_PI_2, 1);
    
    //设置属性
    [[UIColor yellowColor] set];
    
    //绘制
    CGContextDrawPath(context, kCGPathFillStroke);
}

#pragma mark 绘制贝塞尔曲线
- (void)drawCurve:(CGContextRef)context{
    //绘制曲线
    CGContextMoveToPoint(context, 20, 100);//移动到起始点位置
    /*绘制二次贝塞尔曲线
     c:图形上下文
     cpx:控制点x坐标
     cpy:控制点y坐标
     x:结束点x坐标
     y:结束点y坐标
     */
    CGContextAddQuadCurveToPoint(context, 160, 0, 300, 100);
    
    CGContextMoveToPoint(context, 20, 500);
    /*绘制三次贝塞尔曲线
     c:图形上下文
     cp1x:第一个控制点x坐标
     cp1y:第一个控制点y坐标
     cp2x;第二个控制点x坐标
     cp2y:第二个控制点y坐标
     x:结束点x坐标
     y:结束点y坐标
     */
    CGContextAddCurveToPoint(context, 80, 300, 240, 500, 300, 300);
    
    //设置图形上下文属性
    [[UIColor yellowColor] setFill];
    [[UIColor redColor] setStroke];
    
    //绘制路径
    CGContextDrawPath(context, kCGPathFillStroke);
}

#pragma mark 绘制文本内容
- (void)drawText:(CGContextRef)context{
    //绘制到指定的区域内容
    NSString *str=@"Star Walk is the most beautiful stargazing app you’ve ever seen on a mobile device. It will become your go-to interactive astro guide to the night sky, following your every movement in real-time and allowing you to explore over 200, 000 celestial bodies with extensive information about stars and constellations that you find.";
    CGRect rect = CGRectMake(20, 50, 280, 300);
    UIFont *font = [UIFont systemFontOfSize:18];//设置字体
    UIColor *color = [UIColor redColor];//字体颜色
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    NSTextAlignment align = NSTextAlignmentLeft;//对其方式
    style.alignment = align;
    [str drawInRect:rect withAttributes:@{NSFontAttributeName:font,NSForegroundColorAttributeName:color,NSParagraphStyleAttributeName:style}];
}

#pragma mark 绘制图像
- (void)drawImage:(CGContextRef)context{
    UIImage *image = [UIImage imageNamed:@"beaty.jpg"];
    //从某一点开始绘制
    [image drawAtPoint:CGPointMake(10, 50)];
    //绘制到指定的矩形中，注意如果大小不合适会进行拉伸
    //[image drawInRect:CGRectMake(10,50,300,450)];
    //平铺绘制
    //[image drawAsPatternInRect:CGRectMake(0,0,320,560)];
}

@end
