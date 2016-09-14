//
//  XYCommonView.m
//  GOODLOTTERY
//
//  Created by apple on 16/8/16.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "XYCommonView.h"
#import "LiuHeBallBt.h"
#import "TwoFaceBT.h"

@implementation XYCommonView
{
    UILabel *titleLable;
    UIView *ballView;
    UIView *TwoFaceView;
    UIView *OneFaceView;
    UIButton *TitleSubBt;
    
    NSMutableArray *seletedArray;
}

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        seletedArray = [[NSMutableArray alloc]initWithCapacity:3];
       [self setAllView];
    }
    return self;
}

-(void)setAllView
{
    titleLable = [[UILabel alloc]init];
    titleLable.frame = CGRectMake(0, 0,CGRectGetWidth(self.frame),0);
    titleLable.font = [UIFont systemFontOfSize:15*ScaleY];
    titleLable.textColor = [UIColor whiteColor];
    titleLable.textAlignment = NSTextAlignmentCenter;
    titleLable.backgroundColor = DTAISCOLORE(255, 255, 255, 0.3);
    [self addSubview:titleLable];
    
    
    ballView = [[UIView alloc]init];
    [self addSubview:ballView];
    
    OneFaceView = [[UIView alloc]init];
    [self addSubview:OneFaceView];
    
    TwoFaceView = [[UIView alloc]init];
    [self addSubview:TwoFaceView];

    
}

-(void)setTitleName:(NSString *)TitleName
{
    _TitleName  = TitleName;
    titleLable.text = _TitleName;
    titleLable.frame = CGRectMake(0, 0,CGRectGetWidth(self.frame), 30*ScaleY);
    OneFaceView.frame = CGRectMake(0,CGRectGetHeight(titleLable.frame), 0, 0);
    ballView.frame = CGRectMake(0, 30*ScaleY, 0, 0);
}

-(void)setBallNub:(NSInteger)BallNub
{
    _BallNub = BallNub;
    [self setBallView];
}
-(void)setSubTitleArray:(NSArray *)SubTitleArray
{
    _SubTitleArray = SubTitleArray;
    
    titleLable.userInteractionEnabled = YES;
    
    TitleSubBt = [UIButton buttonWithType:UIButtonTypeCustom];
    TitleSubBt.frame = CGRectMake(CGRectGetWidth(self.frame)-60*ScaleX,5*ScaleY,50*ScaleX,20*ScaleY);
    TitleSubBt.layer.cornerRadius = 2;
    TitleSubBt.layer.masksToBounds = YES;
    TitleSubBt.titleLabel.adjustsFontSizeToFitWidth = YES;
    TitleSubBt.titleLabel.font = [UIFont boldSystemFontOfSize:11*ScaleY];
    TitleSubBt.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    //标题框左边向左移动了10个位子然后 右边向左移动了15个位子
    TitleSubBt.titleEdgeInsets = UIEdgeInsetsMake(0,-10*ScaleX,0,10*ScaleX);
    
    
    UIImageView *smallImage = [[UIImageView alloc]init];
    smallImage.image = [UIImage imageNamed:@"TitleRightImage"];
    smallImage.frame = CGRectMake(35*ScaleX,(20*ScaleY-13*ScaleX)/2, 13*ScaleX, 13*ScaleX);
    [TitleSubBt addSubview:smallImage];
    
    [TitleSubBt setBackgroundImage:[CommonDatas createImageWithColor:DTAISCOLORE(255, 255, 255, 0.5)] forState:UIControlStateNormal];
    [TitleSubBt setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [TitleSubBt setTitle:_SubTitleArray[0] forState:UIControlStateNormal];
    
    [TitleSubBt addTarget:self action:@selector(ClickTitleSubBt:) forControlEvents:UIControlEventTouchUpInside];
    [titleLable addSubview:TitleSubBt];

}
-(void)setBallView
{
    
    CGFloat  ballwith = (UIScreenWIDTH-40*ScaleX)/7;
    CGFloat  BallSpaceWith =(CGRectGetWidth(self.frame) - (UIScreenWIDTH-40*ScaleX)/7*_WidthBallNub)/_WidthBallNub;
    
     NSInteger heightNub= _BallNub/_WidthBallNub;
    if (_BallNub%_WidthBallNub)
    {
       heightNub =heightNub+1;
    }
    
     ballView.frame = CGRectMake(0,OneFaceView.frame.origin.y+CGRectGetHeight(OneFaceView.frame), CGRectGetWidth(self.frame), 5*ScaleY+(ballwith+5*ScaleY)*heightNub);
    
    for (int i = 0; i<_BallNub; i++)
    {
        LiuHeBallBt * buttonball = [LiuHeBallBt buttonWithType:UIButtonTypeCustom];
        buttonball.frame = CGRectMake(BallSpaceWith/2+(ballwith+BallSpaceWith)*(i%_WidthBallNub), 5*ScaleY+(ballwith+5*ScaleY)*(i/_WidthBallNub), ballwith,ballwith);
        
        NSString *bigString = [NSString stringWithFormat:@"%ld",i+_BallstartNub];
        
        if (_IsThreeColorBall)
        {
            [buttonball setThreeBallTitle:bigString];//区分颜色
        }else
        {
            [buttonball setBallTitle:bigString];
        }
        
        [buttonball addTarget:self action:@selector(Clcikbuttonball:) forControlEvents:UIControlEventTouchUpInside];
        [ballView addSubview:buttonball];
    }

}
-(void)setOneFaceArray:(NSArray *)OneFaceArray
{
    _OneFaceArray = OneFaceArray;
    
    CGFloat  Facewith = (CGRectGetWidth(self.frame)-(_OneWidthFaceNub-1)*ScaleX)/_OneWidthFaceNub;
    CGFloat FaceHeight = Facewith*_OnehieghtOddwidth;
    
    NSInteger faceNub = _OneFaceArray.count;
    NSInteger FaceheightNub= faceNub/_OneWidthFaceNub;
    if (faceNub%_OneWidthFaceNub)
    {
        FaceheightNub =FaceheightNub+1;
    }
    OneFaceView.frame = CGRectMake(0,CGRectGetHeight(titleLable.frame),CGRectGetWidth(self.frame), 1*ScaleY+(FaceHeight+1*ScaleY)*FaceheightNub);
    
    ballView.frame = CGRectMake(0,OneFaceView.frame.origin.y+CGRectGetHeight(OneFaceView.frame), 0, 0);

    
    for (int i = 0; i<FaceheightNub*_OneWidthFaceNub; i++)
    {
        TwoFaceBT *faceBt = [TwoFaceBT buttonWithType:UIButtonTypeCustom];
        faceBt.frame = CGRectMake((Facewith+1*ScaleX)*(i%_OneWidthFaceNub),1*ScaleY+(FaceHeight+1*ScaleY)*(i/_OneWidthFaceNub), Facewith, FaceHeight);
        
        [faceBt setBackgroundImage:[hybridTool createImageWithColor:GETCOLOR(@"b0.3w")] forState:UIControlStateNormal];
        [faceBt setBackgroundImage:[hybridTool createImageWithColor:[UIColor blueColor]] forState:UIControlStateSelected];
        if (_OneFaceArray.count>i)
        {
            [faceBt.titleBT setTitle:_OneFaceArray[i] forState:UIControlStateNormal];
//            [faceBt.titleBT setImage:[UIImage imageNamed:@"OneDian"] forState:UIControlStateNormal];
            
        }
        [OneFaceView addSubview:faceBt];
        
        [faceBt addTarget:self action:@selector(ClickFaceBt:) forControlEvents:UIControlEventTouchUpInside];
    }
 
}

-(void)setTwoFaceArray:(NSArray *)TwoFaceArray
{
    
    _TwoFaceArray = TwoFaceArray;
    
    CGFloat  Facewith = (CGRectGetWidth(self.frame)-(_TwoWidthFaceNub-1)*ScaleX)/_TwoWidthFaceNub;
    CGFloat FaceHeight = Facewith*_TwohieghtOddwidth;
    
    NSInteger faceNub = _TwoFaceArray.count;
    NSInteger FaceheightNub= faceNub/_TwoWidthFaceNub;
    if (faceNub%_TwoWidthFaceNub)
    {
        FaceheightNub =FaceheightNub+1;
    }
    
    
    TwoFaceView.frame = CGRectMake(0,ballView.frame.origin.y+CGRectGetHeight(ballView.frame),CGRectGetWidth(self.frame), 1*ScaleY+(FaceHeight+1*ScaleY)*FaceheightNub);
    
    
    for (int i = 0; i<FaceheightNub*_TwoWidthFaceNub; i++)
    {
        TwoFaceBT *faceBt = [TwoFaceBT buttonWithType:UIButtonTypeCustom];
        faceBt.frame = CGRectMake((Facewith+1*ScaleX)*(i%_TwoWidthFaceNub),1*ScaleY+(FaceHeight+1*ScaleY)*(i/_TwoWidthFaceNub), Facewith, FaceHeight);
        
        
        [faceBt setBackgroundImage:[hybridTool createImageWithColor:GETCOLOR(@"b0.3w")] forState:UIControlStateNormal];
        [faceBt setBackgroundImage:[hybridTool createImageWithColor:[UIColor blueColor]] forState:UIControlStateSelected];
        if (_TwoFaceArray.count>i)
        {
            [faceBt.titleBT setTitle:_TwoFaceArray[i] forState:UIControlStateNormal];
        }
        else{
            faceBt.userInteractionEnabled = NO;
        }
        [TwoFaceView addSubview:faceBt];
        
        [faceBt addTarget:self action:@selector(ClickFaceBt:) forControlEvents:UIControlEventTouchUpInside];
    }

}



-(void)ClickFaceBt:(TwoFaceBT *)Bt
{
    Bt.selected = !Bt.selected;
    
    [self CurrentSeletedObjc];
}

-(void)Clcikbuttonball:(LiuHeBallBt *)Bt
{
    Bt.selected = !Bt.selected;
    Bt.titleBT.selected = !Bt.titleBT.selected;
    Bt.OddBT.selected = !Bt.OddBT.selected;
     [self CurrentSeletedObjc];
}


-(void)ClickTitleSubBt:(UIButton *)bt
{
    
    UIWindow * window=[[[UIApplication sharedApplication] delegate] window];
    CGRect rect=[bt convertRect: bt.bounds toView:window];
    
    NSInteger cellNub;
    if (_SubTitleArray.count<5)
    {
        cellNub = _SubTitleArray.count;
    }
    else{
        cellNub = 5;
    }
    
    PullDownMenu *pullmenu = [[PullDownMenu alloc]initWithFrame:CGRectMake(rect.origin.x, rect.origin.y+rect.size.height, rect.size.width,30*cellNub)];
    pullmenu.DatasArray = _SubTitleArray;
    pullmenu.GameNamestring = bt.currentTitle;
    
    __weak XYCommonView *BlockSelf = self;
    pullmenu.appearance.resultCallBack = ^(NSString * string)
    {
      [bt  setTitle:string forState:UIControlStateNormal];
        [BlockSelf CurrentSeletedObjc];
    };
    [pullmenu show];
    
}

//当前选中的项目
-(void)CurrentSeletedObjc
{
    
    [seletedArray  removeAllObjects];
    
    if (CGRectGetHeight(OneFaceView.frame))
    {
       
      NSMutableArray * seletedOneArray = [NSMutableArray arrayWithCapacity:5];
        
        
        NSArray *arrayOne = [OneFaceView subviews];
        for (TwoFaceBT *Bt in arrayOne)
        {
            if (Bt.selected)
            {
                NSString *ttt;
                if (_SubTitleArray)
                {
                    ttt = [NSString stringWithFormat:@"%@:%@",TitleSubBt.currentTitle,Bt.titleBT.currentTitle];
                }
                else if (_TitleName)
                {
                    ttt = [NSString stringWithFormat:@"%@:%@",_TitleName,Bt.titleBT.currentTitle];
                }
                else{
                    ttt = [NSString stringWithFormat:@"%@",Bt.titleBT.currentTitle];
                }
                [seletedOneArray addObject:ttt];
            }
        }
        
        [seletedArray addObject:seletedOneArray];
    }
    if (CGRectGetHeight(ballView.frame))
    {
        
        NSMutableArray * seletedBallArray = [NSMutableArray arrayWithCapacity:5];
        
        
       NSArray *arrayBall = [ballView subviews];
        for (LiuHeBallBt *Bt in arrayBall)
        {
            if (Bt.selected)
            {
                NSString *ttt;
                if (_SubTitleArray)
                {
                    ttt = [NSString stringWithFormat:@"%@:%@",TitleSubBt.currentTitle,Bt.titleBT.currentTitle];
                }
                else if (_TitleName)
                {
                    ttt = [NSString stringWithFormat:@"%@:%@",_TitleName,Bt.titleBT.currentTitle];
                }
                else{
                    ttt = [NSString stringWithFormat:@"%@",Bt.titleBT.currentTitle];
                }
                [seletedBallArray addObject:ttt];
            }
        }

        [seletedArray addObject:seletedBallArray];
    }
    if (CGRectGetHeight(TwoFaceView.frame))
    {
       
        
        NSMutableArray * seletedTwoArray = [NSMutableArray arrayWithCapacity:5];
        
        NSArray *arrayTwo = [TwoFaceView subviews];
        for (TwoFaceBT *Bt in arrayTwo)
        {
            if (Bt.selected)
            {
                NSString *ttt;
                if (_SubTitleArray)
                {
                    ttt = [NSString stringWithFormat:@"%@:%@",TitleSubBt.currentTitle,Bt.titleBT.currentTitle];
                }
                else if (_TitleName)
                {
                    ttt = [NSString stringWithFormat:@"%@:%@",_TitleName,Bt.titleBT.currentTitle];
                }
                else{
                    ttt = [NSString stringWithFormat:@"%@",Bt.titleBT.currentTitle];
                }
                [seletedTwoArray addObject:ttt];
            }
        }
         [seletedArray addObject:seletedTwoArray];
    }
    
    
    
    if (_BlcokSeletedArray)
    {
        _BlcokSeletedArray(seletedArray);
    }
    
}
@end
