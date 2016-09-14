//
//  CreditChangeView.m
//  GOODLOTTERY
//
//  Created by apple on 16/3/11.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "CreditChangeView.h"
#import "LotteryCheckHeardView.h"
#import "CreditCell.h"

@implementation CreditChangeView
{
    UIView *HeardView;
}


- (instancetype)initWithFrame:(CGRect)frame
{
    
    self = [super initWithFrame:frame];
    
    if (self)
    {
        self.backgroundColor = GETCOLOR(@"cw");
        _heardView = [[LotteryCheckHeardView alloc]initWithFrame:CGRectMake(0, 0, UIScreenWIDTH, 86*ScaleY) AndKind:3];
        [self addSubview:_heardView];
        
        
        HeardView = [[UIView alloc]initWithFrame:CGRectMake(0,88*ScaleY,UIScreenWIDTH,40*ScaleY)];
        HeardView.backgroundColor = [UIColor blackColor];
        for (int i = 0; i<3; i++)
        {
        UILabel *lable = [[UILabel alloc]initWithFrame:CGRectMake(5*ScaleX+(UIScreenWIDTH-10*ScaleX)/3*i,0,(UIScreenWIDTH-10*ScaleX)/3,40*ScaleY)];
        lable.font = [UIFont systemFontOfSize:13*ScaleY];
        lable.tag = 100+i;
        if (i==0)lable.textColor = [UIColor whiteColor];else lable.textColor = [UIColor redColor];
        [HeardView addSubview:lable];
        }
        [self addSubview:HeardView];
        self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 138*ScaleY, UIScreenWIDTH,FRAMEHEIGHT-128*ScaleY) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.bounces = NO;
        _tableView.backgroundColor = [UIColor clearColor];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [self addSubview:_tableView];
    }
    [self updatas:nil];
    return self;
}


- (void)updatas:(NSArray *)array
{
    NSArray *array1 = @[@"总计400354笔",@"总支出:19999(0)",@"总收入:9999999(0)"];
    
    for (int i = 0; i<3; i++)
    {
        UILabel *lable = [HeardView viewWithTag:100+i];
        if (i!=0)
        {
            NSMutableAttributedString *AttString1 = [[NSMutableAttributedString alloc]initWithString:array1[i]];
            NSRange Clolor2Range1 = NSMakeRange([[AttString1 string] rangeOfString:@"("].location ,[[AttString1 string] rangeOfString:@"(0)"].length);
            [AttString1 addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:Clolor2Range1];
            [lable setAttributedText:AttString1];
        }
        else
        {
            lable.text = array1[i];
        }
    }

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
    
    CreditCell *cell; static NSString *CellId = @"CellID";
    
    cell = [tableView dequeueReusableCellWithIdentifier:CellId];
    if (!cell)
    {
        cell = [[CreditCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellId];
    }
    cell.backgroundColor = [UIColor clearColor];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 100*ScaleY ;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
}

@end
