//
//  GFTenToFiveDatas.m
//  GOODLOTTERY
//
//  Created by apple on 16/9/8.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "GFTenToFiveDatas.h"
#import "GFCommonCell.h"
#import "GFCommonThreeCell.h"
#import "GFThreeModel.h"
#import "GFBallModel.h"

@implementation GFTenToFiveDatas

+(UITableViewCell *)shareGetCell:(NSDictionary *)ChildDic
{
    NSString *leftString = ChildDic[@"leftstring"];
    UITableViewCell *Currentcell;
    if ([leftString isEqualToString:@"趣味型"])
    {
        GFCommonThreeCell *GFThreeCell = [[GFCommonThreeCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
        GFThreeCell.objArray = [self ShareGetUIModel:ChildDic];
        
        Currentcell =GFThreeCell;
    }
    else
    {
        GFCommonCell *GFCell = [[GFCommonCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
        GFCell.objArray = [self ShareGetUIModel:ChildDic];
        Currentcell =GFCell;
        
    }
    return Currentcell;
}

+(NSArray *)ShareGetUIModel:(NSDictionary *)ChildDic
{
    NSString *leftString = ChildDic[@"leftstring"];
    NSString *rightstring = ChildDic[@"rightstring"];
    NSArray *array = [NSArray array];
    if ([leftString isEqualToString:@"趣味型"])
    {
        array = [self ThreeTitleArray:@[@"趣味型"]];
        GFThreeModel *model = array[0];
        model.quickArray = @[@"全",@"清"];
        model.objArray = @[@"奇",@"和",@"偶"];
    }
    else if ([leftString isEqualToString:@"三码"])
    {
        if ([rightstring isEqualToString:@"前三直选复式"])
        {
            array = [self TitleArray:@[@"第一",@"第二",@"第三"]];
        }
        else if ([rightstring isEqualToString:@"前三组选复式"])
        {
            array = [self TitleArray:@[@"组选"]];
        }
        else{
            array = [self DSView];
            GFBallModel *model = array[0];
            model.IsCellheard = NO;
        }
        
    }
    else if ([leftString isEqualToString:@"二码"])
    {
        if ([rightstring isEqualToString:@"前二直选复式"])
        {
            array = [self TitleArray:@[@"第一",@"第二"]];
        }
        else if ([rightstring isEqualToString:@"前二组选复式"])
        {
            array = [self TitleArray:@[@"组选"]];
        }
        else{
            array = [self DSView];
            GFBallModel *model = array[0];
            model.IsCellheard = NO;
        }

    }
    else if ([leftString isEqualToString:@"不定胆"])
    {
        array = [self TitleArray:@[@"前三位"]];
    }
    else if ([leftString isEqualToString:@"定位胆"])
    {
        array = [self TitleArray:@[@"第一",@"第二",@"第三"]];
    }
    else if ([leftString isEqualToString:@"任选单式"])
    {
        array = [self DSView];
        GFBallModel *model = array[0];
        model.IsCellheard = NO;
    }
    else if ([leftString isEqualToString:@"任选复式"])
    {
        NSString *titleString = [NSString stringWithFormat:@"选%@",rightstring];
        array = [self TitleArray:@[titleString]];
    }

    return array;
}


+(CGFloat)shareGetHeight:(NSDictionary *)ChildDic
{
    NSArray *objArray = [self ShareGetUIModel:ChildDic];
    CGFloat StartHeight = 0;
    
    NSString *leftString = ChildDic[@"leftstring"];
    if ([leftString isEqualToString:@"趣味型"])
    {
        for (GFThreeModel *model in objArray)
        {
            CGFloat XYheight = 20*ScaleY;
            
            if (model.quickArray)
            {
                XYheight = 55*ScaleY;
            }
            CGFloat  with = (UIScreenWIDTH-80*ScaleX-45*ScaleX)/3;
            if (model.objArray)
            {
                if (model.objArray.count%3)
                {
                    XYheight =XYheight+with*(model.objArray.count/3)+with;
                }
                else
                {
                    XYheight =XYheight+with*(model.objArray.count/3);
                }
            }
            StartHeight = StartHeight+XYheight;
        }
        
    }
    else
    {
        GFBallModel *model;
        if (objArray.count)
        {
            model = objArray[0];
            if (model.IsCellheard)
            {
                StartHeight = 60*ScaleY;
            }
            
            if (model.IsDsCellHidden)
            {
                StartHeight =StartHeight+300*ScaleY;
                return  StartHeight;
            }
        }
        
        for (GFBallModel *model in objArray)
        {
            CGFloat XYheight = 20*ScaleY;
            if (model.quickArray)
            {
                XYheight = 55*ScaleY;
            }
            CGFloat  with = (UIScreenWIDTH-80*ScaleX)/5;
            if (model.objArray)
            {
                if (model.objArray.count%5)
                {
                    XYheight =XYheight+with*(model.objArray.count/5)+with;
                }
                else
                {
                    XYheight =XYheight+with*(model.objArray.count/5);
                }
            }
            if (model.allBallNub)
            {
                if (model.allBallNub%5)
                {
                    XYheight =XYheight+ with*(model.allBallNub/5)+with;
                }
                else
                {
                    XYheight =XYheight+ with*(model.allBallNub/5);
                }

            }
            StartHeight = StartHeight+XYheight;
        }
    }
    return StartHeight;
}


+(NSArray *)ThreeTitleArray:(NSArray *)titleArray
{
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:5];
    for (int i = 0; i<titleArray.count; i++)
    {
        GFThreeModel *Model = [[GFThreeModel alloc]init];
        Model.titleName = titleArray[i];
        [array addObject:Model];
    }
    return array;
}
//1－11球
+(NSArray *)TitleArray:(NSArray *)titleArray
{
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:5];
    for (int i = 0; i<titleArray.count; i++)
    {
        GFBallModel *Model = [[GFBallModel alloc]init];
        Model.titleName = titleArray[i];
        Model.quickArray = @[@"全",@"大",@"小",@"单",@"双",@"清"];
        Model.startBallNub = 1;
        Model.allBallNub = 11;
        [array addObject:Model];
    }
    return array;
}

+(NSArray *)DSView
{
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:5];
    GFBallModel *Model = [[GFBallModel alloc]init];
    Model.IsDsCellHidden = YES;
    Model.IsCellheard = YES;
    [array addObject:Model];
    return array;
}

@end
