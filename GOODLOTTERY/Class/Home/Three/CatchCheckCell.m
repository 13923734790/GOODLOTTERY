//
//  CatchCheckCell.m
//  GOODLOTTERY
//
//  Created by apple on 16/3/9.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "CatchCheckCell.h"
#import "blackAndwhiteLable.h"

@implementation CatchCheckCell
{
    blackAndwhiteLable *GameLable;
    blackAndwhiteLable *NubLable;
    blackAndwhiteLable *Timelable;
    blackAndwhiteLable *BetNublable;
    blackAndwhiteLable *BetContentLable;
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    NSArray *array1 = @[@"游戏玩法",@"追号期数",@"总投金额",@"完成金额"];
    NSArray *array2 = @[@"彩种",@"完成期数",@"追号状态",@"用户"];
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self)
    {
        
        GameLable = [[blackAndwhiteLable alloc]initWithFrame:CGRectMake(5,0,UIScreenWIDTH/6+10*ScaleX,20)];
        NubLable = [[blackAndwhiteLable alloc]initWithFrame:CGRectMake(UIScreenWIDTH/6+15*ScaleX,0,UIScreenWIDTH/2-35*ScaleX,20)];
        Timelable = [[blackAndwhiteLable alloc]initWithFrame:CGRectMake(UIScreenWIDTH*2/3-20*ScaleX,0,UIScreenWIDTH/3+15*ScaleX,20)];
        Timelable.textAlignment = NSTextAlignmentRight;
        [self addSubview:GameLable];
        [self addSubview:NubLable];
        [self addSubview:Timelable];
        for (int i = 0; i<4; i++)
        {
            blackAndwhiteLable *lable1 = [[blackAndwhiteLable alloc]initWithFrame:CGRectMake(5,20*ScaleY+20*ScaleY*i,UIScreenWIDTH/6+10*ScaleX,20)];
            blackAndwhiteLable *lable2 =[[blackAndwhiteLable alloc]initWithFrame:CGRectMake(UIScreenWIDTH/6+15*ScaleX,20*ScaleY+20*ScaleY*i,UIScreenWIDTH/2-35*ScaleX,20)];
            blackAndwhiteLable *lable3;
            blackAndwhiteLable *lable4;
            if (i==3)
            {
                lable3 = [[blackAndwhiteLable alloc]initWithFrame:CGRectMake(UIScreenWIDTH*2/3-20*ScaleX,20*ScaleY+20*ScaleY*i,(UIScreenWIDTH/3+15*ScaleX)/4,20*ScaleY)];
                lable4 = [[blackAndwhiteLable alloc]initWithFrame:CGRectMake(UIScreenWIDTH*2/3-20*ScaleX+(UIScreenWIDTH/3+15*ScaleX)/4,20*ScaleY+20*ScaleY*i,(UIScreenWIDTH/3+15*ScaleX)*3/4,20*ScaleY)];
            }
            else
            {
                lable3  = [[blackAndwhiteLable alloc]initWithFrame:CGRectMake(UIScreenWIDTH*2/3-20*ScaleX,20*ScaleY+20*ScaleY*i,(UIScreenWIDTH/3+15*ScaleX)/2,20*ScaleY)];
                lable4  = [[blackAndwhiteLable alloc]initWithFrame:CGRectMake(UIScreenWIDTH*2/3-20*ScaleX+(UIScreenWIDTH/3+15*ScaleX)/2,20*ScaleY+20*ScaleY*i,(UIScreenWIDTH/3+15*ScaleX)/2,20*ScaleY)];
            }
            lable1.text = array1[i];
            lable3.text = array2[i];
            if (i==2) lable2.textColor = DTAISCOLORE(239, 65, 73, 1),lable4.textColor = DTAISCOLORE(63, 136, 37, 1);
            if (i==3) lable2.textColor =DTAISCOLORE(63, 136, 37, 1);
            
            lable4.textAlignment = NSTextAlignmentRight;
            lable2.tag = 100+i;
            lable4.tag = 200+i;
            [self addSubview:lable1];
            [self addSubview:lable2];
            [self addSubview:lable3];
            [self addSubview:lable4];
        }
        
        UILabel *BetNubTitle = [[blackAndwhiteLable alloc]initWithFrame:CGRectMake(5,20*ScaleY+20*ScaleY*4,UIScreenWIDTH/6+15*ScaleX,20)];
        UILabel *BetContentTitle = [[blackAndwhiteLable alloc]initWithFrame:CGRectMake(5,20*ScaleY+20*ScaleY*5,UIScreenWIDTH/6+15*ScaleX,20)];
        BetNubTitle.text = @"追号编号";
        BetContentTitle.text = @"追号内容";
        BetNublable = [[blackAndwhiteLable alloc]initWithFrame:CGRectMake(UIScreenWIDTH/6+15*ScaleX,20*ScaleY+20*ScaleY*4,UIScreenWIDTH*5/6-15*ScaleX,20)];
        BetNublable.textColor = DTAISCOLORE(29, 89, 234, 1);
        BetContentLable  = [[blackAndwhiteLable alloc]initWithFrame:CGRectMake(UIScreenWIDTH/6+15*ScaleX,20*ScaleY+20*ScaleY*5,UIScreenWIDTH*5/6-15*ScaleX,20)];
        [self addSubview:BetNubTitle];
        [self addSubview:BetContentTitle];
        [self addSubview:BetContentLable];
        [self addSubview:BetNublable];
    }
    self.layer.borderColor = [UIColor groupTableViewBackgroundColor].CGColor;
    self.layer.borderWidth = 0.5;
    [self UpdataDatas:nil];
    return self;
}
- (void)UpdataDatas:(NSArray *)array
{
    NSArray *array1 = @[@"后三直选",@"25",@"100000.00元",@"1000000.00元"];
    NSArray *array2 = @[@"迪拜分分彩",@"25",@"以完成",@"SuperZachMan"];
    for (int i = 0; i<4; i++)
    {
        UILabel *lable1 = [self viewWithTag:100+i];
        UILabel *lable2 = [self viewWithTag:200+i];
        lable1.text =array1[i];
        lable2.text = array2[i];
    }
    GameLable.text = @"开奖期数";
    NubLable.text = @"150914024期";
    Timelable.text = @"2015-05－09 11:05:09";
    BetNublable.text = @"34324322432432";
    BetContentLable.text = @"3242141|324342324215|3242424";
}

@end
