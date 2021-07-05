//
//  ViewController.m
//  Runtime
//
//  Created by YuSiyuan on 2021/7/5.
//

#import "ViewController.h"
#import <objc/runtime.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self SwizzlingMethod];
    NSLog(@"Call originalFunction ------- ");
    [self originalFunction];
    NSLog(@"Call swizzledFunction ------- ");
    [self swizzledFunction];
}

- (void)SwizzlingMethod {
    // 当前类
    Class class = [self class];
    
    // 原方法名 和 替换方法名
    SEL originalSelector = @selector(originalFunction);
    SEL swizzledSelector = @selector(swizzledFunction);
    
    // 原方法结构体 和 替换方法结构体
    Method originalMethod = class_getInstanceMethod(class, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
    
    // 交换两个方法的实现
    method_exchangeImplementations(originalMethod, swizzledMethod);
}

// 原始方法
- (void)originalFunction {
    NSLog(@"originalFunction");
}

// 替换方法
- (void)swizzledFunction {
    NSLog(@"swizzledFunction");
}

@end
