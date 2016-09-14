//
//  PandectView.h
//  GOODLOTTERY
//
//  Created by apple on 16/3/17.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SearchVIew;
@interface PandectView : UIView
- (instancetype)initWithFrame:(CGRect)frame AndKind:(NSInteger)kind;
@property(nonatomic, strong) SearchVIew *Sview;
@end
