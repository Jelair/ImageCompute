//
//  KHView.m
//  BasicImage
//
//  Created by NowOrNever on 13/10/2017.
//  Copyright © 2017 NowOrNever. All rights reserved.
//

#import "KHView.h"

@implementation KHView


- (void)drawRect:(CGRect)rect {
    NSString *str = _title;
    UIFont *font = [UIFont fontWithName:@"Marker Felt" size:_fontSize];
    UIColor *foreignColor = [UIColor redColor];
    [str drawInRect:CGRectMake(100, 120, 300, 200) withAttributes:@{NSFontAttributeName:font,NSForegroundColorAttributeName:foreignColor}];
}


@end
