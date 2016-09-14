//
//  XYGameCommonCtrl.m
//  GOODLOTTERY
//
//  Created by apple on 16/8/16.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "XYGameCommonCtrl.h"

#import "LotteryBarView.h"
#import "CreditTitleView.h"
#import "CreditTabbar.h"
#import "CreditTabbarConfirm.h"
#import "FPTimeView.h"

#import "MarkSixModel.h"
#import "LiuHeCell.h"

#import "XYDatas.h"

@interface XYGameCommonCtrl ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)CreditTabbar *tabbarView;
@property(nonatomic,strong)CreditTabbarConfirm *ComFirmBt;
@property(nonatomic,strong) FPTimeView *timeView;
@end

@implementation XYGameCommonCtrl
{
  __block  NSString *CurrentChildGanmeString;//子玩法的Name
  __block  NSString *CurrentFPbtTitle;//开奖拦按钮的
}

- (void)viewDidLoad {
    [super viewDidLoad];
    __weak XYGameCommonCtrl *BlcokSelf = self;
    CurrentChildGanmeString = [XYDatas shareXYTitleViewArray:_GameNameString][0];//第一次进来的标题
    
    [self CustomRight:@"菜单"];
    [self setTableView];
    [self setFPTimeDatas];//FPUI的变化
    
    
    //倍率刷新代码
    _tabbarView = [[CreditTabbar alloc]initWithFrame:CGRectMake(0, UIScreenHEIGHT-85*ScaleY-NVHEIGHT-20, UIScreenWIDTH, 40*ScaleY)];
    _tabbarView.BlcokOdd = ^(NSString *string)
    {
        NSDictionary *dic = [NSDictionary dictionaryWithObject:[NSString stringWithFormat:@"%@",string] forKey:@"Odd"];
        NSNotification *notifion = [NSNotification notificationWithName:@"ChangeOdd" object:nil userInfo:dic];
        [[NSNotificationCenter defaultCenter] postNotification:notifion];
    };
    [self.view addSubview:_tabbarView];
    //确定
    self.ComFirmBt = [[CreditTabbarConfirm alloc]initWithFrame:CGRectMake(0, UIScreenHEIGHT-45*ScaleY-NVHEIGHT-20, UIScreenWIDTH, 45*ScaleY)];
    [self.ComFirmBt.rightbutton1 addTarget:self action:@selector(ConFirm) forControlEvents:UIControlEventTouchUpInside];

    [self.view addSubview:_ComFirmBt];
    
    
    
    
    [self MakeLotterybarView];
    [self setCreditTitleView];
    
    self.creditTitleView.TitleArray = [XYDatas shareXYTitleViewArray:_GameNameString];
    
    self.creditTitleView.BlockTitleString = ^(NSString *CurrentString)
    {
        CurrentChildGanmeString =CurrentString;
        [BlcokSelf ChangeGame];
        [BlcokSelf UpdataTitleFramTitleButtonTitleString:CurrentString andLeftImage:IMAGEFILE(@"CQLeftImage%ld") andRightImage:@"TitleRightImage"];
        BlcokSelf.timeView.GameString = CurrentString;
        [BlcokSelf setFPTimeDatas];//刷新表头
        dispatch_async(dispatch_get_main_queue(), ^{
            [BlcokSelf.tableView reloadData];
        });
        
    };
    
    
    [self Maketitlebutton];//TitleView的按钮
    [self.lotterybarView.LeftButton setTitle:_GameNameString forState:UIControlStateNormal];//开奖拦左边button
    [self UpdataTitleFramTitleButtonTitleString:CurrentChildGanmeString andLeftImage:IMAGEFILE(@"CQLeftImage%ld") andRightImage:@"TitleRightImage"];
    [self.TitleView addTarget:self action:@selector(ChangeGame) forControlEvents:UIControlEventTouchUpInside];
    
}


- (void)ChangeGame
{
    self.creditTitleView.hidden = !self.creditTitleView.hidden;
}
-(void)ConFirm
{
    
    UITableViewCell *cell = [_tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
    
    [XYDatas ShareReturnAllSeletedObjc:_GameNameString AndChildTitle:CurrentChildGanmeString AndCurrentCell:cell];
}

-(void)setTableView
{
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0,40*ScaleY, UIScreenWIDTH,UIScreenHEIGHT-NVHEIGHT-85*ScaleY-20-40*ScaleY) style:UITableViewStylePlain];
    _tableView.bounces = NO;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.backgroundColor =[UIColor clearColor];
    _tableView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:_tableView];
    
    
    _timeView = [[FPTimeView alloc]init];
    
    [_timeView setRightPullBt];
    [_timeView SetLeftPullBt];
    [_timeView setYiLouPaiHanView];
    
    _timeView.pullLeftBt.hidden = YES;
    _timeView.pullRightBt.hidden = YES;
    _timeView.YiLouView.hidden = YES;
    _timeView.GameString = CurrentChildGanmeString;
    if ([_GameNameString isEqualToString:@"⑥合彩"])
    {
        _timeView.frame = CGRectMake(0,0,UIScreenWIDTH, 35*ScaleY);
    }
    else
    {
        _timeView.frame = CGRectMake(0,0,UIScreenWIDTH, 70*ScaleY);
        _timeView.YiLouView.hidden = NO;
        
    }
    _tableView.tableHeaderView = _timeView;
    
    
    __weak XYGameCommonCtrl *BlcokSelf = self;
    __weak MarkSixModel *model = [MarkSixModel ShareMarkSix];
    _timeView.blockLeftSelected = ^(NSString *BtString)
    {
        model.childString = BtString;
        [BlcokSelf.tableView reloadData];
    };
    
    _timeView.blockRightSelected = ^(NSString *BtString)
    {
        if ([BtString isEqualToString:@"快速组合"])
        {
            [BlcokSelf ClickFastRight];
        }
        else
        {
           model.childString = BtString;
           [BlcokSelf.tableView reloadData];
        }
        
    };

}


//刷新开奖UI的布局
-(void)setFPTimeDatas
{
    NSDictionary *dic = [XYDatas ShareReturnFPtime:_GameNameString AndChildTitle:CurrentChildGanmeString];
    MarkSixModel *model = [MarkSixModel ShareMarkSix];
    if (dic)
    {
        if (dic[@"Ischange"])
        {
            _timeView.IsChange = YES;
        }
        else {
            _timeView.IsChange =NO;
        }
        
        if (dic[@"leftarray"][0]) _timeView.LeftArray =dic[@"leftarray"];
        else _timeView.LeftArray = nil;
        
        if (dic[@"rightarray"])
        {
            _timeView.RightArray =dic[@"rightarray"];
            model.childString = _timeView.RightArray[0];
        }
        else
        {   _timeView.RightArray = nil;
            model.childString = nil;
        }
    }
    else
    {
        _timeView.LeftArray = nil;
        _timeView.RightArray = nil;
    }
    
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [XYDatas shareGetCell:_GameNameString AndChildTitle:CurrentChildGanmeString];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [XYDatas ShareReturnCellheight:_GameNameString AndChildTitle:CurrentChildGanmeString];
}

#pragma mark - LiuHeCai

//快速组合按钮
-(void)ClickFastRight
{
    LiuHeCell *cell  = (LiuHeCell *)[_tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
    cell.isFastHidden = !cell.isFastHidden;
}
@end
