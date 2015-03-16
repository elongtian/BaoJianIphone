//
//  TopicFinalViewController.m
//  BaoJianIphone
//
//  Created by elongtian on 15-2-26.
//  Copyright (c) 2015年 madongkai. All rights reserved.
//

#import "TopicFinalViewController.h"
#import "EvaluateTableViewCell.h"

#import "GoEvaluateViewController.h"
#import "MoreEvaluatesViewController.h"
@interface TopicFinalViewController ()

@end

@implementation TopicFinalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self initPlat];
    self.navbar.titleLabel.text = @"话题最终";
}

- (void)initPlat{
    
    self.view.backgroundColor = [UIColor whiteColor];
    [_mainwebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.baidu.com"]]];
//    _scrollEndDistance.constant = 0;
//    _headViewDistance.constant = 0;
    
    _content_nameWidth.constant = SCREENWIDTH-20;
    _content_nameL.text = @"免费去巴黎 摘星 不容迟疑免费去巴黎 摘星 不容迟疑";
    _titleViewWidth.constant = SCREENWIDTH;
    [_titleView sizeToFit];
    
    _maintableView.scrollEnabled = NO;
    _mainwebView.scrollView.bounces = NO;
    _mainwebView.scrollView.scrollEnabled = NO;
    
    _zanNumL.layer.cornerRadius = 3;
    _evaluateL.layer.cornerRadius = 3;
    [_evaluateL.layer setMasksToBounds:YES];
    
}


#pragma mark - UItableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.row == 9){
        UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
        if(cell == nil){
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
            
            UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
            [btn setTitle:@"查看更多评论" forState:UIControlStateNormal];
            [btn setBackgroundColor:UIColorFromRGB(0xe0e0e0)];
            [btn setTitleColor:UIColorFromRGB(0x656565) forState:UIControlStateNormal];
            btn.frame = CGRectMake(0, 0, SCREENWIDTH-20, 30);
            btn.center = CGPointMake((SCREENWIDTH)/2, 44/2);
            
            btn.titleLabel.font = UIFontHiraginoSansGBW3(13);
            
            [btn addTarget:self action:@selector(seeMore:) forControlEvents:UIControlEventTouchDown];
            
            [cell.contentView addSubview:btn];
            
        }
        return cell;
    }else{
        EvaluateTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"EvaluateTableViewCell"];
        if(cell == nil){
            cell = [[[NSBundle mainBundle] loadNibNamed:@"EvaluateTableViewCell" owner:self options:nil] lastObject];
        }
        if(indexPath.row == 0){
            cell.content_desc.text = @"字里行间充满了爱！慢慢的爱感动了你我他！ 字里行间充满了爱！慢慢的爱感动了你我他！";
            cell.content_desc2.text = @"保证的产品加上年轻的心态，活出自我风采 保证的产品加上年轻的心态，活出自我风采";
        }
        [cell.contentView sizeToFit];
        return cell;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if(indexPath.row == 9){
        return 44;
    }else{
        NSString * str1 = @"字里行间充满了爱！慢慢的爱感动了你我他！";
        NSString * str2 = @"保证的产品加上年轻的心态，活出自我风采";
        
        if(indexPath.row == 0){
            str1 = @"字里行间充满了爱！慢慢的爱感动了你我他！ 字里行间充满了爱！慢慢的爱感动了你我他！";
            str2 = @"保证的产品加上年轻的心态，活出自我风采 保证的产品加上年轻的心态，活出自我风采";
        }
        
        
        CGSize size = [str1 getcontentsizeWithfont:UIFontHiraginoSansGBW3(13) constrainedtosize:CGSizeMake(SCREENWIDTH-88-16, 200) linemode:NSLineBreakByCharWrapping];
        
        CGSize size2 = [str2 getcontentsizeWithfont:UIFontHiraginoSansGBW3(13) constrainedtosize:CGSizeMake(SCREENWIDTH-88-16, 200) linemode:NSLineBreakByCharWrapping];
        
        CGFloat height = 26+14+13+8+14+8+size2.height+8+8+size.height+18;
        
        return height+3;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    GoEvaluateViewController * go = [[GoEvaluateViewController alloc]initWithNibName:@"GoEvaluateViewController" bundle:nil];
    go.titleName = @"我要回复";
    [self.navigationController pushViewController:go animated:YES];
}

#pragma mark - UIwebViewDelegate
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    
}
- (void)webViewDidFinishLoad:(UIWebView *)webView{
    NSString *height_str= [webView stringByEvaluatingJavaScriptFromString: @"document.body.offsetHeight"];
    int height = [height_str intValue];
    _webHeight.constant = height;
    [self.view setNeedsLayout]; //更新视图
    [self.view layoutIfNeeded];
    
    _mainScrollView.contentSize = CGSizeMake(SCREENWIDTH, _mainwebView.frame.origin.y+_mainwebView.frame.size.height+[self getTableViewHeight]);
    
    _maintableViewHeight.constant = _maintableView.contentSize.height;
    
    
}

- (CGFloat)getTableViewHeight{
    [_maintableView layoutIfNeeded];
    return _maintableView.contentSize.height;
}

- (void)seeMore:(UIButton *)sender{
    //查看更多
    MoreEvaluatesViewController * more = [[MoreEvaluatesViewController alloc]initWithNibName:@"MoreEvaluatesViewController" bundle:nil];
    [self.navigationController pushViewController:more animated:YES];
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
