//
//  ELHttpRequestOperation.h
//  ElongtianRequest
//
//  Created by elongtian on 14-5-22.
//  Copyright (c) 2014年 elongtian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

@interface ELHttpRequestOperation : AFHTTPRequestOperationManager

+ (instancetype)sharedClient;

+ (void)sessionDownloadWithUrl:(NSString *)urlStr success:(void (^)(NSURL *fileURL))success fail:(void (^)())fail;
@end
