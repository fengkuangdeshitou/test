//
//  SubTest.m
//  Nav
//
//  Created by maiyou on 2021/2/8.
//

#import "SubTest.h"
#import "Header.h"

@interface SubTest ()

@property(nonatomic,assign)CGRect ViewRect;
@property(nonatomic,strong)UIView * view;

@end

@implementation SubTest

+ (void)load{
    NSLog(@"%s",__func__);
}

+ (void)initialize
{
    if (self == [self class]) {
        NSLog(@"%s",__func__);
    }
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        self.ViewRect = CGRectMake(200, 200, 50, 50);
        self.view = [[UIView alloc] initWithFrame:self.ViewRect];
        self.view.backgroundColor = [UIColor purpleColor];
        [UIApplication.sharedApplication.keyWindow addSubview:self.view];
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self load];
        });
        
        SubTest * (^custom) (NSInteger value) = ^(NSInteger value){
            return self;
        };
        
        custom(1);
        
    }
    return self;
}

- (void)load{
    if (self.frameBlock) {
        self.ViewRect = self.frameBlock(UIScreen.mainScreen.bounds.size,self.ViewRect);
    }
    [self updateFrame];
    
    self.func1().func1();
    
    self.func2.view.backgroundColor = [UIColor redColor];
    
    self.add(1);
    
    self.blockName = ^{
        
    };
    
    
    
}

- (SubTest *)func2{
    return self;
}

- (SubTest *(^)(void))func1{
    return ^SubTest*{
        return self;
    };
}

- (SubTest*(^)(int value))add{
    return ^SubTest*(int value){
        return self;
    };
}

- (SubTest*(^)(int value))function1:(int)block{
    return ^SubTest*(int dic){
        return self;
    };
}

- (void)updateFrame{
    NSLog(@"%@",NSStringFromCGRect(self.ViewRect));
    self.view.frame = self.ViewRect;
}

@end
