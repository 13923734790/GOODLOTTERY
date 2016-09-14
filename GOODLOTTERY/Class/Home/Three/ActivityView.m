//
//  ActivityView.m
//  GOODLOTTERY
//
//  Created by apple on 16/3/23.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "ActivityView.h"
#import "SearchVIew.h"
#import "ActivityCell.h"

@implementation ActivityView
{
    SearchVIew *Sview;
    __block NSInteger SelectedRow;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        Sview = [[SearchVIew alloc]initWithFrame:CGRectMake(0, 0,UIScreenWIDTH, 44*ScaleY) AndKind:1];
        [self addSubview:Sview];
        
        
        UIView *titleView = [[UIView alloc]initWithFrame:CGRectMake(0,44*ScaleY,UIScreenWIDTH,40*ScaleY)];
        titleView.backgroundColor = [UIColor blackColor];
        NSArray *array1 = @[@"活动名称",@"有效流水",@"所需流水",@"操作",@"详情"];
        [self addSubview:titleView];
        for (int i = 0; i<5; i++)
        {
            UILabel *lable1;
            lable1 = [[UILabel alloc]initWithFrame:CGRectMake(UIScreenWIDTH/5*i,0,UIScreenWIDTH/5,40*ScaleY)];
            lable1.textAlignment = NSTextAlignmentCenter;
            lable1.textColor = [UIColor whiteColor];
            lable1.font = [UIFont systemFontOfSize:13*ScaleY];
            lable1.text = array1[i];
            [titleView addSubview:lable1];
        }
        
        
        
        self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 84*ScaleY, UIScreenWIDTH,FRAMEHEIGHT-84*ScaleY) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.bounces = NO;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.backgroundColor = [UIColor clearColor];
        [self addSubview:_tableView];
        
    }
    return self;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    ActivityCell *cell; static NSString *CellId = @"CellID";
    
    cell = [tableView dequeueReusableCellWithIdentifier:CellId];
    if (!cell)
    {
        cell = [[ActivityCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellId];
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
        return 120*ScaleY;
    }
    return 40*ScaleY;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
}


@end
