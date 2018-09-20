//
//  UIColor+RCColor.h
//  student
//  RGB颜色扩展类
//  Created by wjw on 2017/1/9.
//  Copyright © 2017年 朴新教育科技集团. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (RCColor)

// RGB颜色转UIColor
+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;

// 颜色转图片
+ (UIImage *)imageWithColor:(UIColor *)color;

@end
