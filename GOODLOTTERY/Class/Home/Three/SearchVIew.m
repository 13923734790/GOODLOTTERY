//
//  SearchVIew.m
//  GOODLOTTERY
//
//  Created by apple on 16/3/16.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "SearchVIew.h"
#import "NSString+StringTool.h"

@implementation SearchVIew
{
   UIButton *  CheckBt;
   UIImageView *CheckImage;
   UIButton *Gamebt;
}

- (instancetype)initWithFrame:(CGRect)frame AndKind:(NSInteger)kind
{
    self = [super initWithFrame:frame];
    if (self)
    {
       if(kind==1)[self One];else [self Two];
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
        UILabel *lable2 = [timebt viewWithTag:55];
        UIImageView *image2 = [timebt viewWithTag:99];
        lable2.textColor = GETCOLOR(@"wb");
        [timebt setBackgroundImage:[UIImage imageNamed:arrayImage[0]] forState:UIControlStateNormal];
        image2.image = [UIImage imageNamed:arrayImage[2]];
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
        UIButton *TimeBt = [UIButton buttonWithType:UIButtonTypeCustom];
        TimeBt.tag = 200+i;
        TimeBt.frame = CGRectMake(2*ScaleX+(2*ScaleX+(UIScreenWIDTH-8*ScaleX)*2/5)*i,2*ScaleY,(UIScreenWIDTH-8*ScaleX)*2/5,40*ScaleY);
        UILabel *lable2 = [[UILabel alloc]initWithFrame:CGRectMake(30*ScaleX,0,TimeBt.frame.size.width-30*ScaleX,TimeBt.frame.size.height)];
        lable2.textAlignment = NSTextAlignmentCenter;
        lable2.font = [UIFont systemFontOfSize:15*ScaleY];
        lable2.adjustsFontSizeToFitWidth = YES;
        if (i==0)  lable2.text = [NSString CurrentTime:TimeSimpleStyle];else lable2.text = [NSString CurrentTime:TimeSimpleStyle];
        UIImageView *imageView2 = [[UIImageView alloc]initWithFrame:CGRectMake(5*ScaleY,(TimeBt.frame.size.height-20*ScaleY)/2,20*ScaleY, 20*ScaleY)];
        lable2.tag = 55;
        imageView2.tag = 99;
        [TimeBt addSubview:lable2];
        [TimeBt addSubview:imageView2];
        [self addSubview:TimeBt];
        [TimeBt addTarget:self action:@selector(TimeClick:) forControlEvents:UIControlEventTouchUpInside];
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
        UIButton *TimeBt = [UIButton buttonWithType:UIButtonTypeCustom];
        TimeBt.tag = 200+i;
        TimeBt.frame = CGRectMake(2*ScaleX+((UIScreenWIDTH-6*ScaleX)/2+2*ScaleX)*i,2*ScaleY,(UIScreenWIDTH-6*ScaleX)/2,40*ScaleY);
        UILabel *lable2 = [[UILabel alloc]initWithFrame:CGRectMake(30*ScaleX,0,TimeBt.frame.size.width-30*ScaleX,TimeBt.frame.size.height)];
        lable2.textAlignment = NSTextAlignmentCenter;
        lable2.font = [UIFont systemFontOfSize:15*ScaleY];
        lable2.adjustsFontSizeToFitWidth = YES;
        if (i==0)  lable2.text = [NSString CurrentTime:TimeSimpleStyle];else lable2.text = [NSString CurrentTime:TimeSimpleStyle];
        UIImageView *imageView2 = [[UIImageView alloc]initWithFrame:CGRectMake(5*ScaleY,(TimeBt.frame.size.height-20*ScaleY)/2,20*ScaleY, 20*ScaleY)];
        lable2.tag = 55;
        imageView2.tag = 99;
        [TimeBt addSubview:lable2];
        [TimeBt addSubview:imageView2];
        [self addSubview:TimeBt];
        [TimeBt addTarget:self action:@selector(TimeClick:) forControlEvents:UIControlEventTouchUpInside];
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
            
            UILabel *lable = (UILabel *)[But viewWithTag:55];
            lable.text =[formatter stringFromDate:currentDate];
            
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

//-(void)UpdataImageAndColor
//{
//    NSArray *arrayImage = [SkinPeelerTool UpdataCheckView];
//    [Gamebt setBackgroundImage:[UIImage imageNamed:arrayImage[0]] forState:UIControlStateNormal];
//    [CheckBt setBackgroundImage:[UIImage imageNamed:arrayImage[0]] forState:UIControlStateNormal];
//    for (int i = 0; i<2; i++)
//    {
//        UIButton *timebt = [self viewWithTag:200+i];
//        UILabel *lable2 = [timebt viewWithTag:55];
//        UIImageView *image2 = [timebt viewWithTag:99];
//        lable2.textColor = GETCOLOR(@"wb");
//        [timebt setBackgroundImage:[UIImage imageNamed:arrayImage[0]] forState:UIControlStateNormal];
//        image2.image = [UIImage imageNamed:arrayImage[2]];
//    }
//    CheckImage.image = [UIImage imageNamed:arrayImage[1]];
//    Gameimage.image = [UIImage imageNamed:arrayImage[3]];
//}

//-(void)One
//{
//    CheckBt = [UIButton buttonWithType:UIButtonTypeCustom];
//    CheckBt.frame = CGRectMake((UIScreenWIDTH-8*ScaleX)*4/5+6*ScaleX,2*ScaleY,(UIScreenWIDTH-8*ScaleX)/5, 40*ScaleY);
//    CheckImage = [[UIImageView alloc]initWithFrame:CGRectMake((CheckBt.frame.size.width-30*ScaleX)/2,5*ScaleY, 30*ScaleX, 30*ScaleY)];
//    [CheckBt addSubview:CheckImage];
//    [self addSubview:CheckBt];
//    
//    for (int i = 0; i<2; i++)
//    {
//        UIButton *TimeBt = [UIButton buttonWithType:UIButtonTypeCustom];
//        TimeBt.tag = 200+i;
//        TimeBt.frame = CGRectMake(2*ScaleX+(2*ScaleX+(UIScreenWIDTH-8*ScaleX)*2/5)*i,2*ScaleY,(UIScreenWIDTH-8*ScaleX)*2/5,40*ScaleY);
//        UILabel *lable2 = [[UILabel alloc]initWithFrame:CGRectMake(30*ScaleX,0,TimeBt.frame.size.width-30*ScaleX,TimeBt.frame.size.height)];
//        lable2.textAlignment = NSTextAlignmentCenter;
//        lable2.font = [UIFont systemFontOfSize:15*ScaleY];
//        lable2.adjustsFontSizeToFitWidth = YES;
//        if (i==0)  lable2.text = [NSString CurrentTime:TimeCommonStyle];else lable2.text = [NSString CurrentTime:TimeCommonStyle];
//        UIImageView *imageView2 = [[UIImageView alloc]initWithFrame:CGRectMake(5*ScaleY,(TimeBt.frame.size.height-20*ScaleY)/2,20*ScaleY, 20*ScaleY)];
//        lable2.tag = 55;
//        imageView2.tag = 99;
//        [TimeBt addSubview:lable2];
//        [TimeBt addSubview:imageView2];
//        [self addSubview:TimeBt];
//        
//        [TimeBt addTarget:self action:@selector(TimeClick:) forControlEvents:UIControlEventTouchUpInside];
//    }
//    
//}
//- (void)Two
//{
//    
//    Gamebt  = [UIButton buttonWithType:UIButtonTypeCustom];
//    CheckBt = [UIButton buttonWithType:UIButtonTypeCustom];
//    Gamebt.frame = CGRectMake((UIScreenWIDTH-10*ScaleX)*3/5+6*ScaleX,2*ScaleY,(UIScreenWIDTH-10*ScaleX)/5+15*ScaleX,40*ScaleY);
//    CheckBt.frame = CGRectMake((UIScreenWIDTH-10*ScaleX)*4/5+15*ScaleX+8*ScaleX,2*ScaleY,(UIScreenWIDTH-10*ScaleX)/5-15*ScaleX, 40*ScaleY);
//    CheckImage = [[UIImageView alloc]initWithFrame:CGRectMake((CheckBt.frame.size.width-30*ScaleX)/2,5*ScaleY, 30*ScaleX, 30*ScaleY)];
//    [CheckBt addSubview:CheckImage];
//    UILabel *lable = [[UILabel alloc]initWithFrame:CGRectMake(0, 0,Gamebt.frame.size.width-20*ScaleX, 40*ScaleY)];
//    Gameimage = [[UIImageView alloc]initWithFrame:CGRectMake(Gamebt.frame.size.width-15*ScaleX, (Gamebt.frame.size.height-10*ScaleY)/2,10*ScaleY, 10*ScaleY)];
//    [Gamebt addSubview:lable];
//    [Gamebt addSubview:Gameimage];
//    lable.text = @"所有游戏";
//    lable.textAlignment = NSTextAlignmentCenter;
//    lable.font = [UIFont systemFontOfSize:13*ScaleY];
//    lable.textColor = GETCOLOR(@"wb");
//    [self addSubview:CheckBt];
//    [self addSubview:Gamebt];
//    for (int i = 0; i<2; i++)
//    {
//        UIButton *TimeBt = [UIButton buttonWithType:UIButtonTypeCustom];
//        TimeBt.tag = 200+i;
//        TimeBt.frame = CGRectMake(2*ScaleX+(2*ScaleX+(UIScreenWIDTH-10*ScaleX)*3/5/2)*i,2*ScaleY,(UIScreenWIDTH-10*ScaleX)*3/5/2,40*ScaleY);
//        UILabel *lable2 = [[UILabel alloc]initWithFrame:CGRectMake(30*ScaleX,0,TimeBt.frame.size.width-30*ScaleX,TimeBt.frame.size.height)];
//        lable2.textAlignment = NSTextAlignmentCenter;
//        lable2.font = [UIFont systemFontOfSize:15*ScaleY];
//        lable2.adjustsFontSizeToFitWidth = YES;
//        if (i==0)  lable2.text = [NSString CurrentTime:TimeCommonStyle];else lable2.text = [NSString CurrentTime:TimeCommonStyle];
//        UIImageView *imageView2 = [[UIImageView alloc]initWithFrame:CGRectMake(5*ScaleY,(TimeBt.frame.size.height-20*ScaleY)/2,20*ScaleY, 20*ScaleY)];
//        lable2.tag = 55;
//        imageView2.tag = 99;
//        [TimeBt addSubview:lable2];
//        [TimeBt addSubview:imageView2];
//        [self addSubview:TimeBt];
//        
//        [TimeBt addTarget:self action:@selector(TimeClick:) forControlEvents:UIControlEventTouchUpInside];
//    }
//    
//}
//
//- (void)TimeClick:(UIButton *)bt
//{
//    if (_blockTime)
//    {
//        _blockTime(bt,0);
//    }
//}

@end
