//
//  ProductListViewController.m
//  BaoJianIphone
//
//  Created by elongtian on 15-2-26.
//  Copyright (c) 2015年 madongkai. All rights reserved.
//

#import "ProductListViewController.h"
#import "ProductListTableViewCell.h"
#import "ProductFinalViewController.h"
@interface ProductListViewController ()

@end

@implementation ProductListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navbar.titleLabel.text = self.titleName;
    [self initPlat];
}
- (void)initPlat{
    
    _coverControl = [[UIControl alloc]initWithFrame:CGRectMake(0, _searchField.frame.origin.y+_searchField.frame.size.height+5,SCREENWIDTH, SCREENHEIGHT-(_searchField.frame.origin.y+_searchField.frame.size.height+5))];
    _coverControl.backgroundColor = [UIColor blackColor];
    _coverControl.alpha = 0.4;
    _coverControl.hidden = YES;
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction:)];
    [_coverControl addGestureRecognizer:tap];
    [self.view addSubview:_coverControl];
     _icontextView = [[IconTextView alloc]initWithFrame:CGRectMake(0, 0, _searchField.frame.size.width, _searchField.frame.size.height)];
    __block ProductListViewController * Self = self;
    _icontextView.call_back = ^(IconTextView *view){
        
        [UIView animateWithDuration:0.3 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            Self.searchtextfildRightConstraint.constant = 57;
        } completion:^(BOOL finished) {
            
            Self.coverControl.hidden = NO;
            
            Self.icontextView.hidden = YES;
            
            Self.searchField.placeholder = @"请输入商品名称";
            UIImageView *leftView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 25, 25)];
            leftView.image=[UIImage imageNamed:@"pro_search_icon"];
            Self.searchField.leftView=leftView;
            //设置leftView的frame
            //     leftView.frame.width=40;
            //     leftView.frame.height=35;
            //设置leftViewMode
            Self.searchField.leftViewMode=UITextFieldViewModeAlways;
            //设置放大镜距离左边的间距，设置leftView的内容居中
            leftView.contentMode=UIViewContentModeCenter;
            
            [Self.searchField becomeFirstResponder];
        }];
        [Self.view setNeedsLayout]; //更新视图
        [Self.view layoutIfNeeded];
        
    };
    
    [_searchField addSubview:_icontextView];
    
    [_cancelBtn addTarget:self action:@selector(cancelAction:) forControlEvents:UIControlEventTouchDown];
    
}

#pragma mark - UItableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ProductListTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"ProductListTableViewCell"];
    if(cell == nil){
        cell = [[[NSBundle mainBundle] loadNibNamed:@"ProductListTableViewCell" owner:self options:nil] lastObject];
        cell.content_img.layer.borderColor = UIColorFromRGB(0x8f8f91).CGColor;
        cell.content_img.layer.borderWidth = 1;
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 122.f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    ProductFinalViewController * final = [[ProductFinalViewController alloc]initWithNibName:@"ProductFinalViewController" bundle:nil];
    [self.navigationController pushViewController:final animated:YES];
}

#pragma mark - 隐藏浮层
- (void)tapAction:(UITapGestureRecognizer*)tap{
   
    [self cancelAction:nil];
}


#pragma mark - 取消
- (void)cancelAction:(UIButton *)sender{
    
     __block ProductListViewController * Self = self;
    [UIView animateWithDuration:0.3 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        Self.searchtextfildRightConstraint.constant = 10;
    } completion:^(BOOL finished) {
        
        Self.coverControl.hidden = YES;
        
        Self.icontextView.hidden = NO;
        
        Self.searchField.placeholder = nil;
        
        Self.searchField.leftView = nil;
        Self.searchField.leftViewMode=UITextFieldViewModeAlways;
        
        [Self.searchField resignFirstResponder];
    }];
    [Self.view setNeedsLayout]; //更新视图
    [Self.view layoutIfNeeded];
    
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
