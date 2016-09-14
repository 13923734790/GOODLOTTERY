//
//  MenuManger.h
//  GOODLOTTERY
//
//  Created by apple on 16/4/5.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface MenuManger : NSObject
@property(nonatomic,strong)UIViewController *Ctrl;
@property(nonatomic,assign)NSInteger Tabbarindex;
+(instancetype)ShareMenuManger;
@end
