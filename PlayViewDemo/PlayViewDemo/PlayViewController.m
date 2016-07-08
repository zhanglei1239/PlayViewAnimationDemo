//
//  PlayViewController.m
//  PlayViewDemo
//
//  Created by Mac on 16/7/8.
//  Copyright © 2016年 zhanglei. All rights reserved.
//

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#define TABLEVIEWCELLHEIGHT 180

#import "PlayViewController.h"

@interface PlayViewController ()

@end

@implementation PlayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.bg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    [self.view addSubview:self.bg];
    
    self.movieContentView = [[MovieContentView alloc] initWithFrame:CGRectMake(0, -SCREEN_HEIGHT+TABLEVIEWCELLHEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT-TABLEVIEWCELLHEIGHT)];
    [self.movieContentView setBackgroundColor:[UIColor redColor]];
    [self.view addSubview:self.movieContentView];
    
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideContentView)];
    [self.movieContentView addGestureRecognizer:tap];
    
    self.movieView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, TABLEVIEWCELLHEIGHT)];
    [self.movieView setImage:[UIImage imageNamed:@"aaa.jpg"]];
    self.movieView.hidden = YES;
    [self.view addSubview:self.movieView];
    
    self.lblTip1 = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 40)];
    [self.lblTip1 setText:@"这是视频播放区域"];
    [self.lblTip1 setTextAlignment:NSTextAlignmentCenter];
    [self.lblTip1 setHidden:YES];
    [self.view addSubview:self.lblTip1];
    
    
    self.lblTip2 = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 40)];
    [self.lblTip2 setTextAlignment:NSTextAlignmentCenter];
    [self.lblTip2 setText:@"以下红色区域都是视频介绍和状态区域"];
    [self.lblTip2 setHidden:YES];
    [self.view addSubview:self.lblTip2];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.bg setImage:self.img];
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    self.movieView.center = self.point;
    self.movieView.hidden = NO;
    self.movieContentView.transform = CGAffineTransformMakeScale(1, 0.1);
    self.movieContentView.center = self.point;
    [UIView animateWithDuration:.4 animations:^{
        self.movieView.center = CGPointMake(SCREEN_WIDTH/2, (TABLEVIEWCELLHEIGHT)/2);
        self.movieContentView.center = CGPointMake(SCREEN_WIDTH/2, (SCREEN_HEIGHT+TABLEVIEWCELLHEIGHT)/2);
        self.movieContentView.transform = CGAffineTransformMakeScale(1, 1);
        
        
    } completion:^(BOOL finished) {
        self.lblTip1.hidden = NO;
        self.lblTip2.hidden = NO;
        self.lblTip1.center = self.movieView.center;
        self.lblTip2.center = self.movieContentView.center;
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)hideContentView{
    self.lblTip1.hidden = YES;
    self.lblTip2.hidden = YES;
    [UIView animateWithDuration:.4 animations:^{
        self.movieView.center = self.point;
        self.movieContentView.center = self.point;
        self.movieContentView.transform = CGAffineTransformMakeScale(1, .1);
    } completion:^(BOOL finished) {
        self.movieView.hidden = YES;
        self.movieContentView.center = CGPointMake(SCREEN_WIDTH/2, -(SCREEN_HEIGHT+TABLEVIEWCELLHEIGHT)/2);
        [self dismissViewControllerAnimated:NO completion:^{
            
        }];
    }];
}
@end
