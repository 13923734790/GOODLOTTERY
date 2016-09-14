//
//  TopUpView.m
//  GOODLOTTERY
//
//  Created by apple on 16/5/11.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "TopUpView.h"
#import "TopUpHeard.h"
#import "ThirdPartyCell.h"
#import "ThirdpartyCellOne.h"
#import "CompanyCell.h"
#import "CompanyCellOne.h"
@interface TopUpView()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tableView;
@end
@implementation TopUpView
{
   __block NSString *CurrentCell;
}
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self)
    {
        [self UIConfiguration];
    }
    return self;
}

- (void)UIConfiguration
{
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, UIScreenWIDTH,FRAMEHEIGHT) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.bounces = NO;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.backgroundColor = [UIColor clearColor];
    TopUpHeard *heardView = [[TopUpHeard alloc]initWithFrame:CGRectMake(0, 0,UIScreenWIDTH, 225*ScaleX)];
    __block TopUpView *Blcokself = self;
    heardView.blcokPushNub = ^(NSInteger nub)
    {
    };
    heardView.blockUpdataTableView = ^(NSInteger nub)
    {
        if (nub==0)CurrentCell = @"ThirdPartyCell";
        if (nub==1)CurrentCell = @"CompanyCell";
        if (nub==2)CurrentCell = @"WXCell";
        if (nub==3)CurrentCell = @"ThirdPartyCell";
        
        dispatch_async(dispatch_get_main_queue(), ^{
           [Blcokself.tableView reloadData];
        });
    };
    CurrentCell = @"ThirdPartyCell";
    _tableView.tableHeaderView = heardView;
    [self addSubview:_tableView];
    
    [self reloadTopUpdatas];
}
- (void)reloadTopUpdatas
{
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell*cell;
    if ([CurrentCell isEqualToString:@"ThirdPartyCell"])
    {
    ThirdPartyCell*ThirdCell = [[ThirdPartyCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
        __weak TopUpView *BlcokSelf = self;
        ThirdCell.BlockNext = ^(NSArray *Things)
        {
            CurrentCell = @"ThirdPartyCellOne";
            dispatch_async(dispatch_get_main_queue(), ^{
                [BlcokSelf.tableView reloadData];
            });
        };
        cell = ThirdCell;
    }
    else if ([CurrentCell isEqualToString:@"ThirdPartyCellOne"])
    {
        ThirdpartyCellOne *ThirdCell = [[ThirdpartyCellOne alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
        cell = ThirdCell;
    }
    else if ([CurrentCell isEqualToString:@"CompanyCell"])
    {
        CompanyCell *CPCell = [[CompanyCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
        __weak TopUpView *BlcokSelf = self;
        CPCell.BlockNext = ^(NSArray *Things)
        {
            CurrentCell = @"CompanyCellOne";
            dispatch_async(dispatch_get_main_queue(), ^{
                [BlcokSelf.tableView reloadData];
            });

        };
        cell = CPCell;
    }
    else if ([CurrentCell isEqualToString:@"CompanyCellOne"])
    {
        CompanyCellOne *CPOneCell = [[CompanyCellOne alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
        __weak TopUpView *BlcokSelf = self;
        CPOneCell.BlockNext = ^(NSArray *Things)
        {
            CurrentCell = @"CompanyCellOne";
            dispatch_async(dispatch_get_main_queue(), ^{
                [BlcokSelf.tableView reloadData];
            });

        };
        cell = CPOneCell;
    }
    else if ([CurrentCell isEqualToString:@"WXCell"])
    {
        CompanyCellOne *CPOneCell = [[CompanyCellOne alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
        __weak TopUpView *BlcokSelf = self;
        CPOneCell.BlockNext = ^(NSArray *Things)
        {
            CurrentCell = @"CompanyCellOne";
            dispatch_async(dispatch_get_main_queue(), ^{
                [BlcokSelf.tableView reloadData];
            });
            
        };
        cell = CPOneCell;
    }


    cell.backgroundColor = DTAISCOLORE(203, 203, 203, 1);
    cell.selectionStyle = UITableViewCellSelectionStyleNone;

    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if ([CurrentCell isEqualToString:@"ThirdPartyCell"]||[CurrentCell isEqualToString:@"ThirdPartyCellOne"]||[CurrentCell isEqualToString:@"CompanyCell"])
    {
        return FRAMEHEIGHT-225*ScaleX;
    }
    if ([CurrentCell isEqualToString:@"CompanyCellOne"]||[CurrentCell isEqualToString:@"WXCell"]) {
        return 730*ScaleY;
    }
    return 0;
}

@end
