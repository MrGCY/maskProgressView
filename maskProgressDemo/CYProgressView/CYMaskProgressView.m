//
//  BBMaskProgressView.m
//  maskProgressDemo
//
//  Created by Mr.GCY on 2017/6/1.
//  Copyright © 2017年 Mr.GCY. All rights reserved.
//

#import "CYMaskProgressView.h"

@implementation CYMaskProgressView
- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    CGFloat xCenter = rect.size.width * 0.5;
    CGFloat yCenter = rect.size.height * 0.5;
    
    
    CGFloat radius = MIN(rect.size.width * 0.5, rect.size.height * 0.5);
    
    
    //外面的环
    [[UIColor greenColor] set];
    CGContextSetLineWidth(ctx, 5);
    //线头的的形状
    CGContextSetLineCap(ctx, kCGLineCapRound);
    CGContextAddArc(ctx, xCenter, yCenter, radius - 8, 0, M_PI * 2, 1);
    CGContextStrokePath(ctx);
    
    // 背景遮罩
    [[UIColor colorWithRed:0.5 green:0.5 blue:0.5 alpha:0.5] set];
    [[UIColor clearColor] setStroke];
    CGFloat lineW = MAX(rect.size.width, rect.size.height) * 0.5;
    CGContextSetLineWidth(ctx, lineW);
    CGContextAddArc(ctx, xCenter, yCenter, radius - 18, 0, M_PI * 2, 1);
    CGContextStrokePath(ctx);
    
    // 进程圆
    CGContextSetLineWidth(ctx, 1);
    CGContextMoveToPoint(ctx, xCenter, yCenter);
    CGContextAddLineToPoint(ctx, xCenter, 0);
    CGFloat to = - M_PI * 0.5 + self.progress * M_PI * 2 + 0.001; // 初始值
    CGContextAddArc(ctx, xCenter, yCenter, radius - 18, - M_PI * 0.5, to, 1);
    CGContextClosePath(ctx);
    
    CGContextFillPath(ctx);
}
@end
