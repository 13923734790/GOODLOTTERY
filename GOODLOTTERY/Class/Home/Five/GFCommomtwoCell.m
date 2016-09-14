//
//  GFCommomtwoCell.m
//  GOODLOTTERY
//
//  Created by apple on 16/9/7.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "GFCommomtwoCell.h"
#import "GFCommonTwoView.h"
#import "GFTwoModel.h"
#import "OddAndNubModel.h"

@implementation GFCommomtwoCell
{
    NSMutableArray *ViewArray;
    OddAndNubModel *Nubmodel;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        self.backgroundColor = [UIColor clearColor];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        Nubmodel = [OddAndNubModel shareOddAndNubModel];
    }
    return self;
}

-(void)setObjArray:(NSArray *)objArray
{
    _objArray = objArray;
    _SeletedArray = [NSMutableArray arrayWithCapacity:5];
    CGFloat Ystart = 0;
    
    for (int i = 0;i<_objArray.count;i++)
    {
        NSArray *seletedArr = [NSArray array];
        [_SeletedArray addObject:seletedArr];
        
        GFTwoModel *model = _objArray[i];
        GFCommonTwoView *GFTwoView = [[GFCommonTwoView alloc]init];
        GFTwoView.BlcokSeletedArray = ^(NSArray *seletedArr)
        {
            _SeletedArray[i] = seletedArr;
            
            Nubmodel.Nub = 0;
            for (NSArray *array in _SeletedArray)
            {
                Nubmodel.Nub = Nubmodel.Nub+ array.count;
            }
            NSDictionary *dic = [NSDictionary dictionaryWithObject:_SeletedArray forKey:@"ArrayNub"];
            NSNotification *notifion = [NSNotification notificationWithName:@"ChangeArrayNub" object:nil userInfo:dic];
            [[NSNotificationCenter defaultCenter] postNotification:notifion];
            
        };
        [self.contentView addSubview:GFTwoView];
        
        CGFloat XYheight = 20*ScaleY;
        if (model.quickArray)
        {
            XYheight = 55*ScaleY;
        }
        CGFloat  with = (UIScreenWIDTH-80*ScaleX)/2;
        if (model.objArray)
        {
            if (model.objArray.count%2)
            {
                XYheight =XYheight+with/3*(model.objArray.count/2)+with/3;
            }
            else
            {
                XYheight =XYheight+with/3*(model.objArray.count/2);
            }
            
        }
        GFTwoView.frame = CGRectMake(0, Ystart,UIScreenWIDTH,XYheight);
        Ystart = Ystart+XYheight;
        
        GFTwoView.titleName = model.titleName;
        if (model.quickArray)
        {
            GFTwoView.quickArray = model.quickArray;
        }
        if (model.objArray)
        {
            GFTwoView.objArray = model.objArray;
        }
        
    }
}


@end
