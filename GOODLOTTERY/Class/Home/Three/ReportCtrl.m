//
//  ReportCtrl.m
//  GOODLOTTERY
//
//  Created by apple on 16/3/10.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "ReportCtrl.h"
#import "ReportView.h"


@interface ReportCtrl ()

@end

@implementation ReportCtrl
- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.title = _TitleName;
    self.iamgeView.frame = CGRectMake(0,0, UIScreenWIDTH,UIScreenHEIGHT-20-NVHEIGHT);
    ReportView *BsckView = [[ReportView alloc]initWithFrame:CGRectMake(0, 0, UIScreenWIDTH,UIScreenHEIGHT-NVHEIGHT-20)];
    BsckView.Kind = _kind;
    [self.view addSubview:BsckView];
}

    
   
@end
