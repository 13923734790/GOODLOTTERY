//
//  CatchCheckView.m
//  GOODLOTTERY
//
//  Created by apple on 16/3/9.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "CatchCheckView.h"
#import "LotteryCheckHeardView.h"
#import "CatchCheckCell.h"

@implementation CatchCheckView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self)
    {
        self.backgroundColor = GETCOLOR(@"cw");
       _heardView = [[LotteryCheckHeardView alloc]initWithFrame:CGRectMake(0, 0, UIScreenWIDTH, 86*ScaleY) AndKind:1];
        
        [self addSubview:_heardView];
        [self AddSomeView];
    }
    return self;
}


- (void)AddSomeView
{
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0,86*ScaleY,UIScreenWIDTH,FRAMEHEIGHT-86*ScaleY) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource =self;
    _tableView.bounces = NO;
    _tableView.backgroundColor = [UIColor clearColor];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self addSubview:_tableView];
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    CatchCheckCell *cell; static NSString *CellId = @"CellID";
    
    cell = [tableView dequeueReusableCellWithIdentifier:CellId];
    if (!cell)
    {
        cell = [[CatchCheckCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellId];
    }
    cell.backgroundColor = [UIColor clearColor];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 140*ScaleY;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.SeletedCell)
    {
        _SeletedCell(@"ID");
    }
    
}
@end
