//
//  GGNetwork.h
//  GGTools
//
//  Created by GG on 2018/3/14.
//  Copyright © 2018年 GG. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GGNetwork : NSObject

#pragma POST
#pragma ********************* 发起一个POST请求（NSData） *********************
+ (NSURLSessionDataTask *)gg_postWithURLString:(NSString *)urlString httpBody:(NSData *)httpBody resultBlock:(void(^)(NSError *error,id result))resultBlock;
#pragma ********************* 发起一个POST请求（NSDictionary） *********************
+ (NSURLSessionDataTask *)gg_postWithURLString:(NSString *)urlString parameters:(NSDictionary *)parameters resultBlock:(void(^)(NSError *error,id result))resultBlock;

#pragma GET
#pragma ********************* 发起一个GET 请求 *********************
+ (NSURLSessionDataTask *)gg_getWithURLString:(NSString *)urlString parameters:(NSDictionary *)parameters resultBlock:(void(^)(NSError *error,id result))resultBlock;


@end
