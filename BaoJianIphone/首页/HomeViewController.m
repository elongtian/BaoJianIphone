//
//  HomeViewController.m
//  BaoJianIphone
//
//  Created by elongtian on 15-2-11.
//  Copyright (c) 2015年 madongkai. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeChannelView.h"
#import "ELBottomBar.h"
#import "EnterBaoJianViewController.h"
#import "HealthManagementViewController.h"
#import "CareerChanceViewController.h"
#import "InfomationCenterViewController.h"
#import "SearchResultViewController.h"
#import "MemberCenterViewController.h"
#import "MoreViewController.h"
#import "HotActivityViewController.h"

#import "LoginViewController.h"
@interface HomeViewController ()

@end

@implementation HomeViewController
@synthesize pageView;
@synthesize mainScrollView;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self initParameters];
    
    [self ad_request];
    
    [self createChannel];
    
    [self createBottomBar];
}

- (void)initParameters
{
    
    [ELRequestSingle load:^(BOOL sucess, id objc) {
        NSLog(@"%@",[[[[[objc objectForKey:@"data"] objectAtIndex:0] objectForKey:@"modules_sub"] objectAtIndex:0] objectForKey:@"modules_name"]);
    }];
    
    channelArray = [[NSArray alloc]init];
    titles = [[NSMutableArray alloc]initWithObjects:@"走进宝健",@"健康管理",@"事业机会",@"资讯中心",@"宝健商场",@"热门活动", nil];
    icons = [[NSMutableArray alloc]initWithObjects:@"comebj",@"health",@"career",@"infocenter",@"shop",@"activity", nil];
//    colors = [[NSMutableArray alloc]initWithObjects:UIColorFromRGB(0x39b735),UIColorFromRGB(0x2893d6),UIColorFromRGB(0xc300de),UIColorFromRGB(0xbb9b09),UIColorFromRGB(0xff5f7e),UIColorFromRGB(0xe89d3d), nil];
//    self.navbar.titleLabel.text = @"首页";
    [self.navbar.backbtn setBackgroundImage:[UIImage imageNamed:@"logo"] forState:UIControlStateNormal];
    [self.navbar.backbtn setImage:nil forState:UIControlStateNormal];
    self.navbar.backbtn.frame = CGRectMake(0, 0, 103, 40);
    self.navbar.backbtn.center = CGPointMake(SCREENWIDTH/2, 20+44/2);
    mainScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, NAVHEIGHT, SCREENWIDTH, SCREENHEIGHT-NAVHEIGHT-49)];
//    mainScrollView.delegate = self;
    [self.view addSubview:mainScrollView];
}
//1032*785

- (void)createChannel
{
    int width = (SCREENWIDTH-10*4)/3.0;
    CGSize size = CGSizeMake(0, 0);
    for(int i = 0;i<6;i++)
    {
        HomeChannelView * channel = [[HomeChannelView alloc]initWithFrame:CGRectMake(10+(width+10)*(i%3), 10+(SCREENWIDTH-10*2)*(790.0/1035.0)+(width+10)*(i/3)+10, width, width)];
        channel.titleL.text = [titles objectAtIndex:i];
        channel.titleL.textColor = UIColorFromRGB(0x514f4e);
        [channel.imgV setImage:[UIImage imageNamed:[icons objectAtIndex:i]]];
        channel.backgroundColor = [UIColor whiteColor];
        channel.tag = 100+i;
        
        channel.call_back = ^(HomeChannelView *view){
            
        if([channelArray count] == 0){
                [self.view makeToast:@"数据拉取中..."];
                return ;
            }
        BJObject * object = [channelArray objectAtIndex:i];
            
            
            switch (view.tag-100) {
                case 0:
                {
                    EnterBaoJianViewController * enterBJ = [[EnterBaoJianViewController alloc]init];
                    enterBJ.optionid = object.auto_id;
                    [self.navigationController pushViewController:enterBJ animated:YES];
                }
                    break;
                case 1:
                {
                    HealthManagementViewController * health = [[HealthManagementViewController alloc]initWithNibName:@"HealthManagementViewController" bundle:nil];
                    health.optionid = object.auto_id;
                    [self.navigationController pushViewController:health animated:YES];
                }
                    break;
                case 2:
                {
                    CareerChanceViewController * career = [[CareerChanceViewController alloc]initWithNibName:@"CareerChanceViewController" bundle:nil];
                    career.optionid = object.auto_id;
                    [self.navigationController pushViewController:career animated:YES];
                }
                    break;
                case 3:
                {
                    InfomationCenterViewController * infocenter = [[InfomationCenterViewController alloc]initWithNibName:@"InfomationCenterViewController" bundle:nil];
                    infocenter.titleName = @"资讯中心";
                    infocenter.optionid = object.auto_id;
                    [self.navigationController pushViewController:infocenter animated:YES];
                }
                    break;
                case 4:
                {
                    UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"敬请期待!" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"知道了", nil];
                    [alert show];
                }
                    break;
                case 5:
                {
                    HotActivityViewController * infocenter = [[HotActivityViewController alloc]initWithNibName:@"HotActivityViewController" bundle:nil];
                    infocenter.titleName = @"热门活动";
                    infocenter.optionid = @"164";
                    [self.navigationController pushViewController:infocenter animated:YES];
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
    [ELRequestSingle homeBannerRequest:^(BOOL success,id objc) {
        self.pics = [NSMutableArray arrayWithArray:(NSArray *)objc];
        [self createBanner:self.pics];
    }];
    
    [ELRequestSingle homePlateRequest:^(BOOL success,id objc) {
        channelArray = [NSArray arrayWithArray:(NSArray *)objc];
    }];
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

- (void)createBottomBar
{
    ELBottomBar * bar = [[ELBottomBar alloc]initWithFrame:CGRectMake(0, SCREENHEIGHT-49, SCREENWIDTH, 49)];
    NSArray * titlesArray = @[@"个人中心",@"搜索",@"帮助"];
    NSArray * bottom_icons = @[@"member",@"search_icon",@"help"];
    bar.callback = ^(UIButton * sender){
    
        switch (sender.tag-100) {
            case 0:
            {
                //个人中心
                if([[UserLoginInfoManager loginmanager] state]){
                    MemberCenterViewController * member = [[MemberCenterViewController alloc]initWithNibName:@"MemberCenterViewController" bundle:nil];
                    [self.navigationController pushViewController:member animated:YES];

                }else{
                    LoginViewController * login = [[LoginViewController alloc] initWithNibName:@"LoginViewController" bundle:nil];
                    [self.navigationController pushViewController:login animated:YES];
                }
                
            }
                break;
            case 1:
            {
                //搜索
                SearchResultViewController * search = [[SearchResultViewController alloc]initWithNibName:@"SearchResultViewController" bundle:nil];
                [self.navigationController pushViewController:search animated:YES];
            }
                break;
            case 2:
            {
                //帮助
                MoreViewController * more = [[MoreViewController alloc]initWithNibName:@"MoreViewController" bundle:nil];
                [self.navigationController pushViewController:more animated:YES];
            }
                break;
            default:
                break;
        }
    };
    bar.titles = (NSMutableArray *)titlesArray;
    bar.icons = (NSMutableArray *)bottom_icons;
    [self.view addSubview:bar];
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
