//
//  GFDatas.h
//  GOODLOTTERY
//
//  Created by apple on 16/8/24.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GFDatas : NSObject
+(UITableViewCell *)shareGetCell:(NSString *)TitleString AndChildDic:(NSDictionary *)ChildDic;
+(CGFloat)ShareReturnCellheight:(NSString *)TitleString AndChildDic:(NSDictionary *)ChildDic;
+(NSDictionary *)ShareReturn:(NSArray *)allObjArray;
@end
