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
/**
 发送一个GET请求

 @param urlString 请求地址
 @param httpBody 请求体
 @param timeOut 超时时常
 @param resultBlock 结果回掉
 @return 请求任务
 */
+ (NSURLSessionDataTask *)gg_postWithURLString:(NSString *)urlString httpBody:(NSData *)httpBody time:(NSTimeInterval)timeOut resultBlock:(void(^)(NSError *error,id result))resultBlock;
#pragma ********************* 发起一个POST请求（NSDictionary） *********************
+ (NSURLSessionDataTask *)gg_postWithURLString:(NSString *)urlString parameters:(NSDictionary *)parameters resultBlock:(void(^)(NSError *error,id result))resultBlock;
#pragma ********************* 发起一个POST请求（NSDictionary和超时） *********************
+ (NSURLSessionDataTask *)gg_postWithURLString:(NSString *)urlString parameters:(NSDictionary *)parameters time:(NSTimeInterval)timeOut resultBlock:(void(^)(NSError *error,id result))resultBlock;

#pragma GET
#pragma ********************* 发起一个GET 请求 *********************
+ (NSURLSessionDataTask *)gg_getWithURLString:(NSString *)urlString parameters:(NSDictionary *)parameters resultBlock:(void(^)(NSError *error,id result))resultBlock;


/**
 发起一个get请求,可设置超时时常

 @param urlString 请求地址
 @param parameters 参数
 @param timeOut 超时时常
 @param resultBlock 会调
 @return 任务实例
 */
+ (NSURLSessionDataTask *)gg_getWithURLString:(NSString *)urlString parameters:(NSDictionary *)parameters time:(NSTimeInterval)timeOut resultBlock:(void(^)(NSError *error,id result))resultBlock;
@end
