//
//  ViewController.m
//  Runtime
//
//  Created by YuSiyuan on 2021/7/5.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong)UILabel *label;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.label];
}

-(UILabel *)label {
    if (!_label) {
        _label = [[UILabel alloc] initWithFrame:CGRectMake(50, 50, 100, 50)];
        _label.text = @"label";
        _label.backgroundColor = [UIColor blueColor];
        _label.font = [UIFont fontWithName:@"Helvetica-BoldOblique" size:Fontsize(19)];
        _label.textColor = [UIColor whiteColor];
    }
    return _label;
}

@end
