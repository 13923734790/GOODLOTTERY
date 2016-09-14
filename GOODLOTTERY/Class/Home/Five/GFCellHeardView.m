//
//  GFCellHeardView.m
//  GOODLOTTERY
//
//  Created by apple on 16/9/2.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "GFCellHeardView.h"

@implementation GFCellHeardView
{
    UILabel *promptLable;
    NSMutableArray *seletedArray;
    NSArray *Titlearray;
}

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        seletedArray = [NSMutableArray arrayWithCapacity:5];
        [self setAllView];
    }
    return self;
}

-(void)setAllView
{
    Titlearray = @[@"万",@"千",@"百",@"十",@"个"];
    
    for (int i = 0;i<5; i++)
    {
        UIButton *WeiShubt =[UIButton buttonWithType:UIButtonTypeCustom];
        WeiShubt.frame = CGRectMake(UIScreenWIDTH/8*1.5+UIScreenWIDTH/8*i,10*ScaleY,UIScreenWIDTH/8*(2/5.0),UIScreenWIDTH/8*(2/5.0));
        [WeiShubt setImage:[UIImage imageNamed:@"CatchSelected"] forState:UIControlStateNormal];
        [WeiShubt setImage:[UIImage imageNamed:IMAGEFILE(@"CatchSelected%ld")] forState:UIControlStateSelected];
        [WeiShubt addTarget:self action:@selector(CLickBt:) forControlEvents:UIControlEventTouchUpInside];
         WeiShubt.tag = 100+i;
         WeiShubt.selected = YES;
        
        [seletedArray addObject:Titlearray[i]];
        [self addSubview:WeiShubt];
        
        
        
        UILabel *WeiShuLable = [[UILabel alloc]init];
        WeiShuLable.frame = CGRectMake(UIScreenWIDTH/8*1.5+UIScreenWIDTH/8*(2/5.0)+UIScreenWIDTH/8*i,10*ScaleY,UIScreenWIDTH/8*(3/5.0),UIScreenWIDTH/8*(2/5.0));
        
        WeiShuLable.text = Titlearray[i];
        WeiShuLable.font = [UIFont systemFontOfSize:11*ScaleY];
        WeiShuLable.textColor = [UIColor whiteColor];
        [self addSubview:WeiShuLable];
    }
    promptLable = [[UILabel alloc]init];
    promptLable.font = [UIFont systemFontOfSize:12*ScaleY];
    promptLable.textColor = [UIColor whiteColor];
    [self setpromptLable];
    [self addSubview:promptLable];
    
}
-(void)layoutSubviews
{
    promptLable.frame = CGRectMake(5*ScaleX,CGRectGetHeight(self.frame)-20*ScaleY,UIScreenWIDTH, 20*ScaleY);
}

-(void)CLickBt:(UIButton *)Bt
{
    Bt.selected = !Bt.selected;
    
           if (Bt.selected)
        {
            seletedArray[Bt.tag-100] = Titlearray[Bt.tag-100];
        }
        else
        {
            seletedArray[Bt.tag-100] = @"nil";
        }
    
    [self setpromptLable];
}
-(void)setpromptLable
{
    int i = 0;
    for (NSString *string in seletedArray)
    {
        if ([string isEqualToString:@"nil"])
        {
            i++;
        }
    }
    promptLable.text = [NSString stringWithFormat:@"(温馨提示:您选择了%d个位置，系统会自动根据位置组合成5个方案)",5-i];
}
@end
