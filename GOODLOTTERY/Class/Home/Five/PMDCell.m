//
//  PMDCell.m
//  GOODLOTTERY
//
//  Created by apple on 16/1/22.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "PMDCell.h"
#import "BBFlashCtntLabel.h"

@implementation PMDCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
        self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
        if (self)
        {
            
            UIImageView *suonaImage = [[UIImageView alloc]initWithFrame:CGRectMake(10*ScaleY,7, 16*ScaleY, 16*ScaleY)];
            suonaImage.image = [UIImage imageNamed:@"suona"];
            [self addSubview:suonaImage];
            
            self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"PMDKing1"]];
            BBFlashCtntLabel *lbl = [[BBFlashCtntLabel alloc]initWithFrame:CGRectMake(30*ScaleY, 7*ScaleY, UIScreenWIDTH-30*ScaleY, 16*ScaleY)];
            lbl.textColor = [UIColor whiteColor];
            [self.contentView addSubview:lbl];
            
            
                      lbl.leastInnerGap = 50.f;
//                    lbl.repeatCount = 5;
//                    lbl.speed = BBFlashCtntSpeedSlow;
//            
                     lbl.speed = BBFlashCtntSpeedMild;
            
//                    lbl.speed = BBFlashCtntSpeedFast;
            
                
            
//                    lbl.font = [UIFont systemFontOfSize:25];
        
//                    NSMutableAttributedString *att = [[NSMutableAttributedString alloc] initWithString:str];
//                    [att addAttribute:NSFontAttributeName
//                                value:[UIFont systemFontOfSize:25]
//                                range:NSMakeRange(0, 5)];
//                    [att addAttribute:NSFontAttributeName
//                                value:[UIFont systemFontOfSize:17]
//                                range:NSMakeRange(15, 5)];
//                    [att addAttribute:NSBackgroundColorAttributeName
//                                value:[UIColor cyanColor]
//                                range:NSMakeRange(0, 15)];
//                    [att addAttribute:NSForegroundColorAttributeName
//                                value:[UIColor redColor]
//                                range:NSMakeRange(8, 7)];
//                    lbl.attributedText = att;
            
//                    lbl.textColor = [UIColor greenColor];
//                    lbl.text = @"少量文字";
            lbl.text =  @"测试文字。来来；‘了哈哈😄^_^abcdefg123456👿66666666666,中奖中奖了";
            
        
            
            }
        return self;

}

@end
