//
//  InfomationCenterViewController.h
//  BaoJianIphone
//
//  Created by elongtian on 15-2-26.
//  Copyright (c) 2015年 madongkai. All rights reserved.
//

#import "BaseViewController.h"
#import "QCSlideSwitchView.h"
#import "InfoListViewController.h"
@interface InfomationCenterViewController : BaseViewController<QCSlideSwitchViewDelegate>{
    QCSlideSwitchView *_slideSwitchView;
    float length;
}
@property (strong, nonatomic) IBOutlet QCSlideSwitchView *slideSwitchView;
@property (retain, nonatomic) NSMutableArray * titleLengthArray;
@property (retain, nonatomic) InfoListViewController * newsController;
@property (retain, nonatomic) InfoListViewController * bookController;
@property (retain, nonatomic) InfoListViewController * videoController;
@property (retain, nonatomic) InfoListViewController * pptController;
@end
