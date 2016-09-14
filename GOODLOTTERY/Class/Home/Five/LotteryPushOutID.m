//
//  LotteryPushOutID.m
//  GOODLOTTERY
//
//  Created by apple on 16/1/22.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "LotteryPushOutID.h"
#import "GamePourModel.h"

@implementation LotteryPushOutID

+(GamePourModel *)Pushctrland:(NSString *)PID
{
    if ([PID isEqualToString:@"北京快乐8"])
    {
        
        GamePourModel *model = [[GamePourModel alloc]init];
        model.DigitArray = @[@"上",@"下"];
        model.BugKeyArray = nil;
        model.IsHeardlable = YES;
        model.BallNub = 41;
        model.StartNub = 1;
        model.KindShape = 0;
        
        return model;
        

    }
    else if ([PID isEqualToString:@"江苏快三"])
    {
        
        GamePourModel *model = [[GamePourModel alloc]init];
        model.DigitArray = @[@"同号",@"不同号"];
        model.BugKeyArray = nil;
        model.KindShape = 1;
        model.OptionsArrays = @[@[@"11",@"22",@"33",@"44",@"55",@"66"],@[@"1",@"2",@"3",@"4",@"5",@"6"]];
        return model;
    }
    else if ([PID containsString:@"时时彩"]||[PID containsString:@"分彩"])
    {
        GamePourModel *model = [[GamePourModel alloc]init];
        model.DigitArray = @[@"万位",@"千位",@"百位",@"十位",@"个位"];
        model.BugKeyArray = @[@"全",@"大",@"小",@"奇",@"偶",@"清"];
        model.BallNub = 10;
        model.StartNub = 0;
        model.KindShape= 0;
        return model;
    }
    else if ([PID containsString:@"11选5"])
    {

        GamePourModel *model = [[GamePourModel alloc]init];
        model.DigitArray = @[@"第一位",@"第二位",@"第三位"];
        model.BugKeyArray = @[@"全",@"大",@"小",@"奇",@"偶",@"清"];
        model.BallNub = 11;
        model.StartNub = 0;
        model.IsHeardlable = YES;
        model.KindShape = 0;
        
        return model;
    }
    else if ([PID isEqualToString:@"北京PK拾"])
    {
        
        GamePourModel *model = [[GamePourModel alloc]init];
        model.DigitArray = @[@"猜冠军"];
        model.BugKeyArray = @[@"全",@"大",@"小",@"奇",@"偶",@"清"];
        model.BallNub = 10;
        model.StartNub = 1;
        model.IsHeardlable = NO;
        model.KindShape = 0;
        
        return model;
    }
    else if ([PID isEqualToString:@"福彩3D"])
    {
        
        GamePourModel *model = [[GamePourModel alloc]init];
        model.DigitArray = @[@"百位",@"十位",@"个位"];
        model.BugKeyArray = @[@"全",@"大",@"小",@"奇",@"偶",@"清"];
        model.BallNub = 10;
        model.StartNub = 0;
        model.IsHeardlable = NO;
        model.KindShape = 0;
        return model;
    }
    else if ([PID isEqualToString:@"排列三,五"])
    {
        GamePourModel *model = [[GamePourModel alloc]init];
        model.DigitArray = @[@"万位",@"千位",@"百位"];
        model.BugKeyArray = @[@"全",@"大",@"小",@"奇",@"偶",@"清"];
        model.BallNub = 10;
        model.StartNub = 0;
        model.IsHeardlable = NO;
        model.KindShape = 0;
        return model;
    }
    
    return nil;
}
@end
