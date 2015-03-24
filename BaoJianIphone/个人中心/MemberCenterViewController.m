//
//  MemberCenterViewController.m
//  BaoJianIphone
//
//  Created by 马东凯 on 15/3/16.
//  Copyright (c) 2015年 madongkai. All rights reserved.
//

#import "MemberCenterViewController.h"

@interface MemberCenterViewController ()

@end

@implementation MemberCenterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.navbar.titleLabel.text = @"个人中心";
    entryArray = [[NSMutableArray alloc]initWithObjects:
  @{@"title":@"个人信息",@"subtitle":@"我的个人基本信息",@"img":@"member_info_icon"},
  @{@"title":@"业绩查询",@"subtitle":@"我的业绩查询",@"img":@"member_search_icon"},
  @{@"title":@"个人订货",@"subtitle":@"查看个人已购产品",@"img":@"member_order_icon"},
  @{@"title":@"兑换纪录",@"subtitle":@"我已兑领的产品和积分",@"img":@"member_dl_icon"},
  @{@"title":@"销售激励",@"subtitle":@"我的奖励",@"img":@"member_jl_icon"},
  @{@"title":@"续约提醒",@"subtitle":@"伙伴们续约提醒在这里",@"img":@"member_tip_icon"},
  @{@"title":@"设置",@"subtitle":@"手机APP管理",@"img":@"member_set_icon"}, nil];
    
    
    _maintableView.backgroundColor = [UIColor clearColor];
    _maintableView.opaque = NO;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if(section == 0){
        return 5;
    }else{
        return 2;
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if(cell == nil){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
        UIImageView * line = [[UIImageView alloc]initWithFrame:CGRectMake(44, 49,tableView.frame.size.width-44, 1)];
        line.tag = 100;
        line.backgroundColor = UIColorFromRGB(0xf1f1f1);
        [cell.contentView addSubview:line];
    }
    
    UIImageView * line = (UIImageView *)[cell.contentView viewWithTag:100];
    
    if(indexPath.section == 0){
        cell.textLabel.text = [[entryArray objectAtIndex:indexPath.row] objectForKey:@"title"];
        cell.detailTextLabel.text = [[entryArray objectAtIndex:indexPath.row] objectForKey:@"subtitle"];
        [cell.imageView setImage:[UIImage imageNamed:[[entryArray objectAtIndex:indexPath.row] objectForKey:@"img"]]];
        if(indexPath.row == 4){
            line.hidden = YES;
        }else{
            line.hidden = NO;
        }
    }else{
        cell.textLabel.text = [[entryArray objectAtIndex:5+indexPath.row] objectForKey:@"title"];
        cell.detailTextLabel.text = [[entryArray objectAtIndex:5+indexPath.row] objectForKey:@"subtitle"];
        [cell.imageView setImage:[UIImage imageNamed:[[entryArray objectAtIndex:5+indexPath.row] objectForKey:@"img"]]];
        if(indexPath.row == 1){
            line.hidden = YES;
        }else{
            line.hidden = NO;
        }
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if(section == 1){
        return 10;
    }
    else
    {
        return 0;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}

- (void)back:(id)sender{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
