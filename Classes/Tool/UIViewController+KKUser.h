//
//  UIViewController+KKUser.h
//
//
//  Created by Johnny on 14-9-1.
//  Copyright (c) 2014年 come.CrazyExam.apps. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (KKUser)

/**
 *  创建UIBarButtonItem
 *
 *  @param normalImage 有图像
 *  @param title       有标题
 *  @param tapBlock    点击的效果
 *
 *  @return 返回一个UIBarButtonItem
 */
- (UIBarButtonItem *)itemWithImage:(UIImage *)normalImage
                             title:(NSString *)title
                          tapBlock:(void (^)(void))block;
/**
 *  创建UIBarButtonItem
 *
 *  @param normalImage 图像
 *  @param action      点击效果
 *
 *  @return 返回一个UIBarButtonItem
 */
- (UIBarButtonItem *)itemWithImage:(UIImage *)normalImage
                            action:(void (^)(id sender))action;

/**
 *  创建UIBarButtonItem
 *
 *  @param title  标题
 *  @param action 点击效果
 *
 *  @return 返回一个UIBarButtonItem
 */
- (UIBarButtonItem *)itemWithTitle:(NSString *)title
                            action:(void (^)(id sender))action;
/**
 *  创建UIBarButtonItem
 *
 *  @param normalImage 图像
 *  @param action      点击效果
 *
 *  @return 返回一个UIBarButtonItem
 */
- (UIBarButtonItem *)itemCustomImage:(UIImage *)normalImage
                              action:(void (^)(id sender))action;


- (UIButton *)buttonWithFrame:(CGRect)frame
                        image:(UIImage *)normalImage
                selectedImage:(UIImage *)selectedImage
                     tapBlock:(void (^)(void))block;

- (UIImageView *)imageWithFrame:(CGRect)frame
                          image:(UIImage *)normalImage
                       tapBlock:(void (^)(void))block;

- (UILabel *)labelWithFrame:(CGRect)frame
                      title:(NSString *)title
                   fontSize:(CGFloat)fSize
                  fontColor:(UIColor *)fColor
               textAligment:(NSTextAlignment)aligment
                   tapBlock:(void (^)(void))block;

- (UIBarButtonItem *)itemCustomTitle:(NSString *)title font:(UIFont *)font tapBlock:(void (^)(void))block;

- (UIBarButtonItem *)itemCustomRightImageName:(NSString *)imageName tapBlock:(void (^)(void))block;
@end
