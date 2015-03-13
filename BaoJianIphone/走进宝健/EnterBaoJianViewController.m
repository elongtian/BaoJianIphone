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
@interface EnterBaoJianViewController ()

@end

@implementation EnterBaoJianViewController
@synthesize mainScrollView;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navbar.titleLabel.text = @"走进宝健";
    [self initParameters];

    [self createDescription];
    
    [self ad_request];
    [self createChannel];
}

- (void)initParameters
{
    _Topic = [[JCTopic alloc]initWithFrame:CGRectMake(10, 10, SCREENWIDTH-10*2, (SCREENWIDTH-10*2)*(790.0/1035.0))];
    titles = [[NSMutableArray alloc]initWithObjects:@"企业简介",@"企业特色",@"园区全景", nil];
    icons = [[NSMutableArray alloc]initWithObjects:@"qyjj_icon",@"qyts_icon",@"yqqj_icon", nil];
    colors = [[NSMutableArray alloc]initWithObjects:UIColorFromRGB(0x39b735),UIColorFromRGB(0x1aafa2),UIColorFromRGB(0x2893d6), nil];
    mainScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, NAVHEIGHT, SCREENWIDTH, SCREENHEIGHT-NAVHEIGHT-49)];
    //    mainScrollView.delegate = self;
    [self.view addSubview:mainScrollView];
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
            switch (view.tag-100) {
                case 0:
                {
                
                }
                    break;
                case 1:
                {
                    EnterpriseFeaturesViewController * feature = [[EnterpriseFeaturesViewController alloc]init];
                    [self.navigationController pushViewController:feature animated:YES];
                }
                    break;
                case 2:
                {
                    PanoramaListViewController * panoramalist = [[PanoramaListViewController alloc]initWithNibName:@"PanoramaListViewController" bundle:nil];
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
    //代理
    _Topic.JCdelegate = self;
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
    [mainScrollView addSubview:_Topic];
    
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
        
    }
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
