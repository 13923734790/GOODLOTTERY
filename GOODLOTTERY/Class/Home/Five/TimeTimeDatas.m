//
//  TimeTimeDatas.m
//  GOODLOTTERY
//
//  Created by apple on 16/8/19.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "TimeTimeDatas.h"
#import "XYCommonCell.h"
#import "DragonTigerCell.h"
#import "XYCommonModel.h"

@implementation TimeTimeDatas

+(UITableViewCell *)shareGetCell:(NSString *)TitleString AndChildTitle:(NSString *)ChildString
{
    UITableViewCell *cell;
    if ([ChildString isEqualToString:@"龙虎斗"])
    {
        DragonTigerCell *Dragoncell= [[DragonTigerCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
        Dragoncell.DragonTigerStyle = DragonTigerThree;
        Dragoncell.NubCount = 10;
        [Dragoncell setAllBt];
        cell = Dragoncell;
    }
    else
    {
        XYCommonCell * XYcell = [[XYCommonCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
        XYcell.ModelArray = [self ShareGetUIModel:TitleString AndChildTitle:ChildString];
        cell = XYcell;
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.backgroundColor = [UIColor clearColor];
    
    return cell;
}


//计算高度
+(CGFloat)ShareGetCellHeight:(NSString *)TitleString AndChildTitle:(NSString *)ChildString
{
    
    if ([ChildString isEqualToString:@"龙虎斗"])
    {
        return 5*ScaleY+((UIScreenWIDTH-15*ScaleX)/4+5*ScaleY)*5;
    }
    
    NSArray *array =  [self ShareGetUIModel:TitleString AndChildTitle:ChildString];
    
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
        
        Ystart = Ystart +XYheight+XYModel.SpaceHeight;
    }
    
    return Ystart;
}


//界面不同数据
+(NSArray *)ShareGetUIModel:(NSString *)TitleString AndChildTitle:(NSString *)ChildString
{
    
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:5];
    
    if ([ChildString isEqualToString:@"整合"])
    {
        NSArray *titleArray = @[@"第一球",@"第二球",@"第三球",@"第四球",@"第五球",@"总合",@"特殊玩法"];
        for (int i = 0; i<7; i++)
        {
            XYCommonModel *XYModel = [[XYCommonModel alloc]init];
            XYModel.TitleName = titleArray[i];
            XYModel.SpaceHeight = 10*ScaleY;
            if (i==5)
            {
                XYModel.TwoWidthFaceNub = 4;
                XYModel.TwohieghtOddwidth =0.5;
                XYModel.TwoFaceArray = @[@"总大",@"总小",@"总单",@"总双"];
            }
            else if (i==6)
            {
                XYModel.SubTitleArray = @[@"前三",@"中三",@"后三"];
                
                XYModel.TwoWidthFaceNub = 5;
                XYModel.TwohieghtOddwidth =0.5;
                XYModel.TwoFaceArray = @[@"豹子",@"顺子",@"对子",@"杂六",@"半顺"];
            }
            else
            {
                XYModel.WidthBallNub  = 5;
                XYModel.BallstartNub = 0;
                XYModel.IsThreeColorBall = NO;
                XYModel.BallNub = 10;

                XYModel.TwoWidthFaceNub = 4;
                XYModel.TwohieghtOddwidth =0.5;
                XYModel.TwoFaceArray = @[@"单",@"双",@"大",@"小"];

            }
            [array addObject:XYModel];
            
        }
    }
    else if ([ChildString isEqualToString:@"龙虎斗"])
    {
        
    }
    else if ([ChildString isEqualToString:@"全5中1"])
    {
        XYCommonModel *XYModel = [[XYCommonModel alloc]init];
        XYModel.WidthBallNub  = 5;
        XYModel.BallstartNub = 0;
        XYModel.IsThreeColorBall = NO;
        XYModel.BallNub = 10;
        [array addObject:XYModel];
    }
    
    return array;
}
@end
