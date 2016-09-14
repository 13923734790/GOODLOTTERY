//
//  LotteryBallCtrl.m
//  GOODLOTTERY
//
//  Created by apple on 16/1/21.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "LotteryBallCtrl.h"
#import "LotteryHeardView.h"
#import "MenuCtrl.h"
#import "RESideMenu.h"
#import "PMDCell.h"
#import "GameKingCell.h"
#import "SkinPeelerTool.h"
#import "PopUpMenuCtrl.h"

#import "GFGameCommonCtrl.h"
#import "XYGameCommonCtrl.h"
#import "ChuMaYiLouView.h"

@interface LotteryBallCtrl ()<UITableViewDataSource,UITableViewDelegate,SkinpeelerDelegate>
@property(nonatomic,strong)UISegmentedControl *GameKindCtrl;
@end

@implementation LotteryBallCtrl
{
    CGFloat cellheight;
    NSArray *cellArray;
    NSArray *CreditArray;
    NSArray *OfficialArray;
}
- (void)ClickLeft
{
    //推出一个透明的ctrl
    PopUpMenuCtrl *popctrl = [[PopUpMenuCtrl alloc]init];
    ChuMaYiLouView *YiLouView = [[ChuMaYiLouView alloc]init];
    
    [popctrl.view addSubview:YiLouView];
    if ([[[UIDevice currentDevice] systemVersion] floatValue]>=8.0) {
        popctrl.modalPresentationStyle=UIModalPresentationOverCurrentContext;
    }else{
        self.modalPresentationStyle=UIModalPresentationCurrentContext;
    }
    popctrl.view.backgroundColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:0.5];
     self.tabBarController.modalPresentationStyle = UIModalPresentationCurrentContext;
    [self.tabBarController presentViewController:popctrl animated:NO completion:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.Skindelegate = self;
    [self CustomLeft:@"登出"];
    [self SkinpeelrNub];
    [self.leftButton addTarget:self action:@selector(ClickLeft)forControlEvents:UIControlEventTouchUpInside];
    [self CustomRight:@"菜单"];
    
    self.navigationItem.titleView =self.GameKindCtrl;
    
    
    cellheight = UIScreenHEIGHT-20-NVHEIGHT-TABBARHEIGHT-230*ScaleY-30*ScaleY;
    
    CreditArray =  @[@"⑥合彩",@"广东11选5",@"广东快十",@"广西快十",@"重庆快十",@"江苏快三",@"天津时时彩",@"新疆时时彩",@"江西时时彩",@"北京PK拾"];
    OfficialArray = @[@"北京快乐8",@"江苏快三",@"重庆时时彩",@"新疆时时彩",@"天津时时彩",@"迪拜分分彩",@"迪拜五分彩",@"山东11选5",@"广东11选5",@"江西11选5",@"北京PK拾",@"福彩3D",@"排列三,五"];
    [self customTableView];
    
}

-(UISegmentedControl *)GameKindCtrl
{
    NSDictionary *dic1 = [NSDictionary dictionaryWithObjectsAndKeys:GETCOLOR(@"wg"),NSForegroundColorAttributeName,[UIFont boldSystemFontOfSize:15],NSFontAttributeName,nil];
    NSDictionary *dic2= [NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName,[UIFont boldSystemFontOfSize:15],NSFontAttributeName,nil];
    [_GameKindCtrl setTitleTextAttributes:dic1 forState:UIControlStateNormal];
    [_GameKindCtrl setTitleTextAttributes:dic2 forState:UIControlStateSelected];
    _GameKindCtrl = [[UISegmentedControl alloc]initWithItems:@[@"信用玩法",@"官方玩法"]];
    _GameKindCtrl.frame = CGRectMake(0, 0,100,30);
    [_GameKindCtrl setSelectedSegmentIndex:0];
    _GameKindCtrl.tintColor = [UIColor whiteColor];
    [_GameKindCtrl addTarget:self action:@selector(changeGameKind:) forControlEvents:UIControlEventValueChanged];
    return _GameKindCtrl;
    
}

-(void)changeGameKind:(UISegmentedControl *)segctrl
{
[self.tableView reloadData];
}
- (void)SkinpeelrNub
{
    NSArray *array = [SkinPeelerTool UpdataLotteryImage];
    self.iamgeView.image = [UIImage imageNamed:array[0]];
}

-(void)customTableView
{
    
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, UIScreenWIDTH, UIScreenHEIGHT-NVHEIGHT-20-TABBARHEIGHT) style:UITableViewStylePlain];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    self.tableView.backgroundColor =  [UIColor clearColor];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.tableView];
   LotteryHeardView *HeardView = [[LotteryHeardView alloc]initWithFrame:CGRectMake(0, 0, UIScreenWIDTH, 230*ScaleY)];
    self.tableView.tableHeaderView =HeardView;

}
#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell;
    if (indexPath.row==0)
    {
        PMDCell *pmdCell = [[PMDCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
        cell = pmdCell;
    }
    else if (indexPath.row == 1)
    {
        GameKingCell *cell1 = [[GameKingCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
        
        cell1.backgroundColor = [UIColor clearColor];
        cell1.ItemHeight = cellheight;
        if (_GameKindCtrl.selectedSegmentIndex)
        {   //官方玩法
            cellArray = OfficialArray;
            cell1.array =OfficialArray;
            cell1.GameIDBlock = ^(NSString *PushID)
            {
                GFGameCommonCtrl *ctrl = [[GFGameCommonCtrl alloc]init];
                ctrl.GameNameString = PushID;
                ctrl.hidesBottomBarWhenPushed = YES;
                [self.navigationController pushViewController:ctrl animated:YES];
            };
        }
        else
        {//信用玩法
            cell1.array =CreditArray;
            cellArray =CreditArray;
            cell1.GameIDBlock = ^(NSString *PushID)
            {
                UIViewController *ctrl;
//                if ([PushID isEqualToString:@"⑥合彩"])
//                {
//                    MarkSixCtrl *sixCtrl = [[MarkSixCtrl alloc]init];
//                    sixCtrl.GameNameString = PushID;
//                    sixCtrl.hidesBottomBarWhenPushed = YES;
//                    ctrl = sixCtrl;
//                    
//                }
//                else{
                    XYGameCommonCtrl *XYCtrl = [[XYGameCommonCtrl alloc]init];
                    XYCtrl.GameNameString = PushID;
                    XYCtrl.hidesBottomBarWhenPushed = YES;
                    ctrl = XYCtrl;
//                }

                [self.navigationController pushViewController:ctrl animated:YES];
            };

        }
        [cell1 SetAllButton];
        cell = cell1;
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row==0)
    {
        return 30*ScaleY;
    }
    
    NSInteger nub;
    if (cellArray.count/4>=2)
    {
    if (cellArray.count%4) nub = cellArray.count/4+1;else nub = cellArray.count/4;
    }
    else{
        nub=2;
    }
    return  cellheight/2*nub;
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

-(void)viewWillAppear:(BOOL)animated
{
    self.sideMenuViewController.panGestureEnabled = YES;
    //为了让跑马灯不失效
    [self.tableView reloadData];
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


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end