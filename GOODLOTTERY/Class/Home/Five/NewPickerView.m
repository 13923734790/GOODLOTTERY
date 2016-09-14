//
//  NewPickerView.m
//  GOODLOTTERY
//
//  Created by apple on 16/3/23.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "NewPickerView.h"
#import "AllkingGameDatas.h"
#import "newPikerModel.h"
#import "newPikerSubOneModel.h"
#import "newPikerSubTwoModel.h"
typedef void (^Upcomponent)(NSInteger seleted);

@implementation NewPickerView
{
    NSArray *allDatas;
    NSArray *LeftDatas;
    NSArray *MiddleDatas;
    NSArray *RightDatas;
    Upcomponent upblock;
    NSInteger UpInteger;
    
    NSString *leftString;
    NSString *middleString;
    NSString *rightString;
    NSInteger _left;
    NSInteger _middle;
    NSInteger _right;
}
- (instancetype)initWithFrame:(CGRect)frame andLeftNub:(NSInteger)left andMiddleNub:(NSInteger)middle andRightNub:(NSInteger)right and:(NSArray *)ModelArray
{
    if (!allDatas)
    {allDatas = [NSArray array];
    }
    allDatas = ModelArray;
    _left =left;
    _middle =middle;
    _right = right;
    self = [super initWithFrame:frame];
    if (self)
    {
        [self setPickerAllView];
        [self setView];
    }
    return self;
}
- (void)setPickerAllView
{
    NSArray *array = @[@"官方玩法",@"信用玩法"];
    UISegmentedControl  *segment = [[UISegmentedControl alloc]initWithItems:array];
    segment.frame = CGRectMake(25*ScaleX,5*ScaleX,FRAMEWIDTH-50,35*ScaleY);
    segment.tintColor = GETCOLOR(@"blr");
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor], NSForegroundColorAttributeName,[UIFont systemFontOfSize:15*ScaleY],NSFontAttributeName,nil];
    [segment setTitleTextAttributes:dic forState:UIControlStateSelected];
    [segment setSelectedSegmentIndex:0];
    [segment addTarget:self action:@selector(change:) forControlEvents:UIControlEventValueChanged];
    [self addSubview:segment];
}


- (void)setView
{
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(25*ScaleX,245*ScaleY,UIScreenWIDTH-50*ScaleX,30*ScaleY);
    button.backgroundColor = GETCOLOR(@"blr");
    [button setTitle:@"确定" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:button];
    
    _pickerTitle = [[UIPickerView alloc]initWithFrame:CGRectMake(0, 50*ScaleY, UIScreenWIDTH,200*ScaleY)];
    _pickerTitle.delegate = self;
    _pickerTitle.dataSource = self;
    [self addSubview:_pickerTitle];
    
    __weak UIPickerView *pv = self.pickerTitle;
    __weak NewPickerView *blockSelf = self;
    
    upblock = ^(NSInteger bj)
    {
        [blockSelf pickerView:pv didSelectRow:0 inComponent:bj];
    };
    
    
    [self updatasSeleted];
    
}

-(void)updatasSeleted
{
    [self.pickerTitle selectRow:_left inComponent:0 animated:NO];
    [self pickerView:_pickerTitle didSelectRow:_left inComponent:0];
    [self.pickerTitle selectRow:_middle inComponent:1 animated:NO];
    [self pickerView:_pickerTitle didSelectRow:_middle inComponent:1];
    [self.pickerTitle selectRow:_right inComponent:2 animated:NO];
    [self pickerView:_pickerTitle didSelectRow:_right inComponent:2];
}
- (void)buttonClick
{
    
    if (_leftAndMiddleAndRightNSIntegerDic)
    {
        NSString *left = [NSString stringWithFormat:@"%ld",[_pickerTitle selectedRowInComponent:0]];
        NSString *middel = [NSString stringWithFormat:@"%ld",[_pickerTitle selectedRowInComponent:1]];
        NSString *right = [NSString stringWithFormat:@"%ld",[_pickerTitle selectedRowInComponent:2]];
        _leftAndMiddleAndRightNSIntegerDic(@{@"leftNub":left,@"middelNub":middel,@"rightNub":right,@"leftstring":leftString,@"middelstring":middleString,@"rightstring":rightString});
    }
    
    
}
#pragma mark Picker Data Source Methed
- (NSInteger) numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 3;
}
- (NSInteger) pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (component==0)return  allDatas.count;
    if (component==1)return  MiddleDatas.count;
    if (component==2)return  RightDatas.count;
    return 0;
}

#pragma mark Picker Delegate Methods
////当用户选择某个row时,pickerview调用此函数
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    
    
    if (component==0)
    {
        if (!MiddleDatas)
            MiddleDatas = [NSArray array];
        NSLog(@"%@",[newPikerModel class]);
        NSLog(@"%@",[allDatas[0] class]);
        
        if ([allDatas[0] isKindOfClass:[newPikerModel class]])
        {
            newPikerModel *newArray = allDatas[row];
            MiddleDatas = newArray.array;
        }
        else
        {
            MiddleDatas = [allDatas[row] allValues][0];
        }
        [pickerView selectRow:0 inComponent:1 animated:NO];
        [pickerView reloadComponent:1];
//        选中第二列的回调 不然再更新第一列时rightString  数据将不变
        if (upblock)
        {
          upblock(1);
        }
    }
    if (component==1)
    {
        if (!RightDatas)RightDatas = [NSArray array];
        
        if ([allDatas[0] isKindOfClass:[newPikerModel class]])
        {
            newPikerSubOneModel *newArray = MiddleDatas[row];
            RightDatas = newArray.array;
        }
        else
        {
             RightDatas = [MiddleDatas[row] allValues][0];
        }
        [pickerView selectRow:0 inComponent:2 animated:NO];
        [pickerView reloadComponent:2];
        //选中第二列的回调 不然再更新第一列时rightString  数据将不变
        if (upblock)
        {
            upblock(2);
        }
    }
    UIButton *bt = (UIButton *)[pickerView viewForRow:row forComponent:component];
    bt.selected = YES;
    bt.titleLabel.font = [UIFont systemFontOfSize:bt.frame.size.height*2/3];
   
    if (component==0)leftString = bt.currentTitle;
    if (component==1)middleString = bt.currentTitle;
    if (component==2)rightString = bt.currentTitle;
    
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
{
    UIButton *butt = (UIButton *)view;
    butt = [UIButton buttonWithType:UIButtonTypeCustom];
    [butt setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [butt setTitleColor:GETCOLOR(@"blr") forState:UIControlStateSelected];
    
    
    
    if ([allDatas[0] isKindOfClass:[newPikerModel class]])
    {
        newPikerModel *leftmodel;
        newPikerSubOneModel *middlemodel;
        newPikerSubTwoModel *rightmodel;
       
        if (component==0)butt.tag = 100+row,leftmodel= allDatas[row],[butt setTitle:leftmodel.gameName forState:UIControlStateNormal];
        if (component==1)butt.tag = 200+row,middlemodel = MiddleDatas[row],[butt setTitle:middlemodel.gameName forState:UIControlStateNormal];
        if (component==2)butt.tag = 300+row,rightmodel = RightDatas[row],[butt setTitle:rightmodel.gameName forState:UIControlStateNormal];
    }
    else
    {
        if (component==0)butt.tag = 100+row,[butt setTitle:[allDatas[row] allKeys][0] forState:UIControlStateNormal];
        if (component==1)butt.tag = 200+row,[butt setTitle:[MiddleDatas[row] allKeys][0] forState:UIControlStateNormal];
        if (component==2)butt.tag = 300+row,[butt setTitle:RightDatas[row] forState:UIControlStateNormal];
    }


    return butt;
    
}
- (void)change:(id)sender
{
    UISegmentedControl *ctrl = (UISegmentedControl *)sender;
    switch (ctrl.selectedSegmentIndex)
    {
        case 0:
        {
            NSLog(@"00");
        }
            break;
        case 1:
        {
            NSLog(@"11");
        }
            break;
        default:
            break;
    }
}
-(void)updatas:(NSArray *)array
{
    allDatas = array;
    [self updatasSeleted];//更新时不调用选中方法MiddleDatas RightDatas 将没有数据。
    [self.pickerTitle reloadAllComponents];
}
@end
