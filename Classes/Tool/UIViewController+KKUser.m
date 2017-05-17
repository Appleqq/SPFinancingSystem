//
//  UIViewController+KKUser.h
//
//
//  Created by Johnny on 14-9-1.
//  Copyright (c) 2014年 come.CrazyExam.apps. All rights reserved.
//

#import "UIViewController+KKUser.h"
@implementation UIViewController (KKUser)

- (UIBarButtonItem *)itemWithImage:(UIImage *)normalImage
                             title:(NSString *)title
                          tapBlock:(void (^)(void))block
{
    UIBarButtonItem *item;
    CGSize size     = [title boundingRectWithSize:CGSizeMake(100, INT_MAX)
                                      options:NSStringDrawingUsesLineFragmentOrigin
                                   attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:18]}
                                      context:nil].size;
    UIView *view    = [[UIView alloc] initWithFrame:CGRectMake(0, 0, size.width + 23, 40)];
    UIImageView *iv = [self imageWithFrame:CGRectMake(0, 9.5, 21, 21)
                                     image:[UIImage imageNamed:@"nav-location"]
                                  tapBlock:nil];

    UILabel *label  = [self labelWithFrame:CGRectMake(23, (40-size.height)/2, size.width, size.height)
                                    title:title
                                 fontSize:18
                                fontColor:[UIColor whiteColor]
                             textAligment:NSTextAlignmentLeft
                                 tapBlock:nil];
    [view addSubview:iv];
    [view addSubview:label];

    [view bk_whenTapped:block];

    item            = [[UIBarButtonItem alloc] initWithCustomView:view];
    return item;
}

- (UIBarButtonItem *)itemCustomImage:(UIImage *)normalImage
                              action:(void (^)(id))action {
    return [[UIBarButtonItem alloc]bk_initWithImage:normalImage style:UIBarButtonItemStylePlain handler:action];
}

- (UIBarButtonItem *)itemWithImage:(UIImage *)normalImage
                            action:(void (^)(id sender))action
{
    return [[UIBarButtonItem alloc] bk_initWithImage:normalImage
                                               style:UIBarButtonItemStylePlain
                                             handler:action];
}

- (UIBarButtonItem *)itemWithTitle:(NSString *)title
                            action:(void (^)(id sender))action
{
    return [[UIBarButtonItem alloc] bk_initWithTitle:title
                                               style:UIBarButtonItemStylePlain
                                             handler:action];
}

- (UIButton *)buttonWithFrame:(CGRect)frame
                        image:(UIImage *)normalImage
                selectedImage:(UIImage *)selectedImage
                     tapBlock:(void (^)(void))block
{

    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame     = frame;
    [btn setImage:normalImage forState:UIControlStateNormal];
    [btn setImage:selectedImage forState:UIControlStateSelected];
    [btn bk_whenTapped:block];
    return btn;
}

- (UIImageView *)imageWithFrame:(CGRect)frame
                          image:(UIImage *)normalImage
                       tapBlock:(void (^)(void))block
{
    UIImageView *iv = [[UIImageView alloc] initWithFrame:frame];
    iv.image        = normalImage;
    [iv bk_whenTapped:block];
    return iv;
}

- (UILabel *)labelWithFrame:(CGRect)frame
                      title:(NSString *)title
                   fontSize:(CGFloat)fSize
                  fontColor:(UIColor *)fColor
               textAligment:(NSTextAlignment)aligment
                   tapBlock:(void (^)(void))block
{
    UILabel *label  = [[UILabel alloc] initWithFrame:frame];
    label.text      = title;
    label.font      = [UIFont systemFontOfSize:fSize];
    label.textColor = fColor;
    [label bk_whenTapped:block];
    return label;
}

- (UIBarButtonItem *)itemCustomTitle:(NSString *)title font:(UIFont *)font tapBlock:(void (^)(void))block {
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(-20, -10, 44,44)];
    label.textAlignment = NSTextAlignmentCenter;
    label.font = font;
    label.text = title;
    label.textColor = RRBaseColor;
    [label ds_tappedWithBlock:block];
    return [[UIBarButtonItem alloc]initWithCustomView:label];
}

- (UIBarButtonItem *)itemCustomRightImageName:(NSString *)imageName tapBlock:(void (^)(void))block {
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(23, 23, 100*7/10, 23*7/10)];
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 10, 100*7/10, 23*7/10)];
    imageView.image = [UIImage imageNamed:imageName];
    [view addSubview:imageView];
    [view ds_tappedWithBlock:block];
    return [[UIBarButtonItem alloc]initWithCustomView:view];
}



@end
