//
//  SpecialOfferCtrl.m
//  GOODLOTTERY
//
//  Created by apple on 16/1/21.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "SpecialOfferCtrl.h"
#import "MenuCtrl.h"
#import "RESideMenu.h"
#import "SpecialOfferCell.h"
#import "SpecialOfferdetailsCtrl.h"

@interface SpecialOfferCtrl ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tableView;
@end

@implementation SpecialOfferCtrl

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self CustomRight:@"菜单"];
    self.iamgeView.frame = CGRectMake(0,0, UIScreenWIDTH,UIScreenHEIGHT-20-NVHEIGHT);
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, UIScreenWIDTH, UIScreenHEIGHT-20-NVHEIGHT)];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_tableView];
    
    [_tableView registerNib:[UINib nibWithNibName:@"SpecialOfferCell" bundle:nil] forCellReuseIdentifier:@"SpecialOfferCellID"];
    
    
}

-(void)appviewbtnClick
{
    NSLog(@"哈哈哈哈哈哈哈哈");
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SpecialOfferCell *cell; static NSString *Cellid = @"SpecialOfferCellID";
    cell = [tableView dequeueReusableCellWithIdentifier:Cellid];
    if (!cell)
    {
        cell = [[SpecialOfferCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Cellid];
    }
    cell.backgroundColor = [UIColor clearColor];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 180*ScaleY;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    SpecialOfferdetailsCtrl *Ctrl = [[SpecialOfferdetailsCtrl alloc]init];
//    TextCtrl *Ctrl = [[TextCtrl alloc]initWithNibName:@"TextCtrl" bundle:nil];
    [self.navigationController pushViewController:Ctrl animated:YES];
    
}
#pragma mark - TableViewDelegate

#pragma mark - Configuring the view’s layout behavior
- (BOOL)prefersStatusBarHidden
{
    return NO;
}
- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

-(void)viewWillAppear:(BOOL)animated
{
    self.sideMenuViewController.panGestureEnabled = YES;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com