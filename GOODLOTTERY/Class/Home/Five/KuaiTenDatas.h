//
//  KuaiTenDatas.h
//  GOODLOTTERY
//
//  Created by apple on 16/8/19.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KuaiTenDatas : NSObject
+(UITableViewCell *)shareGetCell:(NSString *)TitleString AndChildTitle:(NSString *)ChildString;
+(CGFloat)ShareGetCellHeight:(NSString *)TitleString AndChildTitle:(NSString *)ChildString;
@end
