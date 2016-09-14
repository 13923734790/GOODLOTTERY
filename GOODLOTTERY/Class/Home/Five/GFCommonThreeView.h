//
//  GFCommonThreeView.h
//  GOODLOTTERY
//
//  Created by apple on 16/9/8.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GFCommonThreeView : UIView
@property(nonatomic,copy)NSString *titleName;
@property(nonatomic,strong)NSArray *quickArray;//快速选择
@property(nonatomic,strong)NSArray *objArray;
@property(nonatomic,strong)void(^BlcokSeletedArray)(NSArray *SeletedArray);
@end
