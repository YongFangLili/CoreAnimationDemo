//
//  UIView+Utility.m
//  MedplusCommon
//
//  Created by ZhangKaiChao on 16/1/13.
//  Copyright © 2016年 北京欧创医疗技术有限公司. All rights reserved.
//

#import "UIView+Utility.h"

@implementation UIView (Utility)

#pragma mark - X/Y
- (CGFloat)x
{
    return self.frame.origin.x;
}
- (void)setX:(CGFloat)x
{
    CGRect oldFrame = self.frame;
    CGRect frame = CGRectMake(x, oldFrame.origin.y, oldFrame.size.width, oldFrame.size.height);
    self.frame = frame;
}
- (CGFloat)y
{
    return self.frame.origin.y;
}
- (void)setY:(CGFloat)y
{
    CGRect oldFrame = self.frame;
    CGRect frame = CGRectMake(oldFrame.origin.x, y, oldFrame.size.width, oldFrame.size.height);
    self.frame = frame;
}

#pragma mark - 宽高

- (CGFloat)width
{
    return self.bounds.size.width;
}
- (void)setWidth:(CGFloat)width
{
    CGRect oldFrame = self.frame;
    CGRect frame = CGRectMake(oldFrame.origin.x, oldFrame.origin.y, width, oldFrame.size.height);
    self.frame = frame;
}
- (CGFloat)height
{
    return self.bounds.size.height;
}
- (void)setHeight:(CGFloat)height
{
    CGRect oldFrame = self.frame;
    CGRect frame = CGRectMake(oldFrame.origin.x, oldFrame.origin.y, oldFrame.size.width, height);
    self.frame = frame;
}

#pragma mark - 中心点坐标

- (CGFloat)centerX
{
    return self.center.x;
}
- (void)setCenterX:(CGFloat)centerX
{
    CGPoint center = self.center;
    center.x = centerX;
    self.center = center;
}
- (CGFloat)centerY
{
    return self.center.y;
}
- (void)setCenterY:(CGFloat)centerY
{
    CGPoint center = self.center;
    center.y = centerY;
    self.center = center;
}

#pragma mark - 尺寸  size

- (CGSize)size
{
    return self.frame.size;
}
- (void)setSize:(CGSize)size
{
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

#pragma mark - 位置 origin

- (CGPoint)origin
{
    return self.frame.origin;
}
- (void)setOrigin:(CGPoint)origin
{
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

#pragma mark - 返回view所在的viewControllers，一个view可能在多个vc上都有添加所以返回一个数组

- (NSMutableArray*)viewforViewControllers
{
    NSMutableArray* arrayM = [NSMutableArray array];

    for (UIView* next = [self superview]; next; next = next.superview) {
        UIResponder* nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            [arrayM addObject:(UIViewController*)nextResponder];
        }
    }
    return arrayM;
}

@end
