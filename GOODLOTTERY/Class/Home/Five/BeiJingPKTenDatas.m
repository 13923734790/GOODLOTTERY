//
//  BeiJingPKTenDatas.m
//  GOODLOTTERY
//
//  Created by apple on 16/8/19.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "BeiJingPKTenDatas.h"
#import "XYCommonCell.h"
#import "DragonTigerCell.h"
#import "XYCommonModel.h"

@implementation BeiJingPKTenDatas
+(UITableViewCell *)shareGetCell:(NSString *)TitleString
{
    UITableViewCell *cell;
    
    XYCommonCell * XYcell = [[XYCommonCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    XYcell.ModelArray = [self ShareGetUIModel:TitleString];
    cell = XYcell;
    
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.backgroundColor = [UIColor clearColor];
    
    return cell;
}


//计算高度
+(CGFloat)ShareGetCellHeight:(NSString *)TitleString
{
    
    NSArray *array =  [self ShareGetUIModel:TitleString];
    CGFloat Ystart = 0.0;
    for (int i = 0; i<array.count; i++)
    {
        
        CGFloat XYheight = 0;
        XYCommonModel *XYModel = (XYCommonModel *)array[i];
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
        
        Ystart = Ystart +XYheight+XYModel.SpaceHeight;
    }
    
    
    return Ystart;
}


//界面不同数据
+(NSArray *)ShareGetUIModel:(NSString *)ChildString
{
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:5];
    
    if ([ChildString isEqualToString:@"整合"])
    {
        NSArray *titleArray = @[@"冠亚和值",@"冠军",@"亚军",@"第三名",@"第四名",@"第五名",@"第六名",@"第七名",@"第八名",@"第九名",@"第十名"];
        for (int i = 0; i<11; i++)
        {
            XYCommonModel *XYModel = [[XYCommonModel alloc]init];
            XYModel.TitleName = titleArray[i];
            
            XYModel.OneWidthFaceNub = 4;
            XYModel.OnehieghtOddwidth =0.5;
            XYModel.OneFaceArray = @[@"大",@"小",@"单",@"双"];
            if (i==1||i==2||i==3||i==4||i==5)
            {
                XYModel.TwoWidthFaceNub = 2;
                XYModel.TwohieghtOddwidth =0.25;
                XYModel.TwoFaceArray = @[@"1V10:龙",@"1V10:虎"];
            }
            [array addObject:XYModel];
            
        }
        
    }
    else if ([ChildString isEqualToString:@"第1-5名"])
    {
        
        NSArray *titleArray = @[@"冠亚和值",@"冠军",@"亚军",@"第三名",@"第四名",@"第五名"];
        for (int i = 0; i<6; i++)
        {
            XYCommonModel *XYModel = [[XYCommonModel alloc]init];
            XYModel.TitleName = titleArray[i];
            XYModel.SpaceHeight = 10*ScaleY;
            
            XYModel.WidthBallNub  = 5;
            XYModel.BallstartNub = 1;
            XYModel.IsThreeColorBall = NO;
            XYModel.BallNub = 10;
            
            XYModel.OneWidthFaceNub = 4;
            XYModel.OnehieghtOddwidth =0.5;
            XYModel.OneFaceArray = @[@"大",@"小",@"单",@"双"];
            
            XYModel.TwoWidthFaceNub = 2;
            XYModel.TwohieghtOddwidth =0.25;
            XYModel.TwoFaceArray = @[@"1V10:龙",@"1V10:虎"];
            [array addObject:XYModel];
        }
        

    }
    else if ([ChildString isEqualToString:@"第6-10名"])
    {
        NSArray *titleArray = @[@"第六名",@"第七名",@"第八名",@"第九名",@"第十名"];
        for (int i = 0; i<5; i++)
        {
            XYCommonModel *XYModel = [[XYCommonModel alloc]init];
            XYModel.TitleName = titleArray[i];
            XYModel.SpaceHeight = 10*ScaleY;
            
            XYModel.WidthBallNub  = 5;
            XYModel.BallstartNub = 1;
            XYModel.IsThreeColorBall = NO;
            XYModel.BallNub = 10;
            
            XYModel.OneWidthFaceNub = 4;
            XYModel.OnehieghtOddwidth =0.5;
            XYModel.OneFaceArray = @[@"大",@"小",@"单",@"双"];
            [array addObject:XYModel];
        }

    }
    else if ([ChildString isEqualToString:@"冠亚和值"])
    {
        XYCommonModel *XYModel = [[XYCommonModel alloc]init];
        XYModel.WidthBallNub  = 5;
        XYModel.BallstartNub = 3;
        XYModel.IsThreeColorBall = NO;
        XYModel.BallNub = 17;
        
        XYModel.TwoWidthFaceNub = 4;
        XYModel.TwohieghtOddwidth =0.5;
        XYModel.TwoFaceArray = @[@"大",@"小",@"单",@"双"];;
        [array addObject:XYModel];
    }
    else if ([ChildString isEqualToString:@"冠亚组合"])
    {
        NSMutableArray *OneArray = [NSMutableArray arrayWithCapacity:5];
        for (int i = 1; i<10; i++)
        {
            for (int j =i+1; j<11; j++)
            {
                NSString *string = [NSString stringWithFormat:@"%d-%d",i,j];
                NSLog(@"%@",string);
                [OneArray addObject:string];
            }
        }
        
        XYCommonModel *XYModel = [[XYCommonModel alloc]init];
        
        XYModel.OneWidthFaceNub = 4;
        XYModel.OnehieghtOddwidth =0.5;
        XYModel.OneFaceArray = OneArray;
        
        [array addObject:XYModel];
    }

    return array;
}
@end
