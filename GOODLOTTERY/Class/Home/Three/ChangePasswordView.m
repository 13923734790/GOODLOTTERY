//
//  ChangePasswordView.m
//  GOODLOTTERY
//
//  Created by apple on 16/3/14.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "ChangePasswordView.h"
#import "DownListModel.h"
#import "DownListVIew.h"

@interface CustomField : UITextField
@end
@implementation CustomField
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.backgroundColor = [UIColor clearColor];
        self.textColor = [UIColor whiteColor];
        self.contentHorizontalAlignment = UIControlContentVerticalAlignmentCenter;
        self.clearButtonMode = UITextFieldViewModeWhileEditing;
        [self setBackground:[UIImage imageNamed:@"NubbackImageKing2"]];
        self.keyboardType = UIKeyboardTypeASCIICapable;
    }
    return self;
}
//显示文本位置
-(CGRect)textRectForBounds:(CGRect)bounds
{
    CGRect inset = CGRectMake(bounds.origin.x+15, bounds.origin.y, bounds.size.width-15, bounds.size.height);
    return inset;
}
//编辑文本位子
-(CGRect)editingRectForBounds:(CGRect)bounds
{
    CGRect inset = CGRectMake(bounds.origin.x+15, bounds.origin.y, bounds.size.width-15, bounds.size.height);
    return inset;
}
@end

@implementation ChangePasswordView
{
    UIView *_view1;
    UIView *_view2;
    UIView *_view3;
    UIView *_view4;
    DownListVIew *DownView1;
    DownListVIew *DownView2;
    UIView *seletedView;
    UISegmentedControl *segMent;
    
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.backgroundColor = [UIColor clearColor];
        NSArray *array = @[@"登入密码",@"提款密码",@"密保设定",@"密码找回"];
        segMent = [[UISegmentedControl alloc]initWithItems:array];
        segMent.selectedSegmentIndex = 0;
        seletedView = _view1;
         [segMent addTarget:self action:@selector(changeView:) forControlEvents:UIControlEventValueChanged];
        segMent.frame = CGRectMake(15*ScaleX, 30*ScaleX, UIScreenWIDTH-30*ScaleX, 40*ScaleY);
        NSDictionary *dic1 = [NSDictionary dictionaryWithObjectsAndKeys:GETCOLOR(@"wb"),NSForegroundColorAttributeName,[UIFont boldSystemFontOfSize:15*ScaleY],NSFontAttributeName,nil];
        NSDictionary *dic2= [NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName,[UIFont boldSystemFontOfSize:15*ScaleY],NSFontAttributeName,nil];
        [segMent setTitleTextAttributes:dic1 forState:UIControlStateNormal];
        [segMent setTitleTextAttributes:dic2 forState:UIControlStateSelected];
        segMent.tintColor = GETCOLOR(@"blr");
        [self addSubview:segMent];
        
        UIButton *buttonLeft = [UIButton buttonWithType:UIButtonTypeCustom];
        buttonLeft.frame = CGRectMake(15*ScaleX,370*ScaleY ,(UIScreenWIDTH-45*ScaleX)/2,50*ScaleY);
        [self addSubview:buttonLeft];
        [buttonLeft setTitle:@"修改" forState:UIControlStateNormal];
        [buttonLeft setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [buttonLeft setBackgroundImage:[UIImage imageNamed:@"NubbackImageKing2"] forState:UIControlStateNormal];
        [buttonLeft setBackgroundImage:[UIImage imageNamed:@"ChangePass1"] forState:UIControlStateSelected];
        [buttonLeft addTarget:self action:@selector(ClickBtLeft:) forControlEvents:UIControlEventTouchUpInside];
        
        UIButton *buttonRight = [UIButton buttonWithType:UIButtonTypeCustom];
        buttonRight.frame = CGRectMake((UIScreenWIDTH-45*ScaleX)/2+30*ScaleX,370*ScaleY,(UIScreenWIDTH-45*ScaleX)/2,50*ScaleY);
        [self addSubview:buttonRight];
        [buttonRight setTitle:@"重置" forState:UIControlStateNormal];
        [buttonRight setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [buttonRight setBackgroundImage:[UIImage imageNamed:@"NubbackImageKing2"] forState:UIControlStateNormal];
        [buttonRight setBackgroundImage:[UIImage imageNamed:@"ChangePass1"] forState:UIControlStateSelected];
        [buttonRight addTarget:self action:@selector(ClickBtRight:) forControlEvents:UIControlEventTouchUpInside];


        
        [self SetView1];

    }
    return self;
}
- (void)SetView1
{
  
    if(!_view1)
    {
        _view1 = [[UIView alloc]initWithFrame:CGRectMake(0,100*ScaleY,UIScreenWIDTH,270*ScaleY)];
        NSArray *array = @[@"输入登陆密码",@"输入新登陆密码",@"确认新登陆密码"];
        for (int i = 0; i<3; i++)
        {
            CustomField *field = [[CustomField alloc]initWithFrame:CGRectMake(15*ScaleX,(40*ScaleY+50*ScaleY)*i,UIScreenWIDTH-30*ScaleX,50*ScaleY)];
            field.placeholder = array[i];
            [field setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];
            [field setValue:[UIFont boldSystemFontOfSize:18*ScaleY] forKeyPath:@"_placeholderLabel.font"];
            [_view1 addSubview:field];
        }
        UILabel *lable = [[UILabel alloc]initWithFrame:CGRectMake(30*ScaleX,50*ScaleY,UIScreenWIDTH-45*ScaleY,40*ScaleY)];
        [_view1 addSubview:lable];
        lable.textColor = GETCOLOR(@"wb");
        lable.font = [UIFont systemFontOfSize:15*ScaleY];
        lable.text = @"(由字母和数字组成6-16个字符)";
        [self addSubview:_view1];
 
    }
        if (seletedView==_view1);else seletedView.hidden = YES, seletedView = _view1, _view1.hidden = NO;
}
- (void)SetView2
{
    if (!_view2)
    {
        _view2 = [[UIView alloc]initWithFrame:CGRectMake(0,100*ScaleY,UIScreenWIDTH,270*ScaleY)];
        NSArray *array = @[@"输入新提款密码",@"确认新提款密码"];
        for (int i = 0; i<2; i++)
        {
            CustomField *field = [[CustomField alloc]initWithFrame:CGRectMake(15*ScaleX,50*ScaleY+(40*ScaleY+50*ScaleY)*i,UIScreenWIDTH-30*ScaleX,50*ScaleY)];
            field.placeholder = array[i];
            [field setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];
            [field setValue:[UIFont boldSystemFontOfSize:18*ScaleY] forKeyPath:@"_placeholderLabel.font"];
            [_view2 addSubview:field];
        }
        [self addSubview:_view2];
    }
    if (seletedView==_view2);else seletedView.hidden = YES, seletedView = _view2, _view2.hidden = NO;
    
}
- (void)SetView3
{
    if(!_view3)
    {
        _view3 = [[UIView alloc]initWithFrame:CGRectMake(0,100*ScaleY,UIScreenWIDTH,270*ScaleY)];
        [self addSubview:_view3];
        NSArray *array = @[@"问题一:",@"答案:",@"问题二:",@"答案:"];
        for (int i = 0; i<4; i++)
        {
            UILabel *lable = [[UILabel alloc]initWithFrame:CGRectMake(15*ScaleX,(40+110/4)*ScaleY*i,60*ScaleX,40*ScaleY)];
            lable.textColor = GETCOLOR(@"wb");
            lable.textAlignment = NSTextAlignmentRight;
            lable.font = [UIFont systemFontOfSize:18*ScaleY];
            lable.text = array[i];
            [_view3 addSubview:lable];
            if (i==1||i==3)
            {
                CustomField *field = [[CustomField alloc]initWithFrame:CGRectMake(90*ScaleX,(40+110/4)*ScaleY*i,UIScreenWIDTH-105*ScaleX,40*ScaleY)];
                field.placeholder = @"(长度最多为25个字符)";
                [field setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];
                [field setValue:[UIFont boldSystemFontOfSize:18*ScaleY] forKeyPath:@"_placeholderLabel.font"];
                [_view3 addSubview:field];
            }
            else
            {
                UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
                button.frame = CGRectMake(90*ScaleX,(40+110/4)*ScaleY*i,UIScreenWIDTH-105*ScaleX,40*ScaleY);
                button.layer.borderColor = [UIColor whiteColor].CGColor;
                button.layer.borderWidth = 1;
                button.tag = 5+i;
                [button setTitle:@"你母亲的姓名是？" forState:UIControlStateNormal];
                [button setTitleColor:GETCOLOR(@"wb") forState:UIControlStateNormal];
                [button addTarget:self action:@selector(ClickQuestion:) forControlEvents:UIControlEventTouchUpInside];
                [_view3 addSubview:button];
            }
        }
 
    }
       if (seletedView==_view3);else seletedView.hidden = YES,seletedView = _view3, _view3.hidden = NO;
}

- (void)changeView:(id)sender
{
    UISegmentedControl *ctrl = (UISegmentedControl *)sender;
    if (ctrl.selectedSegmentIndex==0) [self SetView1];
    if (ctrl.selectedSegmentIndex==1) [self SetView2];
    if (ctrl.selectedSegmentIndex==2) [self SetView3];
}

-(void)setPagIndex:(NSInteger)PagIndex
{
    _PagIndex = PagIndex;
    segMent.selectedSegmentIndex = PagIndex;
}
- (void)ClickQuestion:(UIButton *)bt
{
    DownListModel *model = [[DownListModel alloc]init];
    if ( !model.TitleNub) model.TitleNub = [[NSArray alloc]init];
    model.TitleNub = @[@"你母亲的姓名是?",@"你配偶的生日是?",@"你的学号（或者工号）是多少？",@"你母亲的生日是多少？",@"你高中班主任的名字是？"];
    model.cellheight = 30*ScaleY;
    model.tableheight = 150*ScaleY;
    model.tablewidth =UIScreenWIDTH-105*ScaleX;
    UIView *Blockview =_view3;
        if (bt.tag==5)
    {
        if (!DownView1)
        {
            DownView1 = [[DownListVIew alloc]initWithFrame:CGRectMake(90*ScaleX,0,UIScreenWIDTH-105*ScaleX,120*ScaleY) AndModel:model];
            DownListVIew *BlockView1 = DownView1;
            DownView1.BlockButtonTitle = ^(NSString *titleString)
            {
                BlockView1.hidden = YES;
                UIButton *button = [Blockview viewWithTag:5];
                [button setTitle:titleString forState:UIControlStateNormal];
            };
            [_view3 addSubview:DownView1];
        }
        else
        {
            DownView1.hidden = NO;
        }
    }
    else
    {
        if (!DownView2)
        {
            DownView2 = [[DownListVIew alloc]initWithFrame:CGRectMake(90*ScaleX,(40+110/4)*ScaleY*2,UIScreenWIDTH-105*ScaleX,120*ScaleY) AndModel:model];
            DownListVIew *BlockView2 = DownView2;
            DownView2.BlockButtonTitle = ^(NSString *titleString)
            {
                UIButton *button = [Blockview viewWithTag:7];
                [button setTitle:titleString forState:UIControlStateNormal];
                BlockView2.hidden = YES;

            };
            [_view3 addSubview:DownView2];
        }
        else{
            DownView2.hidden = NO;
        }

    }
    NSLog(@"333333");
    
}
- (void)ClickBtLeft:(UIButton *)bt
{
 bt.selected = !bt.selected;
}

- (void)ClickBtRight:(UIButton *)bt
{
    bt.selected = !bt.selected;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    if (DownView1.hidden==NO||DownView2.hidden==NO)
    {
        DownView1.hidden = YES;
        DownView2.hidden = YES;
    }
}


@end
