//
//  MoreEvaluatesViewController.m
//  BaoJianIphone
//
//  Created by elongtian on 15-2-26.
//  Copyright (c) 2015年 madongkai. All rights reserved.
//

#import "MoreEvaluatesViewController.h"
#import "EvaluateTableViewCell.h"
#import "GoEvaluateViewController.h"
@interface MoreEvaluatesViewController ()

@end

@implementation MoreEvaluatesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self initPlat];
}

- (void)initPlat{
    [_evaluateBtn addTarget:self action:@selector(evaluateAction:) forControlEvents:UIControlEventTouchDown];
}


#pragma mark - UItableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
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

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
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


- (void)evaluateAction:(UIButton *)sender{
    GoEvaluateViewController * go = [[GoEvaluateViewController alloc]initWithNibName:@"GoEvaluateViewController" bundle:nil];
    [self.navigationController pushViewController:go animated:YES];
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
