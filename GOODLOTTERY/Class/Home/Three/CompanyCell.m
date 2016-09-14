//
//  CompanyCell.m
//  GOODLOTTERY
//
//  Created by apple on 16/5/11.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "CompanyCell.h"

@implementation CompanyCell
{
    UIButton *ConfirmBt;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self)
    {
        [self UIConfiguration];
    }
    return self;
}

- (void)UIConfiguration
{
        NSArray *array2 = @[@"选择银行",@"填写金额",@"支付模式",@"充值到账"];
        for (int i = 0; i<4; i++)
        {
            UILabel *lable = [[UILabel alloc]initWithFrame:CGRectMake(10*ScaleX+(UIScreenWIDTH-20*ScaleX)/4*i,10*ScaleY,(UIScreenWIDTH-20*ScaleX)/4, 20*ScaleY)];
            lable.font = [UIFont systemFontOfSize:15*ScaleY];
            lable.textColor = DTAISCOLORE(66,66,66, 1);
            if (i==1||i==2)lable.textAlignment =NSTextAlignmentCenter;
            if (i==3) lable.textAlignment = NSTextAlignmentRight;
            lable.text = array2[i];
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
            if (i==0)bt.selected =YES;
            bt.tag = 100+i;
            [bt setBackgroundImage:[UIImage imageNamed:@"progressNo1"] forState:UIControlStateNormal];
            [bt setBackgroundImage:[UIImage imageNamed:@"progressYes1"] forState:UIControlStateSelected];
            [self addSubview:bt];
        }
        
        
        UIView *bankcardView = [[UIView alloc]initWithFrame:CGRectMake(0,80*ScaleY,UIScreenWIDTH,40*ScaleY)];
        bankcardView.backgroundColor = [UIColor whiteColor];
        [self addSubview:bankcardView];
        
        UILabel *NameLable = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 90*ScaleX,40*ScaleY)];
        NameLable.textColor = DTAISCOLORE(66,66,66, 1);
        NameLable.text = @"银行卡:";
        NameLable.textAlignment = NSTextAlignmentRight;
        NameLable.font = [UIFont systemFontOfSize:15*ScaleY];
        [bankcardView addSubview:NameLable];
        
        UIButton *BankBut = [UIButton buttonWithType:UIButtonTypeCustom];
        BankBut.frame = CGRectMake(100*ScaleX,0,bankcardView.frame.size.width-100*ScaleX, 40*ScaleY);
        [BankBut setTitle:@"中国工商银行" forState:UIControlStateNormal];
        [BankBut setTitleColor:DTAISCOLORE(66,66,66, 1) forState:UIControlStateNormal];
        BankBut.titleLabel.font = [UIFont systemFontOfSize:15*ScaleY];
        [BankBut addTarget:self action:@selector(BanckBut:) forControlEvents:UIControlEventTouchUpInside];
        [bankcardView addSubview:BankBut];
        
        
        
        
        UITextField *field = [[UITextField alloc]initWithFrame:CGRectMake(110*ScaleX, 250*ScaleY,UIScreenWIDTH-110*ScaleX,15*ScaleY)];
        field.leftViewMode = UITextFieldViewModeAlways;
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 20*ScaleX,15*ScaleY)];
        imageView.image = [UIImage imageNamed:@"CashImage6"];
        field.leftView  = imageView;
        field.textColor = DTAISCOLORE(66,66,66, 1);
        field.text = @"添加/绑定银行卡";
        field.enabled = NO;
        [self addSubview:field];
        
        
        ConfirmBt = [UIButton buttonWithType:UIButtonTypeCustom];
        [ConfirmBt setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"RegisterBt%ld",[SkinPeelerTool ReturnSkinpManger]]] forState:UIControlStateNormal];
        [ConfirmBt setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [ConfirmBt setTitle:@"下一步" forState:UIControlStateNormal];
        [ConfirmBt addTarget:self action:@selector(btClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:ConfirmBt];
    
}
- (void)layoutSubviews
{
    ConfirmBt.frame = CGRectMake(10*ScaleX,FRAMEHEIGHT-70*ScaleY,UIScreenWIDTH-20*ScaleX, 40*ScaleY);
}

- (void)BanckBut:(UIButton *)bt
{
    UIWindow * window=[[[UIApplication sharedApplication] delegate] window];
    CGRect rect=[bt convertRect: bt.bounds toView:window];
    PullDownMenu *pullmenu = [[PullDownMenu alloc]initWithFrame:CGRectMake(rect.origin.x, rect.origin.y+rect.size.height, rect.size.width,30*4)];
    
    pullmenu.layer.borderColor = [UIColor groupTableViewBackgroundColor].CGColor;
    pullmenu.layer.borderWidth = 1;
    pullmenu.DatasArray = @[@"中国工商银行",@"中国农业银行",@"中国建设银行",@"中国银行",@"中国交通银行"];
    pullmenu.GameNamestring = bt.currentTitle;
    pullmenu.appearance.resultCallBack = ^(NSString * string)
    {
        NSLog(@"%@",string);
        [bt  setTitle:string forState:UIControlStateNormal];
    };
    [pullmenu show];
}
-(void)btClick
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
