//
//  GoEvaluateViewController.h
//  BaoJianIphone
//
//  Created by elongtian on 15-2-26.
//  Copyright (c) 2015年 madongkai. All rights reserved.
//

#import "BaseViewController.h"
#import "ELTextView.h"
@interface GoEvaluateViewController : BaseViewController<UITextViewDelegate>
@property (strong, nonatomic) IBOutlet ELTextView *evaluateTextView;
@property (strong, nonatomic) IBOutlet UIButton *commitBtn;
@property (strong, nonatomic) IBOutlet UILabel *wordnumbersLabel;

@end
