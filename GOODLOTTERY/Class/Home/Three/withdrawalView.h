//
//  withdrawalView.h
//  GOODLOTTERY
//
//  Created by apple on 16/4/26.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface withdrawalView : UIView<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)void(^blcokCtrl)(UIViewController *_Ctrl);
@end
