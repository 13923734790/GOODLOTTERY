//
//  PromptBoxAppearance.h
//  GOODLOTTERY
//
//  Created by apple on 16/4/22.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface PromptBoxAppearance : NSObject

@property(nonatomic,strong)UIColor *BorderColor;
@property(nonatomic,assign)CGFloat  BorderWithl;
@property(nonatomic,strong)UIColor *BackgroundColor;
@property(nonatomic,copy)NSString *textString;
@property(nonatomic,strong)UIFont *font;
@property(nonatomic,strong)UIColor *textColor;
@end
