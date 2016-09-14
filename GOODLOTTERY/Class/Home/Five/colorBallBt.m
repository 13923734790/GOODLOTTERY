//
//  colorBallBt.m
//  GOODLOTTERY
//
//  Created by apple on 16/8/15.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "colorBallBt.h"

@implementation colorBallBt


-(void)setBallTitle:(NSString *)Nubstring
{
    
    [self setTitle:Nubstring forState:UIControlStateNormal];
    //  固定颜色的区分
    NSArray * ColorArry = @[@"1",@"1",@"2",@"2",@"3",@"3",@"1",@"1",@"2",@"2",@"3",@"1",@"1",@"2",@"2",@"3",@"3",@"1",@"1",@"2",@"3",@"3",@"1",@"1",@"2",@"2",@"3",@"3",@"1",@"1",@"2",@"3",@"3",@"1",@"1",@"2",@"2",@"3",@"3",@"1",@"2",@"2",@"3",@"3",@"1",@"1",@"2",@"2",@"3"];
    
    NSInteger index = [Nubstring integerValue]-1;
    if ([ColorArry[index] isEqualToString:@"1"])
    {
        [self setBackgroundImage:[CommonDatas createImageWithColor:[UIColor redColor]] forState:UIControlStateNormal];
        [self setBackgroundImage:[CommonDatas createImageWithColor:[UIColor yellowColor]] forState:UIControlStateSelected];
    }
    if ([ColorArry[index] isEqualToString:@"2"]) {
        [self setBackgroundImage:[CommonDatas createImageWithColor:[UIColor blueColor]] forState:UIControlStateNormal];
        [self setBackgroundImage:[CommonDatas createImageWithColor:[UIColor yellowColor]] forState:UIControlStateSelected];
    }
    if ([ColorArry[index] isEqualToString:@"3"]) {
        
        [self setBackgroundImage:[CommonDatas createImageWithColor:[UIColor greenColor]] forState:UIControlStateNormal];
        [self setBackgroundImage:[CommonDatas createImageWithColor:[UIColor yellowColor]] forState:UIControlStateSelected];
    }
    
    
}
@end
