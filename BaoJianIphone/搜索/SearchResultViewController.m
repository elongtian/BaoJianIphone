//
//  SearchResultViewController.m
//  BaoJianIphone
//
//  Created by elongtian on 15-2-26.
//  Copyright (c) 2015年 madongkai. All rights reserved.
//

#import "SearchResultViewController.h"

@interface SearchResultViewController ()

@end

@implementation SearchResultViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.view.backgroundColor = UIColorFromRGB(0xffffff);
    
    UILabel * bottom_line = [[UILabel alloc]initWithFrame:CGRectMake(50, NAVHEIGHT-10, SCREENWIDTH-50-20, 1)];
    bottom_line.backgroundColor = [UIColor whiteColor];
    [self.navbar addSubview:bottom_line];
    
    UILabel * s_line = [[UILabel alloc]initWithFrame:CGRectMake(bottom_line.frame.origin.x, bottom_line.frame.origin.y-2, 1, 2)];
    s_line.backgroundColor = [UIColor whiteColor];
    [self.navbar addSubview:s_line];
    
    UILabel * ss_line = [[UILabel alloc]initWithFrame:CGRectMake(bottom_line.frame.origin.x+bottom_line.frame.size.width-50, bottom_line.frame.origin.y-2, 1, 2)];
    ss_line.backgroundColor = [UIColor whiteColor];
    [self.navbar addSubview:ss_line];
    
    UILabel * sss_line = [[UILabel alloc]initWithFrame:CGRectMake(bottom_line.frame.origin.x+bottom_line.frame.size.width-1, bottom_line.frame.origin.y-2, 1, 2)];
    sss_line.backgroundColor = [UIColor whiteColor];
    [self.navbar addSubview:sss_line];
    
    UITextField * textField = [[UITextField alloc]initWithFrame:CGRectMake(bottom_line.frame.origin.x+5+20, NAVHEIGHT-10-20-3, bottom_line.frame.size.width-50-5-20, 20)];
    textField.delegate = self;
    textField.returnKeyType = UIReturnKeySearch;
    
    [self.navbar addSubview:textField];
    
    UIImageView * img = [[UIImageView alloc]initWithFrame:CGRectMake(bottom_line.frame.origin.x+5, NAVHEIGHT-10-20-3, 20, 18)];
    [img setImage:[UIImage imageNamed:@"main_search_icon.jpg"]];
    [self.navbar addSubview:img];
    
    UIButton * cancelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    cancelBtn.frame = CGRectMake(ss_line.frame.origin.x+1, NAVHEIGHT-10-20-5, 44, 30);
    cancelBtn.tag = 101311;
    [cancelBtn setTitle:@"搜索" forState:UIControlStateNormal];
    cancelBtn.titleLabel.font = UIFontHiraginoSansGBW3(15);
    [self.navbar addSubview:cancelBtn];
    
    resultViewController = [[SearchResultShowViewController alloc]initWithNibName:@"SearchResultShowViewController" bundle:nil];
    resultViewController.view.frame = CGRectMake(0, NAVHEIGHT, self.view.frame.size.width, SCREENHEIGHT-NAVHEIGHT);
//    resultViewController.mainTableView.frame = CGRectMake(0, 0, self.view.frame.size.width, SCREENHEIGHT-NAVHEIGHT);
    [self.view addSubview:resultViewController.view];
    
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
