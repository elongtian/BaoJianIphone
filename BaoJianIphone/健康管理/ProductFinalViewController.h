//
//  ProductFinalViewController.h
//  BaoJianIphone
//
//  Created by elongtian on 15-2-26.
//  Copyright (c) 2015年 madongkai. All rights reserved.
//

#import "BaseViewController.h"
#import "ELButton.h"
#import "JCTopic.h"
#import "StyledPageControl.h"

@interface ProductFinalViewController : BaseViewController<JCTopicDelegate,UIScrollViewDelegate,UIWebViewDelegate>

@property (strong, nonatomic) IBOutlet UIScrollView *mainScrollView;
@property (strong, nonatomic) IBOutlet UIView *headView;
@property (strong, nonatomic) IBOutlet UIView *descBackView;
@property (strong, nonatomic) IBOutlet UIWebView *mainWebView;
@property (strong, nonatomic) IBOutlet ELButton *leftOneBtn;
@property (strong, nonatomic) IBOutlet ELButton *leftTwoBtn;
@property (strong, nonatomic) IBOutlet UIButton *collectionBtn;
@property (strong, nonatomic) IBOutlet UIButton *purchaseBtn;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *webHeghtConstraint;
@property (strong, nonatomic) IBOutlet UILabel *content_name;
@property (strong, nonatomic) IBOutlet UILabel *content_desc1;
@property (strong, nonatomic) IBOutlet UILabel *content_desc2;
@property (strong, nonatomic) IBOutlet UILabel *content_price;
@property (strong, nonatomic) IBOutlet UILabel *content_preprice;

@property (retain, nonatomic) JCTopic * Topic;
@property (retain, nonatomic) StyledPageControl * pageView;
@property (retain, nonatomic) NSMutableArray * pics;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *headViewWidth;
@end
