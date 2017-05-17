//
//  UIView+Common.m
//  DS_Leo
//
//  Created by chenqitao on 15/12/30.
//  Copyright © 2015年 manito. All rights reserved.
//

#import "UIView+Common.h"
#import <QuartzCore/QuartzCore.h>
#import <objc/runtime.h>
static void *DSTapViewKey = &DSTapViewKey;
@implementation UIView (Common)

- (void)setLayerShadow:(UIColor*)color offset:(CGSize)offset radius:(CGFloat)radius {
    self.layer.shadowColor = color.CGColor;
    self.layer.shadowOffset = offset;
    self.layer.shadowRadius = radius;
    self.layer.shadowOpacity = 1;
    self.layer.shouldRasterize = YES;
    self.layer.rasterizationScale = [UIScreen mainScreen].scale;
}

- (void)removeAllSubviews {
    //[self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    while (self.subviews.count) {
        [self.subviews.lastObject removeFromSuperview];
    }
}

- (UIViewController *)viewController {
    for (UIView *view = self; view; view = view.superview) {
        UIResponder *nextResponder = [view nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)nextResponder;
        }
    }
    return nil;
}

- (CGFloat)left {
    return self.frame.origin.x;
}

- (void)setLeft:(CGFloat)x {
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (CGFloat)top {
    return self.frame.origin.y;
}

- (void)setTop:(CGFloat)y {
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)right {
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setRight:(CGFloat)right {
    CGRect frame = self.frame;
    frame.origin.x = right - frame.size.width;
    self.frame = frame;
}

- (CGFloat)bottom {
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setBottom:(CGFloat)bottom {
    CGRect frame = self.frame;
    frame.origin.y = bottom - frame.size.height;
    self.frame = frame;
}

- (CGFloat)width {
    return self.frame.size.width;
}

- (void)setWidth:(CGFloat)width {
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (CGFloat)height {
    return self.frame.size.height;
}

- (void)setHeight:(CGFloat)height {
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGFloat)centerX {
    return self.center.x;
}

- (void)setCenterX:(CGFloat)centerX {
    self.center = CGPointMake(centerX, self.center.y);
}

- (CGFloat)centerY {
    return self.center.y;
}

- (void)setCenterY:(CGFloat)centerY {
    self.center = CGPointMake(self.center.x, centerY);
}

- (CGPoint)origin {
    return self.frame.origin;
}

- (void)setOrigin:(CGPoint)origin {
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

- (CGSize)size {
    return self.frame.size;
}

- (void)setSize:(CGSize)size {
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

- (void)maskView {
    //通过剪取PNG非透明部分的图片作为layer的底层,这里需要一张白色五角星的png图片
    UIImage* imageWithAlphaChannel = [UIImage imageNamed:@"ic_star_choose_white"];
    CGImageRef cgImageWithAlpha = [imageWithAlphaChannel CGImage];
    CALayer* maskingLayer = [CALayer layer];
    maskingLayer.contents = (__bridge id)cgImageWithAlpha;
    self.layer.mask = maskingLayer;
    maskingLayer.frame = self.layer.bounds;
}

- (void)reductionView{
    UIImage* imageWithAlphaChannel = [UIImage imageNamed:@"ic_weibo"];
    CGImageRef cgImageWithAlpha = [imageWithAlphaChannel CGImage];
    CALayer* maskingLayer = [CALayer layer];
    maskingLayer.contents = (__bridge id)cgImageWithAlpha;
    self.layer.mask = maskingLayer;
    maskingLayer.frame = self.layer.bounds;
}

#pragma mark --给View添加点击事件
- (void)ds_tappedWithBlock:(TappedViewBlock)block {
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapHandler:)];
    self.tapBlock = block;
    self.userInteractionEnabled = YES;
    [self addGestureRecognizer:tap];
}

- (void)tapHandler:(UIGestureRecognizer *)gesture {
    if (self.tapBlock) {
        self.tapBlock();
    }
}

- (TappedViewBlock)tapBlock {
   return objc_getAssociatedObject(self, DSTapViewKey);
}

- (void)setTapBlock:(TappedViewBlock)tapBlock {
    objc_setAssociatedObject(self, DSTapViewKey, tapBlock, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

#pragma mark --

@end
