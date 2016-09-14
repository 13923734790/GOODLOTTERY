//
//  XYDatas.m
//  GOODLOTTERY
//
//  Created by apple on 16/8/16.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "XYDatas.h"
#import "XYCommonDatas.h"

#import "MarkSixDatas.h"
#import "GDTenFiveDatas.h"
#import "KuaiTenDatas.h"
#import "TimeTimeDatas.h"
#import "BeiJingPKTenDatas.h"
#import "KuaiSanDatas.h"

@implementation XYDatas
// CreditArray =  @[@"⑥合彩",@"广东11选5",@"广东快十",@"广西快十",@"天津时时彩",@"新疆时时彩",@"江西时时彩",@"幸运农场",@"北京PK拾",@"七星彩",@"江苏骰宝"];
+(NSArray *)shareXYTitleViewArray:(NSString *)GameTitle
{
    
    NSArray *array;
    if ([GameTitle isEqualToString:@"⑥合彩"])
    {
        array = @[@"特码",@"两面",@"色波",@"特肖",@"正码",@"正特",@"正码1-6",@"连码",@"一肖",@"尾数",@"合肖",@"自选不中",@"连肖",@"龙虎斗"];
    }
    else if ([GameTitle isEqualToString:@"广东11选5"])
    {
        array = @[@"两面盘",@"特码",@"正码一",@"正码二",@"正码三",@"正码四",@"龙虎斗",@"全5中1"];
    }
    else if ([GameTitle containsString:@"快十"])
    {
        if ([GameTitle containsString:@"广西快十"])
        {
            array = @[@"两面盘",@"特码",@"正码一",@"正码二",@"正码三",@"正码四",@"龙虎斗",@"全5中1"];

        }else
        {
            array = @[@"两面盘",@"特码",@"正码一",@"正码二",@"正码三",@"正码四",@"正码五",@"正码六",@"正码七",@"龙虎斗",@"全8中1"];

        }
    }
    else if ([GameTitle containsString:@"时时彩"])
    {
        array = @[@"整合",@"龙虎斗",@"全5中1"];
    }
    else if ([GameTitle containsString:@"北京PK拾"])
    {
        array = @[@"整合",@"第1-5名",@"第6-10名",@"冠亚和值",@"冠亚组合"];
    }
    else if ([GameTitle containsString:@"江苏快三"])
    {
        array = @[@"大小骰宝"];
    }

    return array;
}


+(UITableViewCell *)shareGetCell:(NSString *)TitleString AndChildTitle:(NSString *)ChildTitle;

{
    UITableViewCell *cell;
    
    if ([TitleString isEqualToString:@"⑥合彩"])
    {
    return [MarkSixDatas shareGetCell:ChildTitle];
    }
    else if ([TitleString isEqualToString:@"广东11选5"])
    {
     cell = [GDTenFiveDatas shareGetCell:ChildTitle];
    }
    else if ([TitleString containsString:@"快十"])
    {
     cell = [KuaiTenDatas shareGetCell:TitleString AndChildTitle:ChildTitle];
    }
    else if ([TitleString containsString:@"时时彩"])
    {
        cell = [TimeTimeDatas shareGetCell:TitleString AndChildTitle:ChildTitle];
    }
    else if ([TitleString containsString:@"北京PK拾"])
    {
        cell = [BeiJingPKTenDatas shareGetCell:ChildTitle];
    }
    else if ([TitleString containsString:@"江苏快三"])
    {
        cell = [KuaiSanDatas shareGetCell:ChildTitle];
    }
    return cell;
}

+(CGFloat)ShareReturnCellheight:(NSString *)TitleString AndChildTitle:(NSString *)ChildTitle
{
    
    if ([TitleString isEqualToString:@"⑥合彩"])
    {
    return [MarkSixDatas ShareReturnCellheight:ChildTitle];
    }
    else if ([TitleString isEqualToString:@"广东11选5"])
    {
    return [GDTenFiveDatas ShareGetCellHeight:ChildTitle];
    }
    else if ([TitleString containsString:@"快十"])
    {
    return [KuaiTenDatas ShareGetCellHeight:TitleString AndChildTitle:ChildTitle];
    }
    else if ([TitleString containsString:@"时时彩"])
    {
    return [TimeTimeDatas ShareGetCellHeight:TitleString AndChildTitle:ChildTitle];
    }
    else if ([TitleString containsString:@"北京PK拾"])
    {
    return [BeiJingPKTenDatas ShareGetCellHeight:ChildTitle];
    }
    else if ([TitleString containsString:@"江苏快三"])
    {
    return  [KuaiSanDatas ShareGetCellHeight:ChildTitle];
    }

    return 0;
}

+(NSDictionary *)ShareReturnFPtime:(NSString *)TitleString AndChildTitle:(NSString *)ChildTitle;
{
    if ([TitleString isEqualToString:@"⑥合彩"])
    {
       return [MarkSixDatas ShareReturnFPtime:ChildTitle];
    }
    return nil;
}


+(NSArray *)ShareReturnAllSeletedObjc:(NSString *)TitleString AndChildTitle:(NSString *)ChildTitle AndCurrentCell:(UITableViewCell *)Currentcell
{
    NSArray *array;
    
    if ([TitleString isEqualToString:@"⑥合彩"])
    {
        return nil;
    }
    else
    {
        array = [XYCommonDatas ShareReturnSeletedObjc:ChildTitle AndCurrentCell:Currentcell];
    }
//    else if ([TitleString isEqualToString:@"广东11选5"])
//    {
//     return   [GDTenFiveDatas ShareReturnSeletedObjc:ChildTitle AndCurrentCell:Currentcell];
//    }
//    else if ([TitleString containsString:@"快十"])
//    {
////        cell = [KuaiTenDatas shareGetCell:TitleString AndChildTitle:ChildTitle];
//    }
//    else if ([TitleString containsString:@"时时彩"])
//    {
//        [TimeTimeDatas ShareReturnSeletedObjc:ChildTitle AndCurrentCell:Currentcell];
//    }
//    else if ([TitleString containsString:@"北京PK拾"])
//    {
////        cell = [BeiJingPKTenDatas shareGetCell:ChildTitle];
//    }
//    else if ([TitleString containsString:@"江苏快三"])
//    {
////        cell = [KuaiSanDatas shareGetCell:ChildTitle];
//    }
    return array;

}
@end
