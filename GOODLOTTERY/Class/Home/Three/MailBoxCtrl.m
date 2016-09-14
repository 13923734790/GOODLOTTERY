//
//  MailBoxCtrl.m
//  GOODLOTTERY
//
//  Created by apple on 16/3/22.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "MailBoxCtrl.h"
#import "MailBoxView.h"

@interface MailBoxCtrl()
@end
@implementation MailBoxCtrl
{
    MailBoxView *mailView;
}
- (void)viewDidLoad
{[super viewDidLoad];
    
    self.title = _titleString;
//    [self CustomRight:@"菜单"];
    mailView = [[MailBoxView alloc]initWithFrame:CGRectMake(0,0, UIScreenWIDTH,UIScreenHEIGHT-NVHEIGHT-20) AndName:_titleString];
    mailView.backgroundColor = GETCOLOR(@"cw");
    [self.view addSubview:mailView];
}

@end
