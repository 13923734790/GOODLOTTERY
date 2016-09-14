//
//  CatchView.m
//  GOODLOTTERY
//
//  Created by apple on 16/2/26.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "CatchView.h"
#import "CatchCell.h"

@implementation CatchView
{
    NSArray *array;
    UIView *heardView;
    UISegmentedControl  *segment;
    UILabel *TitleInformation;
    UILabel *lable1;
    UITextField *textField1;
    UILabel *lable2;
    UITextField *textField2;
    UIButton *ProduceBt;
    UITableView *_tableView;
    UIButton *ConfirmBt;
    NSInteger Nub;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    array = @[@"同倍追号",@"翻倍追号"];
    self = [super initWithFrame:frame];
    if (self)
    {
        Nub = [SkinPeelerTool ReturnSkinpManger];
        [self SetView];
        [self setTableView];
        [self updateImageAndTextColor];

    }
    return self;
}

-(void)SetView
{
    heardView = [[UIView alloc]initWithFrame:CGRectMake(0, 0,UIScreenWIDTH,120*ScaleY)];
    [self addSubview:heardView];
    segment = [[UISegmentedControl alloc]initWithItems:array];
    segment.frame = CGRectMake(5*ScaleX,10*ScaleY,UIScreenWIDTH-10,30*ScaleY);
    
    
    NSDictionary *dic1 = [NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor], NSForegroundColorAttributeName,[UIFont systemFontOfSize:15*ScaleY],NSFontAttributeName,nil];
    [segment setTitleTextAttributes:dic1 forState:UIControlStateSelected];
    
    [segment setSelectedSegmentIndex:0];
    [segment addTarget:self action:@selector(change:) forControlEvents:UIControlEventValueChanged];
    [heardView addSubview:segment];
    
    TitleInformation = [[UILabel alloc]initWithFrame:CGRectMake(5*ScaleX,45*ScaleY,UIScreenWIDTH*3/4-5*ScaleX,20*ScaleY)];
    TitleInformation.font = [UIFont systemFontOfSize:15*ScaleY];
    [heardView addSubview:TitleInformation];
    
    
    lable1 = [[UILabel alloc]initWithFrame:CGRectMake(5*ScaleX, 75*ScaleY,(UIScreenWIDTH/2-5*ScaleX)/4-5*ScaleX, 30*ScaleY)];
    textField1 = [[UITextField alloc]initWithFrame:CGRectMake(5*ScaleX+(UIScreenWIDTH/2-5*ScaleX)/4-5*ScaleX, 75*ScaleY,(UIScreenWIDTH/2-5*ScaleX)/4+5*ScaleX, 30*ScaleY)];
    textField1.layer.cornerRadius = 5;
    textField1.layer.masksToBounds = YES;
    
    lable2 = [[UILabel alloc]initWithFrame:CGRectMake((UIScreenWIDTH/2-5*ScaleX)/2, 75*ScaleY,(UIScreenWIDTH/2-5*ScaleX)/4-5*ScaleX, 30*ScaleY)];
    textField2 = [[UITextField alloc]initWithFrame:CGRectMake((UIScreenWIDTH/2-5*ScaleX)/2+UIScreenWIDTH/8-5*ScaleX, 75*ScaleY,(UIScreenWIDTH/2-5*ScaleX)/4+5*ScaleX, 30*ScaleY)];
    textField2.layer.cornerRadius = 5;
    textField2.layer.masksToBounds = YES;
    lable1.font = [UIFont systemFontOfSize:15*ScaleY];
    lable2.font = [UIFont systemFontOfSize:15*ScaleY];
    [heardView addSubview:lable1];
    [heardView addSubview:lable2];
    [heardView addSubview:textField1];
    [heardView addSubview:textField2];
    
    
    
    ProduceBt = [UIButton  buttonWithType:UIButtonTypeCustom];
    ProduceBt.layer.cornerRadius = 5;
    ProduceBt.layer.masksToBounds = YES;
    ProduceBt.frame = CGRectMake(UIScreenWIDTH/2+10*ScaleX,75*ScaleY,UIScreenWIDTH/4-20*ScaleX, 30*ScaleY);
    [heardView addSubview:ProduceBt];
    
    
    
    UIButton *selectedBt1 = [UIButton buttonWithType:UIButtonTypeCustom];
    UILabel *RightLable1 = [[UILabel alloc]initWithFrame:CGRectMake(UIScreenWIDTH*3/4+25*ScaleX,55*ScaleY,UIScreenWIDTH/4-25*ScaleX,20*ScaleY)];
    selectedBt1.frame = CGRectMake(UIScreenWIDTH*3/4,55*ScaleY,20*ScaleY, 20*ScaleY);
    
    UIButton *selectedBt2 = [UIButton buttonWithType:UIButtonTypeCustom];
    UILabel *RightLable2 = [[UILabel alloc]initWithFrame:CGRectMake(UIScreenWIDTH*3/4+25*ScaleX,95*ScaleY,UIScreenWIDTH/4-25*ScaleX,20*ScaleY)];
    selectedBt2.frame = CGRectMake(UIScreenWIDTH*3/4,95*ScaleY,20*ScaleY, 20*ScaleY);
    
    RightLable1.font = [UIFont systemFontOfSize:13*ScaleY];
    RightLable1.textAlignment = NSTextAlignmentCenter;
    RightLable1.text = @"官方跳开停";
    RightLable1.textColor = GETCOLOR(@"wt2");
    RightLable2.font = [UIFont systemFontOfSize:13*ScaleY];
    RightLable2.textAlignment = NSTextAlignmentCenter;
    RightLable2.text = @"中奖后停追";
    RightLable2.textColor = GETCOLOR(@"wt2");
    
    
    [selectedBt1 addTarget:self action:@selector(Clickup:) forControlEvents:UIControlEventTouchUpInside];
    [selectedBt1 setBackgroundImage:[UIImage imageNamed:@"CatchSelected"] forState:UIControlStateNormal];
    [selectedBt1 setBackgroundImage:[UIImage imageNamed:IMAGEFILE(@"CatchSelected%ld")] forState:UIControlStateSelected];
    
    
    [selectedBt2 addTarget:self action:@selector(ClickDown:) forControlEvents:UIControlEventTouchUpInside];
    [selectedBt2 setBackgroundImage:[UIImage imageNamed:@"CatchSelected"] forState:UIControlStateNormal];
    [selectedBt2 setBackgroundImage:[UIImage imageNamed:IMAGEFILE(@"CatchSelected%ld")] forState:UIControlStateSelected];
    [heardView addSubview:RightLable1];
    [heardView addSubview:selectedBt1];
    [heardView addSubview:RightLable2];
    [heardView addSubview:selectedBt2];

    
    
    
    lable1.text = @"期数";
    lable2.text = @"倍数";
    lable1.textAlignment = NSTextAlignmentCenter;
    lable2.textAlignment = NSTextAlignmentCenter;
    textField1.textAlignment = NSTextAlignmentCenter;
    textField2.textAlignment = NSTextAlignmentCenter;
    textField1.text = @"1";
    textField2.text = @"2";
    TitleInformation.text = @"追 120 期     累计金额 1200";
    
}

- (void)Clickup:(UIButton *)bt
{
    bt.selected = !bt.selected;
}
- (void)ClickDown:(UIButton *)bt
{
    bt.selected = !bt.selected;
}

- (void)setTableView
{
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0,120*ScaleY,UIScreenWIDTH,self.frame.size.height-120*ScaleY-60*ScaleY) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self addSubview:_tableView];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    ConfirmBt = [UIButton buttonWithType:UIButtonTypeCustom];
    ConfirmBt.frame = CGRectMake(25*ScaleX,self.frame.size.height-60*ScaleY,UIScreenWIDTH-50*ScaleX,40*ScaleY);
    ConfirmBt.layer.cornerRadius = 5;
    ConfirmBt.layer.masksToBounds = YES;
    [ConfirmBt addTarget:self action:@selector(ConFirm:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:ConfirmBt];
    
}



- (void)updateImageAndTextColor
{
    self.backgroundColor = GETCOLOR(@"cbw");
    segment.tintColor = GETCOLOR(@"dtwb");
    heardView.backgroundColor = GETCOLOR(@"bw");
    TitleInformation.textColor = GETCOLOR(@"wt2");
    lable1.textColor = GETCOLOR(@"wt2");
    lable2.textColor = GETCOLOR(@"wt2");
    textField1.textColor = [UIColor redColor];
    textField2.textColor = [UIColor redColor];
    _tableView.backgroundColor = [UIColor clearColor];
    

    
    [textField1 setBackground:[UIImage imageNamed:@"CatchField"]];
    [textField2 setBackground:[UIImage imageNamed:@"CatchField"]];
    [ProduceBt setBackgroundImage:[UIImage imageNamed:IMAGEFILE(@"CatchProduce%ld")] forState:UIControlStateNormal];
    [ConfirmBt setBackgroundImage:[UIImage imageNamed:IMAGEFILE(@"CatchConFirm%ld")] forState:UIControlStateNormal];
}

- (void)change:(id)sender
{
    UISegmentedControl *ctrl = (UISegmentedControl *)sender;
    NSLog(@"%ld",ctrl.selectedSegmentIndex);
}
- (void)ConFirm:(UIButton *)bt
{
    NSLog(@"tttttt");
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    CatchCell *cell; static NSString *cellId = @"CellID";
    cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell)
    {
    cell = [[CatchCell  alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60*ScaleY;
}

@end
