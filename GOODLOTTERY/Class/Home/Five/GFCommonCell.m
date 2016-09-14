//
//  GFCommonCell.m
//  GOODLOTTERY
//
//  Created by apple on 16/8/24.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "GFCommonCell.h"
#import "GFCommonView.h"
#import "GFCellHeardView.h"
#import "GFCommonDSView.h"
#import "GFBallModel.h"
#import "OddAndNubModel.h"

@implementation GFCommonCell
{
    NSMutableArray *ViewArray;
    GFCellHeardView *heardView;
    GFCommonDSView *DSView;
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
    GFBallModel *model;
    
    if (objArray.count)
    {
        model = objArray[0];
        if (model.IsCellheard)
        {
            Ystart = 60*ScaleY;
            heardView = [[GFCellHeardView alloc]init];
            heardView.frame = CGRectMake(0, 0, UIScreenWIDTH, 60*ScaleY);
            [self.contentView addSubview: heardView];
            
        }
        if (model.IsDsCellHidden)
        {
            DSView = [[GFCommonDSView alloc]initWithFrame:CGRectMake(0,Ystart, UIScreenWIDTH,300*ScaleY)];
            [self.contentView addSubview:DSView];
            return;
        }
    }
    
    
    
    
    for (int i = 0;i<_objArray.count;i++)
    {
        NSArray *seletedArr = [NSArray array];
        [_SeletedArray addObject:seletedArr];
        
        
        GFBallModel *model = _objArray[i];
        
        GFCommonView *GFView = [[GFCommonView alloc]init];
        GFView.BlcokSeletedArray = ^(NSArray *seletedArr)
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
        [self.contentView addSubview:GFView];
        
        CGFloat XYheight = 20*ScaleY;
        if (model.quickArray)
        {
            XYheight = 55*ScaleY;
        }
        CGFloat  with = (UIScreenWIDTH-80*ScaleX)/5;
        if (model.objArray)
        {
            if (model.objArray.count%5)
            {
                XYheight =XYheight+with*(model.objArray.count/5)+with;
            }
            else
            {
                XYheight =XYheight+with*(model.objArray.count/5);
            }
            
        }
        if (model.allBallNub)
        {
            if (model.allBallNub%5)
            {
                XYheight =XYheight+ with*(model.allBallNub/5)+with;
            }
            else
            {
                XYheight =XYheight+ with*(model.allBallNub/5);
            }

        }
        GFView.frame = CGRectMake(0, Ystart,UIScreenWIDTH,XYheight);
        Ystart = Ystart+XYheight;
        
        
        GFView.titleName = model.titleName;
        if(model.isHaveClodHot)
        {
            ViewArray = [NSMutableArray arrayWithCapacity:5];
            GFView.isHaveClodHot = model.isHaveClodHot;
            GFView.BlockColdHot = ^(NSString *ColdHot)
            {
                if ([ColdHot isEqualToString:@"冷热"])
                {
                    for (GFCommonView *currentView in ViewArray)
                    {
                    currentView.coldHotArray = @[@"22",@"33",@"44",@"55",@"66",@"77",@"88",@"99",@"11",@"10"];
                    }
                }
                else{
                    for (GFCommonView *currentView in ViewArray)
                    {
                        currentView.coldHotArray = nil;
                    }
                }
            };
        }
        if (ViewArray)//储存每个View
        {
            [ViewArray addObject:GFView];
        }
        if (model.quickArray)
        {
            GFView.quickArray = model.quickArray;
        }
        if (model.objArray)
        {
            GFView.objArray = model.objArray;
        }
        if (model.allBallNub)
        {
            GFView.startBallNub = model.startBallNub;
            GFView.allBallNub = model.allBallNub;
        }
        
    }
}


@end
