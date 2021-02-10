//
//  SubTest.h
//  Nav
//
//  Created by maiyou on 2021/2/8.
//

#import "Test.h"
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef CGRect (^BuildFrameBlock) (CGSize ScreenSize,CGRect frame);

@interface SubTest : Test

@property(nonatomic,copy)BuildFrameBlock frameBlock;

@property(nonatomic,copy)void(^blockName)(void);

@property(nonatomic,assign)int result;

- (SubTest*(^)(int value))add;

- (SubTest*(^)(int value))function1:(int)block;

@end

NS_ASSUME_NONNULL_END
