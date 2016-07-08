//
//  MovieCell.h
//  PlayViewDemo
//
//  Created by Mac on 16/7/8.
//  Copyright © 2016年 zhanglei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MovieCell : UITableViewCell
@property (nonatomic, strong) UIImageView *moviePic;
@property (nonatomic, strong) UILabel *lblDetail;
@property (nonatomic, strong) UIImageView *imgTime;
@property (nonatomic, strong) UILabel *lblTime;
@property (nonatomic, strong) UIImageView *imgCollection;
@property (nonatomic, strong) UILabel *lblCollection;
@end
