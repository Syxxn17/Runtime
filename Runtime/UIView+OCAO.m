//
//  UIView+OCAO.m
//  Runtime
//
//  Created by YuSiyuan on 2021/7/6.
//

#import "UIView+OCAO.h"
#import <objc/runtime.h>

static char kDefaultColorKey;

@implementation UIView (OCAO)

@dynamic defaultColor;

- (void)setDefaultColor:(UIColor *)defaultColor {
    objc_setAssociatedObject(self, &kDefaultColorKey, defaultColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (id)defaultColor {
    return objc_getAssociatedObject(self, &kDefaultColorKey);
}

@end
