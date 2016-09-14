//
//  CreditCell.m
//  GOODLOTTERY
//
//  Created by apple on 16/3/11.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "CreditCell.h"

@interface CreditLable : UILabel
@end
@implementation CreditLable
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.font = [UIFont systemFontOfSize:13*ScaleY];
        self.textColor = GETCOLOR(@"wt1");
    }
    return self;
}
@end

@implementation CreditCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    NSArray *array1 = @[@"用户名",@"账变类型",@"支出",@"备注"];
    NSArray *array2 = @[@"时间",@"余额",@"收入",@""];
    if (self)
    {
        for (int i = 0; i<4; i++)
        {
            CreditLable *lable1;
            CreditLable *lable2;
            CreditLable *lable3;
            CreditLable *lable4;
            if (i!=3)
            {
                lable1 = [[CreditLable alloc]initWithFrame:CGRectMake(5*ScaleX, 5*ScaleY+(5*ScaleY+20*ScaleY)*i,UIScreenWIDTH/5-5*ScaleX,20*ScaleY)];
                lable2 = [[CreditLable alloc]initWithFrame:CGRectMake(UIScreenWIDTH/5,5*ScaleY+(5*ScaleY+20*ScaleY)*i,UIScreenWIDTH*3/10,20*ScaleY)];
                lable3 = [[CreditLable alloc]initWithFrame:CGRectMake(UIScreenWIDTH/2,5*ScaleY+(5*ScaleY+20*ScaleY)*i,UIScreenWIDTH/5-30*ScaleX,20*ScaleY)];
                lable4 = [[CreditLable alloc]initWithFrame:CGRectMake(UIScreenWIDTH*7/10-30*ScaleX,5*ScaleY+(5*ScaleY+20*ScaleY)*i,UIScreenWIDTH*3/10+25*ScaleX,20*ScaleY)];
                lable2.tag = 100+i;
                lable4.tag = 200+i;
                lable1.text = array1[i];
                lable3.text = array2[i];
                if (i==1) lable4.textColor = [UIColor redColor];
                if (i==2) lable2.textColor = [UIColor redColor];
            }
            else
            {
                lable1 = [[CreditLable alloc]initWithFrame:CGRectMake(5*ScaleX, 5*ScaleY+(5*ScaleY+20*ScaleY)*i,UIScreenWIDTH/5-5*ScaleX,20*ScaleY)];
                lable2 = [[CreditLable alloc]initWithFrame:CGRectMake(UIScreenWIDTH/5,5*ScaleY+(5*ScaleY+20*ScaleY)*i,UIScreenWIDTH*4/5-5*ScaleX,20*ScaleY)];
                lable2.tag = 100+i;
                lable2.textColor = DTAISCOLORE(66, 131, 206, 1);
                lable1.text = array1[i];

            }
            
            
            [self addSubview:lable1];
            [self addSubview:lable2];
            [self addSubview:lable3];
            [self addSubview:lable4];
            
        }
    }
    
    self.layer.borderColor = [UIColor groupTableViewBackgroundColor].CGColor;
    self.layer.borderWidth = 0.5;
    
    [self Updatas:nil];
    return self;
}


- (void)Updatas:(NSArray *)array
{
    NSArray *array1 =@[@"Text233333",@"追号扣款",@"2",@"追号，期数：201605091394 彩种：迪拜分分彩"];
    NSArray *array2 =@[@"2016-05-09 11:00:00 ",@"99999.999",@"999999",@""];
    for (int i = 0; i<4; i++)
    {
        UILabel *lable1 = [self viewWithTag:100+i];
        UILabel *lable2 = [self viewWithTag:200+i];
        if (i!=3)
        {
            lable1.text = array1[i];
            lable2.text = array2[i];
        }
        else
        {
            lable1.text = array1[i];
        }
        
    }
}
@end
