//
//  UserListCell.m
//  GOODLOTTERY
//
//  Created by apple on 16/3/21.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "UserListCell.h"

@implementation UserListCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        for (int i = 0; i<6; i++)
        {
            if (i==5)
            {
                UIButton *but = [UIButton buttonWithType:UIButtonTypeCustom];

                but.frame = CGRectMake((((UIScreenWIDTH-5)*2/11)+1)*i,0,(UIScreenWIDTH-5)/11,40*ScaleY-1);
                [but addTarget:self action:@selector(ClickPull:) forControlEvents:UIControlEventTouchUpInside];
                but.backgroundColor = GETCOLOR(@"b0.3w");
                [but setImage:[UIImage imageNamed:@"TitleRightImage"] forState:UIControlStateNormal];
                  [self.contentView addSubview:but];
            }
            else
            {
                blackAndwhiteLable *lable = [[blackAndwhiteLable alloc]init];
                lable.frame = CGRectMake((((UIScreenWIDTH-5)*2/11)+1)*i,0,(UIScreenWIDTH-5)*2/11,40*ScaleY-1);
                lable.text = @"test03";
                lable.textAlignment = NSTextAlignmentCenter;
                lable.backgroundColor = GETCOLOR(@"b0.3w");
                [self.contentView addSubview:lable];

            }
            
        }
        
        _pullView = [[UIView alloc]initWithFrame:CGRectMake(0, 40*ScaleY,UIScreenWIDTH, 25*ScaleY+2)];
        _pullView.hidden = YES;
        [self.contentView addSubview:_pullView];
        
    }

    self.selectionStyle = UITableViewCellSelectionStyleNone;
    return self;
    
}
- (void)ClickPull:(UIButton *)bt
{
    
    if (_blcokpullCell)
    {
        _blcokpullCell(self.tag);
    }
    
}

- (void)setPullArray:(NSArray *)PullArray
{
    
    NSInteger Nub = PullArray.count;
    
    for (int i = 0; i<Nub; i++)
    {
        UIButton *but = [UIButton buttonWithType:UIButtonTypeCustom];
        
        if (i==0)
        {
            but.frame = CGRectMake(1,1,(UIScreenWIDTH-Nub-1)/(2*Nub-1),25*ScaleY);
        }
        else{
            but.frame = CGRectMake(2+(UIScreenWIDTH-Nub-1)/(2*Nub-1)+((UIScreenWIDTH-Nub-1)/(2*Nub-1)*2+1)*i-((UIScreenWIDTH-Nub-1)/(2*Nub-1)*2+1),1,(UIScreenWIDTH-Nub-1)/(2*Nub-1)*2,25*ScaleY);
        }
        but.layer.cornerRadius = 3;
        but.layer.masksToBounds = YES;
        but.titleLabel.font = [UIFont systemFontOfSize:13*ScaleY];
        but.backgroundColor = [UIColor blackColor];
        [but addTarget:self action:@selector(PushNewView:) forControlEvents:UIControlEventTouchUpInside];
        [but setTitle:PullArray[i] forState:UIControlStateNormal];
        [but setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_pullView addSubview:but];
    }
    
}
- (void)PushNewView:(UIButton *)btt
{
   
    NSLog(@"%@",[btt currentTitle]);
    
    if (_blcokpushView)
    {
        _blcokpushView(btt.currentTitle);
    }
}
@end
