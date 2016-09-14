//
//  CompanyCellOne.m
//  GOODLOTTERY
//
//  Created by apple on 16/5/11.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "CompanyCellOne.h"

@implementation CompanyCellOne
{
    UIButton *ConfirmBt;
    CompanyOneModel *_OneModel;
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self)
    {
        _OneModel = [CompanyOneModel new];
        [self UIConfiguration];
    }
    return self;
}

- (void)UIConfiguration
{
    NSArray *array22 = @[@"选择银行",@"填写金额",@"支付模式",@"充值到账"];
    for (int i = 0; i<4; i++)
    {
        UILabel *lable = [[UILabel alloc]initWithFrame:CGRectMake(10*ScaleX+(UIScreenWIDTH-20*ScaleX)/4*i,10*ScaleY,(UIScreenWIDTH-20*ScaleX)/4, 20*ScaleY)];
        lable.font = [UIFont systemFontOfSize:15*ScaleY];
        lable.textColor = DTAISCOLORE(66,66,66, 1);
        if (i==1||i==2)lable.textAlignment =NSTextAlignmentCenter;
        if (i==3) lable.textAlignment = NSTextAlignmentRight;
        lable.text = array22[i];
        [self addSubview:lable];
        if (i<3)
        {
            UIButton *btView = [UIButton buttonWithType:UIButtonTypeCustom];
            btView.frame = CGRectMake(30*ScaleX+(20*ScaleX+(UIScreenWIDTH-100*ScaleX)/3)*i,47.5*ScaleY,(UIScreenWIDTH-100*ScaleX)/3,5*ScaleX);
            
            btView.backgroundColor = DTAISCOLORE(66,66,66, 1);
            [self addSubview:btView];
        }
        
        UIButton *bt = [UIButton buttonWithType:UIButtonTypeCustom];
        bt.frame = CGRectMake(10*ScaleX+(20*ScaleX+(UIScreenWIDTH-100*ScaleX)/3)*i,40*ScaleY,20*ScaleX,20*ScaleX);
        bt.layer.cornerRadius = 10*ScaleX;
        bt.layer.masksToBounds = YES;
        if (i==0||i==1)bt.selected =YES;
        bt.tag = 100+i;
        [bt setBackgroundImage:[UIImage imageNamed:@"progressNo1"] forState:UIControlStateNormal];
        [bt setBackgroundImage:[UIImage imageNamed:@"progressYes1"] forState:UIControlStateSelected];
        [self addSubview:bt];
    }
    

    
        UILabel *lable1 = [[UILabel alloc]initWithFrame:CGRectMake(10*ScaleX, 85*ScaleY,UIScreenWIDTH-20*ScaleX,20*ScaleY)];
        lable1.text = @"请用选择的银行卡充值到下一帐户中";
        lable1.textColor = DTAISCOLORE(66,66,66, 1);
        lable1.font = [UIFont systemFontOfSize:13*ScaleY];
        [self addSubview:lable1];
    
        UIView *viewOne = [[UIView alloc]initWithFrame:CGRectMake(0,110*ScaleY,UIScreenWIDTH, 240*ScaleY+5)];
        viewOne.backgroundColor = [UIColor whiteColor];
        [self addSubview:viewOne];
        
        NSArray *array1 = @[@"入款银行卡:",@"开户行网点:",@"收款人:",@"银行:",@"帐号:",@"订单号:"];
        NSArray *array2 = @[_OneModel.incomeBank,_OneModel.websiteKind,_OneModel.payeeName,_OneModel.BankName,_OneModel.AccountNb,_OneModel.OrderID];
        for (int i = 0; i<6; i++)
        {
            UILabel *lable = [[UILabel alloc]initWithFrame:CGRectMake(0,40*ScaleY*i,80*ScaleX,40*ScaleY)];
            lable.text = array1[i];
            lable.textColor = DTAISCOLORE(66,66,66, 1);
            lable.font = [UIFont systemFontOfSize:13*ScaleY];
            lable.textAlignment = NSTextAlignmentRight;
            
            UITextField *field = [[UITextField alloc]initWithFrame:CGRectMake(90*ScaleX,40*ScaleY*i,UIScreenWIDTH-160*ScaleX,40*ScaleY)];;
            field.text = array2[i];
            field.tag = 200+i;
            field.font = [UIFont systemFontOfSize:13*ScaleY];
            field.enabled = NO;
            
            
        
            UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(10*ScaleY,40*ScaleY*i,UIScreenWIDTH-40*ScaleX,1)];
            lineView.backgroundColor = [UIColor groupTableViewBackgroundColor];
            [viewOne addSubview:lineView];
            [viewOne addSubview:lable];
            [viewOne addSubview:field];
        }
        
        UILabel *lable2 = [[UILabel alloc]initWithFrame:CGRectMake(10*ScaleX, 355*ScaleY+5,UIScreenWIDTH-20*ScaleX,20*ScaleY)];
        lable2.text = @"填写你的转帐资料:";
        lable2.textColor = GETCOLOR(@"blr");
        lable2.font = [UIFont systemFontOfSize:13*ScaleY];
        [self addSubview:lable2];
        
        UIView *viewTwo = [[UIView alloc]initWithFrame:CGRectMake(0,380*ScaleY+4,UIScreenWIDTH, 200*ScaleY)];
        viewTwo.backgroundColor = [UIColor whiteColor];
        [self addSubview:viewTwo];
        
        NSArray *array3 = @[@"订单号:",@"存入金额:",@"存入时间:",@"存款人姓名:",@"存款方式:"];
    NSArray *array4 = @[_OneModel.OrderID,@"300",_OneModel.Currenttime,@"sss",
                        _OneModel.depositBank];
        for (int i = 0; i<5; i++)
        {
            
            UILabel *lable = [[UILabel alloc]initWithFrame:CGRectMake(0,40*ScaleY*i,80*ScaleX,40*ScaleY)];
            lable.text = array3[i];
            lable.textAlignment = NSTextAlignmentRight;
            lable.textColor = DTAISCOLORE(66,66,66, 1);
            lable.font = [UIFont systemFontOfSize:13*ScaleY];
            UITextField *field = [[UITextField alloc]initWithFrame:CGRectMake(90*ScaleX,40*ScaleY*i,UIScreenWIDTH-110*ScaleX,40*ScaleY)];
            field.font = [UIFont systemFontOfSize:13*ScaleY];
            field.tag = 300+i;
            field.text = array4[i];
            field.enabled = NO;
            if (i==1||i==3) {
                field.enabled = YES;
            }
            
            UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(10*ScaleY,40*ScaleY*i,UIScreenWIDTH-40*ScaleX,1)];
            lineView.backgroundColor = [UIColor groupTableViewBackgroundColor];
            [viewTwo addSubview:lineView];
            
            [viewTwo addSubview:lable];
            [viewTwo addSubview:field];
        }
        
        
        //        UILabel *TimeTitle= [[UILabel alloc]initWithFrame:CGRectMake(80*ScaleX,370*ScaleY,40*ScaleX,40*ScaleX)];
        //        TimeTitle.textColor = DTAISCOLORE(66,66,66, 1);
        //        TimeTitle.text = @"有效时间";
        //        TimeTitle.numberOfLines = 2;
        //        TimeTitle.font = [UIFont systemFontOfSize:15*ScaleX];
        //        [self addSubview:TimeTitle];
        //
        //        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(120*ScaleX,370*ScaleY, 40*ScaleX, 40*ScaleY)];
        //        imageView.image = [UIImage imageNamed:@"CashImage8"];
        //        [self addSubview:imageView];
        //
        //        UILabel *TimeLable = [[UILabel alloc]initWithFrame:CGRectMake(170*ScaleX,370*ScaleY,150*ScaleX,40*ScaleY)];
        //        TimeLable.textColor = DTAISCOLORE(66,66,66, 1);
        //        TimeLable.text = @"09:30";
        //        TimeLable.font = [UIFont boldSystemFontOfSize:40*ScaleX];
        //        [self addSubview:TimeLable];
        
        
        
        UIButton *butLeft = [UIButton buttonWithType:UIButtonTypeCustom];
        butLeft.frame = CGRectMake(10*ScaleX, 590*ScaleY+9,80*ScaleX,20*ScaleX);
        [butLeft setTitle:@"联系客服" forState:UIControlStateNormal];
        [butLeft setTitleColor:GETCOLOR(@"blr") forState:UIControlStateNormal];
        [butLeft setTitleColor:[UIColor orangeColor] forState:UIControlStateHighlighted];
        butLeft.titleLabel.font = [UIFont systemFontOfSize:15*ScaleY];
        [self addSubview:butLeft];
        
        UIButton *butRight = [UIButton buttonWithType:UIButtonTypeCustom];
        butRight.frame = CGRectMake(UIScreenWIDTH-90*ScaleX, 590*ScaleY+9, 80*ScaleX, 20*ScaleX);
        [butRight setTitle:@"再充一笔" forState:UIControlStateNormal];
        [butRight setTitleColor:[UIColor orangeColor] forState:UIControlStateHighlighted];
        [butRight setTitleColor:GETCOLOR(@"blr") forState:UIControlStateNormal];
        butRight.titleLabel.font = [UIFont systemFontOfSize:15*ScaleX];
        [self addSubview:butRight];
        
        
        
        ConfirmBt = [UIButton buttonWithType:UIButtonTypeCustom];
        ConfirmBt.frame = CGRectMake(10*ScaleX,630*ScaleY+9,UIScreenWIDTH-20*ScaleX, 40*ScaleY);
        [ConfirmBt setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"RegisterBt%ld",[SkinPeelerTool ReturnSkinpManger]]] forState:UIControlStateNormal];
        [ConfirmBt setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [ConfirmBt setTitle:@"开始充值" forState:UIControlStateNormal];
        [ConfirmBt addTarget:self action:@selector(btClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:ConfirmBt];
}


- (void)defaultValue
{
//    _OneModel.incomeBank;
//    _OneModel.websiteKind;
//    _OneModel.payeeName;
//    _OneModel.BankName;
//    _OneModel.AccountNb;
//    _OneModel.OrderID;
//    _OneModel.Currenttime;
//    _OneModel.depositBank;
    
}
- (void)btClick
{
    if (_BlockNext)
    {
        _BlockNext(@[@"哈哈哈",@"300"]);
    }

}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
