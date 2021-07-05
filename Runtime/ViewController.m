//
//  ViewController.m
//  Runtime
//
//  Created by YuSiyuan on 2021/7/5.
//

#import "ViewController.h"
#import <objc/runtime.h>

@interface Person : NSObject
- (void)myTestPrint: (NSString *)str;
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
    if (sel == @selector(myTestPrint:)) {
        return YES;
    } else {
        return NO;
    }
}

- (id)forwardingTargetForSelector:(SEL)aSelector {
    if (aSelector == @selector(myTestPrint:)) {
        return [Person new];
    } else {
        return [super forwardingTargetForSelector:aSelector];
    }
}

@end
