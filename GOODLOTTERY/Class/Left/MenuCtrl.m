//
//  MenuCtrl.m
//  GOODLOTTERY
//
//  Created by apple on 16/1/22.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "MenuCtrl.h"
#import "YCHomeTabbarController.h"
#import "YCSettingViewController.h"
#import "YCServiceViewController.h"
#import "SkinPeelerTool.h"
#import "MenuHeardView.h"
#import "MenuCell.h"
#import "MenuModelCtrl.h"
#import "MenuManger.h"
#import "CashValueCtrl.h"
#import "withdrawalCtrl.h"

@interface MenuCtrl ()<UITableViewDataSource, UITableViewDelegate,SkinpeelerDelegate>
@property (nonatomic, strong) NSArray *lefs;
@property (nonatomic, assign) NSInteger previousRow;
@property (nonatomic, strong) NSArray *titleArray;
@end

@implementation MenuCtrl
{
    NSInteger  SelectedNub;
    NSArray *sonArray;
    BOOL IsHidden;
    MenuManger * menumanger;
}

- (void)updatas
{
    _titleArray =@[@"投注记录",@"报表管理",@"账户管理",@"代理管理",@"短息公告",@"退出登入"];
    sonArray = @[@[@"彩票查询",@"追号查询"],@[@"账变报表",@"个人报表",@"团队报表",@"优惠活动详情"],@[@"个人总览",@"密码管理",@"银行卡管理",@"资料修改",@"彩种信息",@"彩种限额"],@[@"团队总览",@"用户列表",@"注册管理",@"推广注册"],@[@"站内短信",@"网站公告"],@[]];
    SelectedNub = 99;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self updatas];
    // Do any additional setup after loading the view.
    self.Skindelegate =self;
    [self SkinpeelrNub];
    _tableView = [[UITableView alloc] init];
    _tableView.frame = CGRectMake(UIScreenWIDTH/4,20*ScaleY, UIScreenWIDTH*3/4,UIScreenHEIGHT-20*ScaleY);
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.bounces = NO;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;

    self.tableView.backgroundColor = [UIColor clearColor];
    //cell的高度
    CGFloat cellHeight =(UIScreenHEIGHT -UIScreenWIDTH*3/4/3-(15+5+5+40+20+10)*ScaleY)/10;
    MenuHeardView *heardView = [[MenuHeardView alloc]initWithFrame:CGRectMake(UIScreenWIDTH/4,0, UIScreenWIDTH*3/4,UIScreenWIDTH*3/4/3+(15+5+5+40)*ScaleY+cellHeight+10*ScaleY)];
    
    __weak MenuCtrl *blockSelf = self;
    heardView.BlockTopOut = ^(NSInteger Nub)
    {
        [blockSelf PushTopOutMoney:Nub];
    };
    self.tableView.tableHeaderView = heardView;
    [self.view addSubview:self.tableView];
    
}

- (void)PushTopOutMoney:(NSInteger)nub
{
    CashValueCtrl *Cash;
    withdrawalCtrl *DrawalCtrl;
    UINavigationController * Ctrl;
    if (nub==1)
    {
        if (!Cash)
        {
            Cash =[[CashValueCtrl alloc]init];
            Cash.Blockhidden = YES;
            Cash.titleString = @"充值";
            Ctrl = [[UINavigationController alloc] initWithRootViewController:Cash];
        }
    }
    else if (nub==2)
    {
        if (!DrawalCtrl)
        {
            DrawalCtrl =[[withdrawalCtrl alloc]init];
            DrawalCtrl.Nub = nub;
            DrawalCtrl.Blockhidden = YES;
            DrawalCtrl.titleString = @"提现";
            Ctrl = [[UINavigationController alloc] initWithRootViewController:DrawalCtrl];
        }
    }
    
   
    
    UITabBarController *TabbarCtrl = (UITabBarController *)self.sideMenuViewController.contentViewController;
    NSArray *arrControllers = TabbarCtrl.viewControllers;
    UINavigationController *navCtrl = (UINavigationController *)arrControllers[TabbarCtrl.selectedIndex];
    
    [navCtrl.viewControllers.lastObject presentViewController:Ctrl animated:YES completion:^{
    }];

}
//换肤代理
- (void)SkinpeelrNub
{
    NSArray *array = [SkinPeelerTool UpdataMenuImage]; 
    self.iamgeView.image = [UIImage imageNamed:array[0]];
}
//设置状态栏
- (BOOL)prefersStatusBarHidden
{
    return NO;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 6;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSArray *array = sonArray[section];
    if (SelectedNub==section)
    {
        return array.count;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * const cellid = @"cellid";
    MenuCell *cell = [tableView dequeueReusableCellWithIdentifier:cellid];
    if (!cell)
    {
    cell = [[MenuCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellid];
    }
//    cell.leftImage.image = [UIImage imageNamed:@"Center3"];
    cell.TitleLable.text = sonArray[indexPath.section][indexPath.row];
    cell.TitleLable.font = [UIFont boldSystemFontOfSize:15*ScaleY];
    cell.TitleLable.highlightedTextColor = [UIColor orangeColor];
    cell.selectedBackgroundView = [[UIView alloc] init];
    cell.backgroundColor = [UIColor clearColor];
    cell.BackView.backgroundColor = [UIColor colorWithRed:50/255.0 green:76/255.0 blue:99/255.0 alpha:0.3];
    return cell;
}

#pragma mark - Table view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    UIViewController *center;
    NSString *string;
    if (indexPath.section== 0)
    {
        if (indexPath.row==0) string = @"LotteryCheck";else string = @"CatchView";
        center = [MenuModelCtrl PushCtrlID:string];
    center = [[UINavigationController alloc] initWithRootViewController:center];

    }else if(indexPath.section== 1)
    {
        if (indexPath.row==0) string = @"CreditChange";
        if (indexPath.row==1) string = @"Report1";
        if (indexPath.row==2) string = @"Report2";
        if (indexPath.row==3) string = @"Activity";
        center = [MenuModelCtrl PushCtrlID:string];
        center = [[UINavigationController alloc] initWithRootViewController:center];
    }else if(indexPath.section == 2)
    {
        if (indexPath.row==0) string = @"Pandect1";
        if (indexPath.row==1) string = @"ChangePassword";
        if (indexPath.row==2) string = @"BankCard";
        if (indexPath.row==3) string = @"ChangeData";
        if (indexPath.row==4) string = @"ColorKind1";
        if (indexPath.row==5) string = @"ColorKind2";
        center = [MenuModelCtrl PushCtrlID:string];
        center = [[UINavigationController alloc] initWithRootViewController:center];
    }else if(indexPath.section == 3)
    {
        if (indexPath.row==0) string = @"Pandect2";
        if (indexPath.row==1) string = @"UserList";
        if (indexPath.row==2) string = @"Register";
        if (indexPath.row==3) string = @"Promoted";
        center = [MenuModelCtrl PushCtrlID:string];
        center = [[UINavigationController alloc] initWithRootViewController:center];
    }else
    {
        if (indexPath.row==0) string = @"MailBoxin";
        if (indexPath.row==1) string = @"AnnouncementCtrl";
        center = [MenuModelCtrl PushCtrlID:string];
        center = [[UINavigationController alloc] initWithRootViewController:center];
    }
    
    UITabBarController *TabbarCtrl = (UITabBarController *)self.sideMenuViewController.contentViewController;
    NSArray *arrControllers = TabbarCtrl.viewControllers;
    UINavigationController *navCtrl = (UINavigationController *)arrControllers[TabbarCtrl.selectedIndex];
    
//    NSLog(@"%@",navCtrl.viewControllers.lastObject);
//    for(UIViewController *viewCtrl in arrControllers)
//    {
//        if([viewCtrl  isKindOfClass:[UINavigationController class]])
//        {
//            UINavigationController *navCtrl = (UINavigationController *)viewCtrl;
//            NSLog(@"%@",[navCtrl.viewControllers]);
//        }
//    }
    
    
    [navCtrl.viewControllers.lastObject presentViewController:center animated:YES completion:^{
        }];
//    [self.sideMenuViewController hideMenuViewController];
    
//    [self.sideMenuViewController setContentViewController:center
//                                                 animated:YES];
    
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat cellHeight =(UIScreenHEIGHT -UIScreenWIDTH*3/4/3-(15+5+5+40+20+10)*ScaleY)/10;
    return cellHeight*3/4;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{   CGFloat cellHeight =(UIScreenHEIGHT -UIScreenWIDTH*3/4/3-(15+5+5+40+20+10)*ScaleY)/10;
    return cellHeight;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
        CGFloat cellHeight =(UIScreenHEIGHT -UIScreenWIDTH*3/4/3-(15+5+5+40+20+10)*ScaleY)/10;
        UIButton *view1 = [UIButton buttonWithType:UIButtonTypeCustom];
        view1.frame = CGRectMake(0,0, UIScreenWIDTH*3/4, cellHeight);
        view1.tag = 100+section;
        [view1 addTarget:self action:@selector(SelectedHeardView:) forControlEvents:UIControlEventTouchUpInside];
        view1.userInteractionEnabled = YES;
    
        UIView *View = [[UIView alloc]initWithFrame:CGRectMake(0, 1*ScaleY, UIScreenWIDTH*3/4, cellHeight-1*ScaleY)];
        View.userInteractionEnabled = NO;
        [view1 addSubview:View];
        UIImageView * _leftImage = [[UIImageView alloc]initWithFrame:CGRectMake(50*ScaleX,(cellHeight-30*ScaleY)/2,30*ScaleY,30*ScaleY)];
        [View addSubview:_leftImage];
        UIImageView *RightImage = [[UIImageView alloc]initWithFrame:CGRectMake(UIScreenWIDTH*3/4-35*ScaleY,(cellHeight-15*ScaleY)/2,15*ScaleY,15*ScaleY)];
        [View addSubview:RightImage];
        UILabel * _TitleLable = [[UILabel alloc]initWithFrame:CGRectMake(80*ScaleX, (cellHeight-20*ScaleY)/2, UIScreenWIDTH*3/4-115*ScaleX, 20*ScaleY)];
        [View addSubview:_TitleLable];
    
    
        RightImage.image = [UIImage imageNamed:@"TitleRightImage"];
        _TitleLable.textColor = [UIColor whiteColor];
        _TitleLable.textAlignment = NSTextAlignmentCenter;
        _leftImage.image = [UIImage imageNamed:[NSString stringWithFormat:@"Menu%ld",section+1]];
        _TitleLable.text = _titleArray[section];
        _TitleLable.font = [UIFont boldSystemFontOfSize:15];
        View.backgroundColor = DTAISCOLORE(255, 255, 255, 0.3);

    return view1;
}
- (void)SelectedHeardView:(UIButton *)bt
{
    if (bt.tag==105) [self.sideMenuViewController dismissViewControllerAnimated:NO completion:nil];
    if (SelectedNub==bt.tag-100)SelectedNub = 99;else SelectedNub = bt.tag-100;
    [_tableView reloadData];
//        [self.tableView reloadSections:[[NSIndexSet alloc] initWithIndex:bt.tag-100] withRowAnimation:UITableViewRowAnimationAutomatic];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//    [tableView deselectRowAtIndexPath:indexPath animated:NO];
//NSLog(@"%ld",bt.tag);
//UIViewController *center;
//if (bt.tag-100== 0) {
//    center = self.sideMenuViewController.mainController;
//}else if(bt.tag-100 == 1){
//    YCServiceViewController *service = [[YCServiceViewController alloc ] init];
//    center = [[UINavigationController alloc] initWithRootViewController:service];
//}else if(bt.tag-100 == 2){
//    YCFeedbackViewController *feedback = [[YCFeedbackViewController alloc ] init];
//    center = [[UINavigationController alloc] initWithRootViewController:feedback];
//    
//}else if(bt.tag-100 == 3){
//    //        YCSettingViewController *setting = [[YCSettingViewController alloc ] init];
//    //        center = [[UINavigationController alloc] initWithRootViewController:setting];
//    if (SelectedNub==3)SelectedNub = 99;else SelectedNub = 3;
//    
//    [self.tableView reloadSections:[[NSIndexSet alloc] initWithIndex:3] withRowAnimation:UITableViewRowAnimationAutomatic];
//    return;
//}else{
//    YCAboutViewController *about = [[YCAboutViewController alloc ] init];
//    center = [[UINavigationController alloc] initWithRootViewController:about];
//}
//[self.sideMenuViewController setContentViewController:center
//                                             animated:YES];
//[self.sideMenuViewController hideMenuViewController];
//self.previousRow = bt.tag-100;

@end
