//
//  InfomationCenterViewController.m
//  BaoJianIphone
//
//  Created by elongtian on 15-2-26.
//  Copyright (c) 2015年 madongkai. All rights reserved.
//

#import "InfomationCenterViewController.h"

@interface InfomationCenterViewController ()

@end

@implementation InfomationCenterViewController
@synthesize titleLengthArray;
@synthesize newsController;
@synthesize bookController;
@synthesize videoController;
@synthesize pptController;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self initPlat];
    
}

- (void)initPlat{
    
    
    if ([self respondsToSelector:@selector(edgesForExtendedLayout)]) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    
    self.slideSwitchView.slideSwitchViewDelegate = self;
    
    self.navbar.titleLabel.text = @"资讯中心";
    self.slideSwitchView.tabItemNormalColor = [QCSlideSwitchView colorFromHexRGB:@"868686"];
    self.slideSwitchView.tabItemSelectedColor = [QCSlideSwitchView colorFromHexRGB:@"00a200"];
    self.slideSwitchView.shadowImage = [[UIImage imageNamed:@"red_line_and_shadow.png"]
                                        stretchableImageWithLeftCapWidth:59.0f topCapHeight:0.0f];

    newsController = [[InfoListViewController alloc]initWithNibName:@"InfoListViewController" bundle:nil];
    newsController.title = @"新闻";
    
    bookController = [[InfoListViewController alloc]initWithNibName:@"InfoListViewController" bundle:nil];
    bookController.title = @"刊物";
    
    videoController = [[InfoListViewController alloc]initWithNibName:@"InfoListViewController" bundle:nil];
    videoController.title = @"视频";
    
    pptController = [[InfoListViewController alloc]initWithNibName:@"InfoListViewController" bundle:nil];
    pptController.title = @"产品PPT";
    
    [self.slideSwitchView buildUI];
    
}

#pragma mark - 滑动tab视图代理方法
- (NSUInteger)numberOfTab:(QCSlideSwitchView *)view
{
    return 4;
}

- (UIViewController *)slideSwitchView:(QCSlideSwitchView *)view viewOfTab:(NSUInteger)number
{
    if (number == 0) {
        return self.newsController;
    } else if (number == 1) {
        return self.bookController;
    } else if (number == 2) {
        return self.videoController;
    } else if (number == 3) {
        return self.pptController;
    }else {
        return nil;
    }
}

- (void)slideSwitchView:(QCSlideSwitchView *)view didselectTab:(NSUInteger)number
{
    InfoListViewController *vc = nil;
    if (number == 0) {
        vc = self.newsController;
    } else if (number == 1) {
        vc = self.bookController;
    } else if (number == 2) {
        vc = self.videoController;
    } else if (number == 3) {
        vc = self.pptController;
    }
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
