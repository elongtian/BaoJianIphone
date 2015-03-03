//
//  PanoramaListViewController.m
//  BaoJianIphone
//
//  Created by elongtian on 15-2-26.
//  Copyright (c) 2015年 madongkai. All rights reserved.
//

#import "PanoramaListViewController.h"
#import "GlobalCounter.h"
@interface PanoramaListViewController ()

@end

@implementation PanoramaListViewController
@synthesize mainTableView;
@synthesize photosArray;
@synthesize panoramaListCell;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    photosArray = [[NSMutableArray alloc]init];
    
//    panoramaListCell = [[[NSBundle mainBundle] loadNibNamed:@"PanoramaListCell" owner:self options:nil] lastObject];
    self.view.backgroundColor = [UIColor grayColor];
    mainTableView.backgroundColor = [UIColor clearColor];
    mainTableView.opaque = NO;
}

#pragma mark - UItableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row%2 != 0)
    {
        UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
        if(cell == nil)
        {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
            cell.contentView.backgroundColor = [UIColor clearColor];
            cell.backgroundColor = [UIColor clearColor];
        }
        return cell;
    }
    else
    {
        [[GlobalCounter getInstance] add:@"get cell"];
        PanoramaListCell * cell = [tableView dequeueReusableCellWithIdentifier:@"PanoramaListCell"];
        if(cell == nil)
        {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"PanoramaListCell" owner:self options:nil] lastObject];
        }
        return cell;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row%2 == 0)
    {
        [[GlobalCounter getInstance] add:@"get height"];
        
        PanoramaListCell * cell = [mainTableView dequeueReusableCellWithIdentifier:@"PanoramaListCell"];
        
        return [self getCellHeight:cell];
    }
    else
    {
        return 10.f;
    }
}

- (CGFloat)getCellHeight:(UITableViewCell*)cell
{
    [cell layoutIfNeeded];
    [cell updateConstraintsIfNeeded];
    
    CGFloat height = [cell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height;
    return height;
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
