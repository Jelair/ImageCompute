//
//  KDView.m
//  BasicImage
//
//  Created by NowOrNever on 13/10/2017.
//  Copyright © 2017 NowOrNever. All rights reserved.
//

/*
 *简化绘图方式
 */

#import "KDView.h"

@implementation KDView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    //1.获得图形上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //2.绘制路径（相当于前面创建路径病添加路径到图形上下文两步操作）
    CGContextMoveToPoint(context, 20, 150);
    CGContextAddLineToPoint(context, 20, 100);
    CGContextAddLineToPoint(context, 300, 100);
    //封闭路径：a.创建一条起点和终点的线，不推荐
    //CGPathAddLineToPoint(path, nil, 20, 50);
    //封闭路径：b.直接调用路径封闭方法
    CGContextClosePath(context);
    
    //3.设置图形上下文属性
    [[UIColor redColor] setStroke];//设置红色边框
    [[UIColor greenColor] setFill];//设置绿色填充
    //[[UIColor blueColor] set]; //同时设置填充和边框色
    
    //4.绘制路径
    CGContextDrawPath(context, kCGPathFillStroke);
}


@end
