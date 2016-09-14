//
//  CatchDetaildView.m
//  GOODLOTTERY
//
//  Created by apple on 16/3/9.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "CatchDetaildView.h"
#import "blackAndwhiteLable.h"
#import "CatchDetaildCell.h"

@implementation CatchDetaildView
{
    UIView *HeardView;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    
    NSArray *array1 = @[@"追号编号:",@"追号时间:",@"玩法:",@"开始期号:",@"完成期数:",@"追号总金额:",@"中奖期数:",@"取消金额:",@"官方跳开即停:",@"追号内容:"];
    NSArray *array2 = @[@"游戏用户:",@"游戏:",@"模式:",@"追号期数:",@"取消期数:",@"完成金额:",@"派奖总金额:",@"追号状态:",@"中奖后停止追号:",];
    self = [super initWithFrame:frame];
    if (self)
    {
        HeardView = [[UIView alloc]initWithFrame:CGRectMake(0,0,UIScreenWIDTH,290*ScaleY)];
//        [self addSubview:HeardView];
        
        for (int i = 0; i<10; i++)
        {
            blackAndwhiteLable *lable1;
            blackAndwhiteLable *lable2;
            blackAndwhiteLable *lable3;
            blackAndwhiteLable *lable4;
            CGRect rect1;
            CGRect rect2;
            CGRect rect3;
            CGRect rect4;
            if (i==8)
            {
                rect1 = CGRectMake(5*ScaleX,10*ScaleY+20*ScaleY*i,UIScreenWIDTH/5+20*ScaleX,20*ScaleY);
                rect2 = CGRectMake(UIScreenWIDTH/5+25*ScaleX,10*ScaleY+20*ScaleY*i,UIScreenWIDTH*2/5-25*ScaleY,20*ScaleY);
                rect3 = CGRectMake(UIScreenWIDTH*3/5+10*ScaleX,10*ScaleY+20*ScaleY*i,UIScreenWIDTH/5+30*ScaleX,20*ScaleY);
                rect4 = CGRectMake(UIScreenWIDTH*4/5+40*ScaleX,10*ScaleY+20*ScaleY*i,UIScreenWIDTH/5-40*ScaleX,20*ScaleY);
            }
            else if (i==9)
            {
                rect1 = CGRectMake(5*ScaleX,10*ScaleY+20*ScaleY*i,UIScreenWIDTH/5,20*ScaleY);
                rect2 = CGRectMake(UIScreenWIDTH/5+5*ScaleX,10*ScaleY+20*ScaleY*i,UIScreenWIDTH*2/5-5*ScaleY,20*ScaleY);
                rect3 = CGRectMake(0,0,0,0);
                rect4 = CGRectMake(0,0,0,0);
            }
            else
            {
                rect1 = CGRectMake(5*ScaleX,10*ScaleY+20*ScaleY*i,UIScreenWIDTH/5,20*ScaleY);
                rect2 = CGRectMake(UIScreenWIDTH/5+5*ScaleX,10*ScaleY+20*ScaleY*i,UIScreenWIDTH*2/5+5*ScaleX,20*ScaleY);
                rect3 = CGRectMake(UIScreenWIDTH*3/5+10*ScaleX,10*ScaleY+20*ScaleY*i,UIScreenWIDTH/5-5*ScaleX,20*ScaleY);
                rect4 = CGRectMake(UIScreenWIDTH*4/5+5*ScaleX,10*ScaleY+20*ScaleY*i,UIScreenWIDTH/5-5*ScaleX,20*ScaleY);
            }
                lable1 = [[blackAndwhiteLable alloc]initWithFrame:rect1];
                lable2 = [[blackAndwhiteLable alloc]initWithFrame:rect2];
                lable3 = [[blackAndwhiteLable alloc]initWithFrame:rect3];
                lable4 = [[blackAndwhiteLable alloc]initWithFrame:rect4];
                lable2.tag = 100+i;
                lable4.tag = 200+i;
                if (i==9) lable1.text = array1[i];else lable1.text = array1[i],lable3.text = array2[i];
                 if (i==6||i==7) lable4.textColor = [UIColor redColor];
                [HeardView addSubview:lable1];
                [HeardView addSubview:lable2];
                [HeardView addSubview:lable3];
                [HeardView addSubview:lable4];
        }
    }
    UILabel *TitleView = [[UILabel alloc]initWithFrame:CGRectMake(0, 220*ScaleY,UIScreenWIDTH,40*ScaleY)];
    TitleView.textAlignment = NSTextAlignmentCenter;
    TitleView.text = @"可能中奖情况";
    TitleView.textColor = GETCOLOR(@"wb");
    TitleView.backgroundColor = GETCOLOR(@"b0.6group");
    [HeardView addSubview:TitleView];
    
    NSArray *array = @[@"奖期",@"追号倍数",@"追号状态"];
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0,260*ScaleY, UIScreenWIDTH,30*ScaleY)];
    for (int i = 0; i<3; i++)
    {
        UILabel *lable = [[UILabel alloc]initWithFrame:CGRectMake(UIScreenWIDTH/3*i, 0,UIScreenWIDTH/3,30*ScaleY)];
        lable.textColor = [UIColor whiteColor];
        lable.textAlignment = NSTextAlignmentCenter;
        lable.font = [UIFont systemFontOfSize:15*ScaleY];
        lable.text = array[i];
        [view addSubview:lable];
    }
    view.backgroundColor = [UIColor blackColor];
    [HeardView addSubview:view];
    [self AddSomeView];
    [self Updatas:nil];
    return self;
}


- (void)AddSomeView
{
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0,0,UIScreenWIDTH,FRAMEHEIGHT) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource =self;
    _tableView.bounces = NO;
    _tableView.backgroundColor = [UIColor clearColor];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.tableHeaderView = HeardView;
    [self addSubview:_tableView];
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 15;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    CatchDetaildCell *cell; static NSString *CellId = @"CellID";
    
    cell = [tableView dequeueReusableCellWithIdentifier:CellId];
    if (!cell)
    {
        cell = [[CatchDetaildCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellId];
    }
    cell.backgroundColor = [UIColor clearColor];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

//- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
//{
//    NSArray *array = @[@"奖期",@"追号倍数",@"追号状态"];
//    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, UIScreenWIDTH,30*ScaleY)];
//    for (int i = 0; i<3; i++)
//    {
//        UILabel *lable = [[UILabel alloc]initWithFrame:CGRectMake(UIScreenWIDTH/3*i, 0,UIScreenWIDTH/3,30)];
//        lable.textColor = [UIColor whiteColor];
//        lable.textAlignment = NSTextAlignmentCenter;
//        lable.font = [UIFont systemFontOfSize:15*ScaleY];
//        lable.text = array[i];
//        [view addSubview:lable];
//    }
//    view.backgroundColor = [UIColor blackColor];
//    return view;
//}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 30*ScaleY;
}

//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
//{
//    return 30;
//}
- (void)Updatas:(NSArray *)array
{
    
    NSArray *array1 = @[@"20160509639732648374923t27432",@"2016-20-23 22:12:22:22",@"后三直选复式",@"2221123213124242121",@"25",@"50",@"0",@"0",@"是",@"6｜5｜5"];
    NSArray *array2 = @[@"TES323232",@"迪拜分分彩",@"元",@"25",@"0",@"50",@"0",@"已完成",@"是"];
    for (int i = 0; i<10; i++)
    {
        UILabel *lable1 = [HeardView viewWithTag:100+i];
        UILabel *lable2 = [HeardView viewWithTag:200+i];
        lable1.text = array1[i];
        if (i==9);else lable2.text = array2[i];
    }
}
@end
