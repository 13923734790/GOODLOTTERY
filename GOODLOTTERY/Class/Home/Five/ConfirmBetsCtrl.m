//
//  ConfirmBetsCtrl.m
//  GOODLOTTERY
//
//  Created by apple on 16/2/22.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "ConfirmBetsCtrl.h"
#import "OfficialTabbarTwo.h"
#import "LotteryBarView.h"
#import "ConfirmHeard.h"
#import "ConfirmBetCell.h"
#import "CatchNubCtrl.h"
#import "FPTimeView.h"

@interface ConfirmBetsCtrl ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic, strong)UITableView *tableView;
@end
@implementation ConfirmBetsCtrl

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"投注确认";
    [self CustomRight:@"菜单"];
    
    _tableView =[[UITableView alloc]initWithFrame:CGRectMake(0,40*ScaleY, UIScreenWIDTH, UIScreenHEIGHT-85*ScaleY-NVHEIGHT-20-40*ScaleY) style:UITableViewStylePlain];
    _tableView.backgroundColor = GETCOLOR(@"cbw");
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.bounces = NO;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_tableView];
    ConfirmHeard *heardView = [[ConfirmHeard alloc]initWithFrame:CGRectMake(0, 0, UIScreenWIDTH, 70*ScaleY)];
    _tableView.tableHeaderView = heardView;
    
    
    OfficialTabbarTwo *TabbarTwo = [[OfficialTabbarTwo alloc]initWithFrame:CGRectMake(0, UIScreenHEIGHT-85*ScaleY-NVHEIGHT-20, UIScreenWIDTH, 85*ScaleY)];
    [TabbarTwo.rightbutton addTarget:self action:@selector(ConFirm) forControlEvents:UIControlEventTouchUpInside];
    [TabbarTwo.leftbutton addTarget:self action:@selector(CatChNub) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:TabbarTwo];
    
    [self MakeLotterybarView];
    self.lotterybarView.hidden = NO;
    [self.lotterybarView.LeftButton setTitle:_GameNameString forState:UIControlStateNormal];
}

-(void)ConFirm
{
    
}
- (void)CatChNub
{    CatchNubCtrl *ctrl = [[CatchNubCtrl alloc]init];
    [self.navigationController pushViewController:ctrl animated:YES];
}
#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ConfirmBetCell *cell;  static NSString *string = @"CellId";
    if (!cell)
    {
    cell = [[ConfirmBetCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:string];
    cell.backgroundColor = GETCOLOR(@"cbw");
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return  80*ScaleY;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

#pragma mark - Table view ScrollView
static float lastContentOffset;
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    lastContentOffset = scrollView.contentOffset.y;
}

- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView
{
    
    if (lastContentOffset < scrollView.contentOffset.y)
    {
        NSLog(@"向上滚动");
        
    }else
    {
        NSLog(@"向下滚动");
        if (scrollView.contentOffset.y>UIScreenHEIGHT*2)
        {
            
        }
    }
}

#pragma mark - Configuring the view’s layout behavior

- (BOOL)prefersStatusBarHidden
{
    return NO;
}
- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}


@end
