//
//  PandectCtrl.m
//  GOODLOTTERY
//
//  Created by apple on 16/3/17.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "PandectCtrl.h"
#import "PandectView.h"
#import "SearchVIew.h"

@interface PandectCtrl ()

@end

@implementation PandectCtrl
{
    PandectView *PView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = _TitleString;
    self.iamgeView.frame = CGRectMake(0,0, UIScreenWIDTH,UIScreenHEIGHT-20-NVHEIGHT);
    PView = [[PandectView alloc]initWithFrame:CGRectMake(0, 0, UIScreenWIDTH,UIScreenHEIGHT-NVHEIGHT-20)AndKind:_Kind];
    PView.backgroundColor = GETCOLOR(@"cw");
    [self.view addSubview:PView];
    

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end

