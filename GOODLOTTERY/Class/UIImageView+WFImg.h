//
//  UIImageView+WFImg.h
//  GOODLOTTERY
//
//  Created by apple on 16/4/15.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^WFWebImageCompletionWithFinishedBlock)(UIImage *image);

@interface UIImageView (WFImg)

- (void)wf_setImageWithUrlString:(NSString *)urlString placeholderImage:(UIImage *)placeHolderImage;

- (void)wf_setImageWithUrlString:(NSString *)urlString placeholderImage:(UIImage *)placeHolderImage completed:(WFWebImageCompletionWithFinishedBlock)completedBlock;

@end
