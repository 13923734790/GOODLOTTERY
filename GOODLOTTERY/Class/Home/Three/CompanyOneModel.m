//
//  CompanyOneModel.m
//  GOODLOTTERY
//
//  Created by apple on 16/5/11.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "CompanyOneModel.h"

@implementation CompanyOneModel
- (instancetype)init
{
    self = [super init];
    if (self)
    {
        [self CurrentValue];
    }
    return self;
}
- (void)CurrentValue
{ 
    _incomeBank = @"微信";
    _websiteKind = @"请先添加帐户为微信好友后转帐";
    _payeeName = @"HChaocai1";
    _BankName = @"微信";
    _AccountNb = @"HChaocai1";
    _OrderID = @"201605090019";
    _Currenttime = @"2016/05/06 17:18:36";
    _depositBank = @"微信转账";
}
@end
