//
//  XYCommonDatas.m
//  GOODLOTTERY
//
//  Created by apple on 16/8/23.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "XYCommonDatas.h"

#import "XYCommonCell.h"
#import "DragonTigerCell.h"
#import "XYCommonModel.h"

@implementation XYCommonDatas




+(NSArray *)ShareReturnSeletedObjc:(NSString *)TitleString AndCurrentCell:(UITableViewCell *)Currentcell
{
    
    if ([TitleString isEqualToString:@"龙虎斗"])
    {
        DragonTigerCell *Dragoncell =(DragonTigerCell *) Currentcell;
        
        for (NSArray *arr in Dragoncell.seletedArray)
        {
            for (NSString *string in arr)
            {
                NSLog(@"%@",string);
            }
        }
        
    }
    else
    {
        XYCommonCell * XYcell =(XYCommonCell *) Currentcell;
        
        
        for (NSArray *aa in XYcell.SelectedArray)
        {
            for (NSArray *aaa in aa)
            {
                for (NSString *sss in aaa)
                {
                    NSLog(@"%@",sss);
                }
            }
        }
    }
    
    return nil;
}


@end
