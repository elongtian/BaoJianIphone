//
//  SearchResultViewController.h
//  BaoJianIphone
//
//  Created by elongtian on 15-2-26.
//  Copyright (c) 2015年 madongkai. All rights reserved.
//

#import "BaseViewController.h"
#import "SearchResultShowViewController.h"
@interface SearchResultViewController : BaseViewController<UITextFieldDelegate>{
    SearchResultShowViewController * resultViewController;
}

@end
