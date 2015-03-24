//
//  HotActivityViewController.h
//  BaoJianIphone
//
//  Created by 马东凯 on 15/3/24.
//  Copyright (c) 2015年 madongkai. All rights reserved.
//

#import "BaseViewController.h"
#import "QCSlideSwitchView.h"
#import "InfoListViewController.h"
@interface HotActivityViewController : BaseViewController<QCSlideSwitchViewDelegate>{
    QCSlideSwitchView *_slideSwitchView;
    float length;
    NSArray * channelArray;
    NSMutableArray * controllers;
}
@property (strong, nonatomic) IBOutlet QCSlideSwitchView *slideSwitchView;
@property (retain, nonatomic) NSMutableArray * titleLengthArray;
@property (retain, nonatomic) InfoListViewController * newsController;
@property (retain, nonatomic) InfoListViewController * bookController;
@property (retain, nonatomic) InfoListViewController * videoController;
@property (retain, nonatomic) InfoListViewController * pptController;
@end

