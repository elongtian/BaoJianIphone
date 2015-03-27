//
//  TestResultViewController.m
//  BaoJianIphone
//
//  Created by elongtian on 15-2-26.
//  Copyright (c) 2015年 madongkai. All rights reserved.
//

#import "TestResultViewController.h"
#import "ProductListTableViewCell.h"
#import "TestFinalViewController.h"
#import "ProductFinalViewController.h"
#import "KxMenu.h"
@interface TestResultViewController ()

@end

@implementation TestResultViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navbar.titleLabel.text = @"测试结果";
    [self.navbar.homebtn setImage:[UIImage imageNamed:@"more_point_btn"] forState:UIControlStateNormal];
    [self initPlat];
}

- (void)initPlat{
    
    [_againBtn addTarget:self action:@selector(back:) forControlEvents:UIControlEventTouchDown];
    [_moreBtn addTarget:self action:@selector(moreBtnAction:) forControlEvents:UIControlEventTouchDown];
    
    _resultL.text = @"测试结果测试结果测试结果测试结果测试结果测试结果测试结果测试结果测试结果测试结果测试结果测试结果测试结果测试结果测试结果测试结果测试结果测试结果测试结果测试结果测试结果测试结果测试结果测试结果测试结果测试结果测试结果测试结果测试结果测试结果测试结果测试结果测试结果测试结果测试结果测试结果测试结果测试结果测试结果测试结果测试结果测试结果测试结果测试结果测试结果测试结果测试结果测试结果测试结果测试结果测试结果测试结果测试结果测试结果测试结果测试结果测试结果测试结果测试结果测试结果测试结果测试结果测试结果测试结果测试结果测试结果测试结果测试结果测试结果测试结果测试结果测试结果测试结果测试结果测试结果测试结果测试结果测试结果测试结果测试结果测试结果测试结果测试结果测试结果测试结果测试结果测试结果测试结果测试结果测试结果测试结果测试结果测试结果测试结果测试结果测试结果测试结果测试结果测试结果测试结果测试结果测试结果测试结果测试结果测试结果测试结果测试结果测试结果测试结果测试结果测试结果测试结果";
    [_resultL sizeToFit];
    _topViewHeight.constant = _resultL.frame.origin.y+_resultL.frame.size.height+16+38+21;
    
    _topViewWidth.constant = SCREENWIDTH-20;
    NSLog(@"%@",[NSValue valueWithCGRect:_topView.frame]);
    _maintableViewWidth.constant = SCREENWIDTH-20;

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ProductListTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if(cell == nil){
        cell = [[[NSBundle mainBundle] loadNibNamed:@"ProductListTableViewCell" owner:self options:nil] lastObject];
    }
    
    _maintableViewHeight.constant = _maintableView.contentSize.height;
    _mainScrollView.contentSize = CGSizeMake(SCREENWIDTH, _topView.frame.size.height+_maintableView.contentSize.height+10);
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 122;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    ProductFinalViewController * final = [[ProductFinalViewController alloc]initWithNibName:@"ProductFinalViewController" bundle:nil];
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

- (void)moreBtnAction:(UIButton *)sender{
    NSMutableArray * arr = [[NSMutableArray alloc]init];
    for(UIViewController * vc in self.navigationController.viewControllers){
        if([vc isKindOfClass:[TestFinalViewController class]]){
            continue;
        }
        [arr addObject:vc];
    }
    self.navigationController.viewControllers = arr;
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
