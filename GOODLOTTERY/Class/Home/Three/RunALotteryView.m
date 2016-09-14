//
//  RunALotteryView.m
//  GOODLOTTERY
//
//  Created by apple on 16/3/16.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "RunALotteryView.h"
#import "RunALotteryCell.h"

@implementation RunALotteryView
{
    UILabel *titleLb;
    UIImageView *RightImage;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self setallView];
    }
    return self;
}

- (void)setallView
{
    UIView *ViewHeard= [[UIView alloc]initWithFrame:CGRectMake(0, 0,UIScreenWIDTH,50*ScaleY)];
    ViewHeard.backgroundColor = GETCOLOR(@"cw");
//    UIImageView *TitleImage = [[UIImageView alloc]initWithFrame:CGRectMake(0,48*ScaleY,UIScreenWIDTH,2*ScaleY)];
//    TitleImage.image =[UIImage imageNamed:[NSString stringWithFormat:@"CutLine%ld",[SkinPeelerTool ReturnSkinpManger]]];
//    [ViewHeard addSubview:TitleImage];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(5*ScaleX, 5*ScaleY,UIScreenWIDTH-10*ScaleX,40*ScaleY);
    button.layer.cornerRadius = 5;
    button.layer.masksToBounds = YES;
//  button.backgroundColor = GETCOLOR(@"b0.6b");
    [button setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"ALLGameBt%ld",[SkinPeelerTool ReturnSkinpManger]]] forState:UIControlStateNormal];
    
    
    titleLb = [[UILabel alloc]initWithFrame:CGRectMake((UIScreenWIDTH-10*ScaleX-70*ScaleX)/2,0,60*ScaleX,40*ScaleY)];
    titleLb.textColor = [UIColor whiteColor];
    titleLb.font = [UIFont systemFontOfSize:15*ScaleY];
    titleLb.text = @"所有玩法";
    titleLb.textAlignment = NSTextAlignmentCenter;
    RightImage = [[UIImageView alloc]initWithFrame:CGRectMake((UIScreenWIDTH-10*ScaleX-70*ScaleX)/2+60*ScaleX,15*ScaleY,10*ScaleX,10*ScaleY)];
    RightImage.image = [UIImage imageNamed:@"TitleRightImage"];
    [button addSubview:RightImage];
    [button addSubview:titleLb];
    [ViewHeard addSubview:button];
    
    
    
    
    [self addSubview:ViewHeard];
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0,50*ScaleY,UIScreenWIDTH,FRAMEHEIGHT-50*ScaleY) style:UITableViewStylePlain];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.backgroundColor = GETCOLOR(@"cw");
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self addSubview:_tableView];
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
    RunALotteryCell *cell; static NSString *cellID = @"CellID";
    cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell)
    {
     cell = [[RunALotteryCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.backgroundColor = [UIColor clearColor];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 90*ScaleY;
}
@end
