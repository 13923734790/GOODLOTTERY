//
//  BankCardSubOneCell.m
//  GOODLOTTERY
//
//  Created by apple on 16/5/18.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "BankCardSubOneCell.h"

@interface SmallView : UIView
@property(nonatomic, strong)UILabel *lable;
@property(nonatomic, strong)UITextField *field;
@end
@implementation SmallView
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        _lable = [[UILabel alloc]initWithFrame:CGRectMake(15*ScaleX,0,UIScreenWIDTH/4,45*ScaleY)];
        _lable.textColor = GETCOLOR(@"wb");
        _lable.font = [UIFont systemFontOfSize:15*ScaleY];
        [self addSubview:_lable];
        _field = [[UITextField alloc]initWithFrame:CGRectMake(UIScreenWIDTH/4+15*ScaleX,0,UIScreenWIDTH*3/4-15*ScaleX, 45*ScaleY)];
        _field.clearButtonMode = UITextFieldViewModeWhileEditing;
        _field.keyboardType = UIKeyboardTypeASCIICapable;
        _field.contentHorizontalAlignment = UIControlContentVerticalAlignmentCenter;
        _field.textColor = GETCOLOR(@"wb");
        self.backgroundColor = GETCOLOR(@"b0.3w");
        [self addSubview:_field];
    }
    
    return self;
}
@end


@implementation BankCardSubOneCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        [self SetALLView];
    }
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    return self;
}

- (void)SetALLView
{
    NSArray *array1 = @[@"开户姓名:",@"银行卡号:",@"开户银行:",@"开户省份:",@"开户城市:",@"开户姓名:",@"银行卡号:",@"确认帐号:"];
        NSArray *array2 = @[@"*最近一次绑定的银行卡开户人姓名!",@"*最近一次绑定的银行卡卡号!",@"",@"",@"",@"*只能是中文字符",@"银行卡由16-19位数字组成",@"银行卡号只能手动输入,不可张贴"];
        for (int i = 0; i<2; i++)
        {
            UILabel *lable;
            if (i==0)
            {
               lable = [[UILabel alloc]initWithFrame:CGRectMake(0,135*ScaleY*i,UIScreenWIDTH,50*ScaleY)];
            }
            else
            {
               lable = [[UILabel alloc]initWithFrame:CGRectMake(0,140*ScaleY*i,UIScreenWIDTH,100*ScaleY)];
            }
            lable.textColor = GETCOLOR(@"blr");
            lable.font = [UIFont systemFontOfSize:15*ScaleY];
            lable.textAlignment = NSTextAlignmentCenter;
            lable.backgroundColor = GETCOLOR(@"b0.6group");
            lable.text = @"添加绑定银行卡需要提供最近一次绑定的卡号信息";
            [self.contentView addSubview:lable];
        }
    
        for (int i = 0; i<8; i++)
        {
            SmallView *view;
            if (i<2)
            {view = [[SmallView alloc]initWithFrame:CGRectMake(0,50*ScaleY+(0.5+45*ScaleY)*i,UIScreenWIDTH,45*ScaleY)];
            }
            else
            {
                view = [[SmallView alloc]initWithFrame:CGRectMake(0,240*ScaleY+1.5+(45*ScaleY+0.5)*(i-2), UIScreenWIDTH,45*ScaleY)];
                
                if (i==2)
                {
                    UIButton *OtherBt = [UIButton buttonWithType:UIButtonTypeCustom];
                    OtherBt.frame= CGRectMake(UIScreenWIDTH/4+15*ScaleX,5*ScaleY,UIScreenWIDTH*3/4-35*ScaleX, 35*ScaleY);
                    OtherBt.layer.cornerRadius = 5;
                    OtherBt.layer.masksToBounds = YES;
                    [OtherBt setTitle:@"选择银行" forState:UIControlStateNormal];
                    [OtherBt setTitleColor:GETCOLOR(@"wb") forState:UIControlStateNormal];
                    [OtherBt setImage:[UIImage imageNamed:@"TitleRightImage"] forState:UIControlStateNormal];
                    
                    [OtherBt addTarget:self action:@selector(OtherBtClick:) forControlEvents:UIControlEventTouchUpInside];
                    OtherBt.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
                    //            OtherBt.titleEdgeInsets = UIEdgeInsetsMake(0,-7*ScaleX,0,7*ScaleX);
                    OtherBt.imageEdgeInsets = UIEdgeInsetsMake(0,UIScreenWIDTH*3/4-35*ScaleX-25*ScaleX,0, -5*ScaleX);
                    
                    OtherBt.backgroundColor = GETCOLOR(@"w0.1group");
                    [view addSubview:OtherBt];

                }
            }
            view.lable.text = array1[i];
            view.field.placeholder = array2[i];
            [view.field setValue:GETCOLOR(@"wb") forKeyPath:@"_placeholderLabel.textColor"];
            [view.field setValue:[UIFont boldSystemFontOfSize:13*ScaleY] forKeyPath:@"_placeholderLabel.font"];
            [self addSubview:view];
        }
}


- (void)OtherBtClick:(UIButton *)bt
{
    UIWindow * window=[[[UIApplication sharedApplication] delegate] window];
    CGRect rect=[bt convertRect: bt.bounds toView:window];
    PullDownMenu *pullmenu = [[PullDownMenu alloc]initWithFrame:CGRectMake(rect.origin.x, rect.origin.y+rect.size.height, rect.size.width,30*4)];
    
    pullmenu.layer.borderColor = [UIColor groupTableViewBackgroundColor].CGColor;
    pullmenu.layer.borderWidth = 1;
    
    pullmenu.DatasArray = @[@"华夏银行",@"中国工商银行",@"天地银行",@"瑞士银行"];
    
    pullmenu.GameNamestring = bt.currentTitle;
    pullmenu.appearance.resultCallBack = ^(NSString * string)
    {
        NSLog(@"%@",string);
        [bt  setTitle:string forState:UIControlStateNormal];
    };
    [pullmenu show];
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
