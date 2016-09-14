//
//  LiuHeFastTool.m
//  GOODLOTTERY
//
//  Created by apple on 16/8/15.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "LiuHeFastTool.h"
#import "LiuHeBallBt.h"

@implementation LiuHeFastTool

+(void)OneGanme:(NSArray *)arry andMin:(NSInteger)minn;

{
    for (int i = 0; i<49; i++)
    {
        switch (minn)
        {
            case 1:
            {
                if ((i+1)%2==1)
                {
                    LiuHeBallBt *bt = arry[i];
                    [self Obtain:bt];
                }
            }
                break;
            case 2:
            {
                if ((i+1)%2==0)
                {
                    LiuHeBallBt *bt = arry[i];
                    [self Obtain:bt];
                }
            }
                break;
            case 3:
            {
                if (24<=i&&i<=47)
                {
                    LiuHeBallBt *bt = arry[i];
                    [self Obtain:bt];
                }
            }
                break;
            case 4:
            {
                if (i<24)
                {
                    LiuHeBallBt *bt = arry[i];
                    [self Obtain:bt];
                }
            }
                break;
            case 5:
            {
                NSString *string = [NSString stringWithFormat:@"%d",i+1];
                int b = 0;
                if (string.length==1)
                {
                    b = [[string substringToIndex:1] intValue];
                }
                else if (string.length==2)
                {
                    b = [[string substringWithRange:NSMakeRange(0, 1)] intValue]+[[string substringWithRange:NSMakeRange(1, 1)] intValue];
                }
                if (b%2)
                {
                    LiuHeBallBt *bt = arry[i];
                    [self Obtain:bt];
                }
            }
                break;
            case 6:
            {
                NSString *string = [NSString stringWithFormat:@"%d",i+1];
                int b = 0;
                if (string.length==1)
                {
                    b = [[string substringToIndex:1] intValue];
                }
                else if (string.length==2)
                {
                    b = [[string substringWithRange:NSMakeRange(0, 1)] intValue]+[[string substringWithRange:NSMakeRange(1, 1)] intValue];
                }
                if (b%2==0)
                {
                    LiuHeBallBt *bt = arry[i];[self Obtain:bt];;
                }
                
                
            }
                break;
            case 7:
            {
                
            }
                break;
            case 8:
            {
            }
                break;
            case 9:
            {
                NSString *string = [NSString stringWithFormat:@"%d",i+1];
                int b = 0;
                if (string.length==1)
                {
                    b = [[string substringToIndex:1] intValue];
                }
                else if (string.length==2)
                {
                    b = [[string substringWithRange:NSMakeRange(1, 1)] intValue];
                }
                if (b>4)
                {
                    LiuHeBallBt *bt = arry[i];[self Obtain:bt];
                }
                
            }
                break;
            case 10:
            {
                NSString *string = [NSString stringWithFormat:@"%d",i+1];
                int b = 0;
                if (string.length==1)
                {
                    b = [[string substringToIndex:1] intValue];
                }
                else if (string.length==2)
                {
                    b = [[string substringWithRange:NSMakeRange(1, 1)] intValue];
                }
                if (b<5)
                {
                    LiuHeBallBt *bt = arry[i];[self Obtain:bt];
                }
                
            }
                break;
            case 11:
            {
                NSString *string = [NSString stringWithFormat:@"%d",i+1];
                int b = 0;
                if (string.length==1)
                {
                    b = [[string substringToIndex:1] intValue];
                }
                else if (string.length==2)
                {
                    b = [[string substringWithRange:NSMakeRange(0, 1)] intValue]+[[string substringWithRange:NSMakeRange(1, 1)] intValue];
                    if (b>9)
                    {
                        b =[[[NSString stringWithFormat:@"%d",b] substringWithRange:NSMakeRange(0, 1)] intValue]+[[[NSString stringWithFormat:@"%d",b] substringWithRange:NSMakeRange(1, 1)] intValue];
                    }
                }
                if (b>4&&i!=24)
                {
                    LiuHeBallBt *bt = arry[i];[self Obtain:bt];
                }
            }
                break;
            case 12:
            {
                NSString *string = [NSString stringWithFormat:@"%d",i+1];
                int b = 0;
                if (string.length==1)
                {
                    b = [[string substringToIndex:1] intValue];
                }
                else if (string.length==2)
                {
                    b = [[string substringWithRange:NSMakeRange(0, 1)] intValue]+[[string substringWithRange:NSMakeRange(1, 1)] intValue];
                    if (b>9)
                    {
                        b =[[[NSString stringWithFormat:@"%d",b] substringWithRange:NSMakeRange(0, 1)] intValue]+[[[NSString stringWithFormat:@"%d",b] substringWithRange:NSMakeRange(1, 1)] intValue];
                    }
                }
                if (b<5)
                {
                    LiuHeBallBt *bt = arry[i];[self Obtain:bt];
                }
                
            }
                break;
                
                
            default:
                break;
        }
        
        
    }
}

#pragma mark - TwoGame
+ (void)TwoGanme:(NSArray *)arry andMin:(NSInteger)minn;
{
     NSArray * ColorArry = @[@"1",@"1",@"2",@"2",@"3",@"3",@"1",@"1",@"2",@"2",@"3",@"1",@"1",@"2",@"2",@"3",@"3",@"1",@"1",@"2",@"3",@"3",@"1",@"1",@"2",@"2",@"3",@"3",@"1",@"1",@"2",@"3",@"3",@"1",@"1",@"2",@"2",@"3",@"3",@"1",@"2",@"2",@"3",@"3",@"1",@"1",@"2",@"2",@"3"];
    
        for (int i = 0; i<49; i++)
    {
        switch (minn)
        {
            case 1:
            {
                if ([ColorArry[i] isEqualToString:@"1"])
                {
                    LiuHeBallBt *bt = arry[i];[self Obtain:bt];
                }
            }
                break;
            case 2:
            {
                if ([ColorArry[i] isEqualToString:@"2"])
                {
                    LiuHeBallBt *bt = arry[i];[self Obtain:bt];
                }
                
            }
                break;
            case 3:
            {
                if ([ColorArry[i] isEqualToString:@"3"])
                {
                    LiuHeBallBt *bt = arry[i];[self Obtain:bt];
                }
            }
                break;
            case 4:
            {
                if ([ColorArry[i] isEqualToString:@"1"]&&(i+1)%2)
                {
                    LiuHeBallBt *bt = arry[i];[self Obtain:bt];
                }
                
                
            }
                break;
            case 5:
            {
                if ([ColorArry[i] isEqualToString:@"1"]&&!((i+1)%2))
                {
                    LiuHeBallBt *bt = arry[i];[self Obtain:bt];
                }
                
            }
                break;
            case 6:
            {
                if ([ColorArry[i] isEqualToString:@"1"]&&i>23)
                {
                    LiuHeBallBt *bt = arry[i];[self Obtain:bt];
                }
                
            }
                break;
            case 7:
            {
                if ([ColorArry[i] isEqualToString:@"1"]&&i<24)
                {
                    LiuHeBallBt *bt = arry[i];[self Obtain:bt];
                }
            }
                break;
            case 8:
            {
                if ([ColorArry[i] isEqualToString:@"2"]&&(i+1)%2)
                {
                    LiuHeBallBt *bt = arry[i];[self Obtain:bt];
                }
                
                
            }
                break;
            case 9:
            {
                if ([ColorArry[i] isEqualToString:@"2"]&&!((i+1)%2))
                {
                    LiuHeBallBt *bt = arry[i];[self Obtain:bt];
                }
                
            }
                break;
            case 10:
            {
                if ([ColorArry[i] isEqualToString:@"2"]&&i>23)
                {
                    LiuHeBallBt *bt = arry[i];[self Obtain:bt];
                }
                
            }
                break;
            case 11:
            {
                if ([ColorArry[i] isEqualToString:@"2"]&&i<24)
                {
                    LiuHeBallBt *bt = arry[i];[self Obtain:bt];
                }
            }
                break;
            case 12:
            {
                if ([ColorArry[i] isEqualToString:@"3"]&&(i+1)%2)
                {
                    LiuHeBallBt *bt = arry[i];[self Obtain:bt];
                }
                
                
            }
                break;
            case 13:
            {
                if ([ColorArry[i] isEqualToString:@"3"]&&!((i+1)%2))
                {
                    LiuHeBallBt *bt = arry[i];[self Obtain:bt];
                }
                
            }
                break;
            case 14:
            {
                if ([ColorArry[i] isEqualToString:@"3"]&&i>23)
                {
                    LiuHeBallBt *bt = arry[i];[self Obtain:bt];
                }
                
            }
                break;
            case 15:
            {
                if ([ColorArry[i] isEqualToString:@"3"]&&i<24)
                {
                    LiuHeBallBt *bt = arry[i];[self Obtain:bt];
                }
            }
                break;
                
                
            default:
                break;
        }
        
        
    }
    
    
}
#pragma mark - ThreeGame
+ (void)ThreeGanme:(NSArray *)arry andMin:(NSInteger)minn;
{
    for (int i = 0; i<49; i++)
    {
        switch (minn)
        {
            case 1:
            {
                NSString *string = [NSString stringWithFormat:@"%d",i+1];
                if (string.length==1)
                {
                    LiuHeBallBt *bt = arry[i];[self Obtain:bt];
                }
            }
                break;
            case 2:
            {
                NSString *string = [NSString stringWithFormat:@"%d",i+1];
                if (string.length==2)
                {
                    if ([[string substringWithRange:NSMakeRange(0, 1)] intValue]==1)
                    {
                        LiuHeBallBt *bt = arry[i];[self Obtain:bt];
                    }
                }
            }
                break;
            case 3:
            {
                NSString *string = [NSString stringWithFormat:@"%d",i+1];
                if (string.length==2)
                {
                    if ([[string substringWithRange:NSMakeRange(0, 1)] intValue]==2)
                    {
                        LiuHeBallBt *bt = arry[i];[self Obtain:bt];
                    }
                }
            }
                break;
            case 4:
            {
                NSString *string = [NSString stringWithFormat:@"%d",i+1];
                if (string.length==2)
                {
                    if ([[string substringWithRange:NSMakeRange(0, 1)] intValue]==3)
                    {
                        LiuHeBallBt *bt = arry[i];[self Obtain:bt];
                    }
                }
            }
                break;
            case 5:
            {
                NSString *string = [NSString stringWithFormat:@"%d",i+1];
                if (string.length==2)
                {
                    if ([[string substringWithRange:NSMakeRange(0, 1)] intValue]==4)
                    {
                        LiuHeBallBt *bt = arry[i];[self Obtain:bt];
                    }
                }
            }
                break;
            case 6:
            {
                NSString *string = [NSString stringWithFormat:@"%d",i+1];
                if (string.length==2)
                {
                    if ([[string substringWithRange:NSMakeRange(1, 1)] intValue]==0)
                    {
                        LiuHeBallBt *bt = arry[i];[self Obtain:bt];
                    }
                }
            }
                break;
            case 7:
            {
                NSString *string = [NSString stringWithFormat:@"%d",i+1];
                if (string.length==1)
                {
                    if ([[string substringWithRange:NSMakeRange(0, 1)] intValue]==1)
                    {
                        LiuHeBallBt *bt = arry[i];[self Obtain:bt];
                    }
                }
                if (string.length==2)
                {
                    if ([[string substringWithRange:NSMakeRange(1, 1)] intValue]==1)
                    {
                        LiuHeBallBt *bt = arry[i];[self Obtain:bt];
                    }
                }
            }
                break;
            case 8:
            {
                NSString *string = [NSString stringWithFormat:@"%d",i+1];
                if (string.length==1)
                {
                    if ([[string substringWithRange:NSMakeRange(0, 1)] intValue]==2)
                    {
                        LiuHeBallBt *bt = arry[i];[self Obtain:bt];
                    }
                }
                
                if (string.length==2)
                {
                    if ([[string substringWithRange:NSMakeRange(1, 1)] intValue]==2)
                    {
                        LiuHeBallBt *bt = arry[i];[self Obtain:bt];
                    }
                }
                
            }
                break;
            case 9:
            {
                NSString *string = [NSString stringWithFormat:@"%d",i+1];
                if (string.length==1)
                {
                    if ([[string substringWithRange:NSMakeRange(0, 1)] intValue]==3)
                    {
                        LiuHeBallBt *bt = arry[i];[self Obtain:bt];
                    }
                }
                
                if (string.length==2)
                {
                    if ([[string substringWithRange:NSMakeRange(1, 1)] intValue]==3)
                    {
                        LiuHeBallBt *bt = arry[i];[self Obtain:bt];
                    }
                }
            }
                break;
            case 10:
            {
                NSString *string = [NSString stringWithFormat:@"%d",i+1];
                if (string.length==1)
                {
                    if ([[string substringWithRange:NSMakeRange(0, 1)] intValue]==4)
                    {
                        LiuHeBallBt *bt = arry[i];[self Obtain:bt];
                    }
                }
                
                if (string.length==2)
                {
                    if ([[string substringWithRange:NSMakeRange(1, 1)] intValue]==4)
                    {
                        LiuHeBallBt *bt = arry[i];[self Obtain:bt];
                    }
                }
            }
                break;
            case 11:
            {
                NSString *string = [NSString stringWithFormat:@"%d",i+1];
                if (string.length==1)
                {
                    if ([[string substringWithRange:NSMakeRange(0, 1)] intValue]==5)
                    {
                        LiuHeBallBt *bt = arry[i];[self Obtain:bt];
                    }
                }
                
                if (string.length==2)
                {
                    if ([[string substringWithRange:NSMakeRange(1, 1)] intValue]==5)
                    {
                        LiuHeBallBt *bt = arry[i];[self Obtain:bt];
                    }
                }
                
            }
                break;
            case 12:
            {
                NSString *string = [NSString stringWithFormat:@"%d",i+1];
                if (string.length==1)
                {
                    if ([[string substringWithRange:NSMakeRange(0, 1)] intValue]==6)
                    {
                        LiuHeBallBt *bt = arry[i];[self Obtain:bt];
                    }
                }
                
                if (string.length==2)
                {
                    if ([[string substringWithRange:NSMakeRange(1, 1)] intValue]==6)
                    {
                        LiuHeBallBt *bt = arry[i];[self Obtain:bt];
                    }
                }
                
            }
                break;
            case 13:
            {
                NSString *string = [NSString stringWithFormat:@"%d",i+1];
                if (string.length==1)
                {
                    if ([[string substringWithRange:NSMakeRange(0, 1)] intValue]==7)
                    {
                        LiuHeBallBt *bt = arry[i];[self Obtain:bt];
                    }
                }
                
                if (string.length==2)
                {
                    if ([[string substringWithRange:NSMakeRange(1, 1)] intValue]==7)
                    {
                        LiuHeBallBt *bt = arry[i];[self Obtain:bt];
                    }
                }
            }
                break;
            case 14:
            {
                NSString *string = [NSString stringWithFormat:@"%d",i+1];
                if (string.length==1)
                {
                    if ([[string substringWithRange:NSMakeRange(0, 1)] intValue]==8)
                    {
                        LiuHeBallBt *bt = arry[i];[self Obtain:bt];
                    }
                }
                
                if (string.length==2)
                {
                    if ([[string substringWithRange:NSMakeRange(1, 1)] intValue]==8)
                    {
                        LiuHeBallBt *bt = arry[i];[self Obtain:bt];
                    }
                }
            }
                break;
            case 15:
            {
                NSString *string = [NSString stringWithFormat:@"%d",i+1];
                if (string.length==1)
                {
                    if ([[string substringWithRange:NSMakeRange(0, 1)] intValue]==9)
                    {
                        LiuHeBallBt *bt = arry[i];[self Obtain:bt];
                    }
                }
                
                if (string.length==2)
                {
                    if ([[string substringWithRange:NSMakeRange(1, 1)] intValue]==9)
                    {
                        LiuHeBallBt *bt = arry[i];[self Obtain:bt];
                    }
                }
            }
                break;
                
                
            default:
                break;
        }
        
        
    }
    
    
}
+ (void)FourGanme:(NSArray *)arry andMin:(NSInteger)minn
{
    
}


+(void)Obtain:(LiuHeBallBt *)butt
{
    butt.titleBT.selected = YES;
    butt.OddBT.selected = YES;
    butt.selected = YES;
}

@end
