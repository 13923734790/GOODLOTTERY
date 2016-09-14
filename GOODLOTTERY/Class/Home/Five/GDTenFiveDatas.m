//
//  GDTenFiveDatas.m
//  GOODLOTTERY
//
//  Created by apple on 16/8/16.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "GDTenFiveDatas.h"

#import "XYCommonCell.h"
#import "DragonTigerCell.h"
#import "XYCommonModel.h"

@implementation GDTenFiveDatas
+(UITableViewCell *)shareGetCell:(NSString *)TitleString
{
    UITableViewCell *cell;
    if ([TitleString isEqualToString:@"龙虎斗"])
    {
        DragonTigerCell *Dragoncell= [[DragonTigerCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
        Dragoncell.DragonTigerStyle = DragonTigerTwo;
        Dragoncell.NubCount = 10;
        [Dragoncell setAllBt];
        cell = Dragoncell;
    }
    else
    {
        XYCommonCell * XYcell = [[XYCommonCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
        XYcell.ModelArray = [self ShareGetUIModel:TitleString];
        cell = XYcell;
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.backgroundColor = [UIColor clearColor];
    
    return cell;
}


//计算高度
+(CGFloat)ShareGetCellHeight:(NSString *)TitleString
{
    
    if ([TitleString isEqualToString:@"龙虎斗"])
    {
        return 5*ScaleY+((UIScreenWIDTH-15*ScaleX)/4+5*ScaleY)*5;
    }
    
    
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
        
        Ystart = Ystart +XYheight;
    }
    
    
    return Ystart;
}


//界面不同数据
+(NSArray *)ShareGetUIModel:(NSString *)ChildString
{
    
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:5];
    
    if ([ChildString isEqualToString:@"两面盘"])
    {
        NSArray *titleArray = @[@"特码",@"正码一",@"正码二",@"正码三",@"正码四",@"总和",];
        for (int i = 0; i<6; i++)
        {
            XYCommonModel *XYModel = [[XYCommonModel alloc]init];
            XYModel.TitleName = titleArray[i];
            XYModel.TwoWidthFaceNub = 4;
            XYModel.TwohieghtOddwidth =0.5;
            if (i==0)
            {
                XYModel.TwoFaceArray = @[@"特单",@"特双",@"特大",@"特小"];
            }
            else if (i==5)
            {
                XYModel.TwoFaceArray = @[@"总单",@"总双",@"总大",@"总小",@"总尾大",@"总尾小"];
            }
            else
            {XYModel.TwoFaceArray = @[@"单",@"双",@"大",@"小"];
            }
            [array addObject:XYModel];
            
        }

    }
    else if ([ChildString isEqualToString:@"特码"]||[ChildString isEqualToString:@"正码一"]||[ChildString isEqualToString:@"正码二"]||[ChildString isEqualToString:@"正码三"]||[ChildString isEqualToString:@"正码四"])
    {
        
        XYCommonModel *XYModel = [[XYCommonModel alloc]init];
        
        XYModel.WidthBallNub  = 5;
        XYModel.BallstartNub = 1;
        XYModel.IsThreeColorBall = NO;
        XYModel.BallNub = 11;
        
        XYModel.TwoWidthFaceNub = 4;
        XYModel.TwohieghtOddwidth =0.5;
        XYModel.TwoFaceArray = @[@"上",@"和",@"下",@"特大",@"奇",@"和",@"偶",@"特小",@"总大",@"总单",@"总尾大",@"特单",@"总小",@"总双",@"总尾小",@"总双"];
        [array addObject:XYModel];

    }
    else if ([ChildString isEqualToString:@"龙虎斗"])
    {
        
    }
    else if ([ChildString isEqualToString:@"全5中1"])
    {
        XYCommonModel *XYModel = [[XYCommonModel alloc]init];
        XYModel.WidthBallNub  = 5;
        XYModel.BallstartNub = 1;
        XYModel.IsThreeColorBall = NO;
        XYModel.BallNub = 11;
        [array addObject:XYModel];
    }

    
    return array;
}

@end
