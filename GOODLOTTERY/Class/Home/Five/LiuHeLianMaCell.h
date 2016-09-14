//
//  LiuHeLianMaCell.h
//  GOODLOTTERY
//
//  Created by apple on 16/8/6.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LiuHeLianMaCell : UITableViewCell
@property(nonatomic)NSInteger FaceNub;
@property(nonatomic)NSInteger WithFaceNub;
@property(nonatomic)CGFloat heightOddwith;//Face的高是宽的几倍
@property(nonatomic,strong)UIImage *ballImageNormal;
@property(nonatomic,strong)UIImage *ballImageSelected;

-(void)setButtonView;
-(void)setOddstring:(NSString *)Odd;
@end
