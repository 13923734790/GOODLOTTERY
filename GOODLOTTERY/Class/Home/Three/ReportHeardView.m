//
//  ReportHeardView.m
//  GOODLOTTERY
//
//  Created by apple on 16/3/10.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "ReportHeardView.h"
#import "NSString+StringTool.h"

@implementation ReportHeardView
{
    UIButton *  CheckBt;
    UIImageView *CheckImage;
    UIButton *Gamebt;
}

-(instancetype)initWithFrame:(CGRect)frame AndKind:(NSInteger)kind
{
    self = [super initWithFrame:frame];
    if (self)
    {
        
        CGFloat TitleHeight;
        if (kind==1) [self One],TitleHeight =44*ScaleY;else [self Two],TitleHeight =86*ScaleY;
        
        UIView *titleView = [[UIView alloc]initWithFrame:CGRectMake(0,TitleHeight,UIScreenWIDTH,40*ScaleY)];
        titleView.backgroundColor = [UIColor blackColor];
        NSArray *array1 = @[@"日期",@"彩票投注",@"彩票盈亏",@"详情"];
        NSArray *array2 = @[@"用户名",@"所属组",@"销售总额",@"详情"];
        [self addSubview:titleView];
        for (int i = 0; i<4; i++)
        {
            UILabel *lable1;
            lable1 = [[UILabel alloc]initWithFrame:CGRectMake(UIScreenWIDTH/4*i,0,UIScreenWIDTH/4,40*ScaleY)];
            lable1.textAlignment = NSTextAlignmentCenter;
            if (kind==1)lable1.text = array1[i];else lable1.text = array2[i];
            lable1.textColor = [UIColor whiteColor];
            lable1.font = [UIFont systemFontOfSize:13*ScaleY];
            [titleView addSubview:lable1];
            
        }
    }
    
    [self UpdataImageAndColor];
    return self;
}
-(void)UpdataImageAndColor
{
    NSArray *arrayImage = [SkinPeelerTool UpdataCheckView];
    [Gamebt setBackgroundImage:[UIImage imageNamed:arrayImage[0]] forState:UIControlStateNormal];
    [Gamebt setImage:[UIImage imageNamed:arrayImage[3]] forState:UIControlStateNormal];
    [Gamebt setTitleColor:GETCOLOR(@"wb") forState:UIControlStateNormal];

    
    [CheckBt setBackgroundImage:[UIImage imageNamed:arrayImage[0]] forState:UIControlStateNormal];
    

    for (int i = 0; i<2; i++)
    {
        UIButton *timebt = [self viewWithTag:200+i];
        [timebt  setTitleColor:GETCOLOR(@"wb") forState:UIControlStateNormal];
        [timebt setBackgroundImage:[UIImage imageNamed:arrayImage[0]] forState:UIControlStateNormal];
        [timebt setImage:[UIImage imageNamed:arrayImage[2]] forState:UIControlStateNormal];
    }
    CheckImage.image = [UIImage imageNamed:arrayImage[1]];
}


-(void)One
{
    CheckBt = [UIButton buttonWithType:UIButtonTypeCustom];
    CheckBt.frame = CGRectMake((UIScreenWIDTH-8*ScaleX)*4/5+6*ScaleX,2*ScaleY,(UIScreenWIDTH-8*ScaleX)/5, 40*ScaleY);
    CheckImage = [[UIImageView alloc]initWithFrame:CGRectMake((CheckBt.frame.size.width-30*ScaleX)/2,5*ScaleY, 30*ScaleX, 30*ScaleY)];
    [CheckBt addSubview:CheckImage];
    [self addSubview:CheckBt];
    
    for (int i = 0; i<2; i++)
    {
        
        UIButton * TimeBt = [UIButton buttonWithType:UIButtonTypeCustom];
        TimeBt.frame = CGRectMake(2*ScaleX+(2*ScaleX+(UIScreenWIDTH-8*ScaleX)*2/5)*i,2*ScaleY,(UIScreenWIDTH-8*ScaleX)*2/5,40*ScaleY);
        
        TimeBt.layer.cornerRadius = 5;
        TimeBt.layer.masksToBounds = YES;
        NSString *TimeString;
        
        if (i==0)  TimeString = [NSString CurrentTime:TimeSimpleStyle];else TimeString = [NSString CurrentTime:TimeSimpleStyle];
        
        [TimeBt setTitle:TimeString forState:UIControlStateNormal];
        
        TimeBt.titleLabel.adjustsFontSizeToFitWidth = YES;
        TimeBt.titleLabel.font = [UIFont systemFontOfSize:13*ScaleY];
        [TimeBt addTarget:self action:@selector(TimeClick:) forControlEvents:UIControlEventTouchUpInside];
        TimeBt.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        //            OtherBt.titleEdgeInsets = UIEdgeInsetsMake(0,-7*ScaleX,0,7*ScaleX);
        //            TimeBt.imageEdgeInsets = UIEdgeInsetsMake(0,(UIScreenWIDTH-8*ScaleX)/3-25*ScaleX,0, -5*ScaleX);
        TimeBt.tag = 200+i;
        
        
        [self addSubview:TimeBt];

    }

}
- (void)Two
{
    CheckBt = [UIButton buttonWithType:UIButtonTypeCustom];
    CheckBt.frame = CGRectMake((UIScreenWIDTH-6*ScaleX)*2/3+4*ScaleX,44*ScaleY,(UIScreenWIDTH-6*ScaleX)/3, 40*ScaleY);
    CheckImage = [[UIImageView alloc]initWithFrame:CGRectMake((CheckBt.frame.size.width-30*ScaleX)/2,5*ScaleY, 30*ScaleX, 30*ScaleY)];
    [CheckBt addSubview:CheckImage];
    
    
    
    Gamebt  = [UIButton buttonWithType:UIButtonTypeCustom];
    Gamebt.frame = CGRectMake(2*ScaleX,44*ScaleY,(UIScreenWIDTH-6*ScaleX)*2/3,40*ScaleY);
    Gamebt.frame = CGRectMake(2*ScaleX,44*ScaleY,(UIScreenWIDTH-6*ScaleX)*2/3,40*ScaleY);
    Gamebt.layer.cornerRadius = 5;
    Gamebt.layer.masksToBounds = YES;
    [Gamebt setTitle:@"所有游戏" forState:UIControlStateNormal];
    
    [Gamebt addTarget:self action:@selector(GameBut:) forControlEvents:UIControlEventTouchUpInside];
    Gamebt.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    //            OtherBt.titleEdgeInsets = UIEdgeInsetsMake(0,-7*ScaleX,0,7*ScaleX);
    Gamebt.imageEdgeInsets = UIEdgeInsetsMake(0,(UIScreenWIDTH-6*ScaleX)*2/3-25*ScaleX,0, -5*ScaleX);
    
    
    [self addSubview:CheckBt];
    [self addSubview:Gamebt];
    
    
    
    for (int i = 0; i<2; i++)
    {
        
        UIButton * TimeBt = [UIButton buttonWithType:UIButtonTypeCustom];
        TimeBt.frame = CGRectMake(2*ScaleX+((UIScreenWIDTH-6*ScaleX)/2+2*ScaleX)*i,2*ScaleY,(UIScreenWIDTH-6*ScaleX)/2,40*ScaleY);
        
        TimeBt.layer.cornerRadius = 5;
        TimeBt.layer.masksToBounds = YES;
        NSString *TimeString;
        
        if (i==0)  TimeString = [NSString CurrentTime:TimeSimpleStyle];else TimeString = [NSString CurrentTime:TimeSimpleStyle];
        
        [TimeBt setTitle:TimeString forState:UIControlStateNormal];
        
        TimeBt.titleLabel.adjustsFontSizeToFitWidth = YES;
        TimeBt.titleLabel.font = [UIFont systemFontOfSize:13*ScaleY];
        [TimeBt addTarget:self action:@selector(TimeClick:) forControlEvents:UIControlEventTouchUpInside];
        TimeBt.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        //            OtherBt.titleEdgeInsets = UIEdgeInsetsMake(0,-7*ScaleX,0,7*ScaleX);
        //            TimeBt.imageEdgeInsets = UIEdgeInsetsMake(0,(UIScreenWIDTH-8*ScaleX)/3-25*ScaleX,0, -5*ScaleX);
        TimeBt.tag = 200+i;
        
        
        
        [self addSubview:TimeBt];

    }

}
- (void)TimeClick:(UIButton *)But
{
    //x,y 值无效，默认是居中的
    KSDatePicker* picker = [[KSDatePicker alloc] initWithFrame:CGRectMake(0, 0, FRAMEWIDTH - 40, 300)];
    //配置中心，详情见KSDatePikcerApperance
    
    picker.appearance.radius = 5;
    //设置回调
    picker.appearance.resultCallBack = ^void(KSDatePicker* datePicker,NSDate* currentDate,KSDatePickerButtonType buttonType){
        
        if (buttonType == KSDatePickerButtonCommit) {
            
        NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
            
        [But setTitle:[formatter stringFromDate:currentDate] forState:UIControlStateNormal];

            
        }
    };
    // 显示
    [picker show];
}
- (void)GameBut:(UIButton *)Bt
{
    UIWindow * window=[[[UIApplication sharedApplication] delegate] window];
    CGRect rect=[Bt convertRect: Bt.bounds toView:window];
    PullDownMenu *pullmenu = [[PullDownMenu alloc]initWithFrame:CGRectMake(rect.origin.x, rect.origin.y+rect.size.height, rect.size.width,30*4)];
        
        pullmenu.layer.borderColor = [UIColor groupTableViewBackgroundColor].CGColor;
        pullmenu.layer.borderWidth = 1;
        
        pullmenu.DatasArray = @[@"所有游戏",@"天津时时彩",@"广东11选5",@"北京快乐8"];
        
        pullmenu.GameNamestring = Bt.currentTitle;
        pullmenu.appearance.resultCallBack = ^(NSString * string)
        {
            [Bt  setTitle:string forState:UIControlStateNormal];
        };
    
        [pullmenu show];
    
}

@end