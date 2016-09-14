//
//  ColorKindView.m
//  GOODLOTTERY
//
//  Created by apple on 16/3/28.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "ColorKindView.h"
#import "DownListVIew.h"
#import "ColorKindCell.h"

@implementation ColorKindView
{
    UIButton * GameBut;
    UILabel *Gamelable;
    UIImageView *GameImage;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self setAllView];
    }
    return self;
}
- (void)setAllView
{

    GameBut  = [UIButton buttonWithType:UIButtonTypeCustom];
    GameBut.frame = CGRectMake(20*ScaleX, 10*ScaleY, UIScreenWIDTH-40*ScaleX,40*ScaleY);
    GameBut.layer.cornerRadius = 5;
    GameBut.layer.masksToBounds = YES;
    GameBut.titleLabel.adjustsFontSizeToFitWidth = YES;
    GameBut.titleLabel.font = [UIFont systemFontOfSize:15*ScaleY];
    [GameBut setTitle:@"默认游戏" forState:UIControlStateNormal];
   
    [GameBut setTitleColor:GETCOLOR(@"wb") forState:UIControlStateNormal];
    [GameBut setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"CheckHeardBack%ld",[SkinPeelerTool ReturnSkinpManger]]] forState:UIControlStateNormal];
    [GameBut setImage:[UIImage imageNamed:[NSString stringWithFormat:@"TitleRightImage%ld",[SkinPeelerTool ReturnSkinpManger]]] forState:UIControlStateNormal];
    
    [GameBut addTarget:self action:@selector(playAndgameBt:) forControlEvents:UIControlEventTouchUpInside];
    GameBut.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    GameBut.imageEdgeInsets = UIEdgeInsetsMake(0,UIScreenWIDTH-40*ScaleX-30*ScaleX,0, -10*ScaleX);
    [self addSubview:GameBut];

    
    [self setHeardView];
   
    
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0,90*ScaleY,UIScreenWIDTH,FRAMEHEIGHT-90*ScaleY)style:UITableViewStylePlain];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.bounces = NO;
    _tableView.backgroundColor = [UIColor clearColor];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self addSubview:_tableView];
    
}


- (void)setHeardView
{
    NSArray *array = @[@"玩法类型",@"玩法分类",@"基本奖金",@"返点"];
    UIView *heard = [[UIView alloc]initWithFrame:CGRectMake(0,60*ScaleY,UIScreenWIDTH,30*ScaleY)];
    heard.backgroundColor = [UIColor blackColor];
    for (int i = 0; i<4; i++)
    {
        UILabel *lable = [[UILabel alloc]initWithFrame:CGRectMake(UIScreenWIDTH/4*i,0,UIScreenWIDTH/4,30*ScaleY)];
        lable.text = array[i];
        lable.textColor = [UIColor whiteColor];
        lable.textAlignment = NSTextAlignmentCenter;
        lable.font = [UIFont systemFontOfSize:13*ScaleY];
        [heard addSubview:lable];
    }
    [self addSubview:heard];
}

- (void)playAndgameBt:(UIButton *)Bt
{
    UIWindow * window=[[[UIApplication sharedApplication] delegate] window];
    CGRect rect=[Bt convertRect: Bt.bounds toView:window];
    PullDownMenu *pullmenu = [[PullDownMenu alloc]initWithFrame:CGRectMake(rect.origin.x, rect.origin.y+rect.size.height, rect.size.width,30*4)];
    
    pullmenu.layer.borderColor = [UIColor groupTableViewBackgroundColor].CGColor;
    pullmenu.layer.borderWidth = 1;
    
    pullmenu.DatasArray = @[@"所有游戏",@"天津时时彩",@"广东11选5",@"北京快乐8"];
    
    pullmenu.GameNamestring = Bt.currentTitle;
    pullmenu.appearance.resultCallBack = ^(NSString * string)
    {
      [Bt  setTitle:string forState:UIControlStateNormal];
        
    };
    [pullmenu show];
    
}


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
    ColorKindCell *cell; static NSString *CellId = @"CellId";
    cell = [tableView dequeueReusableCellWithIdentifier:CellId];
    if (!cell)
    {
        cell = [[ColorKindCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellId];
    }
    cell.backgroundColor = GETCOLOR(@"cgroup");
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40;
}
@end
