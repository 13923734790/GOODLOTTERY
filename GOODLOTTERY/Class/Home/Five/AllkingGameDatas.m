//
//  AllkingGameDatas.m
//  GOODLOTTERY
//
//  Created by apple on 16/1/27.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "AllkingGameDatas.h"
#import "newPikerModel.h"
#import "newPikerSubOneModel.h"
#import "newPikerSubTwoModel.h"

@implementation AllkingGameDatas

+(NSArray *)SSCDatas
{
    
NSArray *array = @[@{@"五星":@[@{@"五星直选":@[@"五星复式",@"五星单式",@"五星组合"]},@{@"五星组选":@[@"组选120",@"组选60", @"组选30",@"组选20", @"组选10",@"组选5"]}]},
  @{@"前四":@[@{@"前四直选":@[@"前四复式",@"前四单式",@"前四组合"]},@{@"前四组选":@[@"前四组选24",@"前四组选12",@"前四组选6",@"前四组选4"]}]},
  @{@"后四":@[@{@"后四直选":@[@"后四复式",@"后四单式",@"后四组合"]},@{@"后四组选":@[@"后四组选24",@"后四组选12",@"后四组选6",@"后四组选4"]}]},
  @{@"后三码":@[@{@"后三直选":@[@"后三直选复式",@"后三直选单式",@"后三直选和值"]},@{@"后三组选":@[@"后三组三",@"后三组六",@"后三混合组选",@"后三组选和值"]}]},
  @{@"前三码":@[@{@"前三直选":@[@"前三直选复式",@"前三直选单式",@"前三直选和值"]},@{@"前三组选":@[@"前三组三",@"前三组六",@"前三混合组选",@"前三组选和值"]}]},
  @{@"中三码":@[@{@"中三直选":@[@"中三直选复式",@"中三直选单式",@"中三直选和值"]},@{@"中三组选":@[@"中三组三",@"中三组六",@"中三混合组选",@"中三直选和值"]}]},
  @{@"二码":@[@{@"二星直选":@[@"后二直选(复式)",@"后二直选(单式)",@"前二直选(复式)",@"前二直选(单式)",@"后二直选和值",@"前二直选和值"]},@{@"二星组选":@[@"后二组选(复式)",@"后二组选(单式)",@"前二组选(复式)",@"前二组选(单式)",@"后二组选和值",@"前二组选和值"]}]},
  @{@"定位胆":@[@{@"定位胆":@[@"定位胆"]}]},
  @{@"不定胆":@[@{@"三星不定胆":@[@"后三一码不定胆",@"后三二码不定胆",@"前三一码不定胆",@"前三二码不定胆"]}]},
  @{@"大小单双":@[@{@"大小单双":@[@"前二大小单双",@"后二大小单双"]}]},
  @{@"趣味":@[@{@"特殊":@[@"一帆风顺",@"好事成双",@"三星报喜",@"四季发财"]}]},
  @{@"任选二":@[@{@"任二直选":@[@"任二直选复式",@"任二直选单式",@"任二直选和值"]},@{@"任二组选":@[@"任二直选复式",@"任二直选单式",@"任二直选和值"]}]},
  @{@"任选三":@[@{@"任三直选":@[@"任三直选复式",@"任三直选单式",@"任三直选和值"]},@{@"任三组选":@[@"任三组三",@"任三组六",@"任三混合组选",@"任三组选和值"]}]},
  @{@"任选四":@[@{@"任四直选":@[@"任四直选复式",@"任四直选单式"]},@{@"任四组选":@[@"组选24",@"组选12",@"组选6",@"组选4"]}]}
    ];
    
    
    
    return array;
    
    
}

+(void)pickerViewAllDatas:(NSString *)NameString success:(datasSuccessBlock)success failure:(datasFailureBlock)failure{
    if ([NameString containsString:@"时时彩"]||[NameString containsString:@"分彩"])
    {
        AFNetworkingAPI *manger = [AFNetworkingAPI shareAFNetworking];
        [manger getHttp:@"http://192.168.1.10:31/OffcialGame/Index?gameId=26" showHUD:NO parameters:nil success:^(NSMutableDictionary *responseDic)
         {
             
             [newPikerModel mj_setupObjectClassInArray:^NSDictionary *{
                 return @{
                          @"array":@"newPikerSubOneModel"
                          };
             }];
             [newPikerSubOneModel mj_setupObjectClassInArray:^NSDictionary *{
                 return @{
                          @"array":@"newPikerSubTwoModel",
                          };
             }];
             
             NSArray *datas = [newPikerModel mj_objectArrayWithKeyValuesArray:responseDic];
             NSMutableArray *array = (NSMutableArray *)datas;
             if (success)
             {
                 success(array);
             }
             
         } failure:^(NSError *error)
         {
             if (failure)
             {
                 failure(error);
             }
             NSLog(@"失败");
         }];

    }
    
}

+(NSArray *)BjHappyDatas
{
    NSArray *array = @[@{@"任选":@[@{@"任选":@[@"任选一",@"任选二",@"任选三",@"任选四",@"任选五",@"任选六",@"任选七"]}]},
                       @{@"趣味":@[@{@"趣味":@[@"和值单双",@"和值大小",@"上下盘",@"奇偶盘",@"和值大小单双"]}]}];
    
    return array;
}
+(NSArray *)JsHappyDatas
{
    NSArray *array = @[@{@"同号":@[@{@"二同号":@[@"二同号单选",@"二同号复选"]},@{@"三同号":@[@"三同号单选",@"三同号复选"]}]},
                       @{@"和值":@[@{@"和值":@[@"和值"]}]},@{@"三连号":@[@{@"三连号":@[@"三连号"]}]},@{@"不同号":@[@{@"不同号":@[@"二不同号",@"三不同号"]}]}];
    
    return array;
}
+(NSArray *)ElevenToFiveDatas
{
    NSArray *array = @[@{@"三码":@[@{@"前三":@[@"前三直选复式",@"前三直选单式",@"前三组选复式",@"前三组选单式"]}]},
  @{@"二码":@[@{@"前二":@[@"前二直选复式",@"前二直选单式",@"前二组选复式",@"前二组选单式"]}]},
  @{@"不定胆":@[@{@"不定胆":@[@"不定胆"]}]},
  @{@"定位胆":@[@{@"定位胆":@[@"定位胆"]}]},
  @{@"趣味型":@[@{@"趣味性":@[@"定单双",@"猜中位"]}]},
  @{@"任选单式":@[@{@"任选单式":@[@"一中一",@"二中二",@"三中三",@"四中四",@"五中五",@"六中五",@"七中五",@"八中五"]}]},
  @{@"任选复式":@[@{@"任选复式":@[@"一中一",@"二中二",@"三中三",@"四中四",@"五中五",@"六中五",@"七中五",@"八中五"]}]}];
    
    return array;
}
+(NSArray *)BJPKTenDatas
{
    NSArray *array = @[@{@"猜冠军":@[@{@"猜冠军":@[@"猜冠军"]}]},@{@"猜前二":@[@{@"猜前二":@[@"猜前二复式",@"猜前二单式"]}]},@{@"猜前三":@[@{@"猜前三":@[@"猜前三复式",@"猜前三单式"]}]},@{@"猜前四":@[@{@"猜前四":@[@"猜前四复式",@"猜前四单式"]}]},@{@"猜前五":@[@{@"猜前五":@[@"猜前五复式",@"猜前五单式"]}]},@{@"定位胆":@[@{@"定位胆":@[@"定位胆"]}]}];
    return array;
}

+(NSArray *)FC3DDatas
{
    NSArray *array = @[@{@"三码":@[@{@"直选":@[@"复式",@"单式",@"直选和值"]},@{@"组选":@[@"组三",@"组六",@"混合组选",@"组选和值"]}]},@{@"不定胆":@[@{@"不定胆":@[@"一码不定胆",@"二码不定胆"]}]},@{@"二码":@[@{@"前二":@[@"前二直选复式",@"前二直选单式",@"前二组选复式",@"前二组选单式"]},@{@"后二":@[@"后二直选复式",@"后二直选单式",@"后二组选复式",@"后二组选单式"]}]},@{@"定位胆":@[@{@"定位胆":@[@"定位胆"]}]},@{@"大小单双":@[@{@"大小单双":@[@"前二大小单双",@"后二大小单双"]}]}];
    
    return array;
}
+(NSArray *)ArrangeThreeAndFiveDatas
{
    NSArray *array = @[
  @{@"前三码":@[@{@"前三直选":@[@"前三直选复式",@"前三直选单式",@"前三直选和值"]},@{@"前三组选":@[@"前三组三",@"前三组六",@"前三混合组选",@"前三组选和值"]}]},
  @{@"二码":@[@{@"二星直选":@[@"后二直选复式",@"后二直选单式",@"前二直选复式",@"前二直选单式",@"后二直选和值",@"前二直选和值"]},@{@"二星组选":@[@"后二组选复式",@"后二组选单式",@"前二组选复式",@"前二组选单式",@"后二组选和值",@"前二组选和值"]}]},
  @{@"定位胆":@[@{@"定位胆":@[@"定位胆"]}]},
  @{@"不定胆":@[@{@"三星不定胆":@[@"后三一码不定胆",@"后三二码不定胆",@"前三一码不定胆",@"前三二码不定胆"]}]},
  @{@"大小单双":@[@{@"大小单双":@[@"后二大小单双",@"前二大小单双"]}]}];
    return array;
}

+(NSArray *)pickerViewAllDatas:(NSString *)NameString
{
    
    if ([NameString containsString:@"时时彩"]||[NameString containsString:@"分彩"])
    {
        return  [self SSCDatas];
    }
    else if([NameString isEqualToString:@"北京快乐8"])
    {
        return [self BjHappyDatas];
    }
    else if([NameString isEqualToString:@"江苏快三"])
    {
        return [self JsHappyDatas];
    }
    else if([NameString  containsString:@"11选5"])
    {
        return [self ElevenToFiveDatas];
    }
    else if([NameString isEqualToString:@"北京PK拾"])
    {
        return [self BJPKTenDatas];
    }
    else if([NameString isEqualToString:@"福彩3D"])
    {
        return [self FC3DDatas];
    }
    else if([NameString isEqualToString:@"排列三,五"])
    {
        return [self ArrangeThreeAndFiveDatas];
    }
    
    return nil;
}
@end

