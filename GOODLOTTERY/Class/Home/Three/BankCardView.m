//
//  BankCardView.m
//  GOODLOTTERY
//
//  Created by apple on 16/3/15.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "BankCardView.h"
#import "BankCardCell.h"

@implementation BankCardView
{
    UITableView *_tableView;
    __block NSInteger SelectedRow;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    
    self = [super initWithFrame:frame];
    if (self)
    {
        [self setAllView];
        [self UpdatasImageAndColcor];
    }
    return self;
}

-(void)setAllView
{
    UIView *titleBackView = [[UIView alloc]initWithFrame:CGRectMake(0, 0,UIScreenWIDTH,30*ScaleY)];
    titleBackView.backgroundColor = [UIColor blackColor];
    NSArray *array = @[@"用户名",@"开户行",@"状态",@"详情"];
    for (int i = 0; i<4; i++)
    {    UILabel *lable;
        
        lable = [[UILabel alloc]initWithFrame:CGRectMake(UIScreenWIDTH/4*i,0,UIScreenWIDTH/4,30*ScaleY)];
        
        lable.textColor = [UIColor whiteColor];
        lable.font = [UIFont systemFontOfSize:15*ScaleY];
        lable.textAlignment = NSTextAlignmentCenter;
        lable.text = array[i];
        [titleBackView addSubview:lable];
    }
    [self addSubview:titleBackView];
    
    
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0,30*ScaleY,UIScreenWIDTH,FRAMEHEIGHT-30*ScaleY) style:UITableViewStylePlain];
    _tableView.delegate =self;
    _tableView.dataSource = self;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.backgroundColor = [UIColor clearColor];
    _tableView.bounces = NO;
    
    UIView *HeardView = [[UIView alloc]initWithFrame:CGRectMake(0, 0,UIScreenWIDTH,100*ScaleY)];
    _button = [UIButton buttonWithType:UIButtonTypeCustom];
    _button.frame = CGRectMake(15*ScaleX,25*ScaleY,UIScreenWIDTH-30*ScaleX,50*ScaleY);
    [_button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_button setTitle:@"添加银行卡" forState:UIControlStateNormal];
    [HeardView addSubview:_button];
    
    _tableView.tableFooterView =HeardView;
    [self addSubview:_tableView];
    
    
    
}
- (void)UpdatasImageAndColcor
{
    self.backgroundColor = GETCOLOR(@"cgroup");
    [_button setBackgroundImage:[UIImage imageNamed:[SkinPeelerTool UpdatasCurrent][0]] forState:UIControlStateNormal];
    [_tableView reloadData];
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    BankCardCell *cell; static NSString *CellID = @"CellID";
    cell = [tableView dequeueReusableCellWithIdentifier:CellID];
    if (!cell)
    {
        cell = [[BankCardCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellID];
    }
    
    cell.blcokpullCell = ^(NSInteger CurentRow)
    {
        if (SelectedRow==0||SelectedRow!=CurentRow+1) SelectedRow = CurentRow+1;
        else
        {
            SelectedRow = 0;
        }
        [_tableView reloadData];
    };
    if (SelectedRow==indexPath.row+1)
    {
        cell.PullBackView.hidden = NO;
    }
    else
    {
        cell.PullBackView.hidden = YES;
    }

    cell.tag = indexPath.row;
    [cell Updatas:nil];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.row+1==SelectedRow)
    {
        return 90*ScaleY;
    }
    return 40*ScaleY;
}
@end
