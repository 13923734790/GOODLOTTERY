//
//  DownListVIew.m
//  GOODLOTTERY
//
//  Created by apple on 16/3/14.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "DownListVIew.h"
#import "DownListModel.h"

@implementation DownListVIew
{
    DownListModel *model;
}
- (instancetype)initWithFrame:(CGRect)frame AndModel:(DownListModel *)Model
{
    self = [super initWithFrame:frame];
    if (self)
    {
        model = Model;
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, FRAMEWIDTH, FRAMEHEIGHT)];
        _tableView.delegate = self;
        _tableView.dataSource =self;
        _tableView.backgroundColor =GETCOLOR(@"wb");
        _tableView.bounces = NO;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
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
    return model.TitleNub.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell; static NSString *CellID = @"CellID";
    cell = [tableView dequeueReusableCellWithIdentifier:CellID];
    if (!cell)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellID];
    }
    cell.textLabel.text = model.TitleNub[indexPath.row];
    cell.textLabel.textColor = GETCOLOR(@"bw");
    cell.backgroundColor = GETCOLOR(@"wb");
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
 
    return model.cellheight;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (_BlockButtonTitle)
    {
        _BlockButtonTitle(model.TitleNub[indexPath.row]);
    }
    
}

@end
