//
//  PanoramaFinalViewController.m
//  BaoJianIphone
//
//  Created by elongtian on 15-2-26.
//  Copyright (c) 2015年 madongkai. All rights reserved.
//

#import "PanoramaFinalViewController.h"

@interface PanoramaFinalViewController ()

@end



@implementation PanoramaFinalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    _imageViews = [[NSMutableArray alloc]init];
    
    
//    self.myScrollView = [[ReuseScrollView alloc] initWithFrame:CGRectMake(0, 64, SCREENWIDTH, SCREENHEIGHT-64)];
//    self.myScrollView.delegate = self;
//    self.myScrollView.reuseDelegate = self;
//    self.myScrollView.pagingEnabled = YES;
//    self.myScrollView.showsHorizontalScrollIndicator = NO;
//    [self.view addSubview:self.myScrollView];
    
    
    [ELHttpRequestOperation sessionDownloadWithUrl:@"http://www.ipaosos.com/tpl/templates/M011/img/logo.gif" success:^(NSURL *fileURL) {
        NSLog(@"%@",fileURL);
        UIImageView * imageV = [[UIImageView alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
        [imageV setImage:[UIImage imageWithContentsOfFile:@"file:///var/mobile/Containers/Data/Application/0CB9DEEC-C4D8-4EA8-B2E3-5BCF41BA617D/Library/Caches/logo.gif"]];
//        imageV.backgroundColor = [UIColor redColor];
        [self.view addSubview:imageV];
    } fail:^{
        NSLog(@"下载失败！");
    }];
}

#pragma mark-
#pragma mark-UIScrollView代理方法
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    [self.myScrollView loadView];
    
    int currentPage = floor((scrollView.contentOffset.x - scrollView.frame.size.width / 2) /  scrollView.frame.size.width) + 1;
//    [self.pageControl setCurrentPage:currentPage % self.pageControl.numberOfPages];
    
}

#pragma mark-
#pragma mark-ReuseScrollView代理方法
- (NSInteger)numberOfViewInReuseScrollView:(ReuseScrollView *)reusrScroll{
    return _imageViews.count;
}

- (UIView *)reuseScrollView:(ReuseScrollView *)reusrScroll viewForLocationAtPage:(NSInteger)page{
    
    UIView *view = [reusrScroll getReusableView];
    
    if (view == nil) {
        
        view = [[UIView alloc] init];
        
//        UIScrollView *mscr  = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, reusrScroll.frame.size.width, reusrScroll.frame.size.height)];
//        imageView.contentMode = UIViewContentModeScaleAspectFit;
//        imageView.tag = 1;
//        [view addSubview:imageView];
//        imageView = nil;
    }
    
    ((UIImageView *)[view viewWithTag:1]).image = [UIImage imageNamed:[NSString stringWithFormat:@"%@.jpg",_imageViews[page]]];
    
    return view;
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
