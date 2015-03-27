//
//  ProductHomeViewController.m
//  BaoJianIphone
//
//  Created by elongtian on 15-2-26.
//  Copyright (c) 2015年 madongkai. All rights reserved.
//

#import "ProductHomeViewController.h"
#import "HomeChannelView.h"
#import "ProductListViewController.h"
#import "KxMenu.h"
@interface ProductHomeViewController ()

@end

@implementation ProductHomeViewController
@synthesize pageView;
@synthesize mainScrollView;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self initParameters];
    
    [self ad_request];
    
    [self createChannel];
    
}

- (void)initParameters
{
    channelArray = [[NSArray alloc]init];
    titles = [[NSMutableArray alloc]initWithObjects:@"组合套装",@"营养保健食品",@"美容护肤",@"日用护理",@"健康家居", nil];
     icons = [[NSMutableArray alloc]initWithObjects:@"zhtz",@"yybj",@"mrhf",@"ryhl",@"jkjj", nil];
    self.navbar.titleLabel.text = @"产品";
    
    [self.navbar.homebtn setImage:[UIImage imageNamed:@"more_point_btn"] forState:UIControlStateNormal];
    
    mainScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, NAVHEIGHT, SCREENWIDTH, SCREENHEIGHT-NAVHEIGHT)];
    //    mainScrollView.delegate = self;
    [self.view addSubview:mainScrollView];
}
//1032*785

- (void)createChannel
{
    int width = (SCREENWIDTH-10*4)/3.0;
    CGSize size = CGSizeMake(0, 0);
    for(int i = 0;i<[titles count];i++)
    {
        HomeChannelView * channel = [[HomeChannelView alloc]initWithFrame:CGRectMake(10+(width+10)*(i%3), 10+(SCREENWIDTH-10*2)*(790.0/1035.0)+(width+10)*(i/3)+10, width, width)];
        channel.titleL.text = [titles objectAtIndex:i];
        channel.titleL.font = UIFontHiraginoSansGBW3(14);
        channel.titleL.textColor = UIColorFromRGB(0x272727);
        [channel.imgV setImage:[UIImage imageNamed:[icons objectAtIndex:i]]];
        channel.backgroundColor = [UIColor whiteColor];
        channel.tag = 100+i;
        channel.call_back = ^(HomeChannelView *view){
            
            if([channelArray count]==0){
                [self.view makeToast:@"数据正在拉取中..."];
                return;
            }
            BJObject * object = [channelArray objectAtIndex:i];
            ProductListViewController * list = [[ProductListViewController alloc]initWithNibName:@"ProductListViewController" bundle:nil];
            list.titleName = [titles objectAtIndex:view.tag-100];
            list.optionid = object.auto_code;
            [self.navigationController pushViewController:list animated:YES];
            
            switch (view.tag-100) {
                case 0:
                {
                  
                }
                    break;
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
                case 5:
                {
                    
                }
                    break;
                default:
                    break;
            }
        };
        [mainScrollView addSubview:channel];
        size = CGSizeMake(SCREENWIDTH, channel.frame.origin.y+channel.frame.size.height+10);
    }
    mainScrollView.contentSize = size;
}


- (void)ad_request
{
    [ELRequestSingle productListBannerRequest:^(BOOL success,id objc) {
        self.pics = [NSMutableArray arrayWithArray:(NSArray *)objc];
        [self createBanner:self.pics];
    }];
    
    [ELRequestSingle productPlateRequest:^(BOOL success,id objc) {
        channelArray = [NSArray arrayWithArray:(NSArray *)objc];
    } withObject:self.optionid];
}

- (void)createBanner:(NSArray *)arr
{
    _Topic = [[JCTopic alloc]initWithFrame:CGRectMake(10, 10, SCREENWIDTH-10*2, (SCREENWIDTH-10*2)*(790.0/1035.0))];
    //代理
    _Topic.JCdelegate = self;
    _Topic.delegate = self;
    //创建数据
    NSMutableArray * tempArray = [[NSMutableArray alloc]init];
    for(NSDictionary * dic in arr)
    {
        [tempArray addObject:[NSDictionary dictionaryWithObjects:@[OBJC([dic objectForKey:@"content_simg"]) ,NSStringFromJson([dic objectForKey:@"content_name"]),@NO] forKeys:@[@"pic",@"title",@"isLoc"]]];
        
        //        [tempArray addObject:[NSDictionary dictionaryWithObjects:@[OBJC([dic objectForKey:@"content_value"]) ,OBJC([dic objectForKey:@"content_name"]),@NO,[UIImage imageNamed:@"no_phote"]] forKeys:@[@"pic",@"title",@"isLoc",@"placeholderImage"]]];
    }
    
    
    _Topic.pics = tempArray;
    [_Topic upDate];
    _Topic.userInteractionEnabled = YES;
    [mainScrollView addSubview:_Topic];
    
    pageView = [[StyledPageControl alloc]initWithFrame:CGRectMake(_Topic.frame.origin.x+20, _Topic.frame.size.height+_Topic.frame.origin.y-30, _Topic.frame.size.width-40, 30)];
    [mainScrollView addSubview:pageView];
    
    [pageView setAutoresizingMask:UIViewAutoresizingFlexibleWidth];
    
    [pageView setPageControlStyle:PageControlStyleThumb];
    [pageView setThumbImage:[UIImage imageNamed:@"common_no_selected.png"]];
    [pageView setSelectedThumbImage:[UIImage imageNamed:@"common_selected.png"]];
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
