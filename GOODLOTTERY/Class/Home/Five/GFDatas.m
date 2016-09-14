//
//  GFDatas.m
//  GOODLOTTERY
//
//  Created by apple on 16/8/24.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "GFDatas.h"
#import "GFTimeTimeDatas.h"
#import "BeiJingHappyEightDatas.h"
#import "GFJskuaiThreeDatas.h"
#import "GFBeijingPKTenDatas.h"
#import "GFTenToFiveDatas.h"
#import "GFFC3DDatas.h"

@implementation GFDatas
+(UITableViewCell *)shareGetCell:(NSString *)TitleString AndChildDic:(NSDictionary *)ChildDic
{
    if ([TitleString containsString:@"时时彩"])
    {
      return  [GFTimeTimeDatas shareGetCell:ChildDic];
    }
    else if ([TitleString isEqualToString:@"北京快乐8"])
    {
        return [BeiJingHappyEightDatas shareGetCell:ChildDic];
    }
    else if ([TitleString isEqualToString:@"江苏快三"])
    {
        return [GFJskuaiThreeDatas shareGetCell:ChildDic];
    }
    else if ([TitleString isEqualToString:@"北京PK拾"])
    {
        return [GFBeijingPKTenDatas shareGetCell:ChildDic];
    }
    else if ([TitleString containsString:@"11选5"])
    {
        return [GFTenToFiveDatas shareGetCell:ChildDic];
    }
    else if ([TitleString isEqualToString:@"福彩3D"])
    {
        return [GFFC3DDatas shareGetCell:ChildDic];
    }
    return nil;
}

+(CGFloat)ShareReturnCellheight:(NSString *)TitleString AndChildDic:(NSDictionary *)ChildDic
{
    if ([TitleString containsString:@"时时彩"])
    {
        return  [GFTimeTimeDatas shareGetHeight:ChildDic];
    }
    else if ([TitleString isEqualToString:@"北京快乐8"])
    {
        return  [BeiJingHappyEightDatas shareGetHeight:ChildDic];
    }
    else if ([TitleString isEqualToString:@"江苏快三"])
    {
        return  [GFJskuaiThreeDatas shareGetHeight:ChildDic];
    }
    else if ([TitleString isEqualToString:@"北京PK拾"])
    {
        return  [GFBeijingPKTenDatas shareGetHeight:ChildDic];
    }
    else if ([TitleString containsString:@"11选5"])
    {
        return  [GFTenToFiveDatas shareGetHeight:ChildDic];
    }
    else if ([TitleString isEqualToString:@"福彩3D"])
    {
        return  [GFFC3DDatas shareGetHeight:ChildDic];
    }
    
    return 1000*ScaleY;
}

+(NSDictionary *)ShareReturn:(NSArray *)allObjArray;
{
    NSDictionary *dic = allObjArray[0];
    NSArray *Dicarray = [dic allValues][0];
    NSDictionary *SubDic = Dicarray[0];
    NSArray *rightAttay= [SubDic allValues][0];
    
    NSString *left = [dic allKeys][0];
    NSString *middel = [SubDic allKeys][0];
    NSString *right = rightAttay[0];
    
    NSDictionary *currentDic = @{@"leftstring":left,@"middelstring":middel,@"rightstring":right};
    return currentDic;
}
@end
