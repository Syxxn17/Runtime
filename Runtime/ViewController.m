//
//  ViewController.m
//  Runtime
//
//  Created by YuSiyuan on 2021/7/5.
//

#import "ViewController.h"
#import "UIViewController+Swizzling.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIViewController *vc = [UIViewController new];
    NSLog(@"Call original function=======");
    [vc originalFunction];
    NSLog(@"Call swizzled function=======");
    [vc swizzledFunction];
}


@end
