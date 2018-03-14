//
//  GGWifiInfo.h
//  GGTools
//
//  Created by GG on 2018/3/14.
//  Copyright © 2018年 GG. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GGWifiInfo : NSObject


+ (NSDictionary *)currentNetworkInfo;

+ (NSString *)BSSID;

+ (NSString *)SSID;


//+ (id)SSIDDATA;
@end
