//
//  GFBeijingPKTenDatas.m
//  GOODLOTTERY
//
//  Created by apple on 16/9/8.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "GFBeijingPKTenDatas.h"

#import "GFCommonCell.h"
#import "GFBallModel.h"

@implementation GFBeijingPKTenDatas
+(UITableViewCell *)shareGetCell:(NSDictionary *)ChildDic
{
    GFCommonCell *cell = [[GFCommonCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    cell.objArray = [self ShareGetUIModel:ChildDic];
    return cell;
}

+(CGFloat)shareGetHeight:(NSDictionary *)ChildDic
{
    NSArray *objArray = [self ShareGetUIModel:ChildDic];
    CGFloat StartHeight = 0;
    
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
    return StartHeight;
}



+(NSArray *)ShareGetUIModel:(NSDictionary *)ChildDic
{
    NSString *leftString = ChildDic[@"leftstring"];
    NSString *middleString = ChildDic[@"middelstring"];
    NSString *rightstring = ChildDic[@"rightstring"];
    NSArray *array = [NSArray array];
    
    if ([leftString isEqualToString:@"猜冠军"])
    {
        NSArray *titleArray = @[@"猜冠军"];
        array = [self TitleArray:titleArray];
    }
    else if ([leftString isEqualToString:@"猜前二"])
    {
        if ([rightstring isEqualToString:@"猜前二复式"])
        {
            NSArray *titleArray = @[@"冠军",@"亚军"];
            array = [self TitleArray:titleArray];
        }
        else if ([rightstring isEqualToString:@"猜前二单式"])
        {
            array = [self DSView];
            GFBallModel *Model = array[0];
            Model.IsCellheard = NO;
        }
        
    }
    else if ([leftString isEqualToString:@"猜前三"])
    {
        if ([rightstring isEqualToString:@"猜前三复式"])
        {
            NSArray *titleArray = @[@"冠军",@"亚军",@"季军"];
            array = [self TitleArray:titleArray];
        }
        else if ([rightstring isEqualToString:@"猜前三单式"])
        {
            array = [self DSView];
            GFBallModel *Model = array[0];
            Model.IsCellheard = NO;
        }
        
    }
    else if ([leftString isEqualToString:@"猜前四"])
    {
        if ([rightstring isEqualToString:@"猜前四复式"])
        {
            NSArray *titleArray = @[@"第一",@"第二",@"第三",@"第四"];
            array = [self TitleArray:titleArray];
        }
        else if ([rightstring isEqualToString:@"猜前四单式"])
        {
            array = [self DSView];
            GFBallModel *Model = array[0];
            Model.IsCellheard = NO;
        }
        
    }
    else if ([leftString isEqualToString:@"猜前五"])
    {
        if ([rightstring isEqualToString:@"猜前五复式"])
        {
            NSArray *titleArray = @[@"第一",@"第二",@"第三",@"第四",@"第五"];
            array = [self TitleArray:titleArray];
        }
        else if ([rightstring isEqualToString:@"猜前五单式"])
        {
            array = [self DSView];
            GFBallModel *Model = array[0];
            Model.IsCellheard = NO;
        }
        
    }
    else if ([leftString isEqualToString:@"定位胆"])
    {
        NSArray *titleArray = @[@"第一",@"第二",@"第三",@"第四",@"第五",@"第六",@"第七",@"第八",@"第九",@"第十"];
        array = [self TitleArray:titleArray];
    }
    
        return array;
}

//0－9球
+(NSArray *)TitleArray:(NSArray *)titleArray
{
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:5];
    for (int i = 0; i<titleArray.count; i++)
    {
        GFBallModel *Model = [[GFBallModel alloc]init];
        Model.titleName = titleArray[i];
        Model.quickArray = @[@"全",@"大",@"小",@"单",@"双",@"清"];
        Model.startBallNub = 1;
        Model.allBallNub = 10;
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
