//
//  XYCommonCell.m
//  GOODLOTTERY
//
//  Created by apple on 16/8/16.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "XYCommonCell.h"
#import "XYCommonView.h"
#import "XYCommonModel.h"

@implementation XYCommonCell

-(void)setModelArray:(NSArray *)ModelArray
{
    _ModelArray = ModelArray;
    _SelectedArray = [NSMutableArray arrayWithCapacity:5];
    
    CGFloat Ystart = 0;
    
    for (int i = 0; i<_ModelArray.count; i++)
    {
        NSArray *ObjArray = [NSArray array];
        [_SelectedArray addObject:ObjArray];
        
        XYCommonView *XYview = [[XYCommonView alloc]init];
        XYview.BlcokSeletedArray = ^(NSArray *CurrentSeletedArray)
        {
            _SelectedArray[i] = CurrentSeletedArray;
        };
        
        [self.contentView addSubview:XYview];
        
        
        CGFloat XYheight = 0;
        XYCommonModel *XYModel = (XYCommonModel *)_ModelArray[i];
        if (XYModel.TitleName)
        {
            XYheight = 30*ScaleY;
        }
        if (XYModel.OneFaceArray)
        {
            //计算两面高度
            CGFloat  Facewith = ((UIScreenWIDTH-10*ScaleX)-(XYModel.OneWidthFaceNub-1)*ScaleX)/XYModel.OneWidthFaceNub;
            CGFloat FaceHeight = Facewith*XYModel.OnehieghtOddwidth;
            
            NSInteger faceNub = XYModel.OneFaceArray.count;
            NSInteger FaceheightNub= faceNub/XYModel.OneWidthFaceNub;
            if (faceNub%XYModel.OneWidthFaceNub)
            {
                FaceheightNub =FaceheightNub+1;
            }
            XYheight = XYheight +1*ScaleY+(FaceHeight+1*ScaleY)*FaceheightNub;
        }
        if (XYModel.BallNub)
        {
            //计算球所站的高度
            CGFloat  ballwith = (UIScreenWIDTH-40*ScaleX)/7;
            NSInteger heightNub= XYModel.BallNub/XYModel.WidthBallNub;
            if (XYModel.BallNub%XYModel.WidthBallNub)
            {
                heightNub =heightNub+1;
            }
            XYheight = XYheight +5*ScaleY+(ballwith+5*ScaleY)*heightNub;
            
        }
        if (XYModel.TwoFaceArray)
        {
            //计算两面高度
            CGFloat  Facewith = ((UIScreenWIDTH-10*ScaleX)-(XYModel.TwoWidthFaceNub-1)*ScaleX)/XYModel.TwoWidthFaceNub;
            CGFloat FaceHeight = Facewith*XYModel.TwohieghtOddwidth;
            
            NSInteger faceNub = XYModel.TwoFaceArray.count;
            NSInteger FaceheightNub= faceNub/XYModel.TwoWidthFaceNub;
            if (faceNub%XYModel.TwoWidthFaceNub)
            {
                FaceheightNub =FaceheightNub+1;
            }
            XYheight = XYheight +1*ScaleY+(FaceHeight+1*ScaleY)*FaceheightNub;
        }
        
        XYview.frame = CGRectMake(5*ScaleX, Ystart, UIScreenWIDTH-10*ScaleX, XYheight);
        
        Ystart = Ystart +XYheight+XYModel.SpaceHeight;
        
        
        if (XYModel.TitleName)
        {
            XYview.TitleName = XYModel.TitleName;
        }
        if (XYModel.SubTitleArray)
        {
            XYview.SubTitleArray = XYModel.SubTitleArray;
        }
        if (XYModel.OneFaceArray)
        {
            XYview.OneWidthFaceNub = XYModel.OneWidthFaceNub;
            XYview.OnehieghtOddwidth = XYModel.OnehieghtOddwidth;
            XYview.OneFaceArray = XYModel.OneFaceArray;
        }
        if (XYModel.BallNub)
        {
            XYview.WidthBallNub = XYModel.WidthBallNub;
            XYview.BallstartNub = XYModel.BallstartNub;
            XYview.IsThreeColorBall = XYModel.IsThreeColorBall;
            XYview.BallNub = XYModel.BallNub;//这里数据全部加载完创建Ball
        }
        if (XYModel.TwoFaceArray)
        {
            XYview.TwoWidthFaceNub = XYModel.TwoWidthFaceNub;
            XYview.TwohieghtOddwidth = XYModel.TwohieghtOddwidth;
            XYview.TwoFaceArray = XYModel.TwoFaceArray;
        }
        

    }
    
}

@end
