//
//  AuthcodeView.h
//  GoodBetKeno1
//
//  Created by apple on 16/1/5.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AuthcodeView : UIView
@property(nonatomic,strong)NSString *CurrentGUID;
- (void)getAuthcode;
@end
