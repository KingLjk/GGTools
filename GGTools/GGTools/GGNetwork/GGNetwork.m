//
//  GGNetwork.m
//  GGTools
//
//  Created by GG on 2018/3/14.
//  Copyright © 2018年 GG. All rights reserved.
//

#import "GGNetwork.h"



@implementation GGNetwork

#pragma POST
#pragma ********************* 发起一个POST请求（NSData） *********************
+ (NSURLSessionDataTask *)gg_postWithURLString:(NSString *)urlString httpBody:(NSData *)httpBody resultBlock:(void(^)(NSError *error,id result))resultBlock{
    
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequestCachePolicy cachePolicy = NSURLRequestUseProtocolCachePolicy;
    NSTimeInterval timeOut = 15;
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url cachePolicy:cachePolicy timeoutInterval:timeOut];
    request.HTTPMethod = @"POST";
    request.HTTPBody = httpBody;
    
    NSURLSessionDataTask *task = [self gg_creatDataTaskWithURLRequest:request resultBlock:resultBlock];
    [task resume];
    return task;
}
#pragma ********************* 发起一个POST请求（NSDictionary） *********************
+ (NSURLSessionDataTask *)gg_postWithURLString:(NSString *)urlString parameters:(NSDictionary *)parameters resultBlock:(void(^)(NSError *error,id result))resultBlock{
    
    NSString *parametersString = [self convertToStringWithDict:parameters];
    NSURL *url = [NSURL URLWithString:urlString];
    
    NSURLRequestCachePolicy cachePolicy = NSURLRequestUseProtocolCachePolicy;
    NSTimeInterval timeOut = 15;
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url cachePolicy:cachePolicy timeoutInterval:timeOut];
    request.HTTPMethod = @"POST";
    request.HTTPBody = [parametersString dataUsingEncoding:NSUTF8StringEncoding];
    
    NSURLSessionDataTask *task = [self gg_creatDataTaskWithURLRequest:request resultBlock:resultBlock];
    [task resume];
    return task;
}
#pragma GET
#pragma ********************* 发起一个GET 请求 *********************
+ (NSURLSessionDataTask *)gg_getWithURLString:(NSString *)urlString parameters:(NSDictionary *)parameters resultBlock:(void(^)(NSError *error,id result))resultBlock{
    
    NSString *parametersString = [self convertToStringWithDict:parameters];
    NSString *string = [NSString stringWithFormat:@"%@%@",urlString,parametersString ? [NSString stringWithFormat:@"?%@",parametersString] : @""];
    NSLog(@"%@",string);
    NSCharacterSet *characters = [NSCharacterSet URLQueryAllowedCharacterSet];
    string = [string stringByAddingPercentEncodingWithAllowedCharacters:characters];
    
    NSURL *url = [NSURL URLWithString:string];
    NSURLRequestCachePolicy cachePolicy = NSURLRequestUseProtocolCachePolicy;
    NSTimeInterval timeOut = 15;
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url cachePolicy:cachePolicy timeoutInterval:timeOut];
    
    NSURLSessionDataTask *task = [self gg_creatDataTaskWithURLRequest:request resultBlock:resultBlock];
    [task resume];
    
    return task;
}




#pragma *********************  创建 NSURLSessionDataTask 实例 *********************
+ (NSURLSessionDataTask *)gg_creatDataTaskWithURLRequest:(NSURLRequest *)request resultBlock:(void(^)(NSError *error,id result))resultBlock{
    
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        NSHTTPURLResponse *httpURLResponse = (NSHTTPURLResponse *)response;
        NSInteger statusCode = httpURLResponse.statusCode;
        
        if (statusCode == 200 || statusCode == 304) {
            
            NSJSONReadingOptions options = NSJSONReadingMutableContainers;
            NSError *error = nil;
            id result = [NSJSONSerialization JSONObjectWithData:data options:options error:&error];
            if (!resultBlock) {
                return ;
            }
            
            dispatch_async(dispatch_get_main_queue(), ^{
                resultBlock(error,result);
            });
        }else{
            if (!resultBlock) {
                return ;
            }
            NSError *failError = error;
            
            if (!failError) {
                NSErrorDomain domain = @"Code is not equal to 200 or 304.";
                NSInteger code = httpURLResponse.statusCode;
                
                NSDictionary *dict = @{
                                       NSURLErrorFailingURLStringErrorKey:request.URL.absoluteString,
                                       NSURLErrorFailingURLErrorKey:request.URL,
                                       };
                failError = [NSError errorWithDomain:domain code:code userInfo:dict];
            }
            dispatch_async(dispatch_get_main_queue(), ^{
                
                resultBlock(failError,nil);
            });
            
        }
        
    }];
    return task;
}






// 字典转字符串
+ (NSString *)convertToStringWithDict:(NSDictionary *)dict{
    if (!dict || dict.count<1) {
        return nil;
    }
    NSMutableString *mutableString = [NSMutableString string];
    
    [dict enumerateKeysAndObjectsUsingBlock:^(NSString *key, id  _Nonnull  obj, BOOL * _Nonnull stop) {
        [mutableString appendFormat:@"%@=%@&",key,obj];
    }];
    
    if (mutableString.length > 0) {
        NSString *string = [mutableString substringToIndex:mutableString.length - 1];
        return string;
    }
    return mutableString.copy;
}



@end
