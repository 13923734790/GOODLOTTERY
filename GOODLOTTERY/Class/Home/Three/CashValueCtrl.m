//
//  CashValueCtrl.m
//  GOODLOTTERY
//
//  Created by apple on 16/3/25.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "CashValueCtrl.h"
#import "CashValueView.h"

@interface CashValueCtrl()
@end
@implementation CashValueCtrl
{
    CashValueView *CashView;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = _titleString;
    self.iamgeView.frame = CGRectMake(0,0, UIScreenWIDTH,UIScreenHEIGHT-20-NVHEIGHT);
    
    CashView = [[CashValueView alloc]initWithFrame:CGRectMake(0, 0,UIScreenWIDTH,UIScreenHEIGHT-NVHEIGHT-20)];
    [self.view addSubview:CashView];

}
@end
