//
//  ReportView.m
//  GOODLOTTERY
//
//  Created by apple on 16/5/19.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "ReportView.h"
#import "ReportHeardView.h"
#import "ReportFootView.h"
#import "PersonalCell.h"
#import "PersonalDetailedCtrl.h"

@implementation ReportView
{
    UITableView *_tableView;
    ReportHeardView *heardView;
    ReportFootView *FootView;
    __block NSInteger SelectedRow;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.backgroundColor = GETCOLOR(@"cw");
    }
    return self;
}

- (void)setKind:(NSInteger)Kind
{
    _Kind = Kind;
    [self setAllView];
}

- (void)setAllView
{
    CGFloat HeardHeight;
   __block CGFloat FootHeight = 40*ScaleY;

    if (_Kind==1) HeardHeight =85*ScaleY;else HeardHeight =127*ScaleY;
    
    heardView = [[ReportHeardView alloc]initWithFrame:CGRectMake(0, 0, UIScreenWIDTH,HeardHeight) AndKind:_Kind];
    [self addSubview:heardView];

    _tableView= [[UITableView alloc]initWithFrame:CGRectMake(0, HeardHeight, UIScreenWIDTH,FRAMEHEIGHT) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.bounces = NO;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.backgroundColor = [UIColor clearColor];
    
    FootView = [[ReportFootView alloc]initWithFrame:CGRectMake(0, 0, UIScreenWIDTH,FootHeight)];
    FootView.Kind = _Kind;
    
    __weak UITableView *BlockTableView = _tableView;
    __weak ReportFootView *BlcokFoot = FootView;
    FootView.blcokpullCell = ^(BOOL IsHideenView)
    {
        if (IsHideenView)
        {
            BlcokFoot.PullBackView.hidden = NO;
            if (_Kind==1)BlcokFoot.frame = CGRectMake(0, 0, UIScreenWIDTH, 165*ScaleY);
    
            if (_Kind==2) BlcokFoot.frame = CGRectMake(0, 0, UIScreenWIDTH, 140*ScaleY);;
        }
        else
        {
            BlcokFoot.PullBackView.hidden = YES;
            BlcokFoot.frame = CGRectMake(0, 0, UIScreenWIDTH, 40*ScaleY);
            
        }
        [BlockTableView reloadData];
    };
    
    _tableView.tableFooterView = FootView;

    
    [self addSubview:_tableView];
    
    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    PersonalCell *cell; static NSString *CellId = @"CellID";
    
    cell = [tableView dequeueReusableCellWithIdentifier:CellId];
    if (!cell)
    {
        cell = [[PersonalCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellId];
    }
    cell.backgroundColor = GETCOLOR(@"cbw");
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
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
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.row+1==SelectedRow)
    {
        return 145*ScaleY;
    }
    return 40*ScaleY;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

@end
