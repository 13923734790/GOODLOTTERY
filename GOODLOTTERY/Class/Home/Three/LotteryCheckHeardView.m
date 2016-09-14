//
//  LotteryCheckHeardView.m
//  GOODLOTTERY
//
//  Created by apple on 16/3/7.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "LotteryCheckHeardView.h"
#import "NSString+StringTool.h"

@implementation LotteryCheckHeardView
{
    UIButton *  CheckBt;
    UITextField *CheckField;
    UIImageView *CheckImage;
    
    UIButton * AllKindBt;
    UIButton * SeletedBt;
    UIButton *ImageBt;
}


-(instancetype)initWithFrame:(CGRect)frame AndKind:(NSInteger)Nub
{
    self = [super initWithFrame:frame];
    if (self)
    {
        
        CheckField = [[UITextField alloc]initWithFrame:CGRectMake((UIScreenWIDTH-8*ScaleX)*2/3+6*ScaleX,2*ScaleY,(UIScreenWIDTH-8*ScaleX)/3,40*ScaleY)];
        CheckField.placeholder = @" 输入用户名";
        
        [CheckField setValue:[UIFont boldSystemFontOfSize:15*ScaleY] forKeyPath:@"_placeholderLabel.font"];
        [CheckField setValue:[UIColor grayColor] forKeyPath:@"_placeholderLabel.textColor"];

        
        CheckBt = [UIButton buttonWithType:UIButtonTypeCustom];
        CheckBt.frame = CGRectMake((UIScreenWIDTH-8*ScaleX)*4/5+15*ScaleX+6*ScaleX,44*ScaleY,(UIScreenWIDTH-8*ScaleX)/5-15*ScaleX, 40*ScaleY);
        CheckImage = [[UIImageView alloc]initWithFrame:CGRectMake((CheckBt.frame.size.width-30*ScaleX)/2,5*ScaleY, 30*ScaleX, 30*ScaleY)];
        [CheckBt addSubview:CheckImage];
        [self addSubview:CheckBt];
        [self addSubview:CheckField];
        
        
        
        if (Nub==3)
        {
            AllKindBt  = [UIButton buttonWithType:UIButtonTypeCustom];
            AllKindBt.frame = CGRectMake(2*ScaleX,2*ScaleY,(UIScreenWIDTH-8*ScaleX)/3,40*ScaleY);
            AllKindBt.layer.cornerRadius = 5;
            AllKindBt.layer.masksToBounds = YES;
            AllKindBt.titleLabel.adjustsFontSizeToFitWidth = YES;
            AllKindBt.titleLabel.font = [UIFont systemFontOfSize:13*ScaleY];
           
            [AllKindBt setTitle:@"所有类型" forState:UIControlStateNormal];
            
            [AllKindBt addTarget:self action:@selector(playAndgameBt:) forControlEvents:UIControlEventTouchUpInside];
            AllKindBt.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
            AllKindBt.imageEdgeInsets = UIEdgeInsetsMake(0,(UIScreenWIDTH-8*ScaleX)/3-25*ScaleX,0, -5*ScaleX);
            [self addSubview:AllKindBt];
            
            
            
            SeletedBt  = [UIButton buttonWithType:UIButtonTypeCustom];
            SeletedBt.frame = CGRectMake(2*ScaleX+(2*ScaleX+(UIScreenWIDTH-8*ScaleX)/3),2*ScaleY,(UIScreenWIDTH-8*ScaleX)/3,40*ScaleY);
            SeletedBt.layer.cornerRadius = 5;
            SeletedBt.layer.masksToBounds = YES;
            SeletedBt.titleLabel.adjustsFontSizeToFitWidth = YES;
            SeletedBt.titleLabel.font = [UIFont systemFontOfSize:13*ScaleY];
            [SeletedBt setTitle:@"包含下级" forState:UIControlStateNormal];
            
            [SeletedBt addTarget:self action:@selector(SeletedBt:) forControlEvents:UIControlEventTouchUpInside];
            SeletedBt.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
            SeletedBt.titleEdgeInsets = UIEdgeInsetsMake(0,30*ScaleX,0,10*ScaleX);
            
            
            ImageBt = [UIButton buttonWithType:UIButtonTypeCustom];
            ImageBt.frame = CGRectMake(10*ScaleX, 25/2*ScaleY, 15*ScaleY, 15*ScaleY);
            [ImageBt setBackgroundImage:[UIImage imageNamed:@"CatchSelected"] forState:UIControlStateNormal];
            [SeletedBt addSubview:ImageBt];
            [self addSubview:SeletedBt];
            
            
            
        }
        
        for (int i = 0; i<2; i++)
        {
        
            
            
            if (Nub!=3)
            {
                UIButton * playAndgameBt  = [UIButton buttonWithType:UIButtonTypeCustom];
                playAndgameBt.frame = CGRectMake(2*ScaleX+(2*ScaleX+(UIScreenWIDTH-8*ScaleX)/3)*i,2*ScaleY,(UIScreenWIDTH-8*ScaleX)/3,40*ScaleY);
                
                playAndgameBt.layer.cornerRadius = 5;
                playAndgameBt.layer.masksToBounds = YES;
                playAndgameBt.titleLabel.adjustsFontSizeToFitWidth = YES;
                playAndgameBt.titleLabel.font = [UIFont systemFontOfSize:13*ScaleY];
                NSString *titleString;
                if (i==0)  titleString = @"所有玩法";else titleString = @"所有游戏";
                [playAndgameBt setTitle:titleString forState:UIControlStateNormal];
                
                [playAndgameBt addTarget:self action:@selector(playAndgameBt:) forControlEvents:UIControlEventTouchUpInside];
                playAndgameBt.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
                playAndgameBt.imageEdgeInsets = UIEdgeInsetsMake(0,(UIScreenWIDTH-8*ScaleX)/3-25*ScaleX,0, -5*ScaleX);
                playAndgameBt.tag = 100+i;
                [self addSubview:playAndgameBt];

            }
            
            
            
           UIButton * TimeBt = [UIButton buttonWithType:UIButtonTypeCustom];
            TimeBt.frame = CGRectMake(2*ScaleX+(((UIScreenWIDTH-8*ScaleX)*4/5+15*ScaleX)/2+2*ScaleX)*i,44*ScaleY,((UIScreenWIDTH-8*ScaleX)*4/5+15*ScaleX)/2,40*ScaleY);
            
            TimeBt.layer.cornerRadius = 5;
            TimeBt.layer.masksToBounds = YES;
            NSString *TimeString;

            if (i==0)  TimeString = [NSString CurrentTime:TimeSimpleStyle];else TimeString = [NSString CurrentTime:TimeSimpleStyle];
            
            [TimeBt setTitle:TimeString forState:UIControlStateNormal];
            
            TimeBt.titleLabel.adjustsFontSizeToFitWidth = YES;
            TimeBt.titleLabel.font = [UIFont systemFontOfSize:13*ScaleY];
            [TimeBt addTarget:self action:@selector(TimeBt:) forControlEvents:UIControlEventTouchUpInside];
            TimeBt.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
            TimeBt.tag = 200+i;
            
            
            
            [self addSubview:TimeBt];
        }
    }
    
    
    [self UpdataImageAndColor];
    return self;
}


-(void)UpdataImageAndColor
{
    NSArray *arrayImage = [SkinPeelerTool UpdataCheckView];
    
    [CheckBt setBackgroundImage:[UIImage imageNamed:arrayImage[0]] forState:UIControlStateNormal];
    [CheckField setBackground:[UIImage imageNamed:arrayImage[0]]];
    for (int i = 0; i<2; i++)
    {
        UIButton *Playbt = [self viewWithTag:100+i];
        UIButton *timebt = [self viewWithTag:200+i];
        
                
        [Playbt setTitleColor:GETCOLOR(@"wb") forState:UIControlStateNormal];
        [timebt setTitleColor:GETCOLOR(@"wb") forState:UIControlStateNormal];
        
        [Playbt setBackgroundImage:[UIImage imageNamed:arrayImage[0]] forState:UIControlStateNormal];
        [timebt setBackgroundImage:[UIImage imageNamed:arrayImage[0]] forState:UIControlStateNormal];
        [Playbt setImage:[UIImage imageNamed:arrayImage[4]] forState:UIControlStateNormal];
        [timebt setImage:[UIImage imageNamed:arrayImage[2]] forState:UIControlStateNormal];
        
    }
    [AllKindBt setTitleColor:GETCOLOR(@"wb") forState:UIControlStateNormal];
    [AllKindBt setBackgroundImage:[UIImage imageNamed:arrayImage[0]] forState:UIControlStateNormal];
    [AllKindBt setImage:[UIImage imageNamed:arrayImage[4]] forState:UIControlStateNormal];
    
    
    [SeletedBt setTitleColor:GETCOLOR(@"wb") forState:UIControlStateNormal];
    [SeletedBt setBackgroundImage:[UIImage imageNamed:arrayImage[0]] forState:UIControlStateNormal];
    
    [ImageBt setImage:[UIImage imageNamed:arrayImage[3]] forState:UIControlStateSelected];
    
    CheckImage.image = [UIImage imageNamed:arrayImage[1]];
    CheckField.textColor = GETCOLOR(@"wb");
}

- (void)SeletedBt:(UIButton *)Bt
{
    ImageBt.selected = !ImageBt.selected;
    
}
- (void)TimeBt:(UIButton *)But
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

- (void)playAndgameBt:(UIButton *)Bt
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
