//
//  PlayViewController.h
//  PlayViewDemo
//
//  Created by Mac on 16/7/8.
//  Copyright © 2016年 zhanglei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MovieContentView.h"

@interface PlayViewController : UIViewController
@property (nonatomic, strong) UIImage *img;
@property (nonatomic, strong) UIImageView * bg;
@property (nonatomic, strong) UIImageView * movieView;
@property (nonatomic, strong) MovieContentView *movieContentView;
@property (nonatomic, assign) NSInteger index;
@property (nonatomic, assign) CGPoint point;
@property (nonatomic, strong) UILabel *lblTip1;
@property (nonatomic, strong) UILabel *lblTip2;
@end
