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
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    KFView *view = [[KFView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:view];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
