//
//  GGCarrierInfo.m
//  GGTools
//
//  Created by GG on 2018/3/14.
//  Copyright © 2018年 GG. All rights reserved.
//

#import "GGCarrierInfo.h"

#import <CoreTelephony/CTTelephonyNetworkInfo.h>
#import <CoreTelephony/CTCarrier.h>



@implementation GGCarrierInfo


/// @brief 获取运营商信息
+ (CTCarrier *)getCarrier {
    CTTelephonyNetworkInfo *info = [[CTTelephonyNetworkInfo alloc] init];
    CTCarrier *carrier = [info subscriberCellularProvider];
    return carrier;
}

+ (NSString *)getCarrierMobileCountryCode {
    CTCarrier *carrier = [self getCarrier];
    
    NSString *str = [carrier mobileCountryCode];
    return str;
}

+ (NSString *)getCarrierMobileNetworkCode {
    CTCarrier *carrier = [self getCarrier];
    NSString *str = [carrier mobileNetworkCode];
    return str;
}
+ (NSString *)getCarrierName{
    CTCarrier *carrier = [self getCarrier];
    NSString *str = [carrier carrierName];
    
    return str;
}



@end
