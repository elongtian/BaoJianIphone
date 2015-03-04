//
//  PanoramaListViewController.m
//  BaoJianIphone
//
//  Created by elongtian on 15-2-26.
//  Copyright (c) 2015年 madongkai. All rights reserved.
//

#import "PanoramaListViewController.h"
#import "PanoramaFinalViewController.h"
@interface PanoramaListViewController ()

@end

@implementation PanoramaListViewController
@synthesize mainTableView;
@synthesize photosArray;
@synthesize panoramaListCell;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.offscreenCells = [[NSMutableDictionary alloc]init];
    photosArray = [[NSMutableArray alloc]init];
    
//    panoramaListCell = [[[NSBundle mainBundle] loadNibNamed:@"PanoramaListCell" owner:self options:nil] lastObject];
    self.view.backgroundColor = [UIColor grayColor];
    mainTableView.rowHeight = UITableViewAutomaticDimension;
    mainTableView.estimatedRowHeight = 10.0;
    mainTableView.backgroundColor = [UIColor clearColor];
    mainTableView.opaque = NO;
}

#pragma mark - UItableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 100;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row%2 == 0)
    {
        PanoramaListCell * cell = [tableView dequeueReusableCellWithIdentifier:@"PanoramaListCell"];
        if(cell == nil)
        {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"PanoramaListCell" owner:self options:nil] lastObject];
        }
        
        [cell setNeedsUpdateConstraints];
        [cell updateConstraintsIfNeeded];

        return cell;
    }
    else
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
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row %2 == 0)
    {
      return 149.f;
    }
    else
    {
        return 10;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //跳转到图集最终
    PanoramaFinalViewController * final = [[PanoramaFinalViewController alloc]init];
    [self.navigationController pushViewController:final animated:YES];
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
