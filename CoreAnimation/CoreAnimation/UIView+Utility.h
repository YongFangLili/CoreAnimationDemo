//
//  UIView+Utility.h
//  MedplusCommon
//
//  Created by ZhangKaiChao on 16/1/13.
//  Copyright © 2016年 北京欧创医疗技术有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Utility)

///  frame的 X
- (CGFloat)x;
///  设置frame的 x
- (void)setX:(CGFloat)x;

///  frame的 y
- (CGFloat)y;
///  设置frame的 y
- (void)setY:(CGFloat)y;

///  bounds的宽度
- (CGFloat)width;
///  设置宽度
- (void)setWidth:(CGFloat)width;

///  bounds高度
- (CGFloat)height;
///  设置高度
- (void)setHeight:(CGFloat)height;
///  中心 X 坐标
- (CGFloat)centerX;
///  设置中心 X 坐标
- (void)setCenterX:(CGFloat)centerX;
///  中心 Y 坐标
- (CGFloat)centerY;
///  设置中心 Y 坐标
- (void)setCenterY:(CGFloat)centerY;

///  控件位置(origin)
- (CGPoint)origin;
///  设置控件位置(origin)
- (void)setOrigin:(CGPoint)origin;

///  控件大小(size)
- (CGSize)size;
///  设置控件大小(size)
- (void)setSize:(CGSize)size;

///  返回view所在的viewControllers，一个view可能在多个vc上都有添加所以返回一个数组
///
///  @return 所在vc的数组
- (NSMutableArray*)viewforViewControllers;

@end
