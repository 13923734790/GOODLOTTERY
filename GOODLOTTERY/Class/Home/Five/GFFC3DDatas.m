//
//  GFFC3DDatas.m
//  GOODLOTTERY
//
//  Created by apple on 16/9/8.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "GFFC3DDatas.h"
#import "GFCommonCell.h"
#import "GFBallModel.h"

@implementation GFFC3DDatas

+(UITableViewCell *)shareGetCell:(NSDictionary *)ChildDic
{
    UITableViewCell *Currentcell;
    GFCommonCell *GFCell = [[GFCommonCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
        GFCell.objArray = [self ShareGetUIModel:ChildDic];
    Currentcell =GFCell;
    
    return Currentcell;
}

+(NSArray *)ShareGetUIModel:(NSDictionary *)ChildDic
{
    NSString *leftString = ChildDic[@"leftstring"];
    NSString *middelstring = ChildDic[@"middelstring"];
    NSString *rightstring = ChildDic[@"rightstring"];
    NSArray *array = [NSArray array];
    
     if ([leftString isEqualToString:@"三码"])
    {
        if([middelstring isEqualToString:@"直选"])
        {
            if ([rightstring isEqualToString:@"复式"])
            {
                array = [self TitleArray:@[@"百位",@"十位",@"个位"]];
            }
            else if ([rightstring isEqualToString:@"直选和值"])
            {
                array = [self TitleArray:@[@"直选和值"]];
                GFBallModel *model = array[0];
                model.allBallNub = 28;
            }
            else{
                array = [self DSView];
                GFBallModel *model = array[0];
                model.IsCellheard = NO;
            }

        }
        else{
            if ([rightstring isEqualToString:@"组三"]||[rightstring isEqualToString:@"组六"])
            {
                array = [self TitleArray:@[rightstring]];
            }
            else if ([rightstring isEqualToString:@"组选和值"])
            {
                array = [self TitleArray:@[@"组选和值"]];
                GFBallModel *model = array[0];
                model.startBallNub = 1;
                model.allBallNub = 26;
            }
            else{
                array = [self DSView];
                GFBallModel *model = array[0];
                model.IsCellheard = NO;
            }

        }
    
    }
    else if ([leftString isEqualToString:@"二码"])
    {
        
        if ([middelstring isEqualToString:@"前二"])
        {
            if ([rightstring isEqualToString:@"前二直选复式"])
            {
                array = [self TitleArray:@[@"百位",@"十位"]];
                GFBallModel *model = array[0];
                model.isHaveClodHot = YES;
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
        else
        {
            if ([rightstring isEqualToString:@"后二直选复式"])
            {
                array = [self TitleArray:@[@"十位",@"个位"]];
            }
            else if ([rightstring isEqualToString:@"后二组选复式"])
            {
                array = [self TitleArray:@[@"组选"]];
            }
            else{
                array = [self DSView];
                GFBallModel *model = array[0];
                model.IsCellheard = NO;
            }

            
        }
        
    }
    else if ([leftString isEqualToString:@"不定胆"])
    {
        array = [self TitleArray:@[@"不定胆"]];
    }
    else if ([leftString isEqualToString:@"定位胆"])
    {
        array = [self TitleArray:@[@"百位",@"十位",@"个位"]];
        GFBallModel *model = array[0];
        model.isHaveClodHot = YES;
    }
    else if ([leftString isEqualToString:@"大小单双"])
    {
        if ([leftString isEqualToString:@"前二大小单双"])
        {
            array = [self TitleArray:@[@"百位",@"十位"]];
            
            for (GFBallModel *model in array) {
                 model.objArray = @[@"大",@"小",@"单",@"双"];
                model.allBallNub = 0;
                model.quickArray = @[@"全",@"清"];
            }
        }
        else
        {
            array = [self TitleArray:@[@"十位",@"个位"]];
            for (GFBallModel *model in array) {
                model.objArray = @[@"大",@"小",@"单",@"双"];
                model.allBallNub = 0;
                model.quickArray = @[@"全",@"清"];
            }
        }
    }
    return array;
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
    
    return StartHeight;
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
        Model.startBallNub = 0;
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
