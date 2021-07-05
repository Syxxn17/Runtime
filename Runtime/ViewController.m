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
    [self performSelector:@selector(myTestPrint:) withObject:@", hello!"];
}

void myMethod(id self, SEL _cmd, NSString *nub) {
    NSLog(@"sy%@", nub);
}

+ (BOOL)resolveInstanceMethod:(SEL)sel {
    if (sel == @selector(myTestPrint:)) {
        class_addMethod([self class], sel, (IMP)myMethod, "v@:@");
        return YES;
    } else {
        return [super resolveInstanceMethod:sel];
    }
}

@end
