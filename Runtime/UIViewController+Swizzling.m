//
//  UIViewController+Swizzling.m
//  Runtime
//
//  Created by YuSiyuan on 2021/7/5.
//

#import "UIViewController+Swizzling.h"
#import <objc/runtime.h>

@implementation UIViewController (Swizzling)
+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        // 当前类
        Class class = [self class];
        
        // 原方法名 和 替换方法名
        SEL originalSelector = @selector(originalFunction);
        SEL swizzledSelector = @selector(swizzledFunction);
        
        // 原方法结构体 和 替换方法结构体
        Method originalMethod = class_getInstanceMethod(class, originalSelector);
        Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
        
        /* 如果当前类没有 原方法的 IMP，说明在从父类继承过来的方法实现，
         * 需要在当前类中添加一个 originalSelector 方法，
         * 但是用 替换方法 swizzledMethod 去实现它
         */
        BOOL didAddMethod = class_addMethod(class, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
        
        if (didAddMethod) {
            class_replaceMethod(class, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
        } else {
            method_exchangeImplementations(originalMethod, swizzledMethod);
        }
    });
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
