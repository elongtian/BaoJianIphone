//
//  EnterpriseFeaturesViewController.m
//  BaoJianIphone
//
//  Created by elongtian on 15-2-26.
//  Copyright (c) 2015年 madongkai. All rights reserved.
//

#import "EnterpriseFeaturesViewController.h"
#import "HomeChannelView.h"
#import "FeatureFinalViewController.h"
@interface EnterpriseFeaturesViewController ()

@end

@implementation EnterpriseFeaturesViewController
@synthesize TopicIMageView;
@synthesize mainScrollView;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self initParameters];
    [self createChannel];
}

- (void)initParameters
{
    titles = [[NSMutableArray alloc]initWithObjects:@"坚定目标",@"专业研发",@"良心服务",@"密集网点",@"专业物流",@"注重环保",@"扶持创业",@"爱心公益", nil];
    icons = [[NSMutableArray alloc]initWithObjects:@"jdmb",@"zyyf",@"lxfw",@"mjwd",@"zywl",@"zzhb",@"fccy",@"axgy", nil];
    
    channelArray = [[NSArray alloc]init];
    self.navbar.titleLabel.text = @"企业特色";
    
    self.bottom_logoV.hidden = NO;
    
    mainScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(10, NAVHEIGHT, SCREENWIDTH-20, SCREENHEIGHT-NAVHEIGHT-49)];
    //    mainScrollView.delegate = self;
    [self.view addSubview:mainScrollView];
    
    TopicIMageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 10, mainScrollView.frame.size.width, mainScrollView.frame.size.width*(387.0/1035.0))];
    [TopicIMageView setImage:[UIImage imageNamed:@"qyts_banner"]];
    [mainScrollView addSubview:TopicIMageView];
    
    [self download];
}

- (void)download{
    [ELRequestSingle featurePlateRequest:^(BOOL success,id objc) {
        channelArray = [NSArray arrayWithArray:(NSArray *)objc];
    } withObject:self.optionid];
}

- (void)createChannel
{
    int width = (SCREENWIDTH-10*4)/3.0;
    CGSize size = CGSizeMake(0, 0);
    for(int i = 0;i<[titles count];i++)
    {
        HomeChannelView * channel = [[HomeChannelView alloc]initWithFrame:CGRectMake((width+10)*(i%3), 10+TopicIMageView.frame.origin.y+TopicIMageView.frame.size.height+(width+10)*(i/3), width, width)];
        channel.titleL.text = [titles objectAtIndex:i];
        channel.titleL.textColor = UIColorFromRGB(0x272727);
        channel.titleL.font = UIFontHiraginoSansGBW3(14);
        [channel.imgV setImage:[UIImage imageNamed:[icons objectAtIndex:i]]];
        [channel setBackgroundColor:[UIColor whiteColor]];
        channel.tag = 100+i;
        channel.call_back = ^(HomeChannelView *view){
            if([channelArray count] == 0){
                [self.view makeToast:@"数据正在拉取中..."];
                return ;
            }
            FeatureFinalViewController * final = [[FeatureFinalViewController alloc] initWithNibName:@"FeatureFinalViewController" bundle:nil];
            final.titleName = [titles objectAtIndex:i];
            
            final.optionid = [(BJObject *)[channelArray objectAtIndex:i] auto_id];
            [self.navigationController pushViewController:final animated:YES];
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
                case 6:
                {
                    
                }
                    break;
                case 7:
                {
                    
                }
                    break;
                default:
                    break;
            }
        };
        [mainScrollView addSubview:channel];
        size = CGSizeMake(SCREENWIDTH-20, channel.frame.origin.y+channel.frame.size.height+10);
    }
    mainScrollView.contentSize = size;
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
