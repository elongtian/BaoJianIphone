//
//  ProductFinalViewController.m
//  BaoJianIphone
//
//  Created by elongtian on 15-2-26.
//  Copyright (c) 2015年 madongkai. All rights reserved.
//

#import "ProductFinalViewController.h"
#import "NJKWebViewProgress.h"
#import "NJKWebViewProgressView.h"
@interface ProductFinalViewController ()<NJKWebViewProgressDelegate>{
    BOOL isCanLoadWeb;
    NJKWebViewProgressView * _progressView;
    NJKWebViewProgress * _progressProxy;
}

@end

@implementation ProductFinalViewController
@synthesize pageView;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.navbar.titleLabel.text = @"产品最终";
    
    [self.navbar.homebtn setImage:[UIImage imageNamed:@"share_icon"] forState:UIControlStateNormal];
    
    [self initPlat];
    [self ad_request];
    _headViewWidth.constant = SCREENWIDTH-20;
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)initPlat{
    
    _pics = [[NSMutableArray alloc]init];
    _leftOneBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    _leftTwoBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    _mainWebView.scrollView.bounces = NO;
    _mainWebView.scrollView.scrollEnabled = NO;
    _mainWebView.delegate = self;
//    [_mainWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.baidu.com"]]];
    
//    _progressProxy = [[NJKWebViewProgress alloc] init];
//    _mainWebView.delegate = _progressProxy;
//    _progressProxy.webViewProxyDelegate = self;
//    _progressProxy.progressDelegate = self;
    
}
//bj_app/app/index.php?com=com_appService&method=appSev&app_com=com_comtopic&task=view&auto_id=2


//bj_app/app/index.php?com=com_appService&method=appSev&app_com=com_comtopic&task=view&auto_id=1

- (void)ad_request
{
    [ELRequestSingle productDetalBannerRequest:^(BOOL success,id objc) {
        [_pics addObjectsFromArray:(NSArray *)objc];
        [self createBanner:self.pics];
    } withObject:self.optionid];
    
    [ELRequestSingle productDetailRequest:^(BOOL success,id objc) {
        BJObject * object = (BJObject *)objc;
        _content_name.text = object.content_name;
        _content_desc1.text = object.superiority;
        _content_desc2.text = object.effect;
        _content_price.text = [NSString stringWithFormat:@"¥%@",object.content_price];
        _content_preprice.text = [NSString stringWithFormat:@"建议零售价:¥%@",object.content_preprice];
        [_mainWebView loadHTMLString:object.content_body baseURL:nil];
        
        

    } withOptionId:self.optionid];
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


- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
//    if (!isCanLoadWeb){
//        isCanLoadWeb = !isCanLoadWeb;
//        return isCanLoadWeb;
//    }
//    return NO;
    return YES;
}

#pragma mark - NJKWebViewProgressDelegate

//-(void)webViewProgress:(NJKWebViewProgress *)webViewProgress updateProgress:(float)progress {
//    if (progress == 0.0) {
//        [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
//        _progressView.progress = 0;
//        [UIView animateWithDuration:0.27 animations:^{
//            _progressView.alpha = 1.0;
//        }];
//    }
//    
//    if (progress == 1.0) {
//        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
//        [UIView animateWithDuration:0.27 delay:progress - _progressView.progress options:0 animations:^{
//            _progressView.alpha = 0.0;
//            
//           
//        } completion:^(BOOL finished) {
//            
//        }];
//    }
//    
//    [_progressView setProgress:progress animated:NO];
//}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{

}

- (void)webViewDidFinishLoad:(UIWebView *)webView{
    
    NSString *height_str= [_mainWebView stringByEvaluatingJavaScriptFromString: @"document.body.offsetHeight"];
    int height = [height_str intValue];
    _webHeghtConstraint.constant = height;
    [self.view setNeedsLayout]; //更新视图
    [self.view layoutIfNeeded];
    
    [_mainWebView stringByEvaluatingJavaScriptFromString:@"document.getElementsByTagName('body')[0].style.background='#EDF0EB'"];
    
    _mainScrollView.contentSize = CGSizeMake(SCREENWIDTH, _mainWebView.frame.origin.y+_mainWebView.frame.size.height+15);
    
    UIImageView * img_line = [[UIImageView alloc]initWithFrame:CGRectMake(_mainWebView.frame.origin.x, _mainWebView.frame.origin.y-1, _mainWebView.frame.size.width, 1)];
    [img_line setImage:[UIImage imageNamed:@"dashed_line"]];
    [_mainScrollView addSubview:img_line];
    
    UIImageView * img_line2 = [[UIImageView alloc]initWithFrame:CGRectMake(_mainWebView.frame.origin.x, _mainWebView.frame.origin.y+_mainWebView.frame.size.height, _mainWebView.frame.size.width, 2)];
    [img_line2 setImage:[UIImage imageNamed:@"juchi"]];
    [_mainScrollView addSubview:img_line2];
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
