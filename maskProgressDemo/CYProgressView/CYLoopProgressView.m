//
//  CYLoopProgressView.m
//  maskProgressDemo
//
//  Created by Mr.GCY on 2017/6/1.
//  Copyright © 2017年 Mr.GCY. All rights reserved.
//

#import "CYLoopProgressView.h"

@implementation CYLoopProgressView
- (void)drawRect:(CGRect)rect
{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    CGFloat xCenter = rect.size.width * 0.5;
    CGFloat yCenter = rect.size.height * 0.5;
    [[UIColor greenColor] set];
    
    CGContextSetLineWidth(ctx, 5);
    //线头的的形状
    CGContextSetLineCap(ctx, kCGLineCapRound);
    CGFloat to = - M_PI * 0.5 + self.progress * M_PI * 2 + 0.05; // 初始值0.05
    CGFloat radius = MIN(rect.size.width, rect.size.height) * 0.5 - 10;
    CGContextAddArc(ctx, xCenter, yCenter, radius, - M_PI * 0.5, to, 0);
    CGContextStrokePath(ctx);
    
    // 进度数字
    NSString *progressStr = [NSString stringWithFormat:@"%.0f", self.progress * 100];
    NSMutableDictionary *attributes = [NSMutableDictionary dictionary];
    attributes[NSFontAttributeName] = [UIFont boldSystemFontOfSize:15];
    attributes[NSForegroundColorAttributeName] = [UIColor lightGrayColor];
    [self setCenterProgressText:progressStr withAttributes:attributes];
}

@end
