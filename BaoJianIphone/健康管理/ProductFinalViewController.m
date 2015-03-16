//
//  ProductFinalViewController.m
//  BaoJianIphone
//
//  Created by elongtian on 15-2-26.
//  Copyright (c) 2015年 madongkai. All rights reserved.
//

#import "ProductFinalViewController.h"

@interface ProductFinalViewController ()

@end

@implementation ProductFinalViewController
@synthesize pageView;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self initPlat];
    [self ad_request];
    
}

- (void)initPlat{
    _mainWebView.scrollView.bounces = NO;
    [_mainWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.baidu.com"]]];
    _headViewWidth.constant = _mainScrollView.frame.size.width;
    [self.view layoutIfNeeded];
}

- (void)ad_request
{
    NSString * url = [NSString stringWithFormat:@"%@%@",HTTP,HomeAdUrl];
    [[ELHttpRequestOperation sharedClient] GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary * dic = (NSDictionary *)responseObject;
        
        NSArray * arr = (NSArray *)[dic objectForKey:@"datalist"];
        //            rootHeadView.hidden = YES;
        self.pics = [NSMutableArray arrayWithArray:arr];
        [self createBanner:self.pics];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [self.view makeToast:NO_NET];
    }];
}

- (void)createBanner:(NSArray *)arr
{
    _Topic = [[JCTopic alloc]initWithFrame:CGRectMake(0, 0, _headView.frame.size.width, _headView.frame.size.height)];
    //代理
    _Topic.JCdelegate = self;
    _Topic.delegate = self;
    //创建数据
    NSMutableArray * tempArray = [[NSMutableArray alloc]init];
    for(NSDictionary * dic in arr)
    {
        [tempArray addObject:[NSDictionary dictionaryWithObjects:@[OBJC([dic objectForKey:@"content_img"]) ,NSStringFromJson([dic objectForKey:@"content_name"]),@NO] forKeys:@[@"pic",@"title",@"isLoc"]]];
        
        //        [tempArray addObject:[NSDictionary dictionaryWithObjects:@[OBJC([dic objectForKey:@"content_value"]) ,OBJC([dic objectForKey:@"content_name"]),@NO,[UIImage imageNamed:@"no_phote"]] forKeys:@[@"pic",@"title",@"isLoc",@"placeholderImage"]]];
    }
    
    
    _Topic.pics = tempArray;
    [_Topic upDate];
    _Topic.userInteractionEnabled = YES;
    [_headView addSubview:_Topic];
    
    pageView = [[StyledPageControl alloc]initWithFrame:CGRectMake(_Topic.frame.origin.x+20, _Topic.frame.size.height+_Topic.frame.origin.y-30, _Topic.frame.size.width-40, 30)];
    [_headView addSubview:pageView];
    
    [pageView setAutoresizingMask:UIViewAutoresizingFlexibleWidth];
    
    [pageView setPageControlStyle:PageControlStyleThumb];
    [pageView setThumbImage:[UIImage imageNamed:@"final_common_no_selected.png"]];
    [pageView setSelectedThumbImage:[UIImage imageNamed:@"final_common_selected.png"]];
    [pageView setNumberOfPages:(int)[tempArray count]];
    
    
    [pageView setCurrentPage:0];
}

#pragma mark - JCTopDelegate
- (void)didClick:(id)data withscrollview:(UIScrollView *)jc
{
    if(jc == _Topic)
    {
        UIButton * btn = (UIButton *)data;DLog(@"+++%ld",(long)btn.tag);
        NSDictionary * dic = [self.pics objectAtIndex:btn.tag-1];
        switch ([[dic objectForKey:@"content_txt"]integerValue]) {
            case 1:
            {
                
            }
                break;
            case 2:
            {
                
            }
                break;
            case 3:
            {
                
            }
                break;
            case 4:
            {
                
            }
                break;
                
            default:
                break;
        }
        
    }
    else
    {
        
    }
}
-(void)currentPage:(int)page total:(NSUInteger)total withscrollview:(JCTopic *)jc
{
    if(jc == _Topic)
    {
        [pageView setCurrentPage:jc.contentOffset.x/SCREENWIDTH];
    }
}

#pragma mark - WebViewDelegate
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{

}

- (void)webViewDidFinishLoad:(UIWebView *)webView{
    
    NSString *height_str= [webView stringByEvaluatingJavaScriptFromString: @"document.body.offsetHeight"];
    int height = [height_str intValue];
    _webHeghtConstraint.constant = height;
    [self.view setNeedsLayout]; //更新视图
    [self.view layoutIfNeeded];
    
    _mainScrollView.contentSize = CGSizeMake(SCREENWIDTH, _mainWebView.frame.origin.y+_mainWebView.frame.size.height+15);
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
