//
//  ProductListViewController.m
//  BaoJianIphone
//
//  Created by elongtian on 15-2-26.
//  Copyright (c) 2015年 madongkai. All rights reserved.
//

#import "ProductListViewController.h"

#import "ProductListTableViewCell.h"
@interface ProductListViewController ()

@end

@implementation ProductListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self initPlat];
}
- (void)initPlat{
    _searchField.placeholder = @"请输入商品名称";
    _searchField.inputView.backgroundColor = [UIColor redColor];
    _searchField.background=[UIImage imageNamed:@"searchbar_textfield_background"];
//    searchBar.textAlignment=NSTextAlignmentCenter;//说明：这是设置文字水平居中
    //设置文字内容垂直居中
     _searchField.contentVerticalAlignment=UIControlContentVerticalAlignmentCenter;
     //设置左边的放大镜
     UIImageView *leftView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 30, 30)];
     leftView.image=[UIImage imageNamed:@"s2"];
     _searchField.leftView=leftView;
     //设置leftView的frame
//     leftView.frame.width=40;
//     leftView.frame.height=35;
     //设置leftViewMode
     _searchField.leftViewMode=UITextFieldViewModeAlways;
     //设置放大镜距离左边的间距，设置leftView的内容居中
     leftView.contentMode=UIViewContentModeCenter;
    
    _searchField.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    
}

#pragma mark - UItableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ProductListTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"ProductListTableViewCell"];
    if(cell == nil){
        cell = [[[NSBundle mainBundle] loadNibNamed:@"ProductListTableViewCell" owner:self options:nil] lastObject];
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 122.f;
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
