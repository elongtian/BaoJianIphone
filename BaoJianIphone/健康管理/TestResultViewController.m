//
//  TestResultViewController.m
//  BaoJianIphone
//
//  Created by elongtian on 15-2-26.
//  Copyright (c) 2015年 madongkai. All rights reserved.
//

#import "TestResultViewController.h"

@interface TestResultViewController ()

@end

@implementation TestResultViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self initPlat];
}

- (void)initPlat{
    _resultL.text = @"测试结果测试结果测试结果测试结果测试结果测试结果测试结果测试结果测试结果测试结果测试结果测试结果测试结果测试结果测试结果测试结果测试结果测试结果测试结果测试结果测试结果测试结果测试结果测试结果测试结果测试结果测试结果测试结果";
    _topViewHeight.constant = _resultL.frame.origin.y+_resultL.frame.size.height+20*2+40*2;
    _topViewWidth.constant = SCREENWIDTH-20;
    
    _topView.backgroundColor = [UIColor redColor];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if(cell == nil){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    _mainScrollView.contentSize = CGSizeMake(SCREENWIDTH, _topView.frame.size.height+_maintableView.contentSize.height);
    return cell;
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
