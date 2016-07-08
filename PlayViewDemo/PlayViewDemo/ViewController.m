//
//  ViewController.m
//  PlayViewDemo
//
//  Created by Mac on 16/7/8.
//  Copyright © 2016年 zhanglei. All rights reserved.
//

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#define TABLEVIEWCELLHEIGHT 180

#import "ViewController.h"
#import "MovieCell.h"
#import "PlayViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView * tableView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    self.tableView.delegate = self;
    self.tableView.dataSource =self;
    [self.view addSubview:self.tableView];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark -- UITableViewDelegate
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MovieCell * cell = [tableView dequeueReusableCellWithIdentifier:@"movieCellIdent"];
    if (cell == nil) {
        cell = [[MovieCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"movieCellIdent"];
    }
    
    cell.moviePic = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, TABLEVIEWCELLHEIGHT)];
    [cell.moviePic setImage:[UIImage imageNamed:@"aaa.jpg"]];
    [cell addSubview:cell.moviePic];
    
    cell.lblDetail = [[UILabel alloc] initWithFrame:CGRectMake(0, (TABLEVIEWCELLHEIGHT-40)/2, SCREEN_WIDTH, 40)];
    [cell.lblDetail setText:@"「大鱼海棠」 我喜欢你做任何事的样子"];
    [cell.lblDetail setFont:[UIFont systemFontOfSize:14]];
    [cell.lblDetail setTextAlignment:NSTextAlignmentCenter];
    [cell.lblDetail setTextColor:[UIColor whiteColor]];
    [cell addSubview:cell.lblDetail];
    
    cell.imgTime = [[UIImageView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH-120, TABLEVIEWCELLHEIGHT-18, 18, 18)];
    [cell.imgTime setImage:[UIImage imageNamed:@"time"]];
    [cell addSubview:cell.imgTime];
    
    cell.lblTime = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH-100, TABLEVIEWCELLHEIGHT-18, 40, 18)];
    [cell.lblTime setText:@"2:13:44"];
    [cell.lblTime setFont:[UIFont systemFontOfSize:10]];
    [cell.lblTime setTextColor:[UIColor whiteColor]];
    [cell addSubview:cell.lblTime];
    
    cell.imgCollection = [[UIImageView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH-60, TABLEVIEWCELLHEIGHT-18, 18, 18)];
    [cell.imgCollection setImage:[UIImage imageNamed:@"collection"]];
    [cell addSubview:cell.imgCollection];
    
    cell.lblCollection = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH-40, TABLEVIEWCELLHEIGHT-18, 40, 18)];
    [cell.lblCollection setText:@"124"];
    [cell.lblCollection setTextColor:[UIColor whiteColor]];
    [cell.lblCollection setFont:[UIFont systemFontOfSize:10]];
    [cell addSubview:cell.lblCollection];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return TABLEVIEWCELLHEIGHT+5;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //TODO 执行跳转
    
    float cellOffy = (TABLEVIEWCELLHEIGHT+5)*indexPath.row;
    float offy = tableView.contentOffset.y;
    float y = cellOffy-offy;
    
    CGPoint p = CGPointMake(SCREEN_WIDTH/2, y+TABLEVIEWCELLHEIGHT/2);
    
    PlayViewController * playView = [[PlayViewController alloc] init];
    playView.point = p;
    playView.img = [self screenView:self.view];
    [self presentViewController:playView animated:NO completion:^{
        
    }];
    
}

- (UIImage*)screenView:(UIView *)view{
    CGRect rect = view.frame;
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, [UIScreen mainScreen].scale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    [view.layer renderInContext:context];
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}

@end
