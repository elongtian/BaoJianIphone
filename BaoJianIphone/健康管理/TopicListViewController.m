//
//  TopicListViewController.m
//  BaoJianIphone
//
//  Created by elongtian on 15-2-26.
//  Copyright (c) 2015年 madongkai. All rights reserved.
//

#import "TopicListViewController.h"
#import "TopicListTableViewCell.h"
#import "NSString+Addtion.h"
#import "TopicFinalViewController.h"
#import "KxMenu.h"
@interface TopicListViewController ()

@end

@implementation TopicListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self initPlat];
    
    [self download];
}

- (void)initPlat{
    
    dataArray = [[NSMutableArray alloc]init];
    
    self.navbar.titleLabel.text = @"热门话题";
    [self.navbar.homebtn setImage:[UIImage imageNamed:@"more_point_btn"] forState:UIControlStateNormal];
    _mainTableView.backgroundColor = [UIColor clearColor];
    _mainTableView.opaque = NO;
    
    page = 1;
    
    
}
- (void)download{
    [ELRequestSingle topicListRequest:^(BOOL success,id objc) {
        if(page == 1){
            [dataArray removeAllObjects];
        }
        else{
            
        }
        [dataArray addObjectsFromArray:(NSArray *)objc];
        [_mainTableView reloadData];
    } Page:page];
}

//12月摘星榜单来啦！随着摘星活动的持续进行，越来越多的宝健伙伴加入到奔驰人生与免费去巴黎的队伍中。
//免费去巴黎 摘星 不容迟疑

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.row%2 != 0){
    
        BJObject * object = [dataArray objectAtIndex:indexPath.row/2];
        NSString * str1 = @"免费去巴黎 摘星 不容迟疑 免费去巴黎 摘星 不容迟疑";
        NSString * str2 = @"12月摘星榜单来啦！随着摘星活动的持续进行，越来越多的宝健伙伴加入到奔驰人生与免费去巴黎的队伍中。12月摘星榜单来啦！随着摘星活动的持续进行，越来越多的宝健伙伴加入到奔驰人生与免费去巴黎的队伍中。";
//        NSString * str1 = object.content_name;
//        NSString * str2 = object.content_desc;
        CGSize size1 = [str1 getcontentsizeWithfont:UIFontHiraginoSansGBW6(14) constrainedtosize:CGSizeMake(SCREENWIDTH-75-3*8-10*2, 300) linemode:NSLineBreakByCharWrapping];
        
        CGSize size2 = [str2 getcontentsizeWithfont:UIFontHiraginoSansGBW3(13) constrainedtosize:CGSizeMake(SCREENWIDTH-75-3*8-10*2, 300) linemode:NSLineBreakByCharWrapping];
        
        return size1.height+size2.height+3+8+5+20+8>75+8*2?(size1.height+size2.height+3+8+5+20+8):75+8*2;
        
    }else{
        return 10;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [dataArray count]*2;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.row%2 != 0){
    
        TopicListTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"TopicListTableViewCell"];
        if(cell == nil){
            cell = [[[NSBundle mainBundle] loadNibNamed:@"TopicListTableViewCell" owner:self options:nil] lastObject];
            cell.zanNum.layer.cornerRadius = 3;
            cell.evaluates.layer.cornerRadius = 3;
            [cell.evaluates.layer setMasksToBounds:YES];
        }
        BJObject * object = [dataArray objectAtIndex:indexPath.row/2];
        cell.content_title.text = @"免费去巴黎 摘星 不容迟疑 免费去巴黎 摘星 不容迟疑";
        cell.content_desc.text = @"12月摘星榜单来啦！随着摘星活动的持续进行，越来越多的宝健伙伴加入到奔驰人生与免费去巴黎的队伍中。12月摘星榜单来啦！随着摘星活动的持续进行，越来越多的宝健伙伴加入到奔驰人生与免费去巴黎的队伍中。";
//        cell.content_title.text = object.content_name;
//        cell.content_desc.text = object.content_desc;
        [cell.contentView sizeToFit];
        return cell;
    }else{
        UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
        if(cell == nil){
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.backgroundColor = [UIColor clearColor];
            cell.contentView.backgroundColor = [UIColor clearColor];
        }
        return cell;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    BJObject * object = [dataArray objectAtIndex:indexPath.row/2];
    TopicFinalViewController * final = [[TopicFinalViewController alloc]initWithNibName:@"TopicFinalViewController" bundle:nil];
    final.optionid = object.auto_id;
    [self.navigationController pushViewController:final animated:YES];
}


- (void)home:(id)sender{
    //
    NSLog(@"点击更多");
    KxMenuItem * item1 = [KxMenuItem menuItem:@"消息" image:[UIImage imageNamed:@"message_icon"] target:self action:@selector(menuSelected:) index:100];
    item1.foreColor = UIColorFromRGB(0x585858);
    KxMenuItem * item2 = [KxMenuItem menuItem:@"首页" image:[UIImage imageNamed:@"home_icon"] target:self action:@selector(menuSelected:) index:101];
    item2.foreColor = UIColorFromRGB(0x585858);
    NSArray * arr = [[NSArray alloc]initWithObjects:item1,item2, nil];
    
    [KxMenu setTintColor:[UIColor whiteColor]];
    [KxMenu showMenuInView:self.view fromRect:self.navbar.homebtn.frame menuItems:arr];
}

- (void)menuSelected:(id)sender{
    KxMenuItem * item = (KxMenuItem *)sender;
    if(item.tag == 100){
        NSLog(@"消息");
    }else{
        [self.navigationController popToRootViewControllerAnimated:YES];
    }
}


- (void)back:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
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
