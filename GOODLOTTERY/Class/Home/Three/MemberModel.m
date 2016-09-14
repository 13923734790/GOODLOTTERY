//
//  MemberModel.m
//  GOODLOTTERY
//
//  Created by apple on 16/3/3.
//  Copyright © 2016年 apple. All rights reserved.
//

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
#import "CashValueCtrl.h"
#import "TopUpViewCtrl.h"
#import "ColorKindCtrl.h"
#import "ActivityCtrl.h"
#import "MailBoxCtrl.h"
#import "withdrawalCtrl.h"
#import "ChangeDataCtrl.h"
#import "AnnouncementCtrl.h"
@implementation MemberModel
+(UIViewController *)PushCtrlID:(NSString *)string
{
    
    if ([string isEqualToString:@"充值"])
    {
        TopUpViewCtrl *ctrl =[[TopUpViewCtrl alloc]init];
        ctrl.titleString = @"充值";
        ctrl.Blockhidden = YES;
//        ctrl.hidesBottomBarWhenPushed = YES;
        return ctrl;
    }
    else if  ([string isEqualToString:@"提现"])
    {
        withdrawalCtrl *ctrl =[[withdrawalCtrl alloc]init];
        ctrl.Nub = 2;
        ctrl.titleString = @"流水审核";
//        ctrl.hidesBottomBarWhenPushed = YES;
        ctrl.Blockhidden = YES;
        return ctrl;
    }
    else if  ([string isEqualToString:@"Register"])
    {
        RegisterCtrl *ctrl =[[RegisterCtrl alloc]init];
//         ctrl.hidesBottomBarWhenPushed = YES;
        ctrl.Blockhidden = YES;
        return ctrl;
    }
    else if([string isEqualToString:@"彩票查询"])
    {
        LotteryCheckCtrl *ctrl =[[LotteryCheckCtrl alloc]init];
//        ctrl.hidesBottomBarWhenPushed = YES;
        ctrl.Blockhidden = YES;
        return ctrl;
    }
    else if ([string isEqualToString:@"追号查询"])
    {
        CatchViewCtrl *ctrl =[[CatchViewCtrl alloc]init];
//        ctrl.hidesBottomBarWhenPushed = YES;
        ctrl.Blockhidden = YES;
        return ctrl;
    }
    else if ([string isEqualToString:@"个人报表"])
    {
        ReportCtrl *ctrl =[[ReportCtrl alloc]init];
        ctrl.TitleName = @"个人报表";
        ctrl.kind = 1;
//        ctrl.hidesBottomBarWhenPushed = YES;
        ctrl.Blockhidden = YES;
        return ctrl;
    }
    else if ([string isEqualToString:@"团队报表"])
    {
        ReportCtrl *ctrl =[[ReportCtrl alloc]init];
        ctrl.TitleName = @"团队报表";
         ctrl.kind = 2;
//        ctrl.hidesBottomBarWhenPushed = YES;
        ctrl.Blockhidden = YES;
        return ctrl;
    }
    else if ([string isEqualToString:@"账变报表"])
    {
        CreditChangeCtrl *ctrl =[[CreditChangeCtrl alloc]init];
//        ctrl.hidesBottomBarWhenPushed = YES;
        ctrl.Blockhidden = YES;
        return ctrl;
    }
    else if ([string isEqualToString:@"修改密码"])
    {
        ChangePasswordCtrl *ctrl =[[ChangePasswordCtrl alloc]init];
        ctrl.PagIndex= 0;
//        ctrl.hidesBottomBarWhenPushed = YES;
        ctrl.Blockhidden = YES;
        return ctrl;
    }
    else if ([string isEqualToString:@"绑定银行卡"])
    {
        BankCardCtrl *ctrl =[[BankCardCtrl alloc]init];
        ctrl.Blockhidden = YES;
        return ctrl;
    }
    else if ([string isEqualToString:@"彩种信息"])
    {
        ColorKindCtrl *ctrl =[[ColorKindCtrl alloc]init];
        ctrl.Titlename = @"彩种信息";
        ctrl.Blockhidden = YES;
        return ctrl;
    }

    else if ([string isEqualToString:@"彩种限额"])
    {
        ColorKindCtrl *ctrl =[[ColorKindCtrl alloc]init];
        ctrl.Titlename = @"彩种限额";
        ctrl.Blockhidden = YES;
        return ctrl;

    }
    else if ([string isEqualToString:@"开奖结果"])
    {
        RunALotteryCtrl *ctrl =[[RunALotteryCtrl alloc]init];
//        ctrl.hidesBottomBarWhenPushed = YES;
        ctrl.Blockhidden = YES;
        return ctrl;
    }
    else if ([string isEqualToString:@"个人总览"])
    {
        PandectCtrl *ctrl =[[PandectCtrl alloc]init];
        ctrl.Kind = 1;
        ctrl.TitleString = @"个人总览";
//        ctrl.hidesBottomBarWhenPushed = YES;
        ctrl.Blockhidden = YES;
        return ctrl;
    }
    else if ([string isEqualToString:@"团队总览"])
    {
        PandectCtrl *ctrl =[[PandectCtrl alloc]init];
        ctrl.Kind = 2;
        ctrl.TitleString = @"团队总览";
//        ctrl.hidesBottomBarWhenPushed = YES;
        ctrl.Blockhidden = YES;
        return ctrl;
    }
    else if ([string isEqualToString:@"用户列表"])
    {
        UserListCtrl *ctrl =[[UserListCtrl alloc]init];
//        ctrl.hidesBottomBarWhenPushed = YES;
        ctrl.Blockhidden = YES;
        return ctrl;
    }
    else if ([string isEqualToString:@"推广注册"])
    {
        PromotedCtrl *ctrl =[[PromotedCtrl alloc]init];
//        ctrl.hidesBottomBarWhenPushed = YES;
        ctrl.Blockhidden = YES;
        return ctrl;
    }
    else if ([string isEqualToString:@"活动详情"])
    {
        ActivityCtrl *ctrl =[[ActivityCtrl alloc]init];
//        ctrl.hidesBottomBarWhenPushed = YES;
        ctrl.Blockhidden = YES;
        return ctrl;
    }
    else if ([string isEqualToString:@"密保设定"])
    {
        ChangePasswordCtrl *ctrl =[[ChangePasswordCtrl alloc]init];
        ctrl.PagIndex= 2;
//        ctrl.hidesBottomBarWhenPushed = YES;
        ctrl.Blockhidden = YES;
        return ctrl;
    }

    else if ([string isEqualToString:@"资料修改"])
    {
        ChangeDataCtrl *ctrl =[[ChangeDataCtrl alloc]init];
//        ctrl.hidesBottomBarWhenPushed = YES;
        ctrl.Blockhidden = YES;
        return ctrl;
    }
    else if ([string isEqualToString:@"站内短信"])
    {
        MailBoxCtrl *ctrl =[[MailBoxCtrl alloc]init];
//        ctrl.hidesBottomBarWhenPushed = YES;
        ctrl.titleString = @"收件箱";
        ctrl.Blockhidden = YES;
        return ctrl;
    }
    else if ([string isEqualToString:@"网站公告"])
    {
        AnnouncementCtrl *ctrl =[[AnnouncementCtrl alloc]init];
//        ctrl.hidesBottomBarWhenPushed = YES;
        ctrl.titleString = @"网站公告";
        ctrl.Blockhidden = YES;
        return ctrl;
    }

    
       return nil;
}
@end
