//
//  SkinPeelerTool.m
//  GOODLOTTERY
//
//  Created by apple on 16/1/23.
//  Copyright © 2016年 apple. All rights reserved.
//
#import "SkinPeelerTool.h"
#import "SkinpManger.h"
#import <UIKit/UIKit.h>
@implementation SkinPeelerTool
{
    NSUserDefaults *userDef;
    SkinpManger *manger;
}

+(NSArray *)UpdateLoginCtrlImage
{
    NSInteger nub = [SkinPeelerTool ReturnSkinpManger];
    NSString *image1 = [NSString stringWithFormat:@"enterButtonKing%ld",nub];
    NSString *image2 = [NSString stringWithFormat:@"BackImageKing%ld",nub];
    NSString *image3 = [NSString stringWithFormat:@"EnterKing%ld",nub];
    NSArray *Array = [NSArray  arrayWithObjects:image1,image2,image3,nil];
    return Array;
}
+(NSArray *)UpdataFPTxtColor
{
    NSInteger nub = [SkinPeelerTool ReturnSkinpManger];
    
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:5];
    NSString *topPullImage = [NSString stringWithFormat:@"TopPullDown%ld",nub];
    [array addObject:GETCOLOR(@"yr")];
    [array addObject:GETCOLOR(@"wt1")];
    [array addObject:topPullImage];
    return array;
}
+(NSArray *)UpdataSuperImage
{
    NSInteger nub = [SkinPeelerTool ReturnSkinpManger];
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:5];
    
    NSString *nvBackstring = [NSString stringWithFormat:@"NVBackImageKing%ld",nub];
    NSString *BackImageString = [NSString stringWithFormat:@"SuperBack%ld",nub];
    [array addObject:nvBackstring];
    [array addObject:BackImageString];
    NSArray *txtColor = [NSArray arrayWithObjects:GETCOLOR(@"wb"),GETCOLOR(@"wr"),GETCOLOR(@"yr"),GETCOLOR(@"wt1"),GETCOLOR(@"bw"), nil];
    NSString *string1 = [NSString stringWithFormat:@"TopPullDown%ld",nub];
    NSString *string2 = [NSString stringWithFormat:@"LotteryRightIimage%ld",nub];
    NSString *string3 = [NSString stringWithFormat:@"TitleRightImage%ld",nub];
    NSString *string4 = [NSString stringWithFormat:@"LotteryBall%ld",nub];
    NSArray *array1 = [NSArray arrayWithObjects:txtColor,string1,string2,string3,string4, nil];
    [array addObject:array1];
    
    NSString *tabbar1 = [NSString stringWithFormat:@"customBackOne%ld",nub];
    NSString *tabbar2 = [NSString stringWithFormat:@"customBackTwo%ld",nub];
    NSString *tabbar3 = [NSString stringWithFormat:@"CutBt%ld",nub];
    NSString *tabbar4 = [NSString stringWithFormat:@"AddBt%ld",nub];
    NSString *tabbar5 = [NSString stringWithFormat:@"Slider%ld",nub];
    NSString *tabbar6 = [NSString stringWithFormat:@"TypeBack%ld",nub];
    NSString *tabbar7 = [NSString stringWithFormat:@"OddBack%ld",nub];
    NSArray *tabbarArray1 = [NSArray arrayWithObjects:GETCOLOR(@"wt2"),tabbar1,tabbar2,tabbar3,tabbar4,tabbar5,tabbar6,tabbar7, nil];
    [array addObject:tabbarArray1];
    
    NSString *tabbar11 = [NSString stringWithFormat:@"OddAndNubBack%ld",nub];
    NSString *tabbar22 = [NSString stringWithFormat:@"customBackTwo%ld",nub];
    NSString *tabbar33 = [NSString stringWithFormat:@"OddAndNub%ld",nub];
    NSArray *tabbarArray2 = [NSArray arrayWithObjects:GETCOLOR(@"wt2"),tabbar11,tabbar22,tabbar33,nil];
    [array addObject:tabbarArray2];
    
    return array;
}
+(NSArray *)UpdataLotteryImage
{
    NSInteger nub = [SkinPeelerTool ReturnSkinpManger];
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:5];
    NSString *BackImageString = [NSString stringWithFormat:@"LotteryBack%ld",nub];
    [array addObject:BackImageString];
    return array;
}

+(NSArray *)UpdataMenuImage
{
    NSInteger nub = [SkinPeelerTool ReturnSkinpManger];
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:5];
    //    NSString *nvBackstring = [NSString stringWithFormat:@"MenuBack1%ld",nub];
    NSString *BackImageString = [NSString stringWithFormat:@"MenuBack%ld",nub];
    //    [array addObject:nvBackstring];
    [array addObject:BackImageString];
    return array;
}

+(NSArray *)UpdataBottomPourImage
{
    NSInteger nub = [SkinPeelerTool ReturnSkinpManger];
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:5];
    NSString *ImageString1 = [NSString stringWithFormat:@"CutLine%ld",nub];
    NSString *ImageString2 = [NSString stringWithFormat:@"Digit%ld",nub];
    NSString *ImageString3 = [NSString stringWithFormat:@"DigitKing%ld",nub];
    NSString *ImageString4 = [NSString stringWithFormat:@"SeletedDigitKing%ld",nub];
    NSString *ImageString5 = [NSString stringWithFormat:@"PourBall%ld",nub];
    NSString *ImageString6 = [NSString stringWithFormat:@"SeletedBall%ld",nub];
    NSString *ImageString7 = [NSString stringWithFormat:@"LotteryBall%ld",nub];
    [array addObject:ImageString1];
    [array addObject:ImageString2];
    [array addObject:ImageString3];
    [array addObject:ImageString4];
    [array addObject:ImageString5];
    [array addObject:ImageString6];
    [array addObject:ImageString7];
    return array;
}

+(NSArray *)UpdataConfirmBetsImageAndTxtColor
{
    NSInteger nub = [SkinPeelerTool ReturnSkinpManger];
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:5];
    NSString *string1 = [NSString stringWithFormat:@"AddBet%ld",nub];
    NSString *string2 = [NSString stringWithFormat:@"RemoveCell%ld",nub];
    NSString *string3 = [NSString stringWithFormat:@"OddAndNub%ld",nub];
    NSString *string4 = [NSString stringWithFormat:@"CatchCutline%ld",nub];
    NSString *string5 = [NSString stringWithFormat:@"CellAddCut%ld",nub];
    [array addObject:GETCOLOR(@"cbw")];
    [array addObject:GETCOLOR(@"cw")];
    [array addObject:GETCOLOR(@"wt1")];
    [array addObject:GETCOLOR(@"Yr")];
    [array addObject:string1];
    [array addObject:string2];
    [array addObject:string3];
    [array addObject:string4];
    [array addObject:string5];
    
    return array;
}

+(NSArray *)updataCatchNubCtrl
{
    NSInteger nub = [SkinPeelerTool ReturnSkinpManger];
    NSString *string1 = [NSString stringWithFormat:@"CatchField"];
    NSString *string2 = [NSString stringWithFormat:@"CatchSelected"];
    NSString *string3 = [NSString stringWithFormat:@"CatchCutline%ld",nub];
    NSString *string4 = [NSString stringWithFormat:@"CatchProduce%ld",nub];
    NSString *string5 = [NSString stringWithFormat:@"CatchSelected%ld",nub];
    NSString *string6 = [NSString stringWithFormat:@"CatchConFirm%ld",nub];
    NSString *string7 = [NSString stringWithFormat:@"CellAddCut%ld",nub];
    NSArray *array = [NSArray arrayWithObjects:string1,string2,string3,string4,string5,string6,string7,nil];
    return array;
}

+(NSArray *)UpdataRegisterCtrl
{
    NSInteger nub = [SkinPeelerTool ReturnSkinpManger];
    NSString *string1 = [NSString stringWithFormat:@"RegisterMoneybt%ld",nub];
    NSString *string2 = [NSString stringWithFormat:@"RegisterBt%ld",nub];
    NSArray *array = [NSArray arrayWithObjects:string1,string2,nil];
    return array;
}

+(NSArray *)UpdataCheckView
{
    NSInteger nub = [SkinPeelerTool ReturnSkinpManger];
    NSString *string1 = [NSString stringWithFormat:@"CheckHeardBack%ld",nub];
    NSString *string2 = [NSString stringWithFormat:@"Search%ld",nub];
    NSString *string3 = [NSString stringWithFormat:@"TimeBack%ld",nub];
    NSString *string4 = [NSString stringWithFormat:@"CatchSelected%ld",nub];
    NSString *string5 = [NSString stringWithFormat:@"TitleRightImage%ld",nub];
    NSArray *array = [NSArray arrayWithObjects:string1,string2,string3,string4,string5, nil];
    return array;
}
+(NSArray *)UpdatasCurrent
{
    NSInteger nub = [SkinPeelerTool ReturnSkinpManger];
    NSString *string1 = [NSString stringWithFormat:@"RegisterBt%ld",nub];
    NSArray *array = [NSArray arrayWithObjects:string1, nil];
    return array;
}


+(UIColor *)GetColor:(NSString *)string
{
    NSInteger nub = [SkinPeelerTool ReturnSkinpManger];
    UIColor *CureenColor;
    switch (nub)
    {
        case 1:
        {
            NSDictionary *DicColor = @{@"cw":[UIColor clearColor],@"cbw":[UIColor clearColor],@"wt1":[UIColor whiteColor],@"wt2":[UIColor whiteColor],@"wb":[UIColor whiteColor],@"wr":[UIColor whiteColor],@"bw":[UIColor blackColor],@"Yr":DTAISCOLORE(254,218 ,12, 1),@"yr":DTAISCOLORE(252, 235, 163, 1),@"dtwb":DTAISCOLORE(35,119, 198, 1),@"bgg":DTAISCOLORE(52,68, 91, 1),@"wg":[UIColor whiteColor],@"cgr":[UIColor clearColor],@"t1":DTAISCOLORE(27, 51, 74, 1),@"blw":DTAISCOLORE(27, 112, 214,1),@"t3":DTAISCOLORE(27, 112, 214,1),@"t4":DTAISCOLORE(26, 124, 204, 1),@"rg":[UIColor redColor],@"blr":DTAISCOLORE(26, 124, 204, 1),@"br":[UIColor blackColor],@"cgroup":[UIColor clearColor],@"b0.3w":DTAISCOLORE(0,0,0,0.3),@"b0.6group":DTAISCOLORE(0,0,0,0.6),@"b0.6w":DTAISCOLORE(0,0,0,0.6),@"b0.6b":DTAISCOLORE(0,0,0,0.6),@"qbsb":DTAISCOLORE(52,68, 91, 1),@"b0.3group":DTAISCOLORE(0,0,0,0.3),@"w0.1group":DTAISCOLORE(255,255,255,0.1),@"b0.5w":DTAISCOLORE(0,0,0,0.5)};
            
            return DicColor[string];
        }
            break;
        case 2:
        {
            NSDictionary *DicColor = @{@"cw":[UIColor whiteColor],@"cbw":DTAISCOLORE(225,228 ,229, 1),@"wt1":DTAISCOLORE(74,73 ,73, 1),@"wt2":DTAISCOLORE(55,52 ,52, 1),@"wb":[UIColor blackColor],@"wr":[UIColor redColor],@"bw":[UIColor whiteColor],@"Yr":[UIColor redColor],@"yr":[UIColor redColor],@"dtwb":DTAISCOLORE(55,52 ,52, 1),@"bgg":DTAISCOLORE(91, 155, 29, 1),@"wg":DTAISCOLORE(91, 155, 29, 1),@"cgr":[UIColor groupTableViewBackgroundColor],@"t1":[UIColor groupTableViewBackgroundColor],@"blw":[UIColor whiteColor],@"t3":[UIColor redColor],@"t4":[UIColor blackColor],@"rg":DTAISCOLORE(91, 155, 29, 1),@"blr":[UIColor redColor],@"br":[UIColor redColor],@"cgroup":[UIColor groupTableViewBackgroundColor],@"b0.3w":[UIColor whiteColor],@"b0.6group":DTAISCOLORE(229,229,229,1),@"b0.3group":DTAISCOLORE(229,229,229,1),@"b0.6w":[UIColor whiteColor],@"b0.6b":[UIColor blackColor],@"qbsb":DTAISCOLORE(55,52 ,52, 1),@"w0.1group":DTAISCOLORE(229,229,229,1),@"b0.5w":[UIColor whiteColor]};
            return DicColor[string];
        }
            break;
        default:
            break;
    }
    return CureenColor;
    
}

+(NSInteger)ReturnSkinpManger
{
    SkinPeelerTool *sk = [[SkinPeelerTool alloc]init];
    return [sk ReturnManger];
}
-(NSInteger)ReturnManger
{
    if (!manger)manger = [SkinpManger ShareSkinpManger];
    return manger.Nub;
}

+(NSInteger)GetNSUserDefaultsOfNub
{
    SkinPeelerTool *skintool = [[SkinPeelerTool alloc]init];
    return  [skintool GetNSUserDefaults];
}
-(NSInteger)GetNSUserDefaults
{
    NSInteger nub;
    if (!userDef)userDef = [NSUserDefaults standardUserDefaults];
    if (![userDef objectForKey:@"SkinSpeelerNub"])
        [userDef setObject:@"2" forKey:@"SkinSpeelerNub"],[userDef synchronize];
    nub = [[NSString stringWithFormat:@"%@",[userDef objectForKey:@"SkinSpeelerNub"]] integerValue];
    if (!manger) manger = [SkinpManger ShareSkinpManger];
    manger.Nub = nub;
    return nub;
}
@end