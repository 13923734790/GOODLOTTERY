//
//  CompanyCellOne.h
//  GOODLOTTERY
//
//  Created by apple on 16/5/11.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CompanyOneModel.h"

@interface CompanyCellOne : UITableViewCell
@property (nonatomic,strong)void(^BlockNext)(NSArray *aary);
@property (nonatomic, strong, readonly)CompanyOneModel*CompanyModel;

@end
