//
//  GGWifiInfo.m
//  GGTools
//
//  Created by GG on 2018/3/14.
//  Copyright © 2018年 GG. All rights reserved.
//

#import "GGWifiInfo.h"
#import <SystemConfiguration/CaptiveNetwork.h>
@implementation GGWifiInfo

+ (NSDictionary *)currentNetworkInfo{
    
    id info = nil;
    NSArray *ifs = (__bridge_transfer id)CNCopySupportedInterfaces();
    
    for (NSString *ifnam in ifs) {
        
        @try{
            info = (__bridge_transfer id)CNCopyCurrentNetworkInfo((__bridge CFStringRef)ifnam);
        }
        @catch(NSException *exception){
            NSLog(@"获取Wi-Fi信息失败：%@",exception);
            info = nil;
        }
        @finally{
            
        }
        
        if (info) {
            break;
        }
    }
    return info;
}
//+ (id)SSIDDATA{
//    id info = [self currentNetworkInfo];
//    return info[@"SSIDDATA"];
//
//}

+ (NSString *)BSSID{
    
    id info = [self currentNetworkInfo];
    return info[@"BSSID"];
}

+ (NSString *)SSID{
    id info = [self currentNetworkInfo];
    return info[@"SSID"];
    
}


@end
