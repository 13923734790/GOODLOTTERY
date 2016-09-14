//
//  MailBoxView.m
//  GOODLOTTERY
//
//  Created by apple on 16/3/22.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "MailBoxView.h"
#import "InOutBoxView.h"

@implementation MailBoxView
{
    UISegmentedControl *segment;
    InOutBoxView *  inoutView;
}
- (instancetype)initWithFrame:(CGRect)frame AndName:(NSString *)name
{
    self = [super initWithFrame:frame];
    if (self)
    {
        segment = [[UISegmentedControl alloc]initWithItems:@[@"收件箱",@"发件箱"]];
        segment.frame = CGRectMake(10*ScaleX, 10*ScaleY, UIScreenWIDTH-20*ScaleX, 45*ScaleY);
        segment.selectedSegmentIndex = 0;
        NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName,[UIFont systemFontOfSize:15*ScaleY],NSFontAttributeName ,nil];
        [segment setTitleTextAttributes:dic forState:UIControlStateSelected];
        [segment addTarget:self action:@selector(SegmentChange:) forControlEvents:UIControlEventValueChanged];
        [self addSubview:segment];
        segment.tintColor = GETCOLOR(@"qbsb");
        
        inoutView = [[InOutBoxView alloc]initWithFrame:CGRectMake(0, 65*ScaleY,UIScreenWIDTH,FRAMEHEIGHT-65*ScaleY)AndName:name];
        [self addSubview:inoutView];
    }
    return self;
}

- (void)SegmentChange:(UISegmentedControl *)seg
{
    NSLog(@"%ld",seg.selectedSegmentIndex);
    inoutView.InoutInt = seg.selectedSegmentIndex;
}
@end
