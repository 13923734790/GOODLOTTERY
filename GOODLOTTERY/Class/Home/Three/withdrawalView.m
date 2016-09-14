//
//  withdrawalView.m
//  GOODLOTTERY
//
//  Created by apple on 16/4/26.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "withdrawalView.h"
#import "withdrawalCell.h"
#import "withdrawalFootView.h"
#import "CashMoneyCtrl.h"

@implementation withdrawalView
{
    UISegmentedControl *segment;
    UITableView *_tableView;
    NSMutableDictionary *SeletedDic;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        segment = [[UISegmentedControl alloc]initWithItems:@[@"常态性稽核",@"优惠稽核",@"实际有效投注"]];
        segment.frame = CGRectMake(10*ScaleX, 10*ScaleY, UIScreenWIDTH-20*ScaleX, 45*ScaleY);
        segment.selectedSegmentIndex = 0;
        NSDictionary *dic1 = [NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName,[UIFont systemFontOfSize:15*ScaleY],NSFontAttributeName ,nil];
//        NSDictionary *dic2 = [NSDictionary dictionaryWithObjectsAndKeys:GETCOLOR(@"wb"),NSForegroundColorAttributeName,[UIFont systemFontOfSize:15*ScaleY],NSFontAttributeName ,nil];
        [segment setTitleTextAttributes:dic1 forState:UIControlStateSelected];
        [segment setTitleTextAttributes:dic1 forState:UIControlStateNormal];
        [segment addTarget:self action:@selector(SegmentChange:) forControlEvents:UIControlEventValueChanged];
        [self addSubview:segment];
        segment.tintColor = GETCOLOR(@"blr");
        
        
        
         if (!SeletedDic)SeletedDic = [[NSMutableDictionary alloc]initWithCapacity:5];
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 65*ScaleY,UIScreenWIDTH,FRAMEHEIGHT-65*ScaleY) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = [UIColor clearColor];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.bounces = NO;
        withdrawalFootView *footView = [[withdrawalFootView alloc]initWithFrame:CGRectMake(0, 0, UIScreenWIDTH, 150*ScaleY)];
        _tableView.tableFooterView = footView;
        [footView.ContinueBt addTarget:self action:@selector(pushCashCtrl) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_tableView];

    }
    return self;
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
    withdrawalCell *cell; static NSString *CellId = @"CellId";
    cell = [tableView dequeueReusableCellWithIdentifier:CellId];
    if (!cell)
    {
        cell = [[withdrawalCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellId];
    }
    cell.backgroundColor = [UIColor clearColor];
    [cell setAllViewFram:segment.selectedSegmentIndex];
    cell.IndexNub = indexPath.row;
    
    NSString *SeletedID = [NSString stringWithFormat:@"%ld",indexPath.row];
    if ([[SeletedDic objectForKey:SeletedID] isEqualToString:@"PullCell"])
    {
        cell.isHiddenCell = NO;
    }
    else
    {
        cell.isHiddenCell = YES;
    }
    cell.BlockCellID = ^(NSInteger NubID,BOOL IsCellHiden)
    {
        
        NSString *IsHinden;
        if (!IsCellHiden)
        {
            IsHinden = @"PullCell";
            [SeletedDic setObject:IsHinden forKey:[NSString stringWithFormat:@"%ld",NubID]];
        }
        else
        {
            [SeletedDic removeObjectForKey:[NSString stringWithFormat:@"%ld",NubID]];
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
//            [_tableView reloadData];
            NSIndexPath *CurrentIndex1 = [NSIndexPath indexPathForRow:NubID inSection:0];
                    [_tableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:CurrentIndex1, nil] withRowAnimation:UITableViewRowAnimationNone];
        });
        
    };
    
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([[SeletedDic objectForKey:[NSString stringWithFormat:@"%ld",indexPath.row]]isEqualToString:@"PullCell"])
    {
        return 333*ScaleY;
    }
    return  80*ScaleY;
}

- (void)SegmentChange:(UISegmentedControl *)seg
{
    [_tableView reloadData];
}
- (void)pushCashCtrl
{
    CashMoneyCtrl *Ctrl = [[CashMoneyCtrl alloc]init];

    if (_blcokCtrl)
    {
        _blcokCtrl(Ctrl);
    }
}
@end
