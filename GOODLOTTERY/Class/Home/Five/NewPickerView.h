//
//  NewPickerView.h
//  GOODLOTTERY
//
//  Created by apple on 16/3/23.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewPickerView : UIView<UIPickerViewDelegate,UIPickerViewDataSource>

@property (nonatomic, strong)  UIPickerView *pickerTitle;
@property (nonatomic)NSInteger leftNub;
@property (nonatomic)NSInteger MiddleNub;
@property (nonatomic)NSInteger rightNub;


@property (nonatomic, strong)void(^leftAndMiddleAndRightNSIntegerDic)(NSDictionary *dic);

- (instancetype)initWithFrame:(CGRect)frame andLeftNub:(NSInteger)left andMiddleNub:(NSInteger)middle andRightNub:(NSInteger)right and:(NSArray *)ModelArray;
-(void)updatas:(NSArray *)array;
@end
