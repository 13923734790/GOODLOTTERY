//
//  GFTimeTimeDatas.m
//  GOODLOTTERY
//
//  Created by apple on 16/8/25.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "GFTimeTimeDatas.h"
#import "GFCommonCell.h"
#import "GFBallModel.h"

@implementation GFTimeTimeDatas
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

    if ([leftString isEqualToString:@"五星"])
    {
        if ([middleString isEqualToString:@"五星直选"])
        {
            if ([rightstring isEqualToString:@"五星复式"]||[rightstring isEqualToString:@"五星组合"])
            {
                NSArray *titleArray = @[@"万位",@"千位",@"百位",@"十位",@"个位"];
                array = [self TitleArray:titleArray];
                GFBallModel *Model = array[0];
                Model.isHaveClodHot = YES;
            }
            else if ([rightstring isEqualToString:@"五星单式"])
            {
                array = [self DSView];
                GFBallModel *Model = array[0];
                Model.IsCellheard = NO;
            }
        }
        else if ([middleString isEqualToString:@"五星组选"])
        {
            if ([rightstring isEqualToString:@"组选120"])
            {
                NSArray *titleArray = @[@"组选120"];
                array = [self TitleArray:titleArray];
            }
            else if ([rightstring isEqualToString:@"组选60"]||[rightstring isEqualToString:@"组选30"]){
                NSArray *titleArray = @[@"二重号",@"单号"];
                array = [self TitleArray:titleArray];
            }
            else if ([rightstring isEqualToString:@"组选20"]||[rightstring isEqualToString:@"组选10"]){
                NSArray *titleArray = @[@"三重号",@"二重号"];
                array = [self TitleArray:titleArray];
            }
            else if ([rightstring isEqualToString:@"组选5"]){
                NSArray *titleArray = @[@"四重号"];
                array = [self TitleArray:titleArray];
            }
        }
            
    }
    else if ([leftString isEqualToString:@"前四"]||[leftString isEqualToString:@"后四"])
    {
        NSArray *titleArray;
        if ([leftString isEqualToString:@"前四"])
        {
            titleArray = @[@"万位",@"千位",@"百位",@"十位"];
        }
        else{
            titleArray = @[@"千位",@"百位",@"十位",@"个位"];
        }
        
        if ([middleString containsString:@"直选"])
        {
            if ([rightstring containsString:@"单式"])
            {array = [self DSView];
                GFBallModel *Model = array[0];
                Model.IsCellheard = NO;

            }
            else
            {
                array = [self TitleArray:titleArray];
                GFBallModel *Model = array[0];
                Model.isHaveClodHot = YES;
            }
        }
        else if ([middleString containsString:@"组选"])
        {
            if ([rightstring containsString:@"组选24"])
            {
                NSArray *titleArray = @[@"组选24"];
                array = [self TitleArray:titleArray];
            }
            else if ([rightstring containsString:@"组选12"])
            {
                NSArray *titleArray = @[@"二重号",@"单号"];
                array = [self TitleArray:titleArray];
            }
            else if ([rightstring containsString:@"组选6"])
            {
                NSArray *titleArray = @[@"二重号"];
                array = [self TitleArray:titleArray];
            }
            else if ([rightstring containsString:@"组选4"]){
                NSArray *titleArray = @[@"三重号",@"单号"];
                array = [self TitleArray:titleArray];
            }

        }

    }
    else if ([leftString isEqualToString:@"后三码"]||[leftString isEqualToString:@"前三码"]||[leftString isEqualToString:@"中三码"])
    {
        
        NSArray *titleArray;
        if ([leftString isEqualToString:@"后三码"])
        {
            titleArray = @[@"百位",@"十位",@"个位"];
        }
        else if ([leftString isEqualToString:@"前三码"])
        {
            titleArray = @[@"万位",@"千位",@"百位"];
        }
        else{
            titleArray = @[@"千位",@"百位",@"十位"];
        }
        
        if ([middleString containsString:@"直选"])
        {
            if ([rightstring containsString:@"单式"])
            {array = [self DSView];
                GFBallModel *Model = array[0];
                Model.IsCellheard = NO;

            }
            else if ([rightstring containsString:@"直选复式"])
            {
                array = [self TitleArray:titleArray];
                GFBallModel *Model = array[0];
                Model.isHaveClodHot = YES;
            }
            else{
                array = [self TitleArray:@[@"直选和值"]];
                GFBallModel *Model = array[0];
                Model.quickArray = nil;
                Model.allBallNub = 28;
            }
                
        }
        else if ([middleString containsString:@"组选"])
        {
            if ([rightstring containsString:@"组三"])
            {
                NSArray *titleArray = @[@"组三"];
                array = [self TitleArray:titleArray];
            }
            else if ([rightstring containsString:@"组六"])
            {
                NSArray *titleArray = @[@"组六"];
                array = [self TitleArray:titleArray];
            }
            else if ([rightstring containsString:@"混合组选"])
            {
                array = [self DSView];
                GFBallModel *Model = array[0];
                Model.IsCellheard = NO;

            }
            else if ([rightstring containsString:@"组选和值"]){
                NSArray *titleArray = @[@"组选和值"];
                array = [self TitleArray:titleArray];
                GFBallModel *Model = array[0];
                Model.quickArray = nil;
                Model.startBallNub = 1;
                Model.allBallNub = 26;
            }
            
        }

    }
    else if ([leftString isEqualToString:@"二码"])
    {
        if ([middleString isEqualToString:@"二星直选"])
        {
            NSArray *titleArray;
            if ([rightstring containsString:@"复式"])
            {
                if ([rightstring isEqualToString:@"后二直选(复式)"])
                {titleArray = @[@"十位",@"个位"];
                }
                else if ([rightstring isEqualToString:@"前二直选(复式)"]){
                titleArray = @[@"万位",@"千位"];
                }
                array = [self TitleArray:titleArray];
                GFBallModel *Model = array[0];
                Model.isHaveClodHot = YES;
                
            }
            else if ([rightstring containsString:@"单式"])
            {
                array = [self DSView];
                GFBallModel *Model = array[0];
                Model.IsCellheard = NO;

            }
            else if ([rightstring containsString:@"直选和值"])
            {
                array = [self TitleArray:@[@"和值"]];
                GFBallModel *Model = array[0];
                Model.quickArray = nil;
                Model.allBallNub = 19;
            }
            
        }
        else
        {
            
            if ([rightstring containsString:@"复式"])
            {
                array = [self TitleArray:@[@"组选"]];
            }
            else if ([rightstring containsString:@"单式"])
            {
                array = [self DSView];
            }
            else if ([rightstring containsString:@"组选和值"])
            {
                array = [self TitleArray:@[@"和值"]];
                GFBallModel *Model = array[0];
                Model.quickArray = nil;
                Model.startBallNub = 1;
                Model.allBallNub = 17;
            }
        }
        
    }
    else if ([leftString isEqualToString:@"定位胆"])
    {
        NSArray *titleArray = @[@"万位",@"千位",@"百位",@"十位",@"个位"];
        array = [self TitleArray:titleArray];
        GFBallModel *Model = array[0];
        Model.isHaveClodHot = YES;
    }
    else if ([leftString isEqualToString:@"不定胆"])
    {
        array = [self TitleArray:@[@"不定胆"]];
    }
    else if ([leftString isEqualToString:@"大小单双"])
    {
        NSArray *titleArray;
        NSArray *quickArray = @[@"全",@"清"];
        NSArray *objArray = @[@"大",@"小",@"单",@"双"];
        if ([rightstring isEqualToString:@"前二大小单双"])
        {
            titleArray = @[@"万位",@"千位"];
        }
        else if ([rightstring isEqualToString:@"后二大小单双"])
        {
            titleArray = @[@"十位",@"个位"];
        }
        
        array = [self TitleArray:titleArray];
        
        for (int i = 0; i<array.count; i++)
        {
            GFBallModel *Model = array[i];
            Model.quickArray = quickArray;
            Model.objArray = objArray;
            Model.allBallNub = 0;
        }
        
        
    }
    else if ([leftString isEqualToString:@"趣味"])
    {
        NSArray *titleArray;
        if ([rightstring isEqualToString:@"一帆风顺"])
        {titleArray = @[@"一帆风顺"];
        }
        else if([rightstring isEqualToString:@"好事成双"])
        {
            titleArray= @[@"好事成双"];
        }
        else if([rightstring isEqualToString:@"三星报喜"])
        {
            titleArray= @[@"三星报喜"];
        }
        else{
            titleArray= @[@"四季发财"];
        }
        array = [self TitleArray:titleArray];
        
    }
    else if ([leftString isEqualToString:@"任选二"]||[leftString isEqualToString:@"任选三"]||[leftString isEqualToString:@"任选四"])
    {
        if([middleString containsString:@"直选"])
        {
            
            if ([rightstring containsString:@"复式"])
            {
                NSArray *titleArray = @[@"万位",@"千位",@"百位",@"十位",@"个位"];
                array = [self TitleArray:titleArray];
            }
            else if ([rightstring isEqualToString:@"任二直选和值"])
            {
                array = [self TitleArray:@[@"直选和值"]];
                GFBallModel *Model = array[0];
                Model.quickArray = nil;
                Model.startBallNub = 0;
                Model.allBallNub = 19;
            }
            else if ([rightstring isEqualToString:@"任三直选和值"])
            {
                array = [self TitleArray:@[@"直选和值"]];
                GFBallModel *Model = array[0];
                Model.quickArray = nil;
                Model.startBallNub = 0;
                Model.allBallNub = 28;
            }
            else
            {
                array = [self DSView];
                //单式
            }
            
        }
        else//组选
        {
            
            if ([middleString isEqualToString:@"任二组选"])
            {
                if ([rightstring containsString:@"复式"])
                {
                    array = [self TitleArray:@[@"组选"]];
                }
                else if([rightstring containsString:@"单式"])
                {
                    array = [self DSView];
                }
                else{
                    array = [self TitleArray:@[@"组选"]];
                    GFBallModel *Model = array[0];
                    Model.quickArray = nil;
                    Model.startBallNub = 1;
                    Model.allBallNub = 17;
                }
            
            }
            else if ([middleString isEqualToString:@"任三组选"])
            {
                if ([rightstring containsString:@"组三"])
                {
                    NSArray *titleArray = @[@"组三"];
                    array = [self TitleArray:titleArray];
                }
                else if ([rightstring containsString:@"组六"])
                {
                    NSArray *titleArray = @[@"组六"];
                    array = [self TitleArray:titleArray];
                }
                else if ([rightstring containsString:@"混合组选"])
                {
                    array = [self DSView];
                }
                else if ([rightstring containsString:@"组选和值"]){
                    NSArray *titleArray = @[@"组选和值"];
                    array = [self TitleArray:titleArray];
                    GFBallModel *Model = array[0];
                    Model.quickArray = nil;
                    Model.startBallNub = 1;
                    Model.allBallNub = 26;
                }

                
            }
            else
            {
                if ([rightstring containsString:@"组选24"])
                {
                    NSArray *titleArray = @[@"单号"];
                    array = [self TitleArray:titleArray];
                }
                else if ([rightstring containsString:@"组选12"])
                {
                    NSArray *titleArray = @[@"二重号",@"单号"];
                    array = [self TitleArray:titleArray];
                }
                else if ([rightstring containsString:@"组选6"])
                {
                    NSArray *titleArray = @[@"二重号"];
                    array = [self TitleArray:titleArray];
                }
                else if ([rightstring containsString:@"组选4"]){
                    NSArray *titleArray = @[@"三重号",@"单号"];
                    array = [self TitleArray:titleArray];
                }
                
                GFBallModel *Model = array[0];
                Model.IsCellheard = YES;

            }
            
        }
            
        
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
