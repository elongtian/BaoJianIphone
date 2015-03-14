//
//  PanoramaFinalViewController.m
//  BaoJianIphone
//
//  Created by elongtian on 15-2-26.
//  Copyright (c) 2015年 madongkai. All rights reserved.
//

#import "PanoramaFinalViewController.h"
#import "PanoramaImageView.h"
@interface PanoramaFinalViewController ()

@end



@implementation PanoramaFinalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.navbar.backgroundColor = [UIColor blackColor];
    [self.navbar.bg_imageView setImage:nil];
    self.navbar.bg_imageView.backgroundColor = [UIColor clearColor];
    
    self.navbar.titleLabel.text = @"景区全景";
    
    [self.navbar.homebtn setImage:[UIImage imageNamed:@"share_icon"] forState:UIControlStateNormal];
    self.navbar.homebtn.imageView.contentMode = UIViewContentModeCenter;
    
    _imageViews = [[NSMutableArray alloc]init];
    UIImage * image1 = [UIImage imageNamed:@"yqqj1.jpg"];
    [_imageViews addObject:image1];
    
    UIImage * image2 = [UIImage imageNamed:@"home_banner.jpg"];
    [_imageViews addObject:image2];
    
    UIImage * image3 = [UIImage imageNamed:@"yqqj_list_img.jpg"];
    [_imageViews addObject:image3];
    
    UIImage * image4 = [UIImage imageNamed:@"pro_list_img.jpg"];
    [_imageViews addObject:image4];
    
    self.myScrollView = [[ReuseScrollView alloc] initWithFrame:CGRectMake(0, 64, SCREENWIDTH, SCREENHEIGHT-64)];
    self.myScrollView.isobserver = NO;
    self.myScrollView.delegate = self;
    self.myScrollView.reuseDelegate = self;
    self.myScrollView.pagingEnabled = YES;
    self.myScrollView.showsHorizontalScrollIndicator = NO;
    [self.view addSubview:self.myScrollView];
    
}

#pragma mark-
#pragma mark-UIScrollView代理方法
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    [self.myScrollView loadView];
}

#pragma mark-
#pragma mark-ReuseScrollView代理方法
- (NSInteger)numberOfViewInReuseScrollView:(ReuseScrollView *)reusrScroll{
    return _imageViews.count;
}

- (UIView *)reuseScrollView:(ReuseScrollView *)reusrScroll viewForLocationAtPage:(NSInteger)page{
    
    PanoramaImageView *view = [reusrScroll getReusableView];
    
    if (view == nil) {
        
        view = [[PanoramaImageView alloc] initWithFrame:CGRectMake(0, 0, self.myScrollView.frame.size.width, self.myScrollView.frame.size.height)];
    }
    
    [view loadImage:[_imageViews objectAtIndex:page]];
    
    view._numofpageL.text = [NSString stringWithFormat:@"%ld/%lu",(long)page+1,(unsigned long)[_imageViews count]];
    view._content_descL.text = @"宝健于1995年进入中国，1996年正式运营，2014年12月5日宝健（中国）日用品有限公司正式更名为宝健（中国）有限公司。";
    
    return view;
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
