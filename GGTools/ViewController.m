//
//  ViewController.m
//  GGTools
//
//  Created by GG on 2018/3/13.
//  Copyright © 2018年 李佳贵. All rights reserved.
//

#import "ViewController.h"

#import "GGWifiInfo.h"
#import "GGCarrierInfo.h"

#import "GGNetwork.h"

@interface ViewController ()
@property (nonatomic, strong)NSURLSessionDataTask *task;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    
    
    NSString *urlString = @"https://www.baidu.com";
    urlString = @"https://www.sojson.com/open/api/weather/json.shtml";
    NSDictionary *parameters = @{
                                 @"city":@"北京",
//                                 @"null":[NSNull null],
                                 };
    NSURLSessionDataTask *task = [GGNetwork gg_getWithURLString:urlString parameters:parameters resultBlock:^(NSError *error, id result) {
        if (error) {
            NSLog(@"error:---->%@",error);
        }else{
            NSLog(@"result:---->%@",result);
        }

    }];
    self.task = task;
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"%@",self.task);
}






@end
