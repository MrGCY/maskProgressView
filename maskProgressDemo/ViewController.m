//
//  ViewController.m
//  maskProgressDemo
//
//  Created by Mr.GCY on 2017/6/1.
//  Copyright © 2017年 Mr.GCY. All rights reserved.
//

#import "ViewController.h"
#import "CYProgressView.h"

@interface ViewController ()
@property(strong,nonatomic) CYMaskProgressView * maskProgressView;
@property(strong,nonatomic) CYLoopProgressView * loopProgressView;
@property(strong,nonatomic) CYBallProgressView * ballProgressView;
@property(strong,nonatomic) CYRotationLoopProgressView * rotationLoopProgressView;
@property(assign,nonatomic) CGFloat progress;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.progress = 0;
    self.view.backgroundColor = [UIColor yellowColor];
    
    self.maskProgressView = [[CYMaskProgressView alloc] initWithFrame:CGRectMake(10, 10, 100, 100)];
    self.maskProgressView.progress = 0;
    [self.view addSubview:self.maskProgressView];
    
    self.loopProgressView = [[CYLoopProgressView alloc] initWithFrame:CGRectMake(150, 10, 100, 100)];
    self.loopProgressView.progress = 0;
    [self.view addSubview:self.loopProgressView];
    
    self.ballProgressView = [[CYBallProgressView alloc] initWithFrame:CGRectMake(10, 150, 100, 100)];
    self.ballProgressView.progress = 0;
    [self.view addSubview:self.ballProgressView];
    
    self.rotationLoopProgressView = [[CYRotationLoopProgressView alloc] initWithFrame:CGRectMake(150, 150, 100, 100)];
    [self.view addSubview:self.rotationLoopProgressView];
    NSTimer * timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(showProgress) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSDefaultRunLoopMode];
}
-(void)showProgress{
    if (self.progress > 1.0) {
        self.progress = 0.0;
    }
    self.progress += 0.05;
    self.maskProgressView.progress = self.progress;
    self.loopProgressView.progress = self.progress;
    self.ballProgressView.progress = self.progress;
}
@end
