//
//  CatchViewCtrl.m
//  GOODLOTTERY
//
//  Created by apple on 16/3/8.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "CatchViewCtrl.h"
#import "LotteryCheckHeardView.h"
#import "CatchCheckView.h"
#import "CatchCheckDetailedCtrl.h"

@interface CatchViewCtrl ()

@end

@implementation CatchViewCtrl

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"追号详情";
//    [self CustomRight:@"菜单"];
    self.iamgeView.frame = CGRectMake(0,0, UIScreenWIDTH,UIScreenHEIGHT-20-NVHEIGHT);
    CatchCheckView *BsckView = [[CatchCheckView alloc]initWithFrame:CGRectMake(0, 0, UIScreenWIDTH,UIScreenHEIGHT-NVHEIGHT-20)];
    [self.view addSubview:BsckView];
    
    __weak CatchViewCtrl *BlockSelf = self;
    
    BsckView.SeletedCell = ^(NSString *string)
    {
        CatchCheckDetailedCtrl *ctrl = [[CatchCheckDetailedCtrl alloc]init];
        [BlockSelf.navigationController pushViewController:ctrl animated:YES];
    };

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
