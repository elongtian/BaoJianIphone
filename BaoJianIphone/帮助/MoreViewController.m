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
    
    self.bottom_logoV.hidden = NO;
    
    _tags = [[NSArray alloc]initWithObjects:@"应用介绍",@"关于我们",@"亲，给个好评吧！",@"用户指南",nil];
    
    NSDictionary *infoDic = [[NSBundle mainBundle] infoDictionary];
    NSString *appVersion = [infoDic objectForKey:@"CFBundleVersion"];
    _bundleLabel.text = [NSString stringWithFormat:@"v%@",appVersion];
    
    
}

#pragma mark -
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_tags count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
        UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
        if(cell == nil)
        {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            
            UIImageView * line = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, 1)];
            line.tag = 1000;
            line.backgroundColor = UIColorFromRGB(0xf1f1f1);
            [cell.contentView addSubview:line];
            
            cell.textLabel.textColor = UIColorFromRGB(0x333333);
        }
        
        cell.textLabel.text = [_tags objectAtIndex:indexPath.row];
        return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    switch (indexPath.row) {
        case 0:
        {
            AboutAppViewController * app = [[AboutAppViewController alloc]initWithNibName:@"AboutAppViewController" bundle:nil];
            [self.navigationController pushViewController:app animated:YES];
            return;
        }
            break;
        case 1:
        {
            AboutUsViewController * us = [[AboutUsViewController alloc]initWithNibName:@"AboutUsViewController" bundle:nil];
            [self.navigationController pushViewController:us animated:YES];
        }
            break;
        case 2:
        {
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"https://itunes.apple.com/cn/app/id%@",APPID]]];
            return;
        }
            break;
        case 3:
        {
            HelpViewController * help = [[HelpViewController alloc] initWithNibName:@"HelpViewController" bundle:nil];
            [self.navigationController pushViewController:help animated:YES];
            return;
        }
            break;
            
            default:
            break;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
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
