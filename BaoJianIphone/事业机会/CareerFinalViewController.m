//
//  CareerFinalViewController.m
//  BaoJianIphone
//
//  Created by elongtian on 15-3-23.
//  Copyright (c) 2015年 madongkai. All rights reserved.
//

#import "CareerFinalViewController.h"

@interface CareerFinalViewController ()

@end

@implementation CareerFinalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navbar.titleLabel.text = self.titleName;
    [self download];
}

- (void)download{
    [ELRequestSingle careerDetailRequest:^(BOOL sucess, id objc) {
        BJObject * object = (BJObject *)objc;
        _content_name.text = object.content_name;
        _content_time.text = object.create_time;
        [_mWebView loadHTMLString:object.content_body baseURL:nil];
    } withOptionId:self.optionid];
    
   
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
