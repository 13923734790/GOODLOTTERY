//
//  MarkSixDatas.m
//  GOODLOTTERY
//
//  Created by apple on 16/8/1.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "MarkSixDatas.h"

#import "LiuHeCell.h"
#import "LiuHeTwoFaceCell.h"
#import "LiuHeSeBoCell.h"
#import "LiuHeTeXiaoCell.h"
#import "LiuHeLianMaCell.h"
#import "DragonTigerCell.h"
#import "LiuHeHeXIaoCell.h"

#import "MarkSixModel.h"

@implementation MarkSixDatas
+(UITableViewCell *)shareGetCell:(NSString *)TitleString
{
    
//    @[@"正特",@"两面",@"色波",@"特肖",@"正码",@"正特",@"正码1-6",@"连码",@"一肖",@"尾数"];
    
     MarkSixModel *model = [MarkSixModel ShareMarkSix];
     NSString *oddstring = model.OddString;
     UITableViewCell *CurrentCell;
    
    if ([TitleString isEqualToString:@"特码"]||[TitleString isEqualToString:@"正码"]||[TitleString isEqualToString:@"正特"]||[TitleString isEqualToString:@"自选不中"])
    {
        LiuHeCell *cell;
        cell = [[LiuHeCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
        cell.isFastHidden = YES;
        cell.MissNub = 0;
        if ([TitleString isEqualToString:@"自选不中"])
        {
            if ([model.childString isEqualToString:@"五不中"])
            {cell.MissNub = 5;
            }
            else if ([model.childString isEqualToString:@"六不中"])
            {cell.MissNub = 6;
            }
            else if ([model.childString isEqualToString:@"七不中"])
            {cell.MissNub = 7;
            }
            else if ([model.childString isEqualToString:@"八不中"])
            {cell.MissNub = 8;
            }
            else if ([model.childString isEqualToString:@"九不中"])
            {cell.MissNub = 9;
            }
            else if ([model.childString isEqualToString:@"十不中"])
            {cell.MissNub = 10;
            }
            else if ([model.childString isEqualToString:@"十一不中"])
            {cell.MissNub = 11;
            }
            else if ([model.childString isEqualToString:@"十二不中"])
            {cell.MissNub = 12;
            }
        }
        [cell setOddstring:oddstring];
        CurrentCell = cell;
    }
    else if ([TitleString isEqualToString:@"两面"]||[TitleString isEqualToString:@"正码1-6"])
    {
        LiuHeTwoFaceCell *cell;
        cell = [[LiuHeTwoFaceCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
        if ([TitleString isEqualToString:@"正码1-6"])
        {
            cell.FaceNub = 9;
            cell.WithFaceNub =3;
            cell.heightOddwith = 0.5;
        }
        else if ([TitleString isEqualToString:@"两面"])
        {
            cell.FaceNub = 31;
            cell.WithFaceNub =4;
            cell.heightOddwith = 0.5;
        }
        
        [cell setButtonView];
        [cell setOddstring:oddstring];
        
        CurrentCell = cell;
    }
    else if ([TitleString isEqualToString:@"色波"])
    {
        LiuHeSeBoCell *cell;
        cell = [[LiuHeSeBoCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
        [cell setOddstring:oddstring];
        CurrentCell = cell;
    }
    else if ([TitleString isEqualToString:@"特肖"])
    {
        LiuHeTeXiaoCell *cell;
        cell = [[LiuHeTeXiaoCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
        cell.Arraytitle = @[@"鼠",@"牛",@"虎",@"兔",@"龙",@"蛇",@"马",@"羊",@"猴",@"鸡",@"狗",@"猪",];
        [cell setOddstring:oddstring];
        CurrentCell = cell;
    }
    else if ([TitleString isEqualToString:@"连码"])
    {
        
        if ([model.childString isEqualToString:@"生肖对碰"])
        {
            LiuHeTeXiaoCell *cell;
            cell = [[LiuHeTeXiaoCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
            cell.Arraytitle = @[@"鼠",@"牛",@"虎",@"兔",@"龙",@"蛇",@"马",@"羊",@"猴",@"鸡",@"狗",@"猪"];
            [cell setOddstring:oddstring];
            CurrentCell = cell;
            
        }
        else if ([model.childString isEqualToString:@"尾数对碰"])
        {
            
            LiuHeTeXiaoCell *cell;
            cell = [[LiuHeTeXiaoCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
            cell.Arraytitle = @[@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9"];
            [cell setOddstring:oddstring];
            CurrentCell = cell;
        }
        else if ([model.childString isEqualToString:@"混合对碰"])
        {
            
            LiuHeTeXiaoCell *cell;
            cell = [[LiuHeTeXiaoCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
            cell.Arraytitle = @[@"鼠",@"牛",@"虎",@"兔",@"龙",@"蛇",@"马",@"羊",@"猴",@"鸡",@"狗",@"猪",@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9"];
            [cell setOddstring:oddstring];
            CurrentCell = cell;
            
        }
        else{
            
            LiuHeLianMaCell *cell;
            cell = [[LiuHeLianMaCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
            cell.FaceNub = 49;
            cell.WithFaceNub =3;
            cell.heightOddwith = 0.5;
            [cell setButtonView];
            [cell setOddstring:oddstring];
            CurrentCell = cell;

        }
    }
    else if ([TitleString isEqualToString:@"一肖"])
    {
        LiuHeTeXiaoCell *cell;
        cell = [[LiuHeTeXiaoCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
        cell.Arraytitle = @[@"鼠",@"牛",@"虎",@"兔",@"龙",@"蛇",@"马",@"羊",@"猴",@"鸡",@"狗",@"猪"];
        [cell setOddstring:oddstring];
        CurrentCell = cell;
    }
    else if ([TitleString isEqualToString:@"尾数"])
    {
        LiuHeTeXiaoCell *cell;
        cell = [[LiuHeTeXiaoCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
        cell.Arraytitle = @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"0"];
        [cell setOddstring:oddstring];
        CurrentCell = cell;
    }
    else if ([TitleString isEqualToString:@"连肖"])
    {
        LiuHeTeXiaoCell *cell;
        cell = [[LiuHeTeXiaoCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
        cell.Arraytitle = @[@"鼠",@"牛",@"虎",@"兔",@"龙",@"蛇",@"马",@"羊",@"猴",@"鸡",@"狗",@"猪"];
        if ([model.childString isEqualToString:@"连肖二肖"])
        {
            [cell setOddstring:@"2.2"];
        }
        else if ([model.childString isEqualToString:@"连肖三肖"])
        {
            [cell setOddstring:@"3.3"];
        }else if ([model.childString isEqualToString:@"连肖四肖"])
        {
            [cell setOddstring:@"4.4"];
        }else if ([model.childString isEqualToString:@"连肖五肖"])
        {
            [cell setOddstring:@"5.5"];
        }else{
            [cell setOddstring:@"2.2"];
        }
        CurrentCell = cell;

    }
    else if ([TitleString isEqualToString:@"龙虎斗"])
    {
        DragonTigerCell *cell;
        cell = [[DragonTigerCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
        cell.DragonTigerStyle = DragonTigerTwo;
        cell.NubCount = 9;
        [cell setAllBt];
        CurrentCell = cell;
    }
    else if ([TitleString isEqualToString:@"合肖"])
    {
        LiuHeHeXIaoCell *cell;
        cell = [[LiuHeHeXIaoCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
        cell.Arraytitle = @[@"鼠",@"牛",@"虎",@"兔",@"龙",@"蛇",@"马",@"羊",@"猴",@"鸡",@"狗",@"猪"];
        cell.KindString = model.childString;
        [cell setOddstring:oddstring];
        CurrentCell = cell;
    }

    CurrentCell.backgroundColor = [UIColor clearColor];
    CurrentCell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return CurrentCell;

}

+(CGFloat)ShareReturnCellheight:(NSString *)TitleString
{
    
    MarkSixModel *model = [MarkSixModel ShareMarkSix];
    NSString *childString = model.childString;
    
    if ([TitleString isEqualToString:@"特码"]||[TitleString isEqualToString:@"正码"]||[TitleString isEqualToString:@"正特"]||[TitleString isEqualToString:@"自选不中"])
    {
        if([TitleString isEqualToString:@"自选不中"])
        {
            return  UIScreenWIDTH-40*ScaleX+40*ScaleY;
        }
       return  105*ScaleY+UIScreenWIDTH-40*ScaleX+40*ScaleY;
    }
    else if ([TitleString isEqualToString:@"两面"]||[TitleString isEqualToString:@"正码1-6"])
    {
       return (((UIScreenWIDTH-13*ScaleX)/4)*3/5+1*ScaleY)*(30/4)+((UIScreenWIDTH-13*ScaleX)/4)*3/5+1*ScaleY;
    }
    else if ([TitleString isEqualToString:@"色波"])
    {
     return 1*ScaleY+(1*ScaleY+50*ScaleY)*12+35*ScaleY;
    }
    else if ([TitleString isEqualToString:@"特肖"]||[TitleString isEqualToString:@"一肖"]||[TitleString isEqualToString:@"连肖"]||[TitleString isEqualToString:@"合肖"])
    {
        if ([TitleString isEqualToString:@"合肖"]) {
            return 1*ScaleY+(1*ScaleY+40*ScaleY)*12+35*ScaleY+30*ScaleY;
        }
        return 1*ScaleY+(1*ScaleY+40*ScaleY)*12+35*ScaleY;
    }
    else if ([TitleString isEqualToString:@"尾数"])
    {
        return 1*ScaleY+(1*ScaleY+40*ScaleY)*10+35*ScaleY;
    }
    else if ([TitleString isEqualToString:@"连码"])
    {
        if ([childString isEqualToString:@"生肖对碰"])
        {
            return 1*ScaleY+(1*ScaleY+40*ScaleY)*12+35*ScaleY;
        }
        else if ([model.childString isEqualToString:@"尾数对碰"])
        {
            return 1*ScaleY+(1*ScaleY+40*ScaleY)*10+35*ScaleY;
        }
        else if ([model.childString isEqualToString:@"混合对碰"])
        {
            return 1*ScaleY+(1*ScaleY+40*ScaleY)*22+35*ScaleY;
        }
        else
        {
             return (((UIScreenWIDTH-12*ScaleX)/3)*0.5+1*ScaleY)*(49/3)+((UIScreenWIDTH-12*ScaleX)/3)*0.5+1*ScaleY;
        }
    }
    else if ([TitleString isEqualToString:@"龙虎斗"])
    {
        return 5*ScaleY+((UIScreenWIDTH-15*ScaleX)/4+5*ScaleY)*5;
    }

    
    return 0;
}

+(NSDictionary *)ShareReturnFPtime:(NSString *)TitleString
{
    NSDictionary *dic = [NSDictionary dictionary];
    
    if ([TitleString isEqualToString:@"特码"]||[TitleString isEqualToString:@"正码"]||[TitleString isEqualToString:@"正特"]||[TitleString isEqualToString:@"自选不中"])
    {
        if ([TitleString isEqualToString:@"正特"])
        {
            dic = @{@"leftarray":@[@"正码特一",@"正码特二",@"正码特三",@"正码特四",@"正码特五",@"正码特六",],@"rightarray":@[@"快速组合"]};
        }
        else if ([TitleString isEqualToString:@"自选不中"])
        {
            dic = @{@"rightarray":@[@"五不中",@"六不中",@"七不中",@"八不中",@"九不中",@"十不中",@"十一不中",@"十二不中",]};
        }
        else
        {
            dic = @{@"rightarray":@[@"快速组合"]};
        }
        return  dic;
    }
    else if ([TitleString isEqualToString:@"正码1-6"])
    {
        dic = @{@"rightarray":@[@"正码一",@"正码二",@"正码三",@"正码四",@"正码五",@"正码六",]};
        return dic;
    }
    else if ([TitleString isEqualToString:@"色波"]||[TitleString isEqualToString:@"一肖"]||[TitleString isEqualToString:@"尾数"]||[TitleString isEqualToString:@"特肖"]||[TitleString isEqualToString:@"两面"]||[TitleString isEqualToString:@"龙虎斗"])
    {
        dic = @{};
        return dic;
    }
    else if ([TitleString isEqualToString:@"连码"])
    {
        dic = @{@"leftarray":@[@[@"单选/复式",@"胆拖"],@[@"单选/复式",@"胆拖"],@[@"单选/复式",@"胆拖",@"生肖对碰",@"尾数对碰",@"混合对碰"],@[@"单选/复式",@"胆拖",@"生肖对碰",@"尾数对碰",@"混合对碰"],@[@"单选/复式",@"胆拖",@"生肖对碰",@"尾数对碰",@"混合对碰"]],@"rightarray":@[@"三中二",@"三全中",@"二全中",@"二中特",@"特串"],@"Ischange":@"Ischange"};

        return dic;
    }
    else if([TitleString isEqualToString:@"连肖"])
    {
        dic = @{@"leftarray":@[@[@"单选/复式",@"胆拖"],@[@"单选/复式",@"胆拖"],@[@"单选/复式",@"胆拖"],@[@"单选/复式",@"胆拖"]],@"rightarray":@[@"连肖二肖",@"连肖三肖",@"连肖四肖",@"连肖五肖"],@"Ischange":@"Ischange"};
        
        return dic;
    }
    else if ([TitleString isEqualToString:@"合肖"])
    {
        dic = @{@"rightarray":@[@"一肖",@"二肖",@"三肖",@"四肖",@"五肖",@"六肖",@"七肖",@"八肖",@"九肖",@"十肖",@"十一肖"]};
        
        return dic;
    }
    
    
    return nil;
}

//+(NSArray *)ShareReturnSeletedObjc:(NSString *)TitleString AndCurrentCell:(UITableViewCell *)Currentcell{
//    
//}
@end
