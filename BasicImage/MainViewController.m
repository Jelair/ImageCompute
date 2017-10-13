//
//  MainViewController.m
//  BasicImage
//
//  Created by NowOrNever on 13/10/2017.
//  Copyright © 2017 NowOrNever. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
//    UIImage *image = [self drawImageAtImageContext];
//    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
//    imageView.center = self.view.center;
//    [self.view addSubview:imageView];
    
    //
    [self drawContentToPdfContext];
//    UIWebView *myWebView = [[UIWebView alloc] init];
//    myWebView.backgroundColor = [UIColor whiteColor];
//    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
//    NSString *path = [[paths firstObject] stringByAppendingPathComponent:@"myPDF.pdf"];
//    NSURL *filePath = [NSURL URLWithString:path];
//    NSURLRequest *request = [NSURLRequest requestWithURL:filePath];
//    [myWebView loadRequest:request];
//    //使文档的显示范围适合UIWebView的bounds
//    [myWebView setScalesPageToFit:YES];
//    [self.view addSubview:myWebView];
}

#pragma mark 利用位图上下文添加水印效果
- (UIImage *)drawImageAtImageContext{
    //获得一个位图图形上下文
    CGSize size = CGSizeMake(300, 180);//画布大小
    UIGraphicsBeginImageContext(size);
    
    UIImage *image = [UIImage imageNamed:@"beaty.jpg"];
    [image drawInRect:CGRectMake(0, 0, 300, 180)];//注意绘图的位置是相对于画布顶点而言，不是屏幕
    
    //添加水印
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextMoveToPoint(context, 200, 178);
    CGContextAddLineToPoint(context, 270, 178);
    
    [[UIColor redColor] setStroke];
    CGContextSetLineWidth(context, 2);
    
    CGContextDrawPath(context, kCGPathStroke);
    
    NSString *str = @"Kenshin Cui";
    [str drawInRect:CGRectMake(200, 158, 100, 30) withAttributes:@{NSFontAttributeName:[UIFont fontWithName:@"Marker Felt" size:15],NSForegroundColorAttributeName:[UIColor redColor]}];
    
    //返回绘制的新图形
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    //最后一定不要忘记关闭对应的上下文
    UIGraphicsEndImageContext();
    
    //保存图片
    //NSData *data = UIImagePNGRepresentation(newImage);
    //[data writeToFile:@"/Users/kenshincui/Desktop/myPic.png" atomically:YES];
    
    return newImage;
}

#pragma mark 利用pdf图形上下文绘制内容到pdf文档
- (void)drawContentToPdfContext{
    //沙盒路径（也就是我们应用程序文件运行的路径）
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *path = [[paths firstObject] stringByAppendingPathComponent:@"myPDF.pdf"];
    NSLog(@"%@",path);
    //启用pdf图形上下文
    /*
     path:保存路径
     bounds:pdf文档大小，如果设置为CGRectZero则使用默认值：612*792
     pageInfo:页面设置为nil则不设置任何消息
     */
    UIGraphicsBeginPDFContextToFile(path, CGRectZero, [NSDictionary dictionaryWithObjectsAndKeys:@"KenshinCui",kCGPDFContextAuthor, nil]);
    
    //由于pdf文档是分页的，所以首先要创建一页画布供我们绘制
    UIGraphicsBeginPDFPage();
    
    NSString *title = @"Welcome to Apple Support";
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    NSTextAlignment align = NSTextAlignmentCenter;
    style.alignment = align;
    [title drawInRect:CGRectMake(26, 20, 300, 50) withAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:18],NSParagraphStyleAttributeName:style}];
    
    NSString *content = @"Learn about Apple products, view online manuals, get the latest downloads, and more. Connect with other Apple users, or get service, support, and professional advice from Apple.";
    NSMutableParagraphStyle *style2 = [[NSMutableParagraphStyle alloc] init];
    style2.alignment = NSTextAlignmentLeft;
    //style2.firstLineHeadIndent = 20;
    [content drawInRect:CGRectMake(26, 56, 300, 255) withAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15],NSForegroundColorAttributeName:[UIColor grayColor],NSParagraphStyleAttributeName:style2}];
    
    UIImage *image = [UIImage imageNamed:@"beaty.jpg"];
    [image drawInRect:CGRectMake(316, 20, 290, 305)];
    
    UIImage *image2 = [UIImage imageNamed:@"beaty.jpg"];
    [image2 drawInRect:CGRectMake(6, 320, 600, 281)];
    
    //创建新的一页继续绘制其他内容
    UIGraphicsBeginPDFPage();
    UIImage *image3 = [UIImage imageNamed:@"beaty.jpg"];
    [image3 drawInRect:CGRectMake(6, 20, 600, 629)];
    
    //结束pdf上下文
    UIGraphicsEndPDFContext();
}


@end
