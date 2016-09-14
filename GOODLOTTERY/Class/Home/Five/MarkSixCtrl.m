//
//  MarkSixCtrl.m
//  GOODLOTTERY
//
//  Created by apple on 16/7/21.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "MarkSixCtrl.h"
#import "FPTimeView.h"
#import "LotteryBarView.h"
#import "CreditTitleView.h"


#import "LiuHeCell.h"
#import "LiuHeTwoFaceCell.h"
#import "LiuHeSeBoCell.h"
#import "MarkSixDatas.h"
#import "MarkSixModel.h"


#import "CreditTabbar.h"
#import "CreditTabbarConfirm.h"

@interface MarkSixCtrl ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)CreditTabbar *tabbarView;
@property(nonatomic,strong)CreditTabbarConfirm *ComFirmBt;
@property(nonatomic,strong) NSString *currenrOdd;
@property(nonatomic,strong) NSString *CurrentTitle;
@property(nonatomic,strong) FPTimeView *timeView;
@end

@implementation MarkSixCtrl

- (void)viewDidLoad {
    [super viewDidLoad];
    _CurrentTitle = @"特码";
    _currenrOdd = @"0.0%";
    __weak MarkSixCtrl *BlcokSelf = self;
    __weak MarkSixModel *model = [MarkSixModel ShareMarkSix];

    NSString *string = [NSString stringWithFormat:@"CQLeftImage%ld",[SkinPeelerTool ReturnSkinpManger]];
    
    [self CustomRight:@"菜单"];
    [self setTableView];
    [self setFPTimeDatas];//FPUI的变化
    
    
     //倍率刷新代码
    self.tabbarView = [[CreditTabbar alloc]initWithFrame:CGRectMake(0, UIScreenHEIGHT-85*ScaleY-NVHEIGHT-20, UIScreenWIDTH, 40*ScaleY)];
    self.tabbarView.BlcokOdd = ^(NSString *string)
    {
        if ([string isEqualToString:BlcokSelf.currenrOdd])
        {
        }
        else
        {
            BlcokSelf.currenrOdd = string;
            model.OddString = string;//倍率存值
            NSDictionary *dic = [NSDictionary dictionaryWithObject:[NSString stringWithFormat:@"%@",string] forKey:@"Odd"];
            NSNotification *notifion = [NSNotification notificationWithName:@"ChangeOdd" object:nil userInfo:dic];
            [[NSNotificationCenter defaultCenter] postNotification:notifion];
        }
    };
    [self.view addSubview:_tabbarView];
    
    
    //确定
    self.ComFirmBt = [[CreditTabbarConfirm alloc]initWithFrame:CGRectMake(0, UIScreenHEIGHT-45*ScaleY-NVHEIGHT-20, UIScreenWIDTH, 45*ScaleY)];
    [self.view addSubview:_ComFirmBt];

    
    
    [self MakeLotterybarView];
    [self setCreditTitleView];
    self.creditTitleView.TitleArray = @[@"特码",@"两面",@"色波",@"特肖",@"正码",@"正特",@"正码1-6",@"连码",@"一肖",@"尾数",@"合肖",@"自选不中",@"连肖",@"龙虎斗"];
    
    self.creditTitleView.BlockTitleString = ^(NSString *CurrentString)
    {
        //表头存值
        BlcokSelf.CurrentTitle = CurrentString;
        if ([CurrentString isEqualToString:@"合肖"])
        {
           model.childString = @"一肖";
        }
        if ([CurrentString isEqualToString:@"自选不中"])
        {model.childString = @"五不中";
        }
        [BlcokSelf ChangeGame];
        [BlcokSelf UpdataTitleFramTitleButtonTitleString:BlcokSelf.CurrentTitle andLeftImage:string andRightImage:@"TitleRightImage"];
        [BlcokSelf setFPTimeDatas];//刷新表头的UI
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [BlcokSelf.tableView reloadData];
        });
    };
    
    
    [self Maketitlebutton];
    [self.lotterybarView.LeftButton setTitle:_GameNameString forState:UIControlStateNormal];
    [self UpdataTitleFramTitleButtonTitleString:_CurrentTitle andLeftImage:string andRightImage:@"TitleRightImage"];
    [self.TitleView addTarget:self action:@selector(ChangeGame) forControlEvents:UIControlEventTouchUpInside];
    

}

- (void)ChangeGame
{
    self.creditTitleView.hidden = !self.creditTitleView.hidden;
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
    //表头
    [self setFPTime];
    
}

-(void)setFPTime
{
    _timeView = [[FPTimeView alloc]initWithFrame:CGRectMake(0,0,UIScreenWIDTH, 35*ScaleY)];
    [_timeView setRightPullBt];
    [_timeView SetLeftPullBt];
    _timeView.pullLeftBt.hidden = YES;
    _timeView.pullRightBt.hidden = YES;
    _tableView.tableHeaderView = _timeView;
    
    
    __weak MarkSixCtrl *BlcokSelf = self;
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
        else{
            
            model.childString = BtString;
            [BlcokSelf.tableView reloadData];
        }
        
    };

}


-(void)setFPTimeDatas
{
    NSDictionary *dic = [MarkSixDatas ShareReturnFPtime:_CurrentTitle];
    if (dic)
    {
        if (dic[@"Ischange"]) {
            _timeView.IsChange = YES;
        }
        else {
            _timeView.IsChange =NO;
        }
        
        if (dic[@"leftarray"][0]) _timeView.LeftArray =dic[@"leftarray"];
        else _timeView.LeftArray = nil;
        
        if (dic[@"rightarray"])_timeView.RightArray =dic[@"rightarray"];
            else _timeView.RightArray = nil;
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
    return [MarkSixDatas shareGetCell:_CurrentTitle];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [MarkSixDatas ShareReturnCellheight:_CurrentTitle];
}



#pragma mark - LiuHeCai
//快速组合按钮
-(void)ClickFastRight
{
    LiuHeCell *cell  = (LiuHeCell *)[_tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
    cell.isFastHidden = !cell.isFastHidden;
}


@end
