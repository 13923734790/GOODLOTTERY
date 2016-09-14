//
//  NumbersCustomsField.h
//  GOODLOTTERY
//
//  Created by apple on 16/4/22.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger,CustomFieldType)
{
    PureDigitType = 99,
    DigitAndLetterType,
};

@interface NumbersCustomsField : UITextField<UITextFieldDelegate>

@property(nonatomic, assign)NSInteger BitNub;
@property(nonatomic,assign)CustomFieldType FieldType;
@end
