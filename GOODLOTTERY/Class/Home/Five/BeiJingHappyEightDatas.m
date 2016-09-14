//
//  BeiJingHappyEightDatas.m
//  GOODLOTTERY
//
//  Created by apple on 16/9/7.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "BeiJingHappyEightDatas.h"
#import "GFCommonCell.h"
#import "GFCommomtwoCell.h"
#import "GFCommonThreeCell.h"
#import "GFBallModel.h"
#import "GFTwoModel.h"
#import "GFThreeModel.h"

@implementation BeiJingHappyEightDatas

+(UITableViewCell *)shareGetCell:(NSDictionary *)ChildDic
{
    NSString *leftString = ChildDic[@"leftstring"];
//    NSString *middleString = ChildDic[@"middelstring"];
    NSString *rightstring = ChildDic[@"rightstring"];
    UITableViewCell *Currentcell;
    if ([leftString isEqualToString:@"任选"])
    {
        GFCommonCell *GFcell = [[GFCommonCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
        GFcell.objArray = [self ShareGetUIModel:ChildDic];
        Currentcell = GFcell;
    }
    else if ([rightstring isEqualToString:@"和值单双"]||[rightstring isEqualToString:@"和值大小单双"])
    {
        GFCommomtwoCell *GFtwoCell = [[GFCommomtwoCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
        GFtwoCell.objArray = [self ShareGetUIModel:ChildDic];
        Currentcell =GFtwoCell;

    }
    else{
        GFCommonThreeCell *GFThreeCell = [[GFCommonThreeCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
        GFThreeCell.objArray = [self ShareGetUIModel:ChildDic];
        
        Currentcell =GFThreeCell;
        
    }
    return Currentcell;
}

+(NSArray *)ShareGetUIModel:(NSDictionary *)ChildDic
{
    NSString *leftString = ChildDic[@"leftstring"];
//    NSString *middleString = ChildDic[@"middelstring"];
    NSString *rightstring = ChildDic[@"rightstring"];
    NSArray *array = [NSArray array];
    if ([leftString isEqualToString:@"任选"])
    {
        array = [self TitleArray:@[@"上",@"下"]];
    }
    else if ([rightstring isEqualToString:@"和值单双"])
    {
        array = [self TwoTitleArray:@[@"大小单双"]];
        GFTwoModel *model = array[0];
        model.quickArray = @[@"全",@"清"];
        model.objArray = @[@"单",@"双"];
    }
    else if ([rightstring isEqualToString:@"和值大小单双"])
    {
        array = [self TwoTitleArray:@[@"大小单双"]];
        GFTwoModel *model = array[0];
        model.quickArray = @[@"全",@"清"];
        model.objArray = @[@"单",@"双",@"大小",@"单双"];
    }
    else if ([rightstring isEqualToString:@"和值大小"])
    {
        array = [self ThreeTitleArray:@[@"和值大小"]];
        GFThreeModel *model = array[0];
        model.quickArray = @[@"全",@"清"];
        model.objArray = @[@"大",@"和",@"小"];
    }
    else if ([rightstring isEqualToString:@"上下盘"])
    {
        array = [self ThreeTitleArray:@[@"上下盘"]];
        GFThreeModel *model = array[0];
        model.quickArray = @[@"全",@"清"];
        model.objArray = @[@"上",@"中",@"下"];
    }
    else if ([rightstring isEqualToString:@"奇偶盘"])
    {
        array = [self ThreeTitleArray:@[@"奇偶盘"]];
        GFThreeModel *model = array[0];
        model.quickArray = @[@"全",@"清"];
        model.objArray = @[@"奇",@"和",@"偶"];
    }

    return array;
}


+(CGFloat)shareGetHeight:(NSDictionary *)ChildDic
{
    NSArray *objArray = [self ShareGetUIModel:ChildDic];
    CGFloat StartHeight = 0;
    
    NSString *leftString = ChildDic[@"leftstring"];
    //    NSString *middleString = ChildDic[@"middelstring"];
        NSString *rightstring = ChildDic[@"rightstring"];
    if ([leftString isEqualToString:@"任选"])
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
                XYheight =XYheight+ with*(model.allBallNub/5);
            }
            StartHeight = StartHeight+XYheight;
        }
    }
    else if ([rightstring isEqualToString:@"和值单双"]||[rightstring isEqualToString:@"和值大小单双"])
    {
        for (GFTwoModel *model in objArray)
        {
            CGFloat XYheight = 20*ScaleY;
            
            if (model.quickArray)
            {
                XYheight = 55*ScaleY;
            }
            CGFloat  with = (UIScreenWIDTH-80*ScaleX)/2;
            if (model.objArray)
            {
                if (model.objArray.count%2)
                {
                    XYheight =XYheight+with/3*(model.objArray.count/2)+with/3;
                }
                else
                {
                    XYheight =XYheight+with/3*(model.objArray.count/2);
                }
            }
            StartHeight = StartHeight+XYheight;
        }

    }
    else
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
    
    return StartHeight;
}

//1－80球
+(NSArray *)TitleArray:(NSArray *)titleArray
{
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:5];
    for (int i = 0; i<titleArray.count; i++)
    {
        GFBallModel *Model = [[GFBallModel alloc]init];
        Model.titleName = titleArray[i];
        if (i==0)
        {
            Model.startBallNub = 1;
            Model.allBallNub = 40;
        }
        else if (i==1)
        {
            Model.startBallNub =41;
            Model.allBallNub = 40;
        }
        [array addObject:Model];
    }
    return array;
}


+(NSArray *)TwoTitleArray:(NSArray *)titleArray
{
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:5];
    for (int i = 0; i<titleArray.count; i++)
    {
        GFTwoModel *Model = [[GFTwoModel alloc]init];
        Model.titleName = titleArray[i];
        [array addObject:Model];
    }
    return array;
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

@end
