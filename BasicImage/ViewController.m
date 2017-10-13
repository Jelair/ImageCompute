//
//  ViewController.m
//  BasicImage
//
//  Created by NowOrNever on 12/10/2017.
//  Copyright © 2017 NowOrNever. All rights reserved.
//

#import "ViewController.h"
#import "KCView.h"
#import "KDView.h"
#import "KEView.h"
#import "KFView.h"
#import "KGView.h"
#import "KHView.h"
@interface ViewController ()<UIPickerViewDelegate,UIPickerViewDataSource>{
    KHView *_contentView;
    NSArray *_fontSize;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    KGView *view = [[KGView alloc] initWithFrame:[UIScreen mainScreen].bounds];
//    view.backgroundColor = [UIColor whiteColor];
//    [self.view addSubview:view];
    [self initLayout];
    [self addPickerView];
}


- (void)initLayout{
    _fontSize = @[@15,@18,@20,@22,@25,@28,@30,@32,@35,@40];
    _contentView = [[KHView alloc] initWithFrame:CGRectMake(0, 0, 320, 300)];
    _contentView.backgroundColor = [UIColor whiteColor];
    _contentView.title = @"Hello World";
    _contentView.fontSize = [_fontSize[0] intValue];
    [self.view addSubview:_contentView];
}

- (void)addPickerView{
    UIPickerView *picker = [[UIPickerView alloc] initWithFrame:CGRectMake(0,300,320,268)];
    picker.delegate = self;
    picker.dataSource = self;
    [self.view addSubview:picker];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return _fontSize.count;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return [NSString stringWithFormat:@"%@号字体",_fontSize[row]];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    _contentView.fontSize = [[_fontSize objectAtIndex:row] intValue];
    
    //刷新视图
    [_contentView setNeedsDisplay];
}


@end
