//
//  MoreViewController.m
//  ilpUser
//
//  Created by elongtian on 14-6-16.
//  Copyright (c) 2014年 madongkai. All rights reserved.
//

#import "MoreViewController.h"
#import "AboutUsViewController.h"
#import "AboutAppViewController.h"
#import "Harpy.h"
#import "MyModifyViewController.h"
#import "HelpViewController.h"
@interface MoreViewController ()

@end

@implementation MoreViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (void)viewWillAppear:(BOOL)animated
{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"appearTabbar" object:nil];
}
- (void)viewWillDisappear:(BOOL)animated
{
    
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    navBar = [[JRNavgationBar alloc]initWithFrame:CGRectMake(0,0, SCREENWIDTH, NAVHEIGHT) Option:JRNAVGATIONLOGINBAR];
    navBar.delegate = self;
    navBar.titleLabel.text = @"更多";
    [self.view addSubview:navBar];
    
    _tags = [[NSArray alloc]initWithObjects:@"检测更新",@"修改密码",@"应用介绍",@"关于我们",@"亲，给个好评吧！",nil];
    
    NSDictionary *infoDic = [[NSBundle mainBundle] infoDictionary];
    NSString *appVersion = [infoDic objectForKey:@"CFBundleVersion"];
    _bundleLabel.text = [NSString stringWithFormat:@"v%@",appVersion];
    
    
}

#pragma mark -
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_tags count]*2;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row%2==0)
    {
        UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
        if(cell == nil)
        {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            
            UIImageView * line = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, 44)];
            line.tag = 1000;
            [line setImage:[UIImage imageNamed:@"more_xiankuang"]];
            [cell.contentView addSubview:line];
            
                       
            cell.textLabel.textColor = UIColorFromRGB(0x333333);
            
            UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(SCREENWIDTH-120-30, 7, 120, 30)];
            label.tag = 1002;
            label.font = [UIFont systemFontOfSize:12];
            label.textColor = [UIColor lightGrayColor];
            label.textAlignment = NSTextAlignmentRight;
            [cell.contentView addSubview:label];
            
        }
        UILabel * label = (UILabel *)[cell.contentView viewWithTag:1002];
        if(indexPath.row != 0)
        {
            label.hidden = YES;
        }
        else
        {
            label.hidden = NO;
        }
        NSDictionary *infoDic = [[NSBundle mainBundle] infoDictionary];
        NSString *appVersion = [infoDic objectForKey:@"CFBundleVersion"];
        label.text = [NSString stringWithFormat:@"当前版本:v%@",appVersion];
        
        cell.textLabel.text = [_tags objectAtIndex:indexPath.row/2];
        return cell;
    }
    else
    {
        UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"DefaultCell"];
        if(cell == nil)
        {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"DefaultCell"];
            cell.backgroundColor = [UIColor clearColor];
            cell.contentView.backgroundColor = [UIColor clearColor];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        return cell;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    switch (indexPath.row/2) {
        case 0:
        {
            [Harpy checkVersion];
            return;
        }
            break;
        case 1:
        {
           //修改密码
//           if([[UserLoginInfoManager loginmanager] state])
//           {
//               MyModifyViewController * modify = [[MyModifyViewController alloc]initWithNibName:@"MyModifyViewController" bundle:nil];
//               modify.type = 10;
//               [self.navigationController pushViewController:modify animated:YES];
//           }
//            else
//            {
//                AppDelegate * dele = (AppDelegate *)[[UIApplication sharedApplication] delegate];
////                [dele loginViewController];
//            }
        }
            break;
        case 2:
        {
            AboutAppViewController * app = [[AboutAppViewController alloc]initWithNibName:@"AboutAppViewController" bundle:nil];
            [self.navigationController pushViewController:app animated:YES];
        }
            break;
        case 3:
        {
            AboutUsViewController * us = [[AboutUsViewController alloc]initWithNibName:@"AboutUsViewController" bundle:nil];
            [self.navigationController pushViewController:us animated:YES];
        }
            break;
        case 4:
        {
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"https://itunes.apple.com/cn/app/id%@",APPID]]];
            return;
        }
            break;
        default:
            break;
    }
    [[NSNotificationCenter defaultCenter] postNotificationName:@"hideTabbar" object:nil];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row%2==0)
    {
        return 44;
    }
    else
    {
        return 10;
    }
}

- (void)modifyFinished:(NSString *)str index:(NSInteger)index
{
    
}

- (void)back:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
