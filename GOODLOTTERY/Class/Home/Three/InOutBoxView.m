//
//  InOutBoxView.m
//  GOODLOTTERY
//
//  Created by apple on 16/3/22.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "InOutBoxView.h"
#import "MailBoxCell.h"

@implementation InOutBoxView
{
    UIView *heardView;
    UILabel *lable;
    UILabel *lableLeft;
    UIButton *Rightbt;
    NSInteger dataNub;
}

- (instancetype)initWithFrame:(CGRect)frame AndName:(NSString *)name
{
    self = [super initWithFrame:frame];
    dataNub = 10;
    if (self)
    {
        heardView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, UIScreenWIDTH,50*ScaleY)];
        lable = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, UIScreenWIDTH,50*ScaleY)];
        lableLeft = [[UILabel alloc]initWithFrame:CGRectMake(20*ScaleX,0,UIScreenWIDTH/2-20*ScaleX,50*ScaleY)];
        Rightbt = [UIButton buttonWithType:UIButtonTypeCustom];
        Rightbt.frame = CGRectMake(UIScreenWIDTH*3/4-10*ScaleX,10*ScaleY,UIScreenWIDTH/4,30*ScaleY);
        lable.textAlignment = NSTextAlignmentCenter;
        [heardView addSubview:lable];
        [heardView addSubview:lableLeft];
        [heardView addSubview:Rightbt];
        if ([name isEqualToString:@"收件箱"])
        {
            lableLeft.hidden = YES;
            Rightbt.hidden = YES;
            lable.hidden = NO;
        }
        if ([name isEqualToString:@"发件箱"])
        {   lableLeft.hidden = NO;
            Rightbt.hidden = NO;
            lable.hidden = YES;
        }

        
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0,UIScreenWIDTH,FRAMEHEIGHT)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.bounces = NO;
        _tableView.backgroundColor = [UIColor clearColor];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.tableHeaderView = heardView;
        [self addSubview:_tableView];

    }
    [self updatas];
    return self;
}

-(void)updatas
{
    lable.text = @"收件短信列表";
    lableLeft.text = @"收件短信列表";
    heardView.backgroundColor = GETCOLOR(@"b0.6group");
    lable.textColor = GETCOLOR(@"blr");
    lable.font = [UIFont systemFontOfSize:15*ScaleY];
    lableLeft.textColor = GETCOLOR(@"blr");
    lableLeft.font = [UIFont systemFontOfSize:15*ScaleY];
    Rightbt.backgroundColor = GETCOLOR(@"blr");
    Rightbt.titleLabel.font = [UIFont systemFontOfSize:15*ScaleY];
    [Rightbt  setTitle:@"发内站内信息" forState:UIControlStateNormal];
    [Rightbt setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
}

 -(void)setInoutInt:(NSInteger)InoutInt
{
    _InoutInt = InoutInt;
    if (InoutInt==0 )
    {
        lableLeft.hidden = YES;
        Rightbt.hidden = YES;
        lable.hidden = NO;
    }
    if (InoutInt==1)
    {   lableLeft.hidden = NO;
        Rightbt.hidden = NO;
        lable.hidden = YES;
    }

}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return dataNub;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MailBoxCell *cell; static NSString *CellId = @"CellId";
    cell = [tableView dequeueReusableCellWithIdentifier:CellId];
    if (self)
    {
      cell = [[MailBoxCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellId];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.backgroundColor = GETCOLOR(@"cgroup");
    [cell Updatas:nil];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80*ScaleY;
}


- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath{
    return @"删除";
}
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
//        [dataArray removeObjectAtIndex:indexPath.row];
        dataNub -=1;
        // Delete the row from the data source.
        [_tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
    }
    else if (editingStyle == UITableViewCellEditingStyleInsert)
    {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}

//启用上面两个代理,并增加数据删除操作:
//[dataArray removeObjectAtIndex:indexPath.row];
@end
