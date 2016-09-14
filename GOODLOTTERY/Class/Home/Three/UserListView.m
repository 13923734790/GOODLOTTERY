//
//  UserListView.m
//  GOODLOTTERY
//
//  Created by apple on 16/3/17.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "UserListView.h"
#import "UserListHeardView.h"
#import "blackAndwhiteLable.h"
#import "UserListCell.h"

//@interface SelfCell : UITableViewCell
//@end
//@implementation SelfCell
//- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
//{
//    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
//    if (self)
//    {
//    }
//    return self;
//}
//@end
@implementation UserListView
{
    UserListHeardView *heardView;
   __block NSInteger SelectedRow;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        SelectedRow = 0;
        [self setAllView];
    }
    return self;
}

- (void)setAllView
{
    heardView = [[UserListHeardView alloc]initWithFrame:CGRectMake(0, 0, UIScreenWIDTH,84*ScaleY)];
    [self addSubview:heardView];
//    __block UserListView *blockSelf = self;
//    heardView.BlockNub = ^(NSInteger Nub)
//    {
//        if (blockSelf.BlockNub)
//        {
//            blockSelf.BlockNub(Nub);
//        }
//    };
    
    heardView.backgroundColor = GETCOLOR(@"cw");
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0,84*ScaleY, UIScreenWIDTH,FRAMEHEIGHT-84*ScaleY) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.bounces = NO;
    _tableView.backgroundColor =GETCOLOR(@"cgroup");
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self addSubview:_tableView];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 13;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UserListCell *cell; static NSString *CellId = @"CellId";
    cell = [tableView dequeueReusableCellWithIdentifier:CellId];
    if (!cell)
    {
    cell = [[UserListCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellId];
    }
    
    cell.blcokpushView = ^(NSString *CurrentTitle)
    {
        if (_blcokpushView)
        {
            _blcokpushView(CurrentTitle);
        }
    };
    cell.blcokpullCell = ^(NSInteger CurentRow)
    {
       if (SelectedRow==0||SelectedRow!=CurentRow+1) SelectedRow = CurentRow+1;
        else
        {
            SelectedRow = 0;
        }
        [self.tableView reloadData];
    };
    if (SelectedRow==indexPath.row+1)
    {
        cell.pullView.hidden = NO;
    }
    else
    {
        cell.pullView.hidden = YES;
    }
    cell.tag = indexPath.row;
    cell.PullArray = @[@"详情",@"团队总览",@"返点设定",@"配额设定",@"账变记录"];
    cell.backgroundColor = [UIColor clearColor];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row+1==SelectedRow)
    {
        return 65*ScaleY+2;
    }
      return 40*ScaleY;
}

@end
