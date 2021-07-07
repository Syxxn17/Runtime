//
//  ViewController.m
//  Runtime
//
//  Created by YuSiyuan on 2021/7/5.
//

#import "ViewController.h"
#import "UIView+OCAO.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    view.defaultColor = [UIColor blackColor];
    view.backgroundColor = view.defaultColor;
    [self.view addSubview:view];
}


@end
