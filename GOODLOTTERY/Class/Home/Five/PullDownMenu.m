//
//  PullDownMenu.m
//  GOODLOTTERY
//
//  Created by apple on 16/4/21.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "PullDownMenu.h"
#import "PullDownCell.h"

@implementation PullDownMenu
{
    UITableView *_PullDownMenu;
    UIButton    *_maskView;
    NSArray *datasArray;
}
- (instancetype)init
{
    if (self = [super init]) {
        [self commonInit];
    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self commonInit];
    }
    return self;
}
- (void)commonInit
{
    {
        _maskView = [UIButton buttonWithType:UIButtonTypeCustom];
    }
    {
        _appearance = [PullDownMenuAppearance new];
    }
    {
        _PullDownMenu = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, 0, 0) style:UITableViewStylePlain];
        [self addSubview:_PullDownMenu];
    }
    datasArray = _DatasArray;
    [self reloadAppearance];
    
}
- (void)reloadAppearance
{
    {
        _maskView.frame = [UIScreen mainScreen].bounds;
        [_maskView addTarget:self action:@selector(HiddeSelf) forControlEvents:UIControlEventTouchUpInside];
    }
    {
        self.backgroundColor =GETCOLOR(@"blr");
        self.layer.cornerRadius = 5;
        self.layer.masksToBounds = YES;
    }
    {
        _PullDownMenu.delegate = self;
        _PullDownMenu.dataSource =self;
        _PullDownMenu.backgroundColor = [UIColor clearColor];
        _PullDownMenu.separatorStyle = UITableViewCellSeparatorStyleNone;
        _PullDownMenu.bounces = NO;
        
        
    }
    
}

- (void)layoutSubviews
{
    CGFloat supWidth = self.frame.size.width;
    CGFloat supHeight = self.frame.size.height;
    {
    _PullDownMenu.frame = CGRectMake(0,0,supWidth,supHeight);
    }
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _DatasArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{   PullDownCell*cell; static NSString *CellID = @"CellID";
    cell = [tableView dequeueReusableCellWithIdentifier:CellID];
    if (!cell)
    {
        cell = [[PullDownCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellID];
    }
    cell.TextLB.text = _DatasArray[indexPath.row];
    if ([_DatasArray[indexPath.row] isEqualToString:_GameNamestring])
    {
        cell.RightView.image = [UIImage imageNamed:[NSString stringWithFormat:@"CatchSelected%ld",[SkinPeelerTool ReturnSkinpManger]]];
    }
    else
    {
        cell.RightView.image = nil;
    }
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 30*ScaleY;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (_appearance.resultCallBack)
    {
                _appearance.resultCallBack(_DatasArray[indexPath.row]);
    }
   [self hidden];
}


-(void)setDatasArray:(NSArray *)DatasArray
{
    _DatasArray = DatasArray;
    [_PullDownMenu reloadData];
}
- (void)HiddeSelf{
    
    [self hidden];
}
- (void)show
{
    [self reloadAppearance];
    
    [self animationWithView:self duration:0.3];
    _maskView.alpha= 0;
    [UIView animateWithDuration:0.25 animations:^{
        _maskView.alpha = 0.5;
    }];
    
    [[UIApplication sharedApplication].keyWindow addSubview:_maskView];
    [[UIApplication sharedApplication].keyWindow addSubview:self];
//    self.center = [UIApplication sharedApplication].keyWindow.center;
}
- (void)hidden
{   [_maskView removeFromSuperview];
    [self removeFromSuperview];
}

- (void)animationWithView:(UIView *)view duration:(CFTimeInterval)duration{
    
    CAKeyframeAnimation * animation;
    animation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    animation.duration = duration;
    animation.removedOnCompletion = NO;
    
    animation.fillMode = kCAFillModeForwards;
    NSMutableArray *values = [NSMutableArray array];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.1, 0.1, 1.0)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.2, 1.2, 1.0)]];
    //    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.9, 0.9, 0.9)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0, 1.0, 1.0)]];
    
    animation.values = values;
    animation.timingFunction = [CAMediaTimingFunction functionWithName: @"easeInEaseOut"];
    [view.layer addAnimation:animation forKey:nil];
}
@end
