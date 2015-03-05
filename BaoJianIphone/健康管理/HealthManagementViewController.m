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
@interface HealthManagementViewController ()

@end

@implementation HealthManagementViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
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
