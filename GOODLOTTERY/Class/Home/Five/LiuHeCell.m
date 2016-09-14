//
//  LiuHeCell.m
//  GOODLOTTERY
//
//  Created by apple on 16/7/26.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "LiuHeCell.h"
#import "LiuHeBallBt.h"
#import "LiuHeFastTool.h"

@implementation LiuHeCell
{
    UIButton *ButtonSelected;
    UIButton *OOptionButtonSelected;
    NSInteger maxtag;
    NSInteger mintag;
    
    
    NSArray *datas;
    NSArray *data1s;
    NSArray *data2s;
    NSArray *data3s;
    NSArray *data4s;
    NSArray *allDatas;
    UIView *TitleView;
    UIView *ballVIew;
    
    
    
    NSArray *ColorArry;
    UIView *buttonview;
    UIButton *titlebutton;
    NSMutableArray *buttonArry;
    UIButton *buttonSmall;
    
    NSMutableDictionary *BtDic;
}

-(void)reloadDatas
{
    datas = [NSArray arrayWithObjects:@"两面",@"波色",@"头尾",@"生肖", nil];
    data1s = [NSArray arrayWithObjects:@"单",@"双",@"大",@"小",@"合单",@"合双",@"家禽",@"野兽",@"尾大",@"尾小",@"合尾大",@"合尾小", nil];
    data2s = [NSArray arrayWithObjects:@"红",@"蓝",@"绿",@"红单",@"红双",@"红大",@"红小",@"蓝单",@"蓝双",@"蓝大",@"蓝小",@"绿单",@"绿双",@"绿大",@"绿小",nil];
    data3s = [NSArray arrayWithObjects:@"0头",@"1头",@"2头",@"3头",@"4头",@"0尾",@"1尾",@"2尾",@"3尾",@"4尾",@"5尾",@"6尾",@"7尾",@"8尾",@"9尾",nil];
    data4s = [NSArray arrayWithObjects:@"鼠",@"牛",@"虎",@"兔",@"龙",@"蛇",@"马",@"羊",@"猴",@"鸡",@"狗",@"猪", nil];
    allDatas = [NSArray arrayWithObjects:data1s,data2s,data3s,data4s, nil];
    
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        [self reloadDatas];
        [self setAllview];
        [self initBallView];
        
        BtDic = [NSMutableDictionary dictionaryWithCapacity:5];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(ChangeOdd:) name:@"ChangeOdd" object:nil];

    }
    return self;
}
#pragma mark - 赋值

-(void)setIsFastHidden:(BOOL)isFastHidden
{
    _isFastHidden = isFastHidden;
    if (_isFastHidden)
    {
        TitleView.hidden = YES;
        TitleView.frame = CGRectMake(0, 0, 0, 0);
    }
    else
    {   TitleView.hidden = NO;
        TitleView.frame = CGRectMake(0, 0,UIScreenWIDTH,80*ScaleY);
    }
    ballVIew.frame = CGRectMake(0,CGRectGetHeight(TitleView.frame), UIScreenWIDTH, UIScreenWIDTH-40*ScaleX+40*ScaleY);
}


#pragma mark - initView
-(void)setAllview
{
    TitleView = [[UIView alloc]init];
    [self.contentView addSubview:TitleView];
    
    for (int i = 0; i<4; i++)
    {
      UIButton * _TitleButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _TitleButton.frame = CGRectMake(10*ScaleX+((UIScreenWIDTH-35*ScaleX)/4+5*ScaleX)*i,0, (UIScreenWIDTH-35*ScaleX)/4,25*ScaleY);
        _TitleButton.tag = 100+i;
        _TitleButton.titleLabel.font = [UIFont systemFontOfSize:15*ScaleY];
        [_TitleButton setTitle:datas[i] forState:UIControlStateNormal];
        [_TitleButton setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
        [_TitleButton addTarget:self action:@selector(btOne:) forControlEvents:UIControlEventTouchUpInside];
        
        if (i ==  0)
        {
            _TitleButton.selected = YES;
            maxtag = i;
            ButtonSelected = _TitleButton;
        }
        
        [_TitleButton setBackgroundImage:[CommonDatas createImageWithColor:DTAISCOLORE(255, 255, 255, 0.5)] forState:UIControlStateSelected];
        [_TitleButton setBackgroundImage:[CommonDatas createImageWithColor:DTAISCOLORE(0, 0, 0, 0.5)] forState:UIControlStateNormal];
        [TitleView addSubview:_TitleButton];
        
    }
    
    for (int j = 0; j<4; j++)
    {
        if (j==2||j==1)
        {
            UIView *xView = [[UIView alloc]initWithFrame:CGRectMake(5*ScaleX, 25*ScaleY,UIScreenWIDTH-10*ScaleX,80*ScaleY)];
            xView.tag = 200+j;
            xView.hidden = YES;
            xView.backgroundColor = [UIColor colorWithPatternImage:[CommonDatas createImageWithColor:DTAISCOLORE(255, 255, 255, 0.5)]];
            [TitleView addSubview:xView];
            
            for (int i = 0; i<15; i++)
            {
              UIButton *  _OptionButton = [UIButton buttonWithType:UIButtonTypeCustom];
                _OptionButton.frame = CGRectMake(5*ScaleX+((UIScreenWIDTH-45*ScaleX)/6+5*ScaleX)*(i%6),5*ScaleY+(60*ScaleY/3+5*ScaleY)*(i/6), (UIScreenWIDTH-45*ScaleX)/6,60*ScaleY/3);
                _OptionButton.tag = 300+i;

                [_OptionButton setTitle:allDatas[j][i] forState:UIControlStateNormal];
                [_OptionButton addTarget:self action:@selector(btTwo:) forControlEvents:UIControlEventTouchUpInside];
                _OptionButton.titleLabel.font = [UIFont systemFontOfSize:13*ScaleY];
                [_OptionButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
                [_OptionButton setBackgroundImage:[CommonDatas createImageWithColor:DTAISCOLORE(100, 55,55, 1)] forState:UIControlStateNormal];
                [_OptionButton setBackgroundImage:[CommonDatas createImageWithColor:DTAISCOLORE(120, 200,111, 1)] forState:UIControlStateSelected];
                [xView addSubview:_OptionButton];
                
            }
        }
        else
        {
            UIView *xView = [[UIView alloc]initWithFrame:CGRectMake(5*ScaleX, 25*ScaleY,UIScreenWIDTH-10*ScaleX,55*ScaleY)];
            xView.tag = 200+j;
            xView.hidden = YES;
            xView.backgroundColor = [UIColor colorWithPatternImage:[CommonDatas createImageWithColor:DTAISCOLORE(255, 255, 255, 0.5)]];
            [TitleView addSubview:xView];
            
            if (j==0)
            {
                xView.hidden = NO;
                TitleView.frame = CGRectMake(0, 0, UIScreenWIDTH,25*ScaleY+xView.frame.size.height);
            }
            for (int i = 0; i<12; i++)
            {
             UIButton *  _OptionButton = [UIButton buttonWithType:UIButtonTypeCustom];
                _OptionButton.frame = CGRectMake(5*ScaleX+((UIScreenWIDTH-45*ScaleX)/6+5)*(i%6), 5*ScaleY+(40*ScaleY/2+5*ScaleY)*(i/6), (UIScreenWIDTH-45*ScaleX)/6,40*ScaleY/2);
                _OptionButton.tag = 300+i;
                
                [_OptionButton setTitle:allDatas[j][i] forState:UIControlStateNormal];
                [_OptionButton addTarget:self action:@selector(btTwo:) forControlEvents:UIControlEventTouchUpInside];
                _OptionButton.titleLabel.font = [UIFont systemFontOfSize:13*ScaleY];
                [_OptionButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
                
                [_OptionButton setBackgroundImage:[CommonDatas createImageWithColor:DTAISCOLORE(100, 55,55, 1)] forState:UIControlStateNormal];
                [_OptionButton setBackgroundImage:[CommonDatas createImageWithColor:DTAISCOLORE(120, 200,111, 1)] forState:UIControlStateSelected];
                [xView addSubview:_OptionButton];
                
            }
        }
    }
    
}

- (void)initBallView
{
    
    ballVIew = [[UIView alloc]init];
    ballVIew.frame = CGRectMake(0, CGRectGetHeight(TitleView.frame), UIScreenWIDTH, UIScreenWIDTH-40*ScaleX+40*ScaleY);
    [self.contentView addSubview:ballVIew];
    buttonArry = [NSMutableArray arrayWithCapacity:5];
    for (int i = 0; i<49; i++)
    {
        
        LiuHeBallBt * _buttonThree = [LiuHeBallBt buttonWithType:UIButtonTypeCustom];
        _buttonThree.frame = CGRectMake(5*ScaleX+((UIScreenWIDTH-40*ScaleX)/7+5*ScaleX)*(i%7), 5*ScaleY+((UIScreenWIDTH-40*ScaleX)/7+5*ScaleY)*(i/7), (UIScreenWIDTH-40*ScaleX)/7,(UIScreenWIDTH-40*ScaleX)/7);
        NSString *bigString = [NSString stringWithFormat:@"%d",i+1];
        [_buttonThree setThreeBallTitle:bigString];//区分颜色
        
        [_buttonThree addTarget:self action:@selector(Obtain:) forControlEvents:UIControlEventTouchUpInside];
        [ballVIew addSubview:_buttonThree];
        
        //储存49个Button
        [buttonArry addObject:_buttonThree];
    }
    
}


#pragma mark - 自定义方法
//清除所有选中的Ball
- (void)removeallbutton
{
    for (LiuHeBallBt *bt in buttonArry)
    {
        bt.selected = NO;
        bt.titleBT.selected = NO;
        bt.OddBT.selected = NO;
    }
}

//设置赔率
-(void)setOddstring:(NSString *)Odd
{
    for ( LiuHeBallBt *button in buttonArry)
    {
        [button.OddBT setTitle:Odd forState:UIControlStateNormal];
    }
}

//获取赔率变动的监听
-(void)ChangeOdd:(NSNotification *)notidic
{
    NSDictionary *dic = notidic.userInfo;
    [self setOddstring:dic[@"Odd"]];
    
}
-(void)dealloc{
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
#pragma mark - 按钮方法
- (void)Obtain:(LiuHeBallBt *)butt
{
    butt.selected = !butt.selected;
    butt.titleBT.selected = !butt.titleBT.selected;
    butt.OddBT.selected = !butt.OddBT.selected;
    
    
    if (butt.selected)
    {
        [BtDic setObject:butt.OddBT.currentTitle forKey:butt.titleBT.currentTitle];
        
        if (_MissNub!=0)
        {
            NSLog(@"%ld---%ld",_MissNub,BtDic.count);
            if (_MissNub==BtDic.count)
            {
                for (LiuHeBallBt *bt in buttonArry)
                {
                    BOOL isFound = NO;
                    if ([BtDic objectForKey:bt.titleBT.currentTitle])
                    {
                        isFound = YES;
                        NSLog(@"111111");
                    }
                    if (isFound)
                    {
                        continue;
                    }
                    else
                    {
                        bt.userInteractionEnabled = NO;
                    }
                }
                
            }

        }else{
            
        }


    }else
    {
        if (_MissNub!=0)
        {
            if (_MissNub==BtDic.count)
            {
                for (LiuHeBallBt *bt in buttonArry)
                {
                    BOOL isFound = NO;
                    if ([BtDic objectForKey:bt.titleBT.currentTitle])
                    {
                        isFound = YES;
                    }
                    if (isFound)
                    {
                        continue;
                    }
                    else
                    {
                        bt.userInteractionEnabled = YES;
                    }
                }
                
            }
            
        }else
        {
            
        }

        [BtDic removeObjectForKey:butt.titleBT.currentTitle];
    }
    
    NSLog(@"%@",BtDic);
    
}


- (void)btOne:(UIButton *)btone
{
    if (ButtonSelected ==btone)
    {
    }
    else
    {
        btone.selected = YES;
        ButtonSelected.selected = NO;
        {// 界面的伸缩
        UIView *currentView = (UIView *)[self viewWithTag:btone.tag+100];
        UIView *lastView =  (UIView *)[self viewWithTag:ButtonSelected.tag+100];
        
        TitleView.frame = CGRectMake(0, 0, UIScreenWIDTH,25*ScaleY+CGRectGetHeight(currentView.frame));
        ballVIew.frame = CGRectMake(0, CGRectGetHeight(TitleView.frame), UIScreenWIDTH, UIScreenWIDTH-40*ScaleX+40*ScaleY);
        currentView.hidden = NO;
        lastView.hidden = YES;
        }
        ButtonSelected = btone;
    }
      maxtag = btone.tag-100;
}

- (void)btTwo:(UIButton *)bttwo
{
    
    [self removeallbutton];//清楚选中状态
    if (OOptionButtonSelected==nil)
    {
        OOptionButtonSelected = bttwo;
        bttwo.selected=YES;
        mintag = bttwo.tag-300+1;
    }
    else if(OOptionButtonSelected==bttwo)
    {
        bttwo.selected=!bttwo.selected;
        mintag = 0;
        OOptionButtonSelected = nil;
    }
    else if (OOptionButtonSelected!=bttwo)
    {
        OOptionButtonSelected.selected = NO;
        bttwo.selected = YES;
        mintag = bttwo.tag-300+1;
        OOptionButtonSelected = bttwo;
    }
    
    //快速选中
    [self FastCombinationMax];
}

//快捷按钮的回调函数
- (void)FastCombinationMax
{
    
    if (mintag!=0)
    {
//        
        switch (maxtag+1)
        {
            case 1:
            {
                
                [LiuHeFastTool OneGanme:buttonArry andMin:mintag];
            }
                break;
            case 2:
            {
                [LiuHeFastTool TwoGanme:buttonArry andMin:mintag];
            }
                break;
            case 3:
            {
                [LiuHeFastTool ThreeGanme:buttonArry andMin:mintag];
            }
                break;
            case 4:
            {
                NSLog(@"4");
            }
                break;
            default:
                break;
        }
//        
    }
    
}


@end
