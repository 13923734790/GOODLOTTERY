//
//  UserListPushModel.m
//  GOODLOTTERY
//
//  Created by apple on 16/4/7.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "UserListPushModel.h"
#import "UserListDetailedCtrl.h"
#import "TransferCtrl.h"
#import "PandectCtrl.h"
#import "DealbaseCtrl.h"
#import "CreditChangeCtrl.h"
#import "PESetingCtrl.h"

@implementation UserListPushModel
+(UIViewController *)returnCtrl:(NSString *)TitleString
{
    
    
    if([TitleString isEqualToString:@"详情"])
    {
        UserListDetailedCtrl *ctrl = [[UserListDetailedCtrl alloc]init];
        return ctrl;
    }
    else if ([TitleString isEqualToString:@"团队总览"])
    {
        
        PandectCtrl *Ctrl = [[PandectCtrl alloc]init];
        Ctrl.TitleString = @"团队总览";
        Ctrl.Kind = 2;
        return Ctrl;
    }
    else if ([TitleString isEqualToString:@"返点设定"])
    {
        DealbaseCtrl *Ctrl = [[DealbaseCtrl alloc]init];
        return Ctrl;
    }
    else if ([TitleString isEqualToString:@"配额设定"])
    {
        PESetingCtrl *Ctrl = [[PESetingCtrl alloc]init];
        return Ctrl;

    }
    else if ([TitleString isEqualToString:@"账变记录"])
    {
        CreditChangeCtrl *Ctrl = [[CreditChangeCtrl alloc]init];
        return Ctrl;
    }
    else if ([TitleString isEqualToString:@"转账"])
    {
        
        TransferCtrl *Ctrl = [[TransferCtrl alloc]init];
        return Ctrl;
    }

    return nil;
}
@end
