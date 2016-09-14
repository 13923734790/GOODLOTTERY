//
//  BankWriteView.m
//  GOODLOTTERY
//
//  Created by apple on 16/3/15.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "BankWriteView.h"
#import "BankCardSubOneCell.h"

@implementation BankWriteView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self setAllView];
    }
    return self;
}
-(void)setAllView
{
    
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0,0,UIScreenWIDTH,FRAMEHEIGHT) style:UITableViewStylePlain];
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
    [_button setBackgroundImage:[UIImage imageNamed:[SkinPeelerTool UpdatasCurrent][0]] forState:UIControlStateNormal];
    [HeardView addSubview:_button];
    
    _tableView.tableFooterView =HeardView;
    [self addSubview:_tableView];
    
    
    
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
    BankCardSubOneCell *cell;
    cell = [[BankCardSubOneCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    cell.backgroundColor = [UIColor clearColor];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 510*ScaleY;
}

@end
