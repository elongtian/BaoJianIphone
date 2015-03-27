//
//  HealthManagementViewController.m
//  BaoJianIphone
//
//  Created by elongtian on 15-2-26.
//  Copyright (c) 2015年 madongkai. All rights reserved.
//

#import "HealthManagementViewController.h"
#import "TestListViewController.h"
#import "ProductHomeViewController.h"
#import "TopicListViewController.h"
#import "KxMenu.h"
@interface HealthManagementViewController ()

@end

@implementation HealthManagementViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.navbar.titleLabel.text = @"健康管理";
    
    [self.navbar.homebtn setImage:[UIImage imageNamed:@"more_point_btn"] forState:UIControlStateNormal];
    
    UITapGestureRecognizer * protap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(proAction:)];
    [_pro_view addGestureRecognizer:protap];
    
    UITapGestureRecognizer * testtap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(testAction:)];
    [_test_view addGestureRecognizer:testtap];
    
    UITapGestureRecognizer * topictap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(topicAction:)];
    [_topic_view addGestureRecognizer:topictap];
    
}

- (void)proAction:(UITapGestureRecognizer *)tap{
    ProductHomeViewController * pro = [[ProductHomeViewController alloc]initWithNibName:@"ProductHomeViewController" bundle:nil];
    [self.navigationController pushViewController:pro animated:YES];
}

- (void)testAction:(UITapGestureRecognizer *)tap{
    TestListViewController * test = [[TestListViewController alloc]initWithNibName:@"TestListViewController" bundle:nil];
    [self.navigationController pushViewController:test animated:YES];
}

- (void)topicAction:(UITapGestureRecognizer *)tap{
    TopicListViewController * topic = [[TopicListViewController alloc]initWithNibName:@"TopicListViewController" bundle:nil];
    [self.navigationController pushViewController:topic animated:YES];
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

- (void)back:(id)sender
{
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
