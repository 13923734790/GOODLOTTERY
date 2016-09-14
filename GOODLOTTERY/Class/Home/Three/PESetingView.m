//
//  PESetingView.m
//  GOODLOTTERY
//
//  Created by apple on 16/4/8.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "PESetingView.h"
#import "PEHeardView.h"
#import "PECell.h"

@implementation PESetingView
{
    PEHeardView *View;
    UIButton *_button;
    UITableView *_tableView;
}

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        View = [[PEHeardView alloc]initWithFrame:CGRectMake(0, 0, UIScreenWIDTH ,90*ScaleY)];
        View.backgroundColor = GETCOLOR(@"cw");
        [self addSubview:View];
        
        _button = [UIButton buttonWithType:UIButtonTypeCustom];
        _button.frame = CGRectMake(15*ScaleX,FRAMEHEIGHT-70*ScaleY,UIScreenWIDTH-30*ScaleX,50*ScaleY);
        [_button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_button setTitle:@"下一步" forState:UIControlStateNormal];
        [_button setBackgroundImage:[UIImage imageNamed:[SkinPeelerTool UpdatasCurrent][0]] forState:UIControlStateNormal];
        [self addSubview:_button];
        
        
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 90*ScaleY,UIScreenWIDTH,FRAMEHEIGHT-190*ScaleY) style:UITableViewStylePlain];
        _tableView.delegate =self;
        _tableView.dataSource = self;
        _tableView.bounces = NO;
        _tableView.backgroundColor = [UIColor clearColor];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
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
    PECell *pecell;  NSString *CellID = @"CellID";
    pecell = [tableView dequeueReusableCellWithIdentifier:CellID];
    if (!pecell)
    {
        pecell = [[PECell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellID];
    }
    
    return pecell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40*ScaleY;
}
@end
