//
//  GFBallModel.h
//  GOODLOTTERY
//
//  Created by apple on 16/8/25.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GFBallModel : NSObject

@property(nonatomic,copy)NSString *titleName;
@property(nonatomic,strong)NSArray *quickArray;//快速选择
@property(nonatomic)NSInteger startBallNub;
@property(nonatomic)NSInteger  allBallNub;
@property(nonatomic,strong)NSArray *objArray;
@property(nonatomic)BOOL isHaveClodHot;
@property(nonatomic)BOOL IsCellheard;
@property(nonatomic)BOOL IsDsCellHidden;
@end
