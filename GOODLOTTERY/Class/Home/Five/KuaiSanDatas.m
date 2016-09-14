//
//  KuaiSanDatas.m
//  GOODLOTTERY
//
//  Created by apple on 16/8/19.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "KuaiSanDatas.h"
#import "XYCommonCell.h"
#import "DragonTigerCell.h"
#import "XYCommonModel.h"

@implementation KuaiSanDatas
+(UITableViewCell *)shareGetCell:(NSString *)TitleString
{
    UITableViewCell *cell;
    XYCommonCell * XYcell = [[XYCommonCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    XYcell.ModelArray = [self ShareGetUIModel:TitleString];
    cell = XYcell;

    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.backgroundColor = [UIColor clearColor];
    
    return cell;
}

//计算高度
+(CGFloat)ShareGetCellHeight:(NSString *)TitleString
{
    
    NSArray *array =  [self ShareGetUIModel:TitleString];
    CGFloat Ystart = 0.0;
    for (int i = 0; i<array.count; i++)
    {
        
        CGFloat XYheight = 0;
        XYCommonModel *XYModel = (XYCommonModel *)array[i];
        if (XYModel.TitleName)
        {
            XYheight = 30*ScaleY;
        }
        if (XYModel.OneFaceArray)
        {
            //计算两面高度
            CGFloat  Facewith = ((UIScreenWIDTH-10*ScaleX)-(XYModel.OneWidthFaceNub-1)*ScaleX)/XYModel.OneWidthFaceNub;
            CGFloat FaceHeight = Facewith*XYModel.OnehieghtOddwidth;
            
            NSInteger faceNub = XYModel.OneFaceArray.count;
            NSInteger FaceheightNub= faceNub/XYModel.OneWidthFaceNub;
            if (faceNub%XYModel.OneWidthFaceNub)
            {
                FaceheightNub =FaceheightNub+1;
            }
            
            XYheight = XYheight +1*ScaleY+(FaceHeight+1*ScaleY)*FaceheightNub;
        }

        if (XYModel.BallNub)
        {
            //计算球所站的高度
            CGFloat  ballwith = (UIScreenWIDTH-40*ScaleX)/7;
            NSInteger heightNub= XYModel.BallNub/XYModel.WidthBallNub;
            if (XYModel.BallNub%XYModel.WidthBallNub)
            {
                heightNub =heightNub+1;
            }
            XYheight = XYheight +5*ScaleY+(ballwith+5*ScaleY)*heightNub;
            
        }
        if (XYModel.TwoFaceArray)
        {
            //计算两面高度
            CGFloat  Facewith = ((UIScreenWIDTH-10*ScaleX)-(XYModel.TwoWidthFaceNub-1)*ScaleX)/XYModel.TwoWidthFaceNub;
            CGFloat FaceHeight = Facewith*XYModel.TwohieghtOddwidth;
            
            NSInteger faceNub = XYModel.TwoFaceArray.count;
            NSInteger FaceheightNub= faceNub/XYModel.TwoWidthFaceNub;
            if (faceNub%XYModel.TwoWidthFaceNub)
            {
                FaceheightNub =FaceheightNub+1;
            }
            XYheight = XYheight +1*ScaleY+(FaceHeight+1*ScaleY)*FaceheightNub;
        }
        
        Ystart = Ystart +XYheight;
    }
    
    
    return Ystart;
}


//界面不同数据
+(NSArray *)ShareGetUIModel:(NSString *)ChildString
{
    
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:5];
    
    if ([ChildString isEqualToString:@"大小骰宝"])
    {
        NSArray *titleArray = @[@"三军,大小",@"全骰,围骰",@"长牌",@"短牌",@"点数"];
        for (int i = 0; i<5; i++)
        {
            XYCommonModel *XYModel = [[XYCommonModel alloc]init];
            XYModel.TitleName = titleArray[i];
            if (i==0)
            {
                XYModel.OneWidthFaceNub = 3;
                XYModel.OnehieghtOddwidth =0.4;
                XYModel.OneFaceArray = @[@"特单",@"特双",@"特大",@"特小",@"特大",@"特小"];
                
                XYModel.TwoWidthFaceNub = 2;
                XYModel.TwohieghtOddwidth =0.25;
                XYModel.TwoFaceArray = @[@"特单",@"特双"];
            }
            else if (i==1)
            {
                XYModel.OneWidthFaceNub = 1;
                XYModel.OnehieghtOddwidth =0.125;
                XYModel.OneFaceArray = @[@"特单"];
                
                XYModel.TwoWidthFaceNub = 3;
                XYModel.TwohieghtOddwidth =0.4;
                XYModel.TwoFaceArray = @[@"特单",@"特双",@"特大",@"特小",@"特大",@"特小"];

            }
            else if (i==2)
            {
                XYModel.OneWidthFaceNub = 3;
                XYModel.OnehieghtOddwidth =0.4;
                XYModel.OneFaceArray = @[@"特单",@"特双",@"特大",@"特小",@"特大",@"特小",@"特双",@"特大",@"特小",@"特大",@"特小",@"特双",@"特大",@"特小",@"特大",@"特小"];
                
            }
            else if (i==3)
            {
                XYModel.OneWidthFaceNub = 3;
                XYModel.OnehieghtOddwidth =0.4;
                XYModel.OneFaceArray = @[@"特单",@"特双",@"特大",@"特小",@"特大",@"特小"];
                
            }
            else if (i==4)
            {
                XYModel.OneWidthFaceNub = 3;
                XYModel.OnehieghtOddwidth =0.4;
                XYModel.OneFaceArray = @[@"4点",@"5点",@"6点",@"7点",@"8点",@"9点",@"10点",@"11点",@"12点",@"13点",@"14点",@"15点",@"16点",@"17点"];
                
            }


            [array addObject:XYModel];
            
        }
        
    }
    return array;
}@end
