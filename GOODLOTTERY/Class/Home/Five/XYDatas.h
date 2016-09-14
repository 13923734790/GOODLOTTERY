//
//  XYDatas.h
//  GOODLOTTERY
//
//  Created by apple on 16/8/16.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XYDatas : NSObject

+(NSArray *)shareXYTitleViewArray:(NSString *)GameTitle;
+(UITableViewCell *)shareGetCell:(NSString *)TitleString AndChildTitle:(NSString *)ChildTitle;
+(CGFloat)ShareReturnCellheight:(NSString *)TitleString AndChildTitle:(NSString *)ChildTitle;
+(NSDictionary *)ShareReturnFPtime:(NSString *)TitleString AndChildTitle:(NSString *)ChildTitle;
+(NSArray *)ShareReturnAllSeletedObjc:(NSString *)TitleString AndChildTitle:(NSString *)ChildTitle AndCurrentCell:(UITableViewCell *)Currentcell;
@end
