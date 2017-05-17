//
//  UIView+Common.h
//  DS_Leo
//
//  Created by chenqitao on 15/12/30.
//  Copyright © 2015年 manito. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^TappedViewBlock)();
typedef void(^CompleteBlock)();
@interface UIView (Common)
/**
 Shortcut to set the view.layer's shadow
 
 @param color  Shadow Color
 @param offset Shadow offset
 @param radius Shadow radius
 */
- (void)setLayerShadow:(UIColor*)color offset:(CGSize)offset radius:(CGFloat)radius;

/**
 Remove all subviews.
 
 @warning Never call this method inside your view's drawRect: method.
 */
- (void)removeAllSubviews;

/**
 Returns the view's view controller (may be nil).
 */

/**
 *  点击之后画成五角星
 *
 *  @param viewToBeMasked 需要画五角星的view
 */
- (void)maskView;
/**
 *  点击之后画成原形
 *
 *  @param view 需要画成圆形的view
 */
- (void)reductionView;
/**
 *  为View增加手势
 *
 *  @param view 为View添加点击事件
 */
- (void)ds_tappedWithBlock:(TappedViewBlock)block;


@property (nonatomic, readonly) UIViewController *viewController;
@property (nonatomic, copy) TappedViewBlock tapBlock;

@property (nonatomic) CGFloat left;        ///< Shortcut for frame.origin.x.
@property (nonatomic) CGFloat top;         ///< Shortcut for frame.origin.y
@property (nonatomic) CGFloat right;       ///< Shortcut for frame.origin.x + frame.size.width
@property (nonatomic) CGFloat bottom;      ///< Shortcut for frame.origin.y + frame.size.height
@property (nonatomic) CGFloat width;       ///< Shortcut for frame.size.width.
@property (nonatomic) CGFloat height;      ///< Shortcut for frame.size.height.
@property (nonatomic) CGFloat centerX;     ///< Shortcut for center.x
@property (nonatomic) CGFloat centerY;     ///< Shortcut for center.y
@property (nonatomic) CGPoint origin;      ///< Shortcut for frame.origin.
@property (nonatomic) CGSize  size;        ///< Shortcut for frame.size.
@end
