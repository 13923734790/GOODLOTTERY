//
//  RegisterView.m
//  GOODLOTTERY
//
//  Created by apple on 16/3/3.
//  Copyright © 2016年 apple. All rights reserved.
//


#import "RegisterView.h"
@interface RegisterView()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic, strong)UISegmentedControl *SegMent;
@property(nonatomic, strong)UITableView *tableView;
@end
@implementation RegisterView
{
    NSArray *array;
    NSArray *placeholderArray;
    NSArray *array2;
    UIView *InformationView;
    UIButton *SeletedBt;
    UIView *View1;
    UILabel *HintLable;
    UIButton *RegisterBt1;
    UIButton *RegisterBt2;
    UIView *LeftBackView;
    UIView *RightBackView;
//    UILabel *Repeatlable;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    array = @[@"用户昵称:",@"用户帐号:",@"登录密码:",@"重复密码:"];
    placeholderArray = @[@"请输入名称，2-6位字符",@"请输入帐号，6-16位数字和字母",@"输入密码，6-16个字符且必须包含数字和字母",@"再次输入密码"];
    array2 = @[@"当前奖金",@"返点率",@"剩余配额",@"操作"];
    
    self = [super initWithFrame:frame];
    if (self)
    {
        [self SetView];
        [self UpdataImageAndTxtColor];
    }
    return self;
}
- (void)SetView
{
   _SegMent = [[UISegmentedControl alloc]initWithItems:@[@"代理",@"会员"]];
   _SegMent.frame = CGRectMake(10*ScaleX, 10*ScaleY,UIScreenWIDTH-20*ScaleX,35*ScaleY);
   [_SegMent setSelectedSegmentIndex:0];
   [self addSubview:_SegMent];
    InformationView = [[UIView alloc]initWithFrame:CGRectMake(1,55*ScaleY, UIScreenWIDTH-2, 180*ScaleY)];
    InformationView.layer.borderWidth = 1;
    [self addSubview:InformationView];
    
    for (int i = 0; i<4; i++)
    {
        UILabel *lable = [[UILabel alloc]initWithFrame:CGRectMake(20*ScaleX,10*ScaleY+45*ScaleY*i,(UIScreenWIDTH*3/4-20*ScaleX),25*ScaleY)];
        UITextField *field = [[UITextField alloc]initWithFrame:CGRectMake(UIScreenWIDTH/4,12*ScaleY+45*ScaleY*i, UIScreenWIDTH*3/4,25*ScaleY)];
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0,i*45*ScaleY,UIScreenWIDTH-2,1)];
        field.placeholder =placeholderArray[i];
        field.textColor = GETCOLOR(@"wb");
        field.font = [UIFont systemFontOfSize:15*ScaleY];
        field.clearButtonMode = UITextFieldViewModeWhileEditing;
        lable.text = array[i];
        lable.font = [UIFont systemFontOfSize:15*ScaleY];
        
        lable.tag = 100+i;
        field.tag = 200+i;
        view.tag = 300+i;
        [InformationView addSubview:lable];
        [InformationView addSubview:field];
        [InformationView addSubview:view];
    }
    
    View1 = [[UIView alloc]initWithFrame:CGRectMake(0,235*ScaleY,UIScreenWIDTH,50*ScaleY)];
    [self addSubview:View1];
    
    for (int i = 0; i<2; i++)
    {
        UIButton*button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(UIScreenWIDTH/8+UIScreenWIDTH*i/2,10,UIScreenWIDTH/4,30);
        button.tag = 100+i;
        [button addTarget:self action:@selector(BtClick:) forControlEvents:UIControlEventTouchUpInside];
        UILabel *lable = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, button.frame.size.width,20*ScaleY)];
        lable.tag = 9;
        lable.font = [UIFont systemFontOfSize:15*ScaleY];
        [button addSubview:lable];
        UIImageView *image = [[UIImageView alloc]initWithFrame:CGRectMake(0, 20*ScaleY, button.frame.size.width, 2*ScaleY)];
        image.hidden = YES;
        image.tag = 5;
        [button addSubview:image];
        
        if (i==0)lable.text = @"配额奖金组",[self BtClick:button];else lable.text = @"其他奖金组";
        lable.textAlignment = NSTextAlignmentCenter;
        [View1 addSubview:button];
    }
    
    
//    UIView *View2 = [[UIView alloc]initWithFrame:CGRectMake(0,285*ScaleY,UIScreenWIDTH,50*ScaleY)];
//    Repeatlable = [[UILabel alloc]initWithFrame:CGRectMake(20*ScaleX,12.5*ScaleY,(UIScreenWIDTH*3/4-20*ScaleX),25*ScaleY)];
//    [View2 addSubview:Repeatlable];
//    Repeatlable.font = [UIFont systemFontOfSize:15*ScaleY];
//    [self addSubview:View2];
//    Repeatlable.text = @"重复密码";
    
    
    LeftBackView = [[UIView alloc]initWithFrame:CGRectMake(0,285*ScaleY,UIScreenWIDTH,FRAMEHEIGHT-285*ScaleY)];
    [self addSubview:LeftBackView];
    
    RightBackView = [[UIView alloc]initWithFrame:CGRectMake(0,285*ScaleY,UIScreenWIDTH,FRAMEHEIGHT-285*ScaleY)];
    RightBackView.hidden = YES;
    [self addSubview:RightBackView];
    
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, UIScreenWIDTH, FRAMEHEIGHT-285*ScaleY) style:UITableViewStylePlain];
    _tableView.delegate =self;
    _tableView.dataSource = self;
    _tableView.bounces = NO;
    _tableView.backgroundColor = [UIColor clearColor];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    UIView *HeardView = [[UIView alloc]initWithFrame:CGRectMake(0,285*ScaleY,UIScreenWIDTH,35*ScaleY)];
    for (int i = 0; i<4; i++)
    {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(UIScreenWIDTH/4*i, 0, UIScreenWIDTH/4, 35*ScaleY)];
        label.textColor = [UIColor whiteColor];
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [UIFont systemFontOfSize:13*ScaleY];
        label.text = array2[i];
        [HeardView addSubview:label];
    }
    HeardView.backgroundColor = [UIColor blackColor];
    _tableView.tableHeaderView =HeardView;
    
    
    UIView *FootView = [[UIView alloc]initWithFrame:CGRectMake(0, 0,UIScreenWIDTH,60*ScaleY)];
    
    RegisterBt1 = [UIButton buttonWithType:UIButtonTypeCustom];
    RegisterBt1.layer.cornerRadius = 5;
    RegisterBt1.layer.masksToBounds = YES;
    RegisterBt1.frame = CGRectMake(10*ScaleX,10*ScaleY, UIScreenWIDTH-20*ScaleX, 40*ScaleY);
    [RegisterBt1 setTitle:@"注册" forState:UIControlStateNormal];
    [RegisterBt1 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [FootView addSubview:RegisterBt1];
    
    _tableView.tableFooterView =FootView;
    [LeftBackView addSubview:_tableView];
    
    
    
    
    
    
    UILabel *leftLable = [[UILabel alloc]initWithFrame:CGRectMake(20*ScaleX, 0,(UIScreenWIDTH*3/4-20*ScaleX), 45*ScaleY)];
    leftLable.textColor = GETCOLOR(@"wb");
    leftLable.text = @"设置奖金:";
    leftLable.font = [UIFont systemFontOfSize:15*ScaleY];
    [RightBackView addSubview:leftLable];
    
    UIButton *OtherBt = [UIButton buttonWithType:UIButtonTypeCustom];
    OtherBt.frame = CGRectMake(UIScreenWIDTH/4, 5*ScaleY,UIScreenWIDTH*3/4-20*ScaleX, 35*ScaleY);
    OtherBt.layer.cornerRadius = 5;
    OtherBt.layer.masksToBounds = YES;
    [OtherBt setTitle:@"选择其他奖金组" forState:UIControlStateNormal];
    [OtherBt setTitleColor:GETCOLOR(@"wb") forState:UIControlStateNormal];
    [OtherBt setImage:[UIImage imageNamed:@"TitleRightImage"] forState:UIControlStateNormal];
    
    [OtherBt addTarget:self action:@selector(OtherBtClick:) forControlEvents:UIControlEventTouchUpInside];
    OtherBt.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
//    OtherBt.titleEdgeInsets = UIEdgeInsetsMake(0,-7*ScaleX,0,7*ScaleX);
    OtherBt.imageEdgeInsets = UIEdgeInsetsMake(0,UIScreenWIDTH*3/4-40*ScaleX,0, -20*ScaleX);
   
    
    OtherBt.backgroundColor = GETCOLOR(@"w0.1group");
    [RightBackView addSubview:OtherBt];
    
    
    
    
    HintLable =[[UILabel alloc]initWithFrame:CGRectMake(0,45*ScaleY, UIScreenWIDTH, 50*ScaleY)];
    HintLable.textAlignment = NSTextAlignmentCenter;
    HintLable.font = [UIFont systemFontOfSize:15*ScaleY];
    HintLable.text = @"奖金组一旦上调后就无法降低，请谨慎操作";
    [RightBackView  addSubview:HintLable];
    
    
    
   
    RegisterBt2 = [UIButton buttonWithType:UIButtonTypeCustom];
    RegisterBt2.layer.cornerRadius = 5;
    RegisterBt2.layer.masksToBounds = YES;
    RegisterBt2.frame = CGRectMake(10*ScaleX,105*ScaleY, UIScreenWIDTH-20*ScaleX, 40*ScaleY);
    [RegisterBt2 setTitle:@"注册" forState:UIControlStateNormal];
    [RegisterBt2 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [RightBackView addSubview:RegisterBt2];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 0;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell;  static NSString *CellId = @"CellId";
    cell = [tableView dequeueReusableCellWithIdentifier:CellId];
    if (!cell)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellId];
    }
    
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 30;
}


- (void)OtherBtClick:(UIButton *)bt
{
    UIWindow * window=[[[UIApplication sharedApplication] delegate] window];
    CGRect rect=[bt convertRect: bt.bounds toView:window];
    PullDownMenu *pullmenu = [[PullDownMenu alloc]initWithFrame:CGRectMake(rect.origin.x, rect.origin.y+rect.size.height, rect.size.width,30*4)];
    
    pullmenu.layer.borderColor = [UIColor groupTableViewBackgroundColor].CGColor;
    pullmenu.layer.borderWidth = 1;
    pullmenu.DatasArray = @[@"选择其他的奖金组",@"6.9%-----1938",@"6.8%-----1936",@"6.7%-----1934",@"6.6%-----1932",@"6.5%-----1930"];
    pullmenu.GameNamestring = bt.currentTitle;
    pullmenu.appearance.resultCallBack = ^(NSString * string)
    {
        NSLog(@"%@",string);
        [bt  setTitle:string forState:UIControlStateNormal];
    };
    [pullmenu show];
}


- (void)BtClick:(UIButton *)Bt
{
    UIImageView *image = [Bt viewWithTag:5];
    if (!SeletedBt)
    {
        SeletedBt = Bt;image.hidden = NO;
    }
    else
    {
        if (SeletedBt==Bt)
        {
            image.hidden = YES;
            SeletedBt=nil;
        }
        else
        {
            UIImageView *SeletedIMage =[SeletedBt viewWithTag:5];
            SeletedBt=Bt;
            SeletedIMage.hidden = YES;
            image.hidden = NO;
        }
    }
    
    if (Bt.tag==100) LeftBackView.hidden = NO,RightBackView.hidden = YES;else LeftBackView.hidden = YES,RightBackView.hidden = NO;
  
}


-(void)UpdataImageAndTxtColor
{
   
    NSArray * Imagearray = [SkinPeelerTool UpdataRegisterCtrl];
    self.backgroundColor = GETCOLOR(@"cw");
    InformationView.layer.borderColor =GETCOLOR(@"cbw").CGColor ;
     NSDictionary *dic1 = [NSDictionary dictionaryWithObjectsAndKeys:GETCOLOR(@"wg"),NSForegroundColorAttributeName,[UIFont boldSystemFontOfSize:15],NSFontAttributeName,nil];
    NSDictionary *dic2= [NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName,[UIFont boldSystemFontOfSize:15],NSFontAttributeName,nil];
    [_SegMent setTitleTextAttributes:dic1 forState:UIControlStateNormal];
    [_SegMent setTitleTextAttributes:dic2 forState:UIControlStateSelected];
    
    _SegMent.tintColor = GETCOLOR(@"bgg");
    
    for (int i = 0; i<4; i++)
    {
        UILabel *lable = [self viewWithTag:100+i];
        UITextField *field = [self viewWithTag:200+i];
        UIView *view = [self viewWithTag:300+i];
        lable.textColor = GETCOLOR(@"wb");
        view.backgroundColor = GETCOLOR(@"b0.3group");
        [field setValue:[UIColor grayColor] forKeyPath:@"_placeholderLabel.textColor"];
        [field setValue:[UIFont boldSystemFontOfSize:13*ScaleY] forKeyPath:@"_placeholderLabel.font"];
    }
    View1.backgroundColor = GETCOLOR(@"b0.3group");
    for (int i= 0; i<2; i++)
    {
        UIButton *butt  = [View1 viewWithTag:100+i];
        UIImageView *image = [butt viewWithTag:5];
        UILabel *lable = [butt viewWithTag:9];
        image.image =  [UIImage imageNamed:Imagearray[0]];
        lable.textColor = GETCOLOR(@"t3");
    }
    HintLable.backgroundColor = GETCOLOR(@"b0.3group");
    HintLable.textColor = GETCOLOR(@"wb");
    [RegisterBt1 setBackgroundImage:[UIImage imageNamed:Imagearray[1]] forState:UIControlStateNormal];
    [RegisterBt2 setBackgroundImage:[UIImage imageNamed:Imagearray[1]] forState:UIControlStateNormal];
}
@end
