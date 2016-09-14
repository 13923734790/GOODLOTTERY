//
//  MarkSixDatas.h
//  GOODLOTTERY
//
//  Created by apple on 16/8/1.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface MarkSixDatas : NSObject
+(UITableViewCell *)shareGetCell:(NSString *)TitleString;
+(CGFloat)ShareReturnCellheight:(NSString *)TitleString;
+(NSDictionary *)ShareReturnFPtime:(NSString *)TitleString;
+(NSArray *)ShareReturnSeletedObjc:(NSString *)TitleString AndCurrentCell:(UITableViewCell *)Currentcell;
@end
