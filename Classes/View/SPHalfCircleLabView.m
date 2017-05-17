//
//  SPHalfCircleLabView.m
//  Taurus
//
//  Created by ppan on 2017/5/5.
//  Copyright © 2017年 ppan. All rights reserved.
//

#import "SPHalfCircleLabView.h"

@implementation SPHalfCircleLabView

- (void)createUI {

    _percentLab = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 60*SPScaleNumber, 30*SPScaleNumber)];
    [self addSubview:_percentLab];
    _percentLab.font = [UIFont systemFontOfSize:24*SPScaleNumber];
    
    _logoView = [[UIView alloc]initWithFrame:CGRectMake(60*SPScaleNumber+10*SPScaleNumber, 0, 30*SPScaleNumber, 30*SPScaleNumber)];
    [self addSubview:_logoView];
    
    _describeLab = [[UILabel alloc]initWithFrame:CGRectMake(_logoView.frame.origin.x+_logoView.frame.size.width+10*SPScaleNumber, 0, 300*SPScaleNumber, 30*SPScaleNumber)];
    [self addSubview:_describeLab];
    _describeLab.font = [UIFont systemFontOfSize:24*SPScaleNumber];
}

@end
