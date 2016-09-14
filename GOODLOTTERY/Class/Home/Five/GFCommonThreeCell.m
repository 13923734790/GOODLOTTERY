//
//  GFCommonThreeCell.m
//  GOODLOTTERY
//
//  Created by apple on 16/9/8.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "GFCommonThreeCell.h"
#import "GFCommonThreeView.h"
#import "GFThreeModel.h"
#import "OddAndNubModel.h"

@implementation GFCommonThreeCell
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
        
        GFThreeModel *model = _objArray[i];
        GFCommonThreeView *GFThreeView = [[GFCommonThreeView alloc]init];
        GFThreeView.BlcokSeletedArray = ^(NSArray *seletedArr)
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
        [self.contentView addSubview:GFThreeView];
        
        CGFloat XYheight = 20*ScaleY;
        if (model.quickArray)
        {
            XYheight = 55*ScaleY;
        }
        CGFloat  with = (UIScreenWIDTH-80*ScaleX-45*ScaleX)/3;
        if (model.objArray)
        {
            if (model.objArray.count%3)
            {
                XYheight =XYheight+with*(model.objArray.count/3)+with;
            }
            else
            {
                XYheight =XYheight+with*(model.objArray.count/3);
            }
            
        }
        GFThreeView.frame = CGRectMake(0, Ystart,UIScreenWIDTH,XYheight);
        Ystart = Ystart+XYheight;
        
        GFThreeView.titleName = model.titleName;
        if (model.quickArray)
        {
            GFThreeView.quickArray = model.quickArray;
        }
        if (model.objArray)
        {
            GFThreeView.objArray = model.objArray;
        }
        
    }
}


@end
