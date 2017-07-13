//
//  CYBaseProgressView.h
//  maskProgressDemo
//
//  Created by Mr.GCY on 2017/6/1.
//  Copyright © 2017年 Mr.GCY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CYBaseProgressView : UIView
@property (assign , nonatomic)CGFloat progress;
- (void)setCenterProgressText:(NSString *)text withAttributes:(NSDictionary *)attributes;
@end
