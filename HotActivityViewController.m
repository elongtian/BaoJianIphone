//
//  HotActivityViewController.m
//  BaoJianIphone
//
//  Created by 马东凯 on 15/3/24.
//  Copyright (c) 2015年 madongkai. All rights reserved.
//

#import "HotActivityViewController.h"
#import "InfomationFinalViewController.h"
#import "BookChapterListViewController.h"
@interface HotActivityViewController ()

@end

@implementation HotActivityViewController
@synthesize titleLengthArray;
@synthesize newsController;
@synthesize bookController;
@synthesize videoController;
@synthesize pptController;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self initPlat];
    [self download];
}

- (void)download{
    [ELRequestSingle infoCenterPlateRequest:^(BOOL success,id objc) {
        channelArray = [NSArray arrayWithArray:(NSArray *)objc];
        BJObject * object = [channelArray objectAtIndex:0];
        newsController.optionid = object.auto_id;
        [self buildUI];
        [newsController download];
    } withObject:self.optionid];
}
//192.168.1.170/bj_app/app/index.php?com=com_appService&method=appSev&app_com=com_news&task=lists&optionid=166
//192.168.1.170/bj_app/app/index.php?com=com_appService&method=appSev&app_com=com_module&task=module_more&optionid=166

- (void)buildUI{
    for(BJObject * object in channelArray){
        InfoListViewController * infoCtl = [[InfoListViewController alloc]initWithNibName:@"InfoListViewController" bundle:nil];
        infoCtl.title = object.modules_name;
        infoCtl.isbook = YES;
         __block HotActivityViewController * SELF = self;
        infoCtl.callback = ^(NSIndexPath * indexpath){
            InfomationFinalViewController * info = [[InfomationFinalViewController alloc]initWithNibName:@"InfomationFinalViewController" bundle:nil];
            info.optionid = [(BJObject *)[SELF.newsController.dataArray objectAtIndex:indexpath.row] auto_id];
            [SELF.navigationController pushViewController:info animated:YES];
            
        };
        [controllers addObject:infoCtl];
    }
    [self.slideSwitchView buildUI];
}

- (void)initPlat{
    
    channelArray = [[NSArray alloc]init];
    controllers = [[NSMutableArray alloc]init];
    if ([self respondsToSelector:@selector(edgesForExtendedLayout)]) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    
    self.slideSwitchView.slideSwitchViewDelegate = self;
    
    self.navbar.titleLabel.text = self.titleName;
    self.slideSwitchView.tabItemNormalColor = [QCSlideSwitchView colorFromHexRGB:@"868686"];
    self.slideSwitchView.tabItemSelectedColor = [QCSlideSwitchView colorFromHexRGB:@"00a200"];
    self.slideSwitchView.shadowImage = [[UIImage imageNamed:@"red_line_and_shadow.png"]
                                        stretchableImageWithLeftCapWidth:59.0f topCapHeight:0.0f];
}

#pragma mark - 滑动tab视图代理方法
- (NSUInteger)numberOfTab:(QCSlideSwitchView *)view
{
    return [channelArray count];
}

- (UIViewController *)slideSwitchView:(QCSlideSwitchView *)view viewOfTab:(NSUInteger)number
{
    return [controllers objectAtIndex:number];
}

- (void)slideSwitchView:(QCSlideSwitchView *)view didselectTab:(NSUInteger)number
{
    InfoListViewController *vc = nil;
//    if (number == 0) {
//        vc = self.newsController;
//    } else if (number == 1) {
//        vc = self.bookController;
//    } else if (number == 2) {
//        vc = self.videoController;
//    } else if (number == 3) {
//        vc = self.pptController;
//    }
    vc = [controllers objectAtIndex:number];
    if([channelArray count]!=0){
        BJObject * object = [channelArray objectAtIndex:number];
        vc.optionid = object.auto_id;
        [vc download];
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
