//
//  PanoramaListViewController.m
//  BaoJianIphone
//
//  Created by elongtian on 15-2-26.
//  Copyright (c) 2015年 madongkai. All rights reserved.
//

#import "PanoramaListViewController.h"
#import "PanoramaFinalViewController.h"
#import "KxMenu.h"
@interface PanoramaListViewController ()

@end

@implementation PanoramaListViewController
@synthesize mainTableView;
@synthesize photosArray;
@synthesize panoramaListCell;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.navbar.titleLabel.text = @"园区全景";
    [self.navbar.homebtn setImage:[UIImage imageNamed:@"more_point_btn"] forState:UIControlStateNormal];
    self.offscreenCells = [[NSMutableDictionary alloc]init];
    photosArray = [[NSMutableArray alloc]init];
    
//    panoramaListCell = [[[NSBundle mainBundle] loadNibNamed:@"PanoramaListCell" owner:self options:nil] lastObject];
    mainTableView.backgroundColor = [UIColor clearColor];
    mainTableView.opaque = NO;
    
    self.view.backgroundColor = BackGround_Color;
    
    cellHeight = (SCREENWIDTH-46-20*2)*(100/234.0)+12+20+10;
    
    page = 1;
    
    [self requestData];
}

- (void)requestData{
    [ELRequestSingle panoramicListRequest:^(BOOL success,id objc) {
        [self data_load:objc];
    }
    withPage:1 OptionId:self.optionid];
}

- (void)data_load:(id)obj{
 
    if(page == 1){
        [photosArray removeAllObjects];
    }else{
        
    }
    
    [photosArray addObjectsFromArray:(NSArray *)obj];
    NSLog(@"%@",photosArray);
    [mainTableView reloadData];
}

#pragma mark - UItableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [photosArray count]*2;
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
        BJObject * object = [photosArray objectAtIndex:indexPath.row/2];
        [cell.content_img setImageWithURL:[NSURL URLWithString:object.content_img] placeholderImage:[UIImage imageNamed:@"no_phote"]];
        cell.title.text = object.content_name;
        
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
            
            UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(16, 0, 1, 10)];
            label.backgroundColor = UIColorFromRGB(0xc6c6c6);
            
            [cell.contentView addSubview:label];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        return cell;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row %2 == 0)
    {
      return cellHeight;
    }
    else
    {
        return 10;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row%2 == 0)
    {
        //跳转到图集最终
        BJObject * object = [photosArray objectAtIndex:indexPath.row/2];
        
        PanoramaFinalViewController * final = [[PanoramaFinalViewController alloc]init];
        final.optionid = object.auto_id;
        [self.navigationController pushViewController:final animated:YES];
    }
    
}

- (void)home:(id)sender{
    //
    NSLog(@"点击更多");
    KxMenuItem * item1 = [KxMenuItem menuItem:@"消息" image:[UIImage imageNamed:@"message_icon"] target:self action:@selector(menuSelected:) index:100];
    item1.foreColor = UIColorFromRGB(0x585858);
    KxMenuItem * item2 = [KxMenuItem menuItem:@"首页" image:[UIImage imageNamed:@"home_icon"] target:self action:@selector(menuSelected:) index:101];
    item2.foreColor = UIColorFromRGB(0x585858);
    NSArray * arr = [[NSArray alloc]initWithObjects:item1,item2, nil];
    
    [KxMenu setTintColor:[UIColor whiteColor]];
    [KxMenu showMenuInView:self.view fromRect:self.navbar.homebtn.frame menuItems:arr];
}

- (void)menuSelected:(id)sender{
    KxMenuItem * item = (KxMenuItem *)sender;
    if(item.tag == 100){
        NSLog(@"消息");
    }else{
        [self.navigationController popToRootViewControllerAnimated:YES];
    }
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
