//
//  Test+Load.m
//  Nav
//
//  Created by maiyou on 2021/2/8.
//

#import "Test+Load.h"

@implementation Test (Load)

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
