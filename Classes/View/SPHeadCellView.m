
//
//  SPHeadCellView.m
//  Taurus
//
//  Created by ppan on 2017/5/3.
//  Copyright © 2017年 ppan. All rights reserved.
//

#import "SPHeadCellView.h"

@implementation SPHeadCellView

- (void)createUI {

    _topLab = [UILabel newAutoLayoutView];
    [self addSubview:_topLab];
    [_topLab autoPinEdgeToSuperviewEdge:ALEdgeTop];
    [_topLab autoPinEdgeToSuperviewEdge:ALEdgeLeft];
    [_topLab autoPinEdgeToSuperviewEdge:ALEdgeRight];
    [_topLab autoSetDimension:ALDimensionHeight toSize:self.frame.size.height/2];
    _topLab.font = [UIFont systemFontOfSize:36*SPScaleNumber];
    _topLab.textAlignment = NSTextAlignmentCenter;
    
    _bottomLab = [UILabel newAutoLayoutView];
    [self addSubview:_bottomLab];
    [_bottomLab autoPinEdgeToSuperviewEdge:ALEdgeBottom];
    [_bottomLab autoPinEdgeToSuperviewEdge:ALEdgeLeft];
    [_bottomLab autoPinEdgeToSuperviewEdge:ALEdgeRight];
    [_bottomLab autoSetDimension:ALDimensionHeight toSize:self.frame.size.height/2];
    _bottomLab.font = [UIFont systemFontOfSize:26*SPScaleNumber];
    _bottomLab.textColor = DSHexColor(@"#bababa");
    _bottomLab.textAlignment = NSTextAlignmentCenter;
}

@end
