//
//  ViewController.m
//  Runtime
//
//  Created by YuSiyuan on 2021/7/5.
//

#import "ViewController.h"
#import <objc/runtime.h>

@interface Person : NSObject

@end

@implementation Person
- (void)myTestPrint:(NSString *)str {
    NSLog(@"sy%@", str);
}
@end

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self performSelector:@selector(myTestPrint:) withObject:@", hello!"];
}

+ (BOOL)resolveInstanceMethod:(SEL)sel {
    return YES;
}

- (id)forwardingTargetForSelector:(SEL)aSelector {
    return nil;
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    if ([NSStringFromSelector(aSelector) isEqualToString:@"myTestPrint:"]) {
        return [NSMethodSignature signatureWithObjCTypes:"v@:"];
    }
    return [super methodSignatureForSelector:aSelector];
}

- (void)forwardInvocation:(NSInvocation *)anInvocation {
    SEL sel = anInvocation.selector;
    Person *p = [Person new];
    if ([p respondsToSelector:sel]) {
        [anInvocation invokeWithTarget:p];
    } else {
        [self doesNotRecognizeSelector:sel];
    }
}


@end
