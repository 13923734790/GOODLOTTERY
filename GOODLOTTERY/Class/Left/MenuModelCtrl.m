//
//  MenuModelCtrl.m
//  GOODLOTTERY
//
//  Created by apple on 16/3/22.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "MenuModelCtrl.h"

#import "MemberModel.h"
#import "RegisterCtrl.h"
#import "LotteryCheckCtrl.h"
#import "CatchViewCtrl.h"
#import "ReportCtrl.h"
#import "CreditChangeCtrl.h"
#import "ChangePasswordCtrl.h"
#import "BankCardCtrl.h"
#import "RunALotteryCtrl.h"
#import "PandectCtrl.h"
#import "UserListCtrl.h"
#import "PromotedCtrl.h"
#import "MailBoxCtrl.h"
#import "ActivityCtrl.h"
#import "ColorKindCtrl.h"
#import "ChangeDataCtrl.h"
#import "AnnouncementCtrl.h"
@implementation MenuModelCtrl
+(UIViewController *)PushCtrlID:(NSString *)string
{
    if ([string isEqualToString:@"Register"])
    {
        RegisterCtrl *ctrl =[[RegisterCtrl alloc]init];
        ctrl.Blockhidden = YES;
        return ctrl;
    }
    else if([string isEqualToString:@"LotteryCheck"])
    {
        LotteryCheckCtrl *ctrl =[[LotteryCheckCtrl alloc]init];
        ctrl.Blockhidden = YES;
        return ctrl;
    }
    else if ([string isEqualToString:@"CatchView"])
    {
        CatchViewCtrl *ctrl =[[CatchViewCtrl alloc]init];
        ctrl.Blockhidden = YES;
        return ctrl;
    }
    else if ([string isEqualToString:@"Report1"])
    {
        ReportCtrl *ctrl =[[ReportCtrl alloc]init];
        ctrl.TitleName = @"个人报表";
        ctrl.kind = 1;
        ctrl.Blockhidden = YES;
        return ctrl;
    }
    else if ([string isEqualToString:@"Report2"])
    {
        ReportCtrl *ctrl =[[ReportCtrl alloc]init];
        ctrl.TitleName = @"团队报表";
        ctrl.Blockhidden = YES;
        ctrl.kind = 2;

        return ctrl;
    }
    else if ([string isEqualToString:@"CreditChange"])
    {
        CreditChangeCtrl *ctrl =[[CreditChangeCtrl alloc]init];
        ctrl.Blockhidden = YES;
        return ctrl;
    }
    else if ([string isEqualToString:@"ChangePassword"])
    {
        ChangePasswordCtrl *ctrl =[[ChangePasswordCtrl alloc]init];
        ctrl.Blockhidden = YES;
        return ctrl;
    }
    else if ([string isEqualToString:@"BankCard"])
    {
        BankCardCtrl *ctrl =[[BankCardCtrl alloc]init];
        ctrl.Blockhidden = YES;
        return ctrl;
    }
    else if ([string isEqualToString:@"ColorKind1"])
    {
        ColorKindCtrl *ctrl =[[ColorKindCtrl alloc]init];
        ctrl.Titlename = @"彩种信息";
        ctrl.Blockhidden = YES;
        return ctrl;
    }
    
    else if ([string isEqualToString:@"ColorKind2"])
    {
        ColorKindCtrl *ctrl =[[ColorKindCtrl alloc]init];
        ctrl.Titlename = @"彩种限额";
        ctrl.Blockhidden = YES;
        return ctrl;
    }
    else if ([string isEqualToString:@"111"])
    {
        RunALotteryCtrl *ctrl =[[RunALotteryCtrl alloc]init];
        ctrl.Blockhidden = YES;
        return ctrl;
    }
    else if ([string isEqualToString:@"Pandect1"])
    {
        PandectCtrl *ctrl =[[PandectCtrl alloc]init];
        ctrl.Kind = 1;
        ctrl.TitleString = @"个人总览";
        ctrl.Blockhidden = YES;
        return ctrl;
    }
    else if ([string isEqualToString:@"Pandect2"])
    {
        PandectCtrl *ctrl =[[PandectCtrl alloc]init];
        ctrl.Kind = 2;
        ctrl.TitleString = @"团队总览";
        ctrl.Blockhidden = YES;
        return ctrl;
    }
    else if ([string isEqualToString:@"UserList"])
    {
        UserListCtrl *ctrl =[[UserListCtrl alloc]init];
        ctrl.Blockhidden = YES;
        return ctrl;
    }
    else if ([string isEqualToString:@"Promoted"])
    {
        PromotedCtrl *ctrl =[[PromotedCtrl alloc]init];
        ctrl.Blockhidden = YES;
        return ctrl;
    }
    else if ([string isEqualToString:@"MailBoxin"])
    {
        MailBoxCtrl *ctrl =[[MailBoxCtrl alloc]init];
        ctrl.Blockhidden = YES;
        ctrl.titleString = @"收件箱";
        return ctrl;
    }
    else if ([string isEqualToString:@"AnnouncementCtrl"])
    {
        AnnouncementCtrl *ctrl =[[AnnouncementCtrl alloc]init];
        ctrl.Blockhidden = YES;
        ctrl.titleString = @"网站公告";
        return ctrl;
    }
    else if ([string isEqualToString:@"Activity"])
    {
        ActivityCtrl *ctrl =[[ActivityCtrl alloc]init];
        ctrl.Blockhidden = YES;
        return ctrl;
    }
    else if ([string isEqualToString:@"ChangeData"])
    {
        ChangeDataCtrl *Ctrl = [[ChangeDataCtrl alloc]init];
        Ctrl.Blockhidden = YES;
        return Ctrl;
        
    }


    
    
    
    

    return nil;
}
@end

