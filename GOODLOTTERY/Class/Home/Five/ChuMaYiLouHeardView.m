//
//  ChuMaYiLouHeardView.m
//  GOODLOTTERY
//
//  Created by apple on 16/8/31.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "ChuMaYiLouHeardView.h"

@implementation ChuMaYiLouHeardView
{  UILabel *LeftLable;
    UIButton *RightBut;
}

-(instancetype)init
{
    self = [super init];
    if (self)
    {
        [self setAllView];
    }
    return self;
}
-(void)setAllView
{
    self.backgroundColor = [UIColor orangeColor];
    LeftLable = [[UILabel alloc]init];
    LeftLable.textColor = [UIColor whiteColor];
    LeftLable.font = [UIFont systemFontOfSize:13*ScaleY];
    [self addSubview:LeftLable];
    
    RightBut = [UIButton buttonWithType:UIButtonTypeCustom];
    RightBut.layer.cornerRadius = 2;
    RightBut.layer.masksToBounds = YES;
    RightBut.titleLabel.adjustsFontSizeToFitWidth = YES;
    RightBut.titleLabel.font = [UIFont boldSystemFontOfSize:11*ScaleY];
    RightBut.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    //标题框左边向左移动了10个位子然后 右边向左移动了15个位子
    RightBut.titleEdgeInsets = UIEdgeInsetsMake(0,-10*ScaleX,0,10*ScaleX);
    
    
    UIImageView *smallImage2 = [[UIImageView alloc]init];
    smallImage2.image = [UIImage imageNamed:@"TitleRightImage"];
    smallImage2.frame = CGRectMake(45*ScaleX+3.5*ScaleX,(20*ScaleY-13*ScaleX)/2, 13*ScaleX, 13*ScaleX);
    [RightBut addSubview:smallImage2];
    //图标框左边向右移动了55个位子然后 右边向右移动了50个位子
    //    _pullLeftBt.imageEdgeInsets = UIEdgeInsetsMake(0,80*ScaleX-20,0,-(80*ScaleX-30));
    [RightBut setBackgroundImage:[CommonDatas createImageWithColor:DTAISCOLORE(255, 255, 255, 0.3)] forState:UIControlStateNormal];
    [RightBut setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [RightBut addTarget:self action:@selector(ClickRightBut:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:RightBut];

}

-(void)setLeftString:(NSString *)leftString
{
    _leftString = leftString;
    LeftLable.text = _leftString;
}
-(void)setRightArray:(NSArray *)rightArray
{
    _rightArray = rightArray;
    [RightBut  setTitle:_rightArray[0] forState:UIControlStateNormal];
}
-(void)layoutSubviews
{
    LeftLable.frame = CGRectMake(5*ScaleX,0,50*ScaleX,self.frame.size.height);
    RightBut.frame = CGRectMake(CGRectGetWidth(self.frame)-75*ScaleX,(self.frame.size.height-20*ScaleY)/2, 65*ScaleX,20*ScaleY);
}
-(void)ClickRightBut:(UIButton *)Bt
{
    UIWindow * window=[[[UIApplication sharedApplication] delegate] window];
    CGRect rect=[Bt convertRect: Bt.bounds toView:window];
    
    NSInteger cellNub;
    if (_rightArray.count<5)
    {
        cellNub = _rightArray.count;
    }
    else{
        cellNub = 5;
    }

    PullDownMenu *pullmenu = [[PullDownMenu alloc]initWithFrame:CGRectMake(rect.origin.x, rect.origin.y+rect.size.height, rect.size.width,30*cellNub)];
    pullmenu.DatasArray = _rightArray;
    pullmenu.GameNamestring = Bt.currentTitle;
    pullmenu.appearance.resultCallBack = ^(NSString * string)
    {
        [Bt  setTitle:string forState:UIControlStateNormal];
                if (_BlockUpdatas)
                {
                  _BlockUpdatas(string);
                }
    };
    [pullmenu show];
    
}
@end
