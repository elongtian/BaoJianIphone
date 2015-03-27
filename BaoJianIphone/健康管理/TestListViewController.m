//
//  TestListViewController.m
//  BaoJianIphone
//
//  Created by elongtian on 15-2-26.
//  Copyright (c) 2015年 madongkai. All rights reserved.
//

#import "TestListViewController.h"
#import "TestListTableViewCell.h"
#import "TestFinalViewController.h"
#import "KxMenu.h"
@interface TestListViewController ()

@end

@implementation TestListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navbar.titleLabel.text = @"测试";
    [self.navbar.homebtn setImage:[UIImage imageNamed:@"more_point_btn"] forState:UIControlStateNormal];
    _mainTableView.backgroundColor = [UIColor clearColor];
    _mainTableView.opaque = NO;
    
    cellHeight = (SCREENWIDTH-10*3-5*4)/2*(4.0/9.0)+5+8*2+21*2+1+10;
    
}

#pragma mark - 
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 15;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
//    if(indexPath.row %2 == 0)
//    {
        TestListTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"TestListTableViewCell"];
        if(cell == nil)
        {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"TestListTableViewCell" owner:self options:nil] lastObject];
        }
        return cell;
//    }
//    else
//    {
//        UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
//        if(cell == nil)
//        {
//            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
//            cell.backgroundColor = [UIColor clearColor];
//            cell.contentView.backgroundColor = [UIColor clearColor];
//        }
//        return cell;
//    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return cellHeight;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    TestFinalViewController * final = [[TestFinalViewController alloc]initWithNibName:@"TestFinalViewController" bundle:nil];
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
