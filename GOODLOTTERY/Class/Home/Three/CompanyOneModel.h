//
//  CompanyOneModel.h
//  GOODLOTTERY
//
//  Created by apple on 16/5/11.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void (^KSDateResult)();
@interface CompanyOneModel : NSObject

@property(nonatomic,copy)NSString *incomeBank;
@property(nonatomic,copy)NSString *websiteKind;
@property(nonatomic,copy)NSString *payeeName;
@property(nonatomic,copy)NSString *BankName;
@property(nonatomic,copy)NSString *AccountNb;
@property(nonatomic,copy)NSString *OrderID;
@property(nonatomic,copy)NSString *Currenttime;
@property(nonatomic,copy)NSString *depositBank;
@property (nonatomic, copy) KSDateResult  resultCellBack;

@end
