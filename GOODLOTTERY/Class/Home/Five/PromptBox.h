//
//  PromptBox.h
//  GOODLOTTERY
//
//  Created by apple on 16/4/22.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PromptBoxAppearance.h"

@interface PromptBox : UIView
@property (nonatomic, strong)PromptBoxAppearance *appearance;
@property (nonatomic,strong)NSString *DataString;
@property (nonatomic,strong)UIView *PromptView;


- (void)reloadAppearance;
- (void)show;
- (void)hidden;
@end
