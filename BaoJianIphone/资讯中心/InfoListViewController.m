//
//  InfoListViewController.m
//  BaoJianIphone
//
//  Created by elongtian on 15-3-10.
//  Copyright (c) 2015年 madongkai. All rights reserved.
//

#import "InfoListViewController.h"
#import "InfoListTableViewCell.h"
#import "InfomationFinalViewController.h"
#import "BookChapterListViewController.h"
@interface InfoListViewController ()

@end

@implementation InfoListViewController
@synthesize dataArray;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    dataArray = [[NSMutableArray alloc]init];
    page = 1;
}

- (void)download{
    [ELRequestSingle infoListRequest:^(id objc) {
        if(page == 1){
        
            [dataArray removeAllObjects];
        }else{
            
        }
        [dataArray addObjectsFromArray:(NSArray *)objc];
        [_mtableView reloadData];
    } Page:page Optionid:self.optionid];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [dataArray count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    InfoListTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"InfoListTableViewCell"];
    if(cell == nil){
        cell = [[[NSBundle mainBundle] loadNibNamed:@"InfoListTableViewCell" owner:self options:nil] lastObject];
    }
    BJObject * object = [dataArray objectAtIndex:indexPath.row];
    cell.content_name.text = object.content_name;
    cell.content_desc.text = object.content_desc;
    cell.content_time.text = object.create_time;
    [cell.content_img setImageWithURL:[NSURL URLWithString:object.content_img] placeholderImage:[UIImage imageNamed:@"no_phote"]];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 118.0f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if(self.callback){
        _callback(indexPath);
    }
    
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
