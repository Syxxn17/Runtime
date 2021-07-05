//
//  UIViewController+Swizzling.h
//  Runtime
//
//  Created by YuSiyuan on 2021/7/5.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (Swizzling)
+ (void)load;
- (void)originalFunction;
- (void)swizzledFunction;
@end

NS_ASSUME_NONNULL_END
