//
//  SPScreeningView.h
//  Taurus
//
//  Created by ppan on 2017/5/5.
//  Copyright © 2017年 ppan. All rights reserved.
//

#import "SPBaseView.h"
typedef void(^selectedScreeningViewDataBlock)(id data);
@interface SPScreeningView : UIView
@property (nonatomic ,copy) selectedScreeningViewDataBlock block;
- (instancetype)initWithSubView:(UIView*)subview;
@end
