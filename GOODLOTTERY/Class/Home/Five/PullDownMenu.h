//
//  PullDownMenu.h
//  GOODLOTTERY
//
//  Created by apple on 16/4/21.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PullDownMenuAppearance.h"

@interface PullDownMenu : UIView<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong, readonly)PullDownMenuAppearance *appearance;
@property (nonatomic,strong)NSArray *DatasArray;
@property (nonatomic, strong)NSString *GameNamestring;

- (void)reloadAppearance;
- (void)show;
- (void)hidden;
@end
