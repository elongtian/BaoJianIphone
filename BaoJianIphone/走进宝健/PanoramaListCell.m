//
//  PanoramaListCell.m
//  BaoJianIphone
//
//  Created by elongtian on 15-3-2.
//  Copyright (c) 2015年 madongkai. All rights reserved.
//

#import "PanoramaListCell.h"
#import "GlobalCounter.h"
@implementation PanoramaListCell
- (instancetype)initWithCoder:(NSCoder *)coder
{
    [[GlobalCounter getInstance] add:@"create cell"];
    return [super initWithCoder:coder];
}
@end
