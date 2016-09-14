//
//  GamePourDatas.m
//  GOODLOTTERY
//
//  Created by apple on 16/3/29.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "GamePourDatas.h"
#import "GamePourModel.h"

@implementation GamePourDatas

+(GamePourModel *)returnDatas:(NSDictionary *)dic
{
     GamePourModel *model;
     if (!model)model = [[GamePourModel alloc]init];
    
     NSString *leftString = dic[@"leftstring"];
     NSString *middleString = dic[@"middelstring"];
     NSString *rightString = dic[@"rightstring"];
//     NSString *leftnub = dic[@"leftNub"];
     NSString *middel = dic[@"middelNub"];
     NSString *right = dic[@"rightNub"];
     model.KindShape = 0;

    if ([leftString isEqualToString:@"五星"])
    {
        if ([middleString isEqualToString:@"直选"])
        {
           model.DigitArray = @[@"万位",@"千位",@"百位",@"十位",@"个位"];
           model.BugKeyArray = @[@"全",@"大",@"小",@"奇",@"偶",@"清"];
           model.BallNub = 10;
           model.StartNub = 0;
        }
        else
        {
            model.BallNub = 10;
            model.StartNub = 0;
            model.BugKeyArray = @[@"全",@"大",@"小",@"奇",@"偶",@"清"];
            if ([right isEqualToString:@"0"])
                model.DigitArray = @[@"组选120"];
            else if ([right isEqualToString:@"1"]||[right isEqualToString:@"2"])
                model.DigitArray = @[@"二重号",@"单号"];
            else if([right isEqualToString:@"3"])
                model.DigitArray = @[@"三重号",@"单号"];
            else if ([right isEqualToString:@"4"])
                model.DigitArray = @[@"三重号",@"二重号"];
            else if ([right isEqualToString:@"5"])
                model.DigitArray = @[@"四重号",@"单号"];
        }
    }
    else if ([leftString isEqualToString:@"四星"])
    {
        if ([middleString isEqualToString:@"直选"])
        {
            model.DigitArray = @[@"千位",@"百位",@"十位",@"个位"];
            model.BugKeyArray = @[@"全",@"大",@"小",@"奇",@"偶",@"清"];
            model.BallNub = 10;
            model.StartNub = 0;
        }
        else
        {
            model.BallNub = 10;
            model.StartNub = 0;
            model.BugKeyArray = @[@"全",@"大",@"小",@"奇",@"偶",@"清"];
            if ([right isEqualToString:@"0"])
                model.DigitArray = @[@"组选24"];
            else if ([right isEqualToString:@"1"]||[right isEqualToString:@"2"])
                model.DigitArray = @[@"二重号",@"单号"];
            else if([right isEqualToString:@"3"])
                model.DigitArray = @[@"二重号"];
            else if ([right isEqualToString:@"4"])
                model.DigitArray = @[@"三重号",@"单号"];
        }
    }
    else if ([leftString isEqualToString:@"后三码"])
    {
        if ([rightString isEqualToString:@"后三直选复式"])
        {
            model.DigitArray = @[@"百位",@"十位",@"个位"];
            model.BugKeyArray = @[@"全",@"大",@"小",@"奇",@"偶",@"清"];
            model.BallNub = 10;
            model.StartNub = 0;
        }
        else if([rightString isEqualToString:@"后三直选和值"])
        {
            model.DigitArray = @[@"直选和值"];
            model.BugKeyArray = nil;
            model.BallNub = 28;
            model.StartNub = 0;
        }
        else
        {
            model.BallNub = 10;
            model.StartNub = 0;
            model.BugKeyArray = @[@"全",@"大",@"小",@"奇",@"偶",@"清"];
            if ([right isEqualToString:@"0"])
                model.DigitArray = @[@"组三"];
            else if ([right isEqualToString:@"1"])
                model.DigitArray = @[@"组六"];
            else if([right isEqualToString:@"2"])
            {
                model.BallNub = 27;
                model.StartNub = 1;
                model.BugKeyArray = nil;
                model.DigitArray = @[@"后三组选和值"];
            }
        }
    }
    else if ([leftString isEqualToString:@"后三码"])
    {
    if ([rightString isEqualToString:@"后三直选复式"])
            {
                model.DigitArray = @[@"百位",@"十位",@"个位"];
                model.BugKeyArray = @[@"全",@"大",@"小",@"奇",@"偶",@"清"];
                model.BallNub = 10;
                model.StartNub = 0;
            }
            else if([rightString isEqualToString:@"后三直选和值"])
            {
                model.DigitArray = @[@"直选和值"];
                model.BugKeyArray = nil;
                model.BallNub = 28;
                model.StartNub = 0;
            }
            else
            {
                model.BallNub = 10;
                model.StartNub = 0;
                model.BugKeyArray = @[@"全",@"大",@"小",@"奇",@"偶",@"清"];
                if ([right isEqualToString:@"0"])
                    model.DigitArray = @[@"组三"];
                else if ([right isEqualToString:@"1"])
                    model.DigitArray = @[@"组六"];
                else if([right isEqualToString:@"2"])
                {
                    model.BallNub = 27;
                    model.StartNub = 1;
                    model.BugKeyArray = nil;
                    model.DigitArray = @[@"组选和值"];
                }
            }
        }
    else if ([leftString isEqualToString:@"前三码"])
    {
        if ([rightString isEqualToString:@"前三直选复式"])
        {
            model.DigitArray = @[@"万位",@"千位",@"百位"];
            model.BugKeyArray = @[@"全",@"大",@"小",@"奇",@"偶",@"清"];
            model.BallNub = 10;
            model.StartNub = 0;
        }
        else if([rightString isEqualToString:@"前三直选和值"])
        {
            model.DigitArray = @[@"直选和值"];
            model.BugKeyArray = nil;
            model.BallNub = 28;
            model.StartNub = 0;
        }
        else
        {
            model.BallNub = 10;
            model.StartNub = 0;
            model.BugKeyArray = @[@"全",@"大",@"小",@"奇",@"偶",@"清"];
            if ([right isEqualToString:@"0"])
                model.DigitArray = @[@"组三"];
            else if ([right isEqualToString:@"1"])
                model.DigitArray = @[@"组六"];
            else if([right isEqualToString:@"2"])
            {
                model.BallNub = 27;
                model.StartNub = 1;
                model.BugKeyArray = nil;
                model.DigitArray = @[@"组选和值"];
            }
        }
    }
    else if ([leftString isEqualToString:@"中三码"])
    {
        if ([rightString isEqualToString:@"中三直选复式"])
        {
            model.DigitArray = @[@"千位",@"百位",@"十位"];
            model.BugKeyArray = @[@"全",@"大",@"小",@"奇",@"偶",@"清"];
            model.BallNub = 10;
            model.StartNub = 0;
        }
        else if([rightString isEqualToString:@"中三直选和值"])
        {
            model.DigitArray = @[@"直选和值"];
            model.BugKeyArray = nil;
            model.BallNub = 28;
            model.StartNub = 0;
        }
        else
        {
            model.BallNub = 10;
            model.StartNub = 0;
            model.BugKeyArray = @[@"全",@"大",@"小",@"奇",@"偶",@"清"];
            if ([right isEqualToString:@"0"])
                model.DigitArray = @[@"组三"];
            else if ([right isEqualToString:@"1"])
                model.DigitArray = @[@"组六"];
            else if([right isEqualToString:@"2"])
            {
                model.BallNub = 27;
                model.StartNub = 1;
                model.BugKeyArray = nil;
                model.DigitArray = @[@"组选和值"];
            }
        }
    }
    else if ([leftString isEqualToString:@"二码"])
    {
        if ([middleString isEqualToString:@"直选"])
        {
            model.BugKeyArray = @[@"全",@"大",@"小",@"奇",@"偶",@"清"];
            model.BallNub = 10;
            model.StartNub = 0;
            if ([rightString isEqualToString:@"后二直选"])
                model.DigitArray = @[@"十位",@"个位"];
            if ([rightString isEqualToString:@"前二直选"])
                model.DigitArray = @[@"万位",@"千位"];
            if ([rightString isEqualToString:@"后二直选和值"])
                model.DigitArray = @[@"和值"],model.BallNub = 19;
            if ([rightString isEqualToString:@"前二直选和值"])
                model.DigitArray = @[@"和值"],model.BallNub = 19;
        }
        else
        {
            model.BallNub = 10;
            model.StartNub = 0;
            model.BugKeyArray = @[@"全",@"大",@"小",@"奇",@"偶",@"清"];
            if ([right isEqualToString:@"0"]||[right isEqualToString:@"1"])
                model.DigitArray = @[@"组选"];
            else if ([right isEqualToString:@"2"]||[right isEqualToString:@"3"])
                model.DigitArray = @[@"和值"],model.BallNub = 18,model.StartNub = 1,model.BugKeyArray=nil ;
        }
    }
    else if([leftString isEqualToString:@"定位胆"])
    {  model.BallNub = 10;
        model.StartNub = 0;
        model.DigitArray = @[@"万位",@"千位",@"百位",@"十位",@"个位"];
        model.BugKeyArray = @[@"全",@"大",@"小",@"奇",@"偶",@"清"];
    }
    else if([leftString isEqualToString:@"不定胆"])
    {  model.BallNub = 10;
        model.StartNub = 0;
        model.DigitArray = @[@"不定胆"];
        model.BugKeyArray = @[@"全",@"大",@"小",@"奇",@"偶",@"清"];
    }
    else if([leftString isEqualToString:@"大小单双"])
    {
        model.OptionsArray = @[@"大",@"小",@"单",@"双"];
        model.BugKeyArray = @[@"全",@"清"];
        if ([rightString isEqualToString:@"后二大小单双"])
        {model.DigitArray = @[@"十位",@"个位"];
        }
        else
        {
        model.DigitArray = @[@"万位",@"千位"];
        }
            
    }
    else if([leftString isEqualToString:@"趣味"])
    {
        model.BallNub = 10;
        model.StartNub = 0;
        model.BugKeyArray = @[@"全",@"大",@"小",@"奇",@"偶",@"清"];
        if ([right isEqualToString:@"0"])
            model.DigitArray = @[@"一帆风顺"];
        if ([right isEqualToString:@"1"])
            model.DigitArray = @[@"好事成双"];
        if ([right isEqualToString:@"2"])
            model.DigitArray = @[@"三星报喜"];
        if ([right isEqualToString:@"3"])
            model.DigitArray = @[@"四季发财"];
    }
    else if([leftString isEqualToString:@"任选二"])
    {
        if ([middel isEqualToString:@"0"])
        {
        if ([right isEqualToString:@"0"])
        {
            model.DigitArray = @[@"万位",@"千位",@"百位",@"十位",@"个位"];
            model.BugKeyArray = @[@"全",@"大",@"小",@"奇",@"偶",@"清"];
            model.BallNub = 10;
            model.StartNub = 0;
        }
        else
        {
            model.DigitArray = @[@"直选和值"];
            model.BugKeyArray = nil;
            model.BallNub = 19;
            model.StartNub = 0;
        }
        }
        else{
            
            if ([right isEqualToString:@"0"])
            {
                model.DigitArray = @[@"组选"];
                model.BugKeyArray = @[@"全",@"大",@"小",@"奇",@"偶",@"清"];
                model.BallNub = 10;
                model.StartNub = 0;
            }
            else
            {
                model.DigitArray = @[@"组选"];
                model.BugKeyArray = nil;
                model.BallNub = 18;
                model.StartNub = 0;
            }

        }
        
    }
    else if([leftString isEqualToString:@"任选三"])
    {
        if ([middel isEqualToString:@"0"])
        {
            if ([right isEqualToString:@"0"])
            {
                model.DigitArray = @[@"万位",@"千位",@"百位",@"十位",@"个位"];
                model.BugKeyArray = @[@"全",@"大",@"小",@"奇",@"偶",@"清"];
                model.BallNub = 10;
                model.StartNub = 0;
            }
            else
            {
                model.DigitArray = @[@"直选和值"];
                model.BugKeyArray = nil;
                model.BallNub = 28;
                model.StartNub = 0;
            }
        }
        else{
            
            if ([right isEqualToString:@"0"])
            {
                model.DigitArray = @[@"组三"];
                model.BugKeyArray = @[@"全",@"大",@"小",@"奇",@"偶",@"清"];
                model.BallNub = 10;
                model.StartNub = 0;
            }
            else if([right isEqualToString:@"1"])
            {
                model.DigitArray = @[@"组六"];
                model.BugKeyArray = @[@"全",@"大",@"小",@"奇",@"偶",@"清"];
                model.BallNub = 18;
                model.StartNub = 0;
            }
            else{
                model.DigitArray = @[@"组选和值"];
                model.BugKeyArray = nil;
                model.BallNub = 27;
                model.StartNub = 1;
            }
            
        }
        
    }

     return model;
}

+(GamePourModel *)returnBjHappyDatas:(NSDictionary *)dic
{
    GamePourModel *model;
    if (!model)model = [[GamePourModel alloc]init];
    
//    NSString *leftString = dic[@"leftstring"];
//    NSString *middleString = dic[@"middelstring"];
//    NSString *rightString = dic[@"rightstring"];
    NSString *leftnub = dic[@"leftNub"];
//    NSString *middelnub = dic[@"middelNub"];
    NSString *rightnub = dic[@"rightNub"];
    if ([leftnub isEqualToString:@"0"])
    {
        model.DigitArray = @[@"上",@"下"];
        model.BugKeyArray = nil;
        model.IsHeardlable = YES;
        model.KindShape = 0;
        model.BallNub = 41;
        model.StartNub = 1;
        model.OptionsArray = nil;

    }
    else
    {
        if ([rightnub isEqualToString:@"0"])
        {
            model.DigitArray = @[@"和值单双"];
            model.BugKeyArray = @[@"全",@"清"];
            model.OptionsArray = @[@"单",@"双"];
            model.KindShape = 1;
        }
        else if ([rightnub isEqualToString:@"1"])
        {
            model.DigitArray = @[@"和值大小"];
            model.BugKeyArray = @[@"全",@"清"];
            model.OptionsArray = @[@"大",@"和",@"小"];
            model.KindShape = 2;
        }
        else if ([rightnub isEqualToString:@"2"])
        {
            model.DigitArray = @[@"上下盘"];
            model.BugKeyArray = @[@"全",@"清"];
            model.OptionsArray = @[@"上",@"中",@"下"];
            model.KindShape = 2;
        }
        else if ([rightnub isEqualToString:@"3"])
        {
            model.DigitArray = @[@"奇偶盘"];
            model.BugKeyArray = @[@"全",@"清"];
            model.OptionsArray = @[@"奇",@"和",@"偶"];
            model.KindShape = 2;
        }
        else if ([rightnub isEqualToString:@"4"])
        {
            model.DigitArray = @[@"大小单双"];
            model.BugKeyArray = @[@"全",@"清"];
            model.OptionsArray = @[@"大单",@"大双",@"小单",@"小双"];
            model.KindShape = 1;
        }
    }
    
    return model;
}

+(GamePourModel *)returnJSKSDatas:(NSDictionary *)dic
{
    GamePourModel *model;
    if (!model)model = [[GamePourModel alloc]init];
    
    //    NSString *leftString = dic[@"leftstring"];
        NSString *middleString = dic[@"middelstring"];
    //    NSString *rightString = dic[@"rightstring"];
//    NSString *leftnub = dic[@"leftNub"];
//    NSString *middelnub = dic[@"middelNub"];
    NSString *rightnub = dic[@"rightNub"];
    

        if ([middleString isEqualToString:@"二同号"])
        {
            if ([rightnub isEqualToString:@"0"])
            {
                model.DigitArray = @[@"同号",@"不同号"];
                model.BugKeyArray = nil;
                model.KindShape = 1;
                model.OptionsArrays = @[@[@"11",@"22",@"33",@"44",@"55",@"66"],@[@"1",@"2",@"3",@"4",@"5",@"6"]];
            }
            else
            {
                model.DigitArray = @[@"二同复选"];
                model.BugKeyArray = nil;
                model.KindShape = 1;
                model.OptionsArray = @[@"11",@"22",@"33",@"44",@"55",@"66"];
            }
        }
        else if([middleString isEqualToString:@"三同号"])
        {
            if ([rightnub isEqualToString:@"0"])
            {
                model.DigitArray = @[@"三同单选"];
                model.BugKeyArray = nil;
                model.KindShape = 1;
                model.OptionsArray = @[@"111",@"222",@"333",@"444",@"555",@"666"];
            }
            else
            {
                model.DigitArray = @[@"三同复选"];
                model.BugKeyArray = nil;
                model.KindShape = 1;
                model.OptionsArray = @[@"三同号通选"];
            }

        }
        else if([middleString isEqualToString:@"和值"])
        {
            model.DigitArray = @[@"和值"];
            model.BugKeyArray = @[@"小",@"大",@"单",@"双",@"清"];
            model.KindShape = 10;
            model.StartNub = 3;
            model.BallNub = 8;
            model.OptionsArray = nil;

        }
        else if([middleString isEqualToString:@"三连号"])
        {
            model.DigitArray = @[@"三连号"];
            model.BugKeyArray = nil;
            model.KindShape = 1;
            model.OptionsArray = @[@"三连号通选"];

        }
        else if([middleString isEqualToString:@"不同号"])
        {
                model.DigitArray = @[@"标准"];
                model.BugKeyArray = nil;
                model.KindShape = 1;
                model.OptionsArray = @[@"1",@"2",@"3",@"4",@"5",@"6"];

        }
    
     return model;
}

+(GamePourModel *)returnElevenTofiveDatas:(NSDictionary *)dic;
{
    GamePourModel *model;
    if (!model)model = [[GamePourModel alloc]init];
    
//        NSString *leftString = dic[@"leftstring"];
//        NSString *middleString = dic[@"middelstring"];
//        NSString *rightString = dic[@"rightstring"];
        NSString *leftnub = dic[@"leftNub"];
//        NSString *middelnub = dic[@"middelNub"];
        NSString *rightnub = dic[@"rightNub"];
    
    
    if ([leftnub isEqualToString:@"0"])
    {
        model.KindShape = 0;
        model.BugKeyArray = @[@"全",@"大",@"小",@"奇",@"偶",@"清"];
        model.BallNub = 11;
        model.StartNub = 1;
        model.KindShape = 0;
        model.IsHeardlable = YES;
        if ([rightnub isEqualToString:@"0"])
        model.DigitArray = @[@"第一位",@"第二位",@"第三位"];
        else
        model.DigitArray = @[@"组选"];
        
        
    }
    else if ([leftnub isEqualToString:@"1"])
    {
        model.BugKeyArray = @[@"全",@"大",@"小",@"奇",@"偶",@"清"];
        model.BallNub = 11;
        model.StartNub = 1;
        model.KindShape = 0;
        model.IsHeardlable = YES;
        if ([rightnub isEqualToString:@"0"])
            model.DigitArray = @[@"第一位",@"第二位"];
        else
            model.DigitArray = @[@"组选"];
    }
    else if ([leftnub isEqualToString:@"2"])
    {
        model.DigitArray = @[@"前三位"];
        model.BugKeyArray = @[@"全",@"大",@"小",@"奇",@"偶",@"清"];
        model.BallNub = 11;
        model.StartNub =1;
        model.KindShape = 0;
        model.IsHeardlable = YES;
    }else if ([leftnub isEqualToString:@"3"])
    {
        model.DigitArray = @[@"第一位",@"第二位",@"第三位"];
        model.BugKeyArray = @[@"全",@"大",@"小",@"奇",@"偶",@"清"];
        model.BallNub = 11;
        model.StartNub = 1;
        model.KindShape = 0;
        model.IsHeardlable = YES;
    }else if ([leftnub isEqualToString:@"4"])
    {
        if ([rightnub isEqualToString:@"0"])
        {
            model.DigitArray = @[@"定单双"],
            model.BugKeyArray = @[@"全",@"清"];
            model.OptionsArray = @[@"5单0双",@"4单1双",@"3单2双",@"2单3双",@"1单4双",@"0单5双"];
            model.KindShape = 11;
            
        }
        else
        {
            model.KindShape = 100;
            model.DigitArray = @[@"猜中位"];
            model.BugKeyArray = @[@"全",@"大",@"小",@"奇",@"偶",@"清"];
            model.KindShape = 100;
            model.BallNub = 7;
            model.StartNub = 3;
            model.IsHeardlable = YES;
        }
    }
    else if ([leftnub isEqualToString:@"5"])
    {
        if ([rightnub isEqualToString:@"0"]) model.DigitArray = @[@"选一中一"];
        if ([rightnub isEqualToString:@"1"]) model.DigitArray = @[@"选二中二"];
        if ([rightnub isEqualToString:@"2"]) model.DigitArray = @[@"选三中三"];
        if ([rightnub isEqualToString:@"3"]) model.DigitArray = @[@"选四中四"];
        if ([rightnub isEqualToString:@"4"]) model.DigitArray = @[@"选五中五"];
        if ([rightnub isEqualToString:@"5"]) model.DigitArray = @[@"选六中五"];
        if ([rightnub isEqualToString:@"6"]) model.DigitArray = @[@"选七中五"];
        if ([rightnub isEqualToString:@"7"]) model.DigitArray = @[@"选八中五"];
        model.BugKeyArray = @[@"全",@"大",@"小",@"奇",@"偶",@"清"];
        model.BallNub = 11;
        model.StartNub = 1;
        model.KindShape = 0;
        model.IsHeardlable = YES;
    }
    
    
       return model;
}


+(GamePourModel *)returnBJPKTenDatas:(NSDictionary *)dic
{ GamePourModel *model;
    if (!model)model = [[GamePourModel alloc]init];
    
//    NSString *middel = dic[@"middelNub"];
    NSString *leftnub = dic[@"leftNub"];
//    NSString *rightnub = dic[@"rightNub"];
    
    
    if ([leftnub isEqualToString:@"0"])
    {
            model.DigitArray = @[@"猜冠军"];
            model.BugKeyArray = @[@"全",@"大",@"小",@"奇",@"偶",@"清"];
            model.BallNub = 10;
            model.StartNub = 1;
            model.IsHeardlable = YES;
            model.KindShape = 0;
        
    }
    else if ([leftnub isEqualToString:@"1"])
    {
        model.DigitArray = @[@"冠军",@"亚军"];
        model.BugKeyArray = @[@"全",@"大",@"小",@"奇",@"偶",@"清"];
        model.BallNub = 10;
        model.StartNub = 1;
        model.IsHeardlable = YES;
        model.KindShape = 0;
    }
    else if ([leftnub isEqualToString:@"2"])
    {
        model.DigitArray = @[@"冠军",@"亚军",@"季军"];
        model.BugKeyArray = @[@"全",@"大",@"小",@"奇",@"偶",@"清"];
        model.BallNub = 10;
        model.StartNub = 1;
        model.IsHeardlable = YES;
        model.KindShape = 0;
    }else if ([leftnub isEqualToString:@"3"])
    {
        model.DigitArray = @[@"第一",@"第二",@"第三",@"第四"];
        model.BugKeyArray = @[@"全",@"大",@"小",@"奇",@"偶",@"清"];
        model.BallNub = 10;
        model.StartNub = 1;
        model.IsHeardlable = YES;
        model.KindShape = 0;
    }else if ([leftnub isEqualToString:@"4"])
    {
        model.DigitArray = @[@"第一",@"第二",@"第三",@"第四",@"第五"];
        model.BugKeyArray = @[@"全",@"大",@"小",@"奇",@"偶",@"清"];
        model.BallNub = 10;
        model.StartNub = 1;
        model.IsHeardlable = YES;
        model.KindShape = 0;
    }
    
    return model;
}

+(GamePourModel *)returnFC3DDatas:(NSDictionary *)dic
{
    GamePourModel *model;
    if (!model)model = [[GamePourModel alloc]init];
    NSString *leftnub = dic[@"leftNub"];
    NSString *middelnub = dic[@"middelNub"];
    NSString *rightnub = dic[@"rightNub"];
    
    
    if ([leftnub isEqualToString:@"0"])
    {
        if ([middelnub isEqualToString:@"0"])
        {
            if ([rightnub isEqualToString:@"0"])
            {
                model.DigitArray = @[@"百位",@"十位",@"个位"];
                model.BugKeyArray = @[@"全",@"大",@"小",@"奇",@"偶",@"清"];
                model.BallNub = 10;
                model.StartNub = 0;
                model.IsHeardlable = YES;
                model.KindShape = 0;
                
            }
            else
            {
                model.DigitArray = @[@"直选和值"];
                model.BallNub = 28;
                model.StartNub = 0;
                model.KindShape = 0;
                model.IsHeardlable = YES;
            }
        }
        else
        {
            if ([rightnub isEqualToString:@"0"])
            {
                model.DigitArray = @[@"组三"];
                model.BugKeyArray = @[@"全",@"大",@"小",@"奇",@"偶",@"清"];
                model.BallNub = 10;
                model.StartNub = 0;
                model.IsHeardlable = YES;
                model.KindShape = 0;
            }
            else if([rightnub isEqualToString:@"1"])
            {
                model.DigitArray = @[@"组六"];
                model.BugKeyArray = @[@"全",@"大",@"小",@"奇",@"偶",@"清"];
                model.BallNub = 10;
                model.StartNub = 0;
                model.IsHeardlable = YES;
                model.KindShape = 0;
            }
            else
            {
                model.DigitArray = @[@"组选和值"];
                model.BallNub = 26;
                model.StartNub = 1;
                model.IsHeardlable = YES;
                model.KindShape = 0;
                model.IsHeardlable = YES;
            }
        }
    }
    else if ([leftnub isEqualToString:@"1"])
    {
        model.DigitArray = @[@"不定胆"];
        model.BugKeyArray = @[@"全",@"大",@"小",@"奇",@"偶",@"清"];
        model.BallNub = 10;
        model.StartNub = 0;
        model.IsHeardlable = YES;
        model.KindShape = 0;
    }
    else if ([leftnub isEqualToString:@"2"])
    {
        if([middelnub isEqualToString:@"0"])
        {
            if ([rightnub isEqualToString:@"0"]||[rightnub isEqualToString:@"1"])
            {
                model.DigitArray = @[@"百位",@"十位"];
                model.BugKeyArray = @[@"全",@"大",@"小",@"奇",@"偶",@"清"];
                model.BallNub = 10;
                model.StartNub = 0;
                model.IsHeardlable = NO;
                model.KindShape = 0;
            }
            else
            {
                model.DigitArray = @[@"组选"];
                model.BugKeyArray = @[@"全",@"大",@"小",@"奇",@"偶",@"清"];
                model.BallNub = 10;
                model.StartNub = 0;
                model.IsHeardlable = YES;
                model.KindShape = 0;
            }
        }
        else
        {
            if ([rightnub isEqualToString:@"0"]||[rightnub isEqualToString:@"1"])
            {
                model.DigitArray = @[@"百位",@"十位"];
                model.BugKeyArray = @[@"全",@"大",@"小",@"奇",@"偶",@"清"];
                model.BallNub = 10;
                model.StartNub = 0;
                model.IsHeardlable = YES;
                model.KindShape = 0;
            }
            else
            {
                model.DigitArray = @[@"组值"];
                model.BallNub = 10;
                model.StartNub = 0;
                model.IsHeardlable = YES;
                model.KindShape = 0;
            }
        }

    }
    else if ([leftnub isEqualToString:@"3"])
    {
        model.DigitArray = @[@"百位",@"十位",@"个位"];
        model.BugKeyArray = @[@"全",@"大",@"小",@"奇",@"偶",@"清"];
        model.BallNub = 10;
        model.StartNub = 0;
        model.IsHeardlable = NO;
        model.KindShape = 0;
    }
    else if ([leftnub isEqualToString:@"4"])
    {
        
        if([rightnub isEqualToString:@"0"])
        {
            model.DigitArray = @[@"十位",@"个位"];
            model.BugKeyArray = @[@"全",@"清"];
            model.OptionsArray = @[@"大",@"小",@"单",@"双"];
            model.IsHeardlable = YES;
            model.KindShape = 0;
        }
        else
        {model.DigitArray = @[@"百位",@"十位"];
            model.BugKeyArray = @[@"全",@"清"];
            model.OptionsArray = @[@"大",@"小",@"单",@"双"];
            model.IsHeardlable = YES;
            model.KindShape = 0;
            
        }
    }
    
    return model;
}

+(GamePourModel *)returnArrangeThreeAndFiveDatas:(NSDictionary *)dic
{
    GamePourModel *model;
    if (!model) model = [[GamePourModel alloc]init];
    
    NSString *leftnub = dic[@"leftNub"];
    NSString *middelnub = dic[@"middelNub"];
    NSString *rightnub = dic[@"rightNub"];
    
    
    if ([leftnub isEqualToString:@"0"])
    {
        if ([middelnub isEqualToString:@"0"])
        {
            if ([rightnub isEqualToString:@"0"])
            {
                model.DigitArray = @[@"万位",@"千位",@"百位"];
                model.BugKeyArray = @[@"全",@"大",@"小",@"奇",@"偶",@"清"];
                model.BallNub = 10;
                model.StartNub = 0;
                model.IsHeardlable = NO;
                model.KindShape = 0;
            }
            else
            {
                model.DigitArray = @[@"直选和值"];
                model.BallNub = 28;
                model.StartNub = 0;
                model.KindShape = 0;
                model.IsHeardlable = YES;
            }
        }
        else
        {
            if ([rightnub isEqualToString:@"0"])
            {
                model.DigitArray = @[@"组三"];
                model.BugKeyArray = @[@"全",@"大",@"小",@"奇",@"偶",@"清"];
                model.BallNub = 10;
                model.StartNub = 0;
                model.IsHeardlable = YES;
                model.KindShape = 0;
            }
            else if([rightnub isEqualToString:@"0"])
            {
                model.DigitArray = @[@"组三"];
                model.BugKeyArray = @[@"全",@"大",@"小",@"奇",@"偶",@"清"];
                model.BallNub = 10;
                model.StartNub = 0;
                model.IsHeardlable = YES;
                model.KindShape = 0;
            }
            else
            {
                model.DigitArray = @[@"组选和值"];
                model.BallNub = 26;
                model.StartNub = 1;
                model.IsHeardlable = YES;
                model.KindShape = 0;
                model.IsHeardlable = YES;
            }
        }
    }
    else if ([leftnub isEqualToString:@"1"])
    {
        if([middelnub isEqualToString:@"0"])
        {
            if ([rightnub isEqualToString:@"0"]||[rightnub isEqualToString:@"1"])
            {
                model.DigitArray = @[@"十位",@"个位"];
                model.BugKeyArray = @[@"全",@"大",@"小",@"奇",@"偶",@"清"];
                model.BallNub = 10;
                model.StartNub = 0;
                model.IsHeardlable = NO;
                model.KindShape = 0;
            }
            else
            {
                model.DigitArray = @[@"和值"];
                model.BallNub = 19;
                model.StartNub = 0;
                model.IsHeardlable = YES;
                model.KindShape = 0;
            }
        }
        else
        {
            if ([rightnub isEqualToString:@"0"]||[rightnub isEqualToString:@"1"])
            {
                model.DigitArray = @[@"组选"];
                model.BugKeyArray = @[@"全",@"大",@"小",@"奇",@"偶",@"清"];
                model.BallNub = 10;
                model.StartNub = 0;
                model.IsHeardlable = YES;
                model.KindShape = 0;
            }
            else
            {
                model.DigitArray = @[@"和值"];
                model.BallNub = 17;
                model.StartNub = 1;
                model.IsHeardlable = YES;
                model.KindShape = 0;
            }
        }
    }
    else if ([leftnub isEqualToString:@"2"])
    {
        model.DigitArray = @[@"万位",@"千位",@"百位",@"十位",@"个位"];
        model.BugKeyArray = @[@"全",@"大",@"小",@"奇",@"偶",@"清"];
        model.BallNub = 10;
        model.StartNub = 0;
        model.IsHeardlable = NO;
        model.KindShape = 0;
    }
    else if ([leftnub isEqualToString:@"3"])
    {
            model.DigitArray = @[@"不定胆"];
            model.BugKeyArray = @[@"全",@"大",@"小",@"奇",@"偶",@"清"];
            model.BallNub = 10;
            model.StartNub = 0;
            model.IsHeardlable = YES;
            model.KindShape = 0;
    }
    else if ([leftnub isEqualToString:@"4"])
    {
        
        if([rightnub isEqualToString:@"0"])
        {
            model.DigitArray = @[@"十位",@"个位"];
            model.BugKeyArray = @[@"全",@"清"];
            model.OptionsArray = @[@"大",@"小",@"单",@"双"];
            model.IsHeardlable = YES;
            model.KindShape = 0;
        }
        else
        {model.DigitArray = @[@"万位",@"千位"];
            model.BugKeyArray = @[@"全",@"清"];
            model.OptionsArray = @[@"大",@"小",@"单",@"双"];
            model.IsHeardlable = YES;
            model.KindShape = 0;
            
        }
    }
    
    return model;
}

+(GamePourModel *)Gamename:(NSString *)NameString And:(NSDictionary *)dic
{
    
    if ([NameString containsString:@"时时彩"]||[NameString containsString:@"迪拜"])
    {
        return [self returnDatas:dic];
    }
    else if([NameString isEqualToString:@"北京快乐8"])
    {
        return [self returnBjHappyDatas:dic];
    }
    else if([NameString isEqualToString:@"江苏快三"])
    {
        return [self returnJSKSDatas:dic];
    }
    else if([NameString containsString:@"11选5"])
    {
        return [self returnElevenTofiveDatas:dic];
    }
    else if([NameString isEqualToString:@"北京PK拾"])
    {
        return [self returnBJPKTenDatas:dic];
    }
    else if([NameString isEqualToString:@"福彩3D"])
    {
        return [self returnFC3DDatas:dic];
    }
    else if([NameString isEqualToString:@"排列三,五"])
    {
        return [self returnArrangeThreeAndFiveDatas:dic];
    }
    
    return nil;
}

@end
