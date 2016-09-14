//
//  GFJskuaiThreeDatas.m
//  GOODLOTTERY
//
//  Created by apple on 16/9/8.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "GFJskuaiThreeDatas.h"
#import "GFCommonCell.h"
#import "GFCommomtwoCell.h"
#import "GFCommonThreeCell.h"
#import "GFTwoModel.h"
#import "GFThreeModel.h"

@implementation GFJskuaiThreeDatas

+(UITableViewCell *)shareGetCell:(NSDictionary *)ChildDic
{
    NSString *leftString = ChildDic[@"leftstring"];
    UITableViewCell *Currentcell;
    if ([leftString isEqualToString:@"和值"])
    {
        GFCommonThreeCell *GFThreeCell = [[GFCommonThreeCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
        GFThreeCell.objArray = [self ShareGetUIModel:ChildDic];
        
        Currentcell =GFThreeCell;
    }
    else
    {
        GFCommomtwoCell *GFtwoCell = [[GFCommomtwoCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
        GFtwoCell.objArray = [self ShareGetUIModel:ChildDic];
        Currentcell =GFtwoCell;
        
    }
    return Currentcell;
}

+(NSArray *)ShareGetUIModel:(NSDictionary *)ChildDic
{
    NSString *leftString = ChildDic[@"leftstring"];
    NSString *rightstring = ChildDic[@"rightstring"];
    NSArray *array = [NSArray array];
    if ([leftString isEqualToString:@"和值"])
    {
        array = [self ThreeTitleArray:@[@"和值"]];
        GFThreeModel *model = array[0];
        model.quickArray = @[@"全",@"清"];
        model.objArray = @[@"奇",@"和",@"偶"];
    }
    else if ([rightstring isEqualToString:@"二同号单选"])
    {
        array = [self TwoTitleArray:@[@"同号",@"不同号"]];
        GFTwoModel *model1 = array[0];
        GFTwoModel *model2 = array[1];
        model1.objArray = @[@"11",@"22",@"33",@"44",@"55",@"66"];
        model2.objArray = @[@"1",@"2",@"3",@"4",@"5",@"6"];
    }
    else if ([rightstring isEqualToString:@"二同号复选"])
    {
        array = [self TwoTitleArray:@[@"二同复选"]];
        GFTwoModel *model1 = array[0];
        model1.objArray = @[@"11",@"22",@"33",@"44",@"55",@"66"];
    }
    else if ([rightstring isEqualToString:@"三同号单选"])
    {
        array = [self TwoTitleArray:@[@"三同单选"]];
        GFTwoModel *model1 = array[0];
        model1.objArray = @[@"111",@"222",@"333",@"444",@"555",@"666"];
    }
    else if ([rightstring isEqualToString:@"三同号复选"])
    {
        array = [self TwoTitleArray:@[@"三同复选"]];
        GFTwoModel *model1 = array[0];
        model1.objArray = @[@"三同号通选"];
    }
    else if ([rightstring isEqualToString:@"三连号"])
    {
        array = [self TwoTitleArray:@[@"三连号"]];
        GFTwoModel *model1 = array[0];
        model1.objArray = @[@"三连号通选"];
    }
    else if ([rightstring isEqualToString:@"二不同号"])
    {
        array = [self TwoTitleArray:@[@"标准"]];
        GFTwoModel *model1 = array[0];
        model1.objArray = @[@"1",@"2",@"3",@"4",@"5",@"6"];
    }
    else if ([rightstring isEqualToString:@"三不同号"])
    {
        array = [self TwoTitleArray:@[@"标准"]];
        GFTwoModel *model1 = array[0];
        model1.objArray = @[@"1",@"2",@"3",@"4",@"5",@"6"];
    }
    
    return array;
}


+(CGFloat)shareGetHeight:(NSDictionary *)ChildDic
{
    NSArray *objArray = [self ShareGetUIModel:ChildDic];
    CGFloat StartHeight = 0;
    
    NSString *leftString = ChildDic[@"leftstring"];
    if ([leftString isEqualToString:@"和值"])
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
    return StartHeight;
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
