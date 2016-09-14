//
//  LotteryBarView.m
//  GOODLOTTERY
//
//  Created by apple on 16/1/29.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "LotteryBarView.h"
@implementation LotteryBarView

- (instancetype)initWithFrame:(CGRect)frame
{
    
    self = [super initWithFrame:frame];
    if (self)
    {
        _KJBAllView = [[UIView alloc]init];
        _KJBAllView.backgroundColor = DTAISCOLORE(0, 0, 0, 0.6);
        [self addSubview:_KJBAllView];
        
        _KJView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, FRAMEWIDTH, FRAMEHEIGHT)];
        [self addSubview:_KJView];
        
        NSArray *arrayBall = @[@"1",@"2",@"3",@"1",@"3",@"1",@"2",@"3",@"1",@"3"];
        [self updatas:arrayBall];
        
        _LeftButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _LeftButton.frame = CGRectMake(2,2*ScaleY,UIScreenWIDTH/4,_KJView.frame.size.height-4*ScaleY);
        _LeftButton.layer.cornerRadius = 5;
        _LeftButton.layer.masksToBounds = YES;
        _LeftButton.titleLabel.adjustsFontSizeToFitWidth = YES;
        _LeftButton.titleLabel.font = [UIFont boldSystemFontOfSize:13*ScaleY];
        _LeftButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        _LeftButton.titleEdgeInsets = UIEdgeInsetsMake(0,-5,0,15);
        _LeftButton.imageEdgeInsets = UIEdgeInsetsMake(0,UIScreenWIDTH/4-20,0,-(UIScreenWIDTH/4-15));
         [self.LeftButton addTarget:self action:@selector(PUllMenu:) forControlEvents:UIControlEventTouchUpInside];

        _KJRightlable = [[UILabel alloc]initWithFrame:CGRectMake(UIScreenWIDTH*3/4-30*ScaleX,(_KJView.frame.size.height-20*ScaleY)/2,UIScreenWIDTH/4+25*ScaleX,20*ScaleY)];
        _KJRightlable.textAlignment = NSTextAlignmentRight;
        _KJRightlable.adjustsFontSizeToFitWidth = YES;
        _KJRightlable.font = [UIFont systemFontOfSize:14*ScaleY];
        

        [_KJView addSubview:_LeftButton];
        [_KJView addSubview:_KJRightlable];
        
        
        
        //字体颜色和图片
        [self UpdataImageTextColor];
    }
    
    return self;
}

//动态创建开奖VIew
- (void)updatas:(NSArray *)BallArray
{
    if (BallArray.count>5)
    {
        if (BallArray.count>10)
        {
            _KJBAllView.frame = CGRectMake(0,-40*ScaleY, UIScreenWIDTH, 80*ScaleY);
        }
        else
        {
            _KJBAllView.frame = CGRectMake(0,0, UIScreenWIDTH, 40*ScaleY);
        }
        
        NSInteger nub = BallArray.count;
        NSInteger withBall = BallArray.count;
        if (BallArray.count>10)  withBall = 10;
        
        for (int i = 0; i<nub; i++)
        {
            UIView *ballView = [[UIView alloc]initWithFrame:CGRectMake(UIScreenWIDTH/withBall*(i%10),40*ScaleY*(i/10),UIScreenWIDTH/withBall, 40*ScaleY)];
            
            UIButton *BallBt = [UIButton buttonWithType:UIButtonTypeCustom];
            BallBt.frame = CGRectMake((UIScreenWIDTH/nub-30*ScaleX)/2,(40*ScaleY-30*ScaleX)/2,30*ScaleX,30*ScaleX);
            BallBt.layer.cornerRadius = 30*ScaleX/2;
            BallBt.layer.masksToBounds = YES;
            [BallBt setBackgroundImage:[UIImage imageNamed:IMAGEFILE(@"LotteryBall%ld")]   forState:UIControlStateNormal];
            [BallBt setTitle:BallArray[i] forState:UIControlStateNormal];
            [BallBt setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [ballView addSubview:BallBt];
            [_KJBAllView addSubview:ballView];
        }
        
        _KJBut = [UIButton buttonWithType:UIButtonTypeCustom];
        _KJBut.frame = CGRectMake(UIScreenWIDTH/4+30*ScaleX,0,UIScreenWIDTH/2-60*ScaleX,40*ScaleY);
        [_KJBut setTitle:@"显示开奖结果" forState:UIControlStateNormal];
        _KJBut.titleLabel.font = [UIFont systemFontOfSize:14*ScaleY];
        [_KJBut setTitleColor:GETCOLOR(@"wr") forState:UIControlStateNormal];
        [_KJBut addTarget:self action:@selector(ClickKJ:) forControlEvents:UIControlEventTouchUpInside];
        [_KJView addSubview:_KJBut];

    }
    else
    {
        NSInteger nub = BallArray.count;
        NSInteger withBall = BallArray.count;
        
        UIView *vvvView= [UIView new];
        vvvView.frame = CGRectMake(UIScreenWIDTH/4+15*ScaleX,0,UIScreenWIDTH/2-30*ScaleX,40*ScaleY);
        [_KJView addSubview:vvvView];
        
        for (int i = 0; i<nub; i++)
        {
            UIView *ballView = [[UIView alloc]initWithFrame:CGRectMake((UIScreenWIDTH/2-30*ScaleX)/withBall*(i%5),40*ScaleY*(i/5),(UIScreenWIDTH/2-30*ScaleX)/withBall, 40*ScaleY)];
            
            UIButton *BallBt = [UIButton buttonWithType:UIButtonTypeCustom];
            BallBt.frame = CGRectMake(((UIScreenWIDTH/2-30*ScaleX)/nub-30*ScaleX)/2,(40*ScaleY-30*ScaleX)/2,30*ScaleX,30*ScaleX);
            BallBt.layer.cornerRadius = 30*ScaleX/2;
            BallBt.layer.masksToBounds = YES;
            [BallBt setBackgroundImage:[UIImage imageNamed:IMAGEFILE(@"LotteryBall%ld")]   forState:UIControlStateNormal];
            [BallBt setTitle:BallArray[i] forState:UIControlStateNormal];
            [BallBt setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [ballView addSubview:BallBt];
            [vvvView addSubview:ballView];
        }
    }
}

//开奖显示按钮
- (void)ClickKJ:(UIButton *)btt
{
    btt.selected = !btt.selected;
    
        if (btt.selected)
        {
            [UIView animateWithDuration:0.5 animations:^{
                CGRect rect =  _KJBAllView.frame;
                rect.origin.y = rect.size.height+rect.origin.y;
                _KJBAllView.frame = rect;
            }];
        }
        else
        {
            [UIView animateWithDuration:0.5 animations:^{
                CGRect rect = _KJBAllView.frame;
                rect.origin.y = rect.origin.y-rect.size.height;
                _KJBAllView.frame = rect;
            }];
        }
}

//下拉菜单
- (void)PUllMenu:(UIButton *)bt
{
    UIWindow * window=[[[UIApplication sharedApplication] delegate] window];
    CGRect rect=[bt convertRect: bt.bounds toView:window];
    
    PullDownMenu *pullmenu = [[PullDownMenu alloc]initWithFrame:CGRectMake(rect.origin.x, rect.origin.y+rect.size.height, rect.size.width,30*5)];
    
    pullmenu.DatasArray = [CommonDatas GameKind];
    pullmenu.GameNamestring = bt.currentTitle;
    pullmenu.appearance.resultCallBack = ^(NSString * string)
    {
       [bt  setTitle:string forState:UIControlStateNormal];
    };
    
    [pullmenu show];
}


- (void)UpdataImageTextColor
{
   
NSArray *txtColor = [NSArray arrayWithObjects:GETCOLOR(@"wb"),GETCOLOR(@"wr"),GETCOLOR(@"yr"),GETCOLOR(@"wt1"),GETCOLOR(@"bw"), nil];
for (int i = 0; i<5; i++)
{
    UIButton *bt = (UIButton *)[self viewWithTag:100+i];
    [bt setBackgroundImage:[UIImage imageNamed:IMAGEFILE(@"LotteryBall%ld")] forState:UIControlStateNormal];
}
[self.LeftButton setBackgroundImage:[UIImage imageNamed:IMAGEFILE(@"LotteryRightIimage%ld")] forState:UIControlStateNormal];
[self.LeftButton setImage:[UIImage imageNamed:IMAGEFILE(@"TitleRightImage%ld")] forState:UIControlStateNormal];
    [self.LeftButton setTitleColor:txtColor[1] forState:UIControlStateNormal];
    
self.KJView.backgroundColor= txtColor[4];
self.KJRightlable.textColor =  txtColor[1];
    
NSMutableAttributedString *AttString1 = [[NSMutableAttributedString alloc]initWithString:@"第222222222期"];
NSRange ClolorRange1 = NSMakeRange(0,1);
NSRange Clolor2Range1 = NSMakeRange([[AttString1 string] rangeOfString:@"期"].location,1);
[AttString1 addAttribute:NSForegroundColorAttributeName value:txtColor[0] range:ClolorRange1];
[AttString1 addAttribute:NSForegroundColorAttributeName value:txtColor[0] range:Clolor2Range1];
[self.KJRightlable setAttributedText:AttString1];
    
}
@end
