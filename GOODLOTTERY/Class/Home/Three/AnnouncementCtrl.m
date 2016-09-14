//
//  AnnouncementCtrl.m
//  GOODLOTTERY
//
//  Created by apple on 16/5/5.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "AnnouncementCtrl.h"
#import "AnnouncementCell.h"

@interface AnnouncementCtrl ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic)NSInteger CurrentReadNub;
@end

@implementation AnnouncementCtrl
{
    NSString *strings;
}

-(void)updatasCurent
{
    strings = @"你是一个神秘的人，与上天有所连结。你可能有很强的第六感或者灵通的能力。你有一种天真与信任的质量，可以处于浑沌与混乱的情况中。你的困难与挑战：目前处于恼怒，混乱的状况。你想要为你的生命找一个出口，但是却无能为力。现在的你，就像处于最深的黑夜。危机就是转机，转个身，最大的平静就隐藏在你背后。";
    _CurrentReadNub = 999999;
    
}
- (void)viewDidLoad {
   [super viewDidLoad];
     self.title =_titleString;
    [self updatasCurent];
    
    
    
    UIView *HeardView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, UIScreenWIDTH, 30*ScaleY)];
    HeardView.backgroundColor = GETCOLOR(@"b0.6b");
    UILabel *HeardLable = [[UILabel alloc]initWithFrame:CGRectMake(5, 0, UIScreenWIDTH-10, 30*ScaleY)];
    HeardLable.textColor = [UIColor whiteColor];
    HeardLable.font = [UIFont systemFontOfSize:15*ScaleY];
    HeardLable.text = @"公告列表";
    [HeardView addSubview:HeardLable];
    
    
    
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0,UIScreenWIDTH,UIScreenHEIGHT) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.backgroundColor = [UIColor clearColor];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.tableHeaderView = HeardView;
    [self.view addSubview:_tableView];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
     AnnouncementCell *Cell ; static NSString *CellID = @"CellID";
    Cell = [tableView dequeueReusableCellWithIdentifier:CellID];
    if (!Cell)
    {
        Cell = [[AnnouncementCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellID];
    }
    Cell.TitleString = @"迪拜分分彩停止销售";
    Cell.TimeString = @"2016-0509 14:12:12";
    Cell.DetailedString = strings;
    if (indexPath.row==_CurrentReadNub)
    {
        Cell.isHiddenCell = NO;
    }
    else
    {
        Cell.isHiddenCell = YES;
    }
    return Cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSArray *arrayIndex;
    if (indexPath.row==_CurrentReadNub)
    {
        _CurrentReadNub = 999999;
        NSIndexPath *CurrentIndex1 = [NSIndexPath indexPathForRow:indexPath.row inSection:0];
        arrayIndex = @[CurrentIndex1];
    }
    else
    {
        if (_CurrentReadNub!=999999)
        {
            NSIndexPath *CurrentIndex1 = [NSIndexPath indexPathForRow:_CurrentReadNub inSection:0];
            NSIndexPath *CurrentIndex2 = [NSIndexPath indexPathForRow:indexPath.row inSection:0];
            arrayIndex = @[CurrentIndex1,CurrentIndex2];
        }
        else
        {
            NSIndexPath *CurrentIndex1 = [NSIndexPath indexPathForRow:indexPath.row inSection:0];
            arrayIndex = @[CurrentIndex1];
        }
       _CurrentReadNub = indexPath.row;
    }
    

    [_tableView reloadRowsAtIndexPaths:arrayIndex withRowAnimation:UITableViewRowAnimationNone];

    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.row==_CurrentReadNub)
    {
        UILabel *lable1 = [[UILabel alloc]init];
        lable1.font = [UIFont systemFontOfSize:13*ScaleY];
        CGSize size1 = [strings sizeWithStringAndfont:lable1.font AndLableSize:CGSizeMake(UIScreenWIDTH-20, 8000)];
        
        return 20+25*ScaleY+size1.height+10+1;
    }
    return 20+25*ScaleY+1;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end
