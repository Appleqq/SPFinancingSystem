//
//  SPFinacingHeadCell.m
//  Taurus
//
//  Created by ppan on 2017/5/3.
//  Copyright © 2017年 ppan. All rights reserved.
//

#import "SPFinacingHeadCell.h"
@interface SPFinacingHeadCell ()
@property (nonatomic , strong)UIImageView  *topleftIV;
@property (nonatomic , strong)UILabel      *topnameLab;
@property (nonatomic , strong)UIImageView  *toprightIV;
@property (nonatomic , strong)UIView       *bgIV;
@end
@implementation SPFinacingHeadCell

- (void)createUI {
    _bgIV = [[UIView alloc]initWithFrame:CGRectMake(0, 0, RRScreenWith, 224*SPScaleNumber)];
    [self.contentView addSubview:_bgIV];
    _bgIV.backgroundColor = DSHexColor(@"#fefefe");
    
    if (!_topleftIV) {
        _topleftIV = [UIImageView newAutoLayoutView];
        [_bgIV addSubview:_topleftIV];
        [_topleftIV autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:20*SPScaleNumber];
        [_topleftIV autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:20*SPScaleNumber];
        [_topleftIV autoSetDimensionsToSize:CGSizeMake(71*SPScaleNumber, 71*SPScaleNumber)];
        _topleftIV.image = [UIImage imageNamed:@"资金情况"];
    }
    
    if (!_topnameLab) {
        _topnameLab = [UILabel newAutoLayoutView];
        [_bgIV addSubview:_topnameLab];
        [_topnameLab autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:_topleftIV withOffset:10*SPScaleNumber];
        [_topnameLab autoSetDimension:ALDimensionHeight toSize:30*SPScaleNumber];
        _topnameLab.font = [UIFont systemFontOfSize:26*SPScaleNumber];
        _topnameLab.text = @"资金情况";
    }
    if (!_toprightIV) {
        _toprightIV = [UIImageView newAutoLayoutView];
        [_bgIV addSubview:_toprightIV];
        [_toprightIV autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:20*SPScaleNumber];
        [_toprightIV autoSetDimensionsToSize:CGSizeMake(32*SPScaleNumber, 10*SPScaleNumber)];
        _toprightIV.image = [UIImage imageNamed:@"多选项"];
        
    }
    [@[_topleftIV,_topnameLab,_toprightIV]autoAlignViewsToAxis:ALAxisHorizontal];
    
    if (!_moneygapIV) {
       _moneygapIV = [[SPHeadCellView alloc]initWithFrame:CGRectMake(0, 100*SPScaleNumber, 160*SPScaleNumber, 114*SPScaleNumber)];
        [_bgIV addSubview:_moneygapIV];
        UIView *lineIV = [UIView newAutoLayoutView];
        [self.contentView addSubview:lineIV];
        [lineIV autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:_moneygapIV];
        [lineIV autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:_moneygapIV];
        [lineIV autoSetDimensionsToSize:CGSizeMake(1, 114*SPScaleNumber)];
        lineIV.backgroundColor = DSHexColor(@"#bababa");
        _moneygapIV.topLab.text = @"170.55";
        _moneygapIV.bottomLab.text = @"资金缺口";
    }
    
    if (!_agreementIV) {
        _agreementIV = [[SPHeadCellView alloc]initWithFrame:CGRectMake(_moneygapIV.size.width+1, 100*SPScaleNumber, 160*SPScaleNumber, 114*SPScaleNumber)];
        [_bgIV addSubview:_agreementIV];
        UIView *lineIV = [UIView newAutoLayoutView];
        [_bgIV addSubview:lineIV];
        [lineIV autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:_agreementIV];
        [lineIV autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:_agreementIV];
        [lineIV autoSetDimensionsToSize:CGSizeMake(1, 114*SPScaleNumber)];
        lineIV.backgroundColor = DSHexColor(@"#bababa");
        _agreementIV.topLab.text = @"160.22";
        _agreementIV.bottomLab.text = @"协议总额";

    }
    if (!_arriveIV) {
        _arriveIV = [[SPHeadCellView alloc]initWithFrame:CGRectMake(_agreementIV.origin.x+ _agreementIV.size.width+1, 100*SPScaleNumber, 160*SPScaleNumber, 114*SPScaleNumber)];
        [_bgIV addSubview:_arriveIV];
        UIView *lineIV = [UIView newAutoLayoutView];
        [_bgIV addSubview:lineIV];
        [lineIV autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:_arriveIV];
        [lineIV autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:_arriveIV];
        [lineIV autoSetDimensionsToSize:CGSizeMake(1, 114*SPScaleNumber)];
        lineIV.backgroundColor = DSHexColor(@"#bababa");
        _arriveIV.topLab.text = @"210.53";
        _arriveIV.bottomLab.text = @"到位资金";

    }
    if (!_debtIV) {
        _debtIV = [[SPHeadCellView alloc]initWithFrame:CGRectMake(_arriveIV.origin.x+ _arriveIV.size.width+1, 100*SPScaleNumber, 160*SPScaleNumber, 114*SPScaleNumber)];
        [_bgIV addSubview:_debtIV];
        UIView *lineIV = [UIView newAutoLayoutView];
        [_bgIV addSubview:lineIV];
        [lineIV autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:_debtIV];
        [lineIV autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:_debtIV];
        [lineIV autoSetDimensionsToSize:CGSizeMake(1, 114*SPScaleNumber)];
        lineIV.backgroundColor = DSHexColor(@"#bababa");
        _debtIV.topLab.text = @"192.21";
        _debtIV.bottomLab.text = @"到期债务";
    }
    if (!_cashpoolingLab) {
        _cashpoolingLab = [UILabel newAutoLayoutView];
        [self.contentView addSubview:_cashpoolingLab];
        [_cashpoolingLab autoAlignAxisToSuperviewAxis:ALAxisVertical];
        [_cashpoolingLab autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_bgIV withOffset:20*SPScaleNumber];
        _cashpoolingLab.font = [UIFont systemFontOfSize:48*SPScaleNumber];
        _cashpoolingLab.textAlignment = NSTextAlignmentCenter;
        _cashpoolingLab.text = @"267.33";
    }
    if (!_cashpoolBtn) {
        _cashpoolBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        [self.contentView addSubview:_cashpoolBtn];
        [_cashpoolBtn autoAlignAxisToSuperviewAxis:ALAxisVertical];
        [_cashpoolBtn autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_cashpoolingLab];
        [_cashpoolBtn autoSetDimensionsToSize:CGSizeMake(300*SPScaleNumber,44*SPScaleNumber)];
        [_cashpoolBtn setImage:[UIImage imageNamed:@"资金池"] forState:UIControlStateNormal];
        [_cashpoolBtn setTitle:@"资金池" forState:UIControlStateNormal];
        [_cashpoolBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, 10*SPScaleNumber, 0, 0)];
        [_cashpoolBtn setTitleColor:DSHexColor(@"#bababa") forState:UIControlStateNormal];
    }
    self.contentView.backgroundColor = DSHexColor(@"#f2f2f2");
    
}

@end
