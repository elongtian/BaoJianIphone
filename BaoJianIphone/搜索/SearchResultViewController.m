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
    
    [self.navbar addSubview:textField];
    
    UIImageView * img = [[UIImageView alloc]initWithFrame:CGRectMake(bottom_line.frame.origin.x+5, NAVHEIGHT-10-20-3, 20, 18)];
    [img setImage:[UIImage imageNamed:@"main_search_icon.jpg"]];
    [self.navbar addSubview:img];
    
    UIButton * cancelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    cancelBtn.frame = CGRectMake(ss_line.frame.origin.x+1, NAVHEIGHT-10-20-5, 44, 30);
    [cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
    cancelBtn.titleLabel.font = UIFontHiraginoSansGBW3(15);
    [self.navbar addSubview:cancelBtn];
    
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
