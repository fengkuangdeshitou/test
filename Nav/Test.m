//
//  Test.m
//  Nav
//
//  Created by maiyou on 2021/2/7.
//

#import "Test.h"

@implementation Test

NSString * const baseUrl = @"http://api.laigetalk.com";

int const globalVar = 10;

//+ (void)load{
//    NSLog(@"%s",__func__);
//}

+ (void)initialize
{
    if (self == [self class]) {
        NSLog(@"%s",__func__);
    }
}

@end
