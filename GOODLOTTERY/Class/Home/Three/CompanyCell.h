//
//  CompanyCell.h
//  GOODLOTTERY
//
//  Created by apple on 16/5/11.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CompanyCell : UITableViewCell
@property (nonatomic,strong)void(^BlockNext)(NSArray *aary);
@end
