//
//  BookChapterListViewController.m
//  BaoJianIphone
//
//  Created by elongtian on 15-3-20.
//  Copyright (c) 2015年 madongkai. All rights reserved.
//

#import "BookChapterListViewController.h"
#import "InfomationFinalViewController.h"
@interface BookChapterListViewController ()

@end

@implementation BookChapterListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    dataArray = [[NSMutableArray alloc]init];
    [self download];
}

- (void)download{
    [ELRequestSingle chapterListRequest:^(BOOL success,id objc) {
        
        [dataArray addObjectsFromArray:(NSArray *)objc];
        [_mTableView reloadData];
    } Optionid:self.optionid];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [dataArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if(cell == nil){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    BJObject * object = [dataArray objectAtIndex:indexPath.row];
    cell.textLabel.text = object.modules_name;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    BJObject * object = [dataArray objectAtIndex:indexPath.row];
    InfomationFinalViewController * final = [[InfomationFinalViewController alloc]initWithNibName:@"InfomationFinalViewController" bundle:nil];
    final.optionid = object.auto_id;
    [self.navigationController pushViewController:final animated:YES];
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
