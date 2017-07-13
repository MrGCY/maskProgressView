//
//  CYRotationLoopProgressView.m
//  maskProgressDemo
//
//  Created by Mr.GCY on 2017/6/2.
//  Copyright © 2017年 Mr.GCY. All rights reserved.
//

#import "CYRotationLoopProgressView.h"
@interface CYRotationLoopProgressView ()
{
    CGFloat _angleInterval;
}
@end
@implementation CYRotationLoopProgressView
// 加载时显示的文字
NSString * const SDRotationLoopProgressViewWaitingText = @"LOADING...";

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:0.03 target:self selector:@selector(changeAngle) userInfo:nil repeats:YES];
        [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
    }
    return self;
}

- (void)changeAngle
{
    _angleInterval += M_PI * 0.08;
    if (_angleInterval >= M_PI * 2) _angleInterval = 0;
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect
{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    CGFloat xCenter = rect.size.width * 0.5;
    CGFloat yCenter = rect.size.height * 0.5;
    [[UIColor lightGrayColor] set];
    
    CGContextSetLineWidth(ctx, 4);
    //设置缺口大小 通过- M_PI * 0.06
    CGFloat to = - M_PI * 0.06 + _angleInterval; // 初始值0.05
    CGFloat radius = MIN(rect.size.width, rect.size.height) * 0.5 - 10;
    CGContextAddArc(ctx, xCenter, yCenter, radius, _angleInterval, to, 0);
    //画线
    CGContextStrokePath(ctx);
    
    // 加载时显示的文字
    NSMutableDictionary *attributes = [NSMutableDictionary dictionary];
    attributes[NSFontAttributeName] = [UIFont boldSystemFontOfSize:13];
    attributes[NSForegroundColorAttributeName] = [UIColor lightGrayColor];
    [self setCenterProgressText:SDRotationLoopProgressViewWaitingText withAttributes:attributes];
}
@end
