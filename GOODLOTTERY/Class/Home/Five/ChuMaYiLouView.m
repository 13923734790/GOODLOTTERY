//
//  ChuMaYiLouView.m
//  GOODLOTTERY
//
//  Created by apple on 16/8/29.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "ChuMaYiLouView.h"
#import "ChuMaYiLouHeardView.h"
#import "ChuMaYiLouCell.h"


@interface ChuMaYiLouView ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tableView;
@end
@implementation ChuMaYiLouView
{
    UIButton *titleBt;
    UILabel *LeftLable;
    UIButton *RightBut;
    ChuMaYiLouHeardView *heardView;
}
-(instancetype)init
{
    self = [super init];
    
    if (self)
    {
        [self appearance];
    }
    return self;
}

-(void)appearance
{
    self.backgroundColor = [UIColor blackColor];
    
    titleBt = [UIButton buttonWithType:UIButtonTypeCustom];
    titleBt.layer.cornerRadius = 2;
    titleBt.layer.masksToBounds = YES;
    titleBt.titleLabel.adjustsFontSizeToFitWidth = YES;
    
    titleBt.titleLabel.font = [UIFont boldSystemFontOfSize:15*ScaleY];
    titleBt.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    
    UIImageView *smallImage = [[UIImageView alloc]init];
    smallImage.frame = CGRectMake(60*ScaleX+3.5*ScaleX,(30*ScaleY-13*ScaleX)/2, 13*ScaleX, 13*ScaleX);
    smallImage.image = [UIImage imageNamed:@"TitleRightImage"];
    [titleBt addSubview:smallImage];
    //标题框左边向左移动了10个位子然后 右边向左移动了15个位子
    titleBt.titleEdgeInsets = UIEdgeInsetsMake(0,-10*ScaleX,0,10*ScaleX);
    //图标框左边向右移动了55个位子然后 右边向右移动了50个位子
    //    _pullRightBt.imageEdgeInsets = UIEdgeInsetsMake(0,80*ScaleX-20,0,-(80*ScaleX-30));
    
//    [titleBt setBackgroundImage:[CommonDatas createImageWithColor:DTAISCOLORE(255, 255, 255, 0.5)] forState:UIControlStateNormal];
    [titleBt setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [titleBt addTarget:self action:@selector(titleBtClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:titleBt];
    
    
    
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0,0, 0,0) style:UITableViewStylePlain];
    _tableView.bounces = NO;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.backgroundColor =[UIColor clearColor];
    _tableView.showsVerticalScrollIndicator = NO;
    [self addSubview:_tableView];
    
    heardView = [[ChuMaYiLouHeardView alloc]init];
    heardView.leftString = @"类型";
    heardView.rightArray = @[@"1期",@"2期",@"龙虎斗"];
    heardView.BlockUpdatas = ^(NSString *gameString)
    {
        NSLog(@"%@",gameString);
    };
    [self addSubview:heardView];
    
    
}


#pragma mark - TableViewDadegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    ChuMaYiLouCell *cell = [[ChuMaYiLouCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    cell.backgroundColor = [UIColor clearColor];
    cell.ObjString = @"总和大小@总单胆";
    cell.QiShuNub = 5;
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 30*ScaleY;
}


#pragma mark - 按钮和传值

-(void)setTitleString:(NSString *)titleString
{
    _titleString = titleString;
    [titleBt  setTitle:titleString forState:UIControlStateNormal];
}

-(void)layoutSubviews
{
    titleBt.frame = CGRectMake((CGRectGetWidth(self.frame)-80*ScaleX)/2,5*ScaleY,80*ScaleX,30*ScaleY);
    _tableView.frame = CGRectMake(0,70*ScaleY,CGRectGetWidth(self.frame),CGRectGetHeight(self.frame)-40*ScaleY);
    heardView.frame = CGRectMake(0,40*ScaleY, CGRectGetWidth(self.frame), 30*ScaleY);
}

-(void)titleBtClick:(UIButton *)bt
{
    
    UIWindow * window=[[[UIApplication sharedApplication] delegate] window];
    CGRect rect=[bt convertRect: bt.bounds toView:window];

    PullDownMenu *pullmenu = [[PullDownMenu alloc]initWithFrame:CGRectMake(rect.origin.x, rect.origin.y+rect.size.height, rect.size.width,30*2)];
    pullmenu.DatasArray = @[@"出码排行",@"遗漏排行"];
    pullmenu.GameNamestring = bt.currentTitle;
    pullmenu.appearance.resultCallBack = ^(NSString * string)
    {
    [bt  setTitle:string forState:UIControlStateNormal];
        
    };
    [pullmenu show];
    
}

@end
