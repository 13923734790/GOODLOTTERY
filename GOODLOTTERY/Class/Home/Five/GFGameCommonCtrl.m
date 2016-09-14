//
//  GFGameCommonCtrl.m
//  GOODLOTTERY
//
//  Created by apple on 16/8/24.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "GFGameCommonCtrl.h"
#import "AllkingGameDatas.h"
#import "GFDatas.h"
#import "NewPickerView.h"
#import "LotteryBarView.h"
#import "FPTimeView.h"
#import "OfficialTabbarOne.h"
#import "OfficialTabbarTwo.h"
#import "OddAndNubModel.h"


@interface GFGameCommonCtrl ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong) FPTimeView *timeView;
@property(nonatomic,strong) OfficialTabbarOne *TbbarOne;
@property(nonatomic,strong) OfficialTabbarTwo *TbbarTwo;
@property(nonatomic,strong) OddAndNubModel *NubModel;
@end

@implementation GFGameCommonCtrl
{
    NSArray * pikerviewArray;
    __block NSDictionary *CurrentDic;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    __weak  GFGameCommonCtrl *blockSelf = self;
    _NubModel = [OddAndNubModel shareOddAndNubModel];
    [self CustomRight:@"菜单"];
    [self setTableView];

    
    [self MakeLotterybarView];
    [self.lotterybarView.LeftButton setTitle:_GameNameString forState:UIControlStateNormal];
    pikerviewArray = [AllkingGameDatas  pickerViewAllDatas:_GameNameString];
    CurrentDic  = [GFDatas ShareReturn:pikerviewArray];
    [self setPickerone:0 andMiddle:0 and:0 and:pikerviewArray];
    self.newpickerView.leftAndMiddleAndRightNSIntegerDic = ^(NSDictionary *dic)
    {
        [blockSelf UpdataTitleFramTitleButtonTitleString:dic[@"rightstring"] andLeftImage:IMAGEFILE(@"CQLeftImage%ld") andRightImage:@"TitleRightImage"];
        blockSelf.pickerButton.hidden = YES;
        
        {
//            注数的清空
        blockSelf.NubModel.Nub = 0;
        NSDictionary *diccc = [NSDictionary dictionaryWithObject:@[@""] forKey:@"ArrayNub"];
        NSNotification *notifion = [NSNotification notificationWithName:@"ChangeArrayNub" object:nil userInfo:diccc];
        [[NSNotificationCenter defaultCenter] postNotification:notifion];
        }
        
        CurrentDic =dic;
        dispatch_async(dispatch_get_main_queue(), ^{
            [blockSelf.tableView reloadData];
        });
        
    };

    
    _TbbarOne = [[OfficialTabbarOne alloc]initWithFrame:CGRectMake(0, UIScreenHEIGHT-85*ScaleY-NVHEIGHT-20, UIScreenWIDTH, 40*ScaleY)];
    [self.view addSubview:_TbbarOne];
    //确定
    _TbbarTwo = [[OfficialTabbarTwo alloc]initWithFrame:CGRectMake(0, UIScreenHEIGHT-45*ScaleY-NVHEIGHT-20, UIScreenWIDTH, 45*ScaleY)];
    [_TbbarTwo.rightbutton addTarget:self action:@selector(ConFirm) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_TbbarTwo];
    
    
    
    
    
    [self Maketitlebutton];
    [self UpdataTitleFramTitleButtonTitleString:_GameNameString andLeftImage:IMAGEFILE(@"CQLeftImage%ld") andRightImage:@"TitleRightImage"];
    [self.TitleView addTarget:self action:@selector(ChangeGame) forControlEvents:UIControlEventTouchUpInside];
}

- (void)ChangeGame
{
    self.pickerButton.hidden = !self.pickerButton.hidden;
}

-(void)ConFirm
{
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
    _timeView.frame = CGRectMake(0,0,UIScreenWIDTH, 35*ScaleY);
    [_timeView SetQuestionBt];
    [_timeView SetPromptBt];
    _tableView.tableHeaderView = _timeView;
    
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
    
    return [GFDatas shareGetCell:_GameNameString AndChildDic:CurrentDic];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [GFDatas ShareReturnCellheight:_GameNameString AndChildDic:CurrentDic];
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return nil;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0;
}



-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    _NubModel.Nub = 0;
    NSDictionary *diccc = [NSDictionary dictionaryWithObject:@[@""] forKey:@"ArrayNub"];
    NSNotification *notifion = [NSNotification notificationWithName:@"ChangeArrayNub" object:nil userInfo:diccc];
    [[NSNotificationCenter defaultCenter] postNotification:notifion];
    [_TbbarTwo ddddealloc];

}
@end
