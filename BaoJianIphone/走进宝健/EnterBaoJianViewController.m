//
//  EnterBaoJianViewController.m
//  BaoJianIphone
//
//  Created by elongtian on 15-2-26.
//  Copyright (c) 2015年 madongkai. All rights reserved.
//

#import "EnterBaoJianViewController.h"
#import "HomeChannelView.h"
#import "EnterpriseFeaturesViewController.h"
#import "PanoramaListViewController.h"
#import "EnterpriseIntroViewController.h"
#import "KxMenu.h"
@interface EnterBaoJianViewController ()

@end

@implementation EnterBaoJianViewController
@synthesize mainScrollView;
@synthesize pageView;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navbar.titleLabel.text = @"走进宝健";
    [self.navbar.homebtn setImage:[UIImage imageNamed:@"more_point_btn"] forState:UIControlStateNormal];
    
    [self initParameters];

    [self createDescription];
    
    [self ad_request];
    [self createChannel];
}

- (void)initParameters
{
    channelArray = [[NSArray alloc]init];
    
    _Topic = [[JCTopic alloc]initWithFrame:CGRectMake(10, 10, SCREENWIDTH-10*2, (SCREENWIDTH-10*2)*(790.0/1035.0))];
    titles = [[NSMutableArray alloc]initWithObjects:@"企业简介",@"企业特色",@"园区全景", nil];
    icons = [[NSMutableArray alloc]initWithObjects:@"qyjj_icon",@"qyts_icon",@"yqqj_icon", nil];
    colors = [[NSMutableArray alloc]initWithObjects:UIColorFromRGB(0x39b735),UIColorFromRGB(0x1aafa2),UIColorFromRGB(0x2893d6), nil];
    mainScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, NAVHEIGHT, SCREENWIDTH, SCREENHEIGHT-NAVHEIGHT-49)];
    mainScrollView.showsVerticalScrollIndicator = NO;
    //    mainScrollView.delegate = self;
    [self.view addSubview:mainScrollView];
    
    self.bottom_logoV.hidden = NO;
}
   

#pragma mark - 创建企业文化说明
- (void)createDescription
{
    descripView = [[UIView alloc]initWithFrame:CGRectMake(10, _Topic.frame.size.height+_Topic.frame.origin.y+10, SCREENWIDTH-20, 100)];
    [mainScrollView addSubview:descripView];
    
    UIImageView * icon = [[UIImageView alloc]initWithFrame:CGRectMake(15, 10, 25, 25)];
    [icon setImage:[UIImage imageNamed:@"zjbj_title_img"]];
    [descripView addSubview:icon];
    
    UILabel * titleL = [[UILabel alloc]initWithFrame:CGRectMake(icon.frame.origin.x+icon.frame.size.width+10, icon.frame.origin.y, mainScrollView.frame.size.width-(icon.frame.origin.x+icon.frame.size.width+10), icon.frame.size.height)];
    titleL.text = @"健康 成就人生价值";
    [descripView addSubview:titleL];
    
    UILabel * desL = [[UILabel alloc]initWithFrame:CGRectMake(icon.frame.origin.x, icon.frame.origin.y+icon.frame.size.height+10,descripView.frame.size.width-2*15, 60)];
    desL.text = @"宝健致力于以优质的产品和贴心的服务为消费者提供个性化的健康保障，倡导摆脱依赖，自助健康，实现对更高人生价值的追求。";
    [descripView addSubview:desL];
    
    desL.numberOfLines = 0;
    
    CGSize size = CGSizeMake(desL.frame.size.width, 100);
    CGSize caculate_Size = [desL.text getcontentsizeWithfont:desL.font constrainedtosize:size linemode:NSLineBreakByCharWrapping];
    desL.frame = CGRectMake(desL.frame.origin.x, desL.frame.origin.y, caculate_Size.width, caculate_Size.height);
    
    descripView.frame = CGRectMake(descripView.frame.origin.x, _Topic.frame.size.height+_Topic.frame.origin.y+10, descripView.frame.size.width, desL.frame.origin.y+desL.frame.size.height+10);
    
    descripView.backgroundColor = [UIColor whiteColor];
}

- (void)createChannel
{
    int width = (SCREENWIDTH-10*4)/3.0;
    CGSize size = CGSizeMake(0, 0);
    for(int i = 0;i<3;i++)
    {
        HomeChannelView * channel = [[HomeChannelView alloc]initWithFrame:CGRectMake(10+(width+10)*(i%3), 10+descripView.frame.origin.y+descripView.frame.size.height+(width+10)*(i/3)+10, width, width)];
        channel.titleL.text = [titles objectAtIndex:i];
        [channel.imgV setImage:[UIImage imageNamed:[icons objectAtIndex:i]]];
        channel.backgroundColor = [colors objectAtIndex:i];
        channel.tag = 100+i;
        
        channel.call_back = ^(HomeChannelView * view){
            if([channelArray count]==0){
                [self.view makeToast:@"数据正在拉取中..."];
                return ;
            }
            BJObject * object = [channelArray objectAtIndex:i];
            switch (view.tag-100) {
                case 0:
                {
                    EnterpriseIntroViewController * info = [[EnterpriseIntroViewController alloc]initWithNibName:@"EnterpriseIntroViewController" bundle:nil];
                    info.optionid = object.auto_id;
                    [self.navigationController pushViewController:info animated:YES];
                }
                    break;
                case 1:
                {
                    EnterpriseFeaturesViewController * feature = [[EnterpriseFeaturesViewController alloc]init];
                    feature.optionid = object.auto_id;
                    [self.navigationController pushViewController:feature animated:YES];
                }
                    break;
                case 2:
                {
                    PanoramaListViewController * panoramalist = [[PanoramaListViewController alloc]initWithNibName:@"PanoramaListViewController" bundle:nil];
                    panoramalist.optionid = object.auto_id;
                    [self.navigationController pushViewController:panoramalist animated:YES];
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
    [ELRequestSingle comeBaoJianBannerRequest:^(id objc) {
        self.pics = [NSMutableArray arrayWithArray:(NSArray *)objc];
        [self createBanner:self.pics];
    }];
    
    [ELRequestSingle comeBjPlateRequest:^(id objc) {
        
        channelArray = [NSArray arrayWithArray:(NSArray *)objc];
    } withObject:self.optionid];
}

- (void)createBanner:(NSArray *)arr
{
    //代理
    _Topic.JCdelegate = self;
    //创建数据
    NSMutableArray * tempArray = [[NSMutableArray alloc]init];
    for(NSDictionary * dic in arr)
    {
        [tempArray addObject:[NSDictionary dictionaryWithObjects:@[OBJC([dic objectForKey:@"content_simg"]) ,NSStringFromJson([dic objectForKey:@"content_name"]),@NO] forKeys:@[@"pic",@"title",@"isLoc"]]];
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
}

- (void)back:(id)sender
{
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
