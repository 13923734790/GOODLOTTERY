//
//  LiuHeSeBoCell.m
//  GOODLOTTERY
//
//  Created by apple on 16/7/29.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "LiuHeSeBoCell.h"
#import "LiuHeSeBoView.h"

@implementation LiuHeSeBoCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        [self setSeboView];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(ChangeOdd:) name:@"ChangeOdd" object:nil];
    }
    return self;
}


-(void)setSeboView
{
    NSArray *titleArray = @[@"红单",@"红双",@"红大",@"红小",@"蓝单",@"蓝双",@"蓝大",@"蓝小",@"绿单",@"绿双",@"红大",@"绿小",];
    
    NSArray *ballarray1 = @[@"1",@"7",@"13",@"19",@"23",@"29",@"35",@"45",@"40",@"46",];
//    NSArray *ballarray2 = @[@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",];
//    NSArray *ballarray3 = @[@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",];
//    NSArray *ballarray4 = @[@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",];
//    NSArray *ballarray5 = @[@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",];
//    NSArray *ballarray6 = @[@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",];
//    NSArray *ballarray7 = @[@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",];
//    NSArray *ballarray8 = @[@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",];
//    NSArray *ballarray9 = @[@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",];
//    NSArray *ballarray10= @[@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",];
//    NSArray *ballarray11 = @[@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",];
//    NSArray *ballarray12 = @[@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",];
    
    UILabel * titleBt = [[UILabel alloc]init];
    titleBt.frame = CGRectMake(5*ScaleX, 0, 50*ScaleY*1.2, 29*ScaleY);
    titleBt.backgroundColor = DTAISCOLORE(255, 255, 255, 0.6);
    titleBt.textAlignment = NSTextAlignmentCenter;
    titleBt.text = @"项目";
    titleBt.font = [UIFont systemFontOfSize:13*ScaleY];
    [self addSubview:titleBt];
    
    UILabel * OddBt = [[UILabel alloc]init];
    OddBt.frame = CGRectMake(6*ScaleX+50*ScaleY*1.2,0, 50*ScaleY*1.2-2*ScaleX, 29*ScaleY);
    OddBt.backgroundColor = DTAISCOLORE(255,255,255, 0.6);
    OddBt.textAlignment = NSTextAlignmentCenter;
    OddBt.text = @"赔率";
    OddBt.font = [UIFont systemFontOfSize:13*ScaleY];
    [self addSubview:OddBt];
    
     UILabel *balllable = [[UILabel alloc]init];
     balllable.frame = CGRectMake(50*ScaleY*2.4+5*ScaleX, 0, (UIScreenWIDTH-10*ScaleX)-50*ScaleY*2.4, 29*ScaleY);
     balllable.backgroundColor = DTAISCOLORE(255, 255, 255, 0.6);
     balllable.textAlignment = NSTextAlignmentCenter;
     balllable.text = @"号码";
     balllable.font = [UIFont systemFontOfSize:13*ScaleY];
     [self addSubview:balllable];
    
    
    for (int i = 0; i<12; i++)
    {
        LiuHeSeBoView *SeBoView = [[LiuHeSeBoView alloc]initWithFrame:CGRectMake(5*ScaleX, 31*ScaleY+(1*ScaleY+50*ScaleY)*i, UIScreenWIDTH-10*ScaleX, 50*ScaleY)];
        SeBoView.tag = 100+i;
        SeBoView.TitleString = titleArray[i];
        SeBoView.OddString = @"12.2";
        if (i<4)
        {
         SeBoView.SeBoColor = [UIColor redColor];
        }
        if (3<i&&i<8){
            SeBoView.SeBoColor = [UIColor blueColor];
        }
        if (7<i&&i<12){
            SeBoView.SeBoColor = [UIColor greenColor];
        }
        //先把颜色赋值在赋值球号
        SeBoView.BallArray =ballarray1;
        [self.contentView addSubview:SeBoView];
        
    }
}

-(void)setOddstring:(NSString *)Odd
{
    for (int i = 0; i<12; i++)
    {
        LiuHeSeBoView *view = [self viewWithTag:100+i];
        view.OddString = Odd;
    }
}
-(void)ChangeOdd:(NSNotification *)notidic
{
    NSDictionary *dic = notidic.userInfo;
    [self setOddstring:dic[@"Odd"]];
    
}
-(void)dealloc{
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
@end
