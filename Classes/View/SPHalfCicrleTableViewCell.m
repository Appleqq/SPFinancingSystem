//
//  SPHalfCicrleTableViewCell.m
//  Taurus
//
//  Created by ppan on 2017/5/4.
//  Copyright © 2017年 ppan. All rights reserved.
//

#import "SPHalfCicrleTableViewCell.h"
#import "SPHalfCircleLabView.h"
@interface SPHalfCicrleTableViewCell ()
@property (nonatomic ,strong ) UIImageView         *topleftLogoIV;
@property (nonatomic ,strong ) UILabel             *topNameLab;
@property (nonatomic ,strong ) UILabel             *bottomNameLab;
@property (nonatomic ,strong ) UIImageView         *toprightLogoIV;
@property (nonatomic ,strong ) CAShapeLayer        *stockShapeLayer;/**< 存量债务类
*/
@property (nonatomic ,strong ) CAShapeLayer        *debtShaperLayer;/**< 中长期支出债务类*/
@property (nonatomic ,strong ) CAShapeLayer        *financingShaperLayer;/**< 在建后续融资类*/
@property (nonatomic ,strong ) CAShapeLayer        *nProjectShaperLayer;/**< 新建项目类*/
@property (nonatomic ,strong ) SPHalfCircleLabView *stockDecView;/**< 存量债务类描述
                                                                  */
@property (nonatomic ,strong ) SPHalfCircleLabView *debtView;/**< 中长期支出债务类描述
                                                              */
@property (nonatomic ,strong ) SPHalfCircleLabView *financingView;/**< 在建后续融资类描述*/
@property (nonatomic ,strong ) SPHalfCircleLabView *nProjectView;/**< 新建项目类描述*/
@end

@implementation SPHalfCicrleTableViewCell

- (void)createUI {
    self.contentView.backgroundColor = [UIColor whiteColor];
    [self createSameUI];
    [self createOwnUI];
//创建 CAShapeLayer
    _stockShapeLayer = [[CAShapeLayer alloc]init];
    _stockShapeLayer = [self setShapeLayer:_stockShapeLayer withFrame:CGRectMake(0, 0, 300*SPScaleNumber, 300*SPScaleNumber) withsStrokeColor:DSHexColor(@"#fc4f14") andstrokeStart:0.25 andstrokeEnd:0.75];
    _debtShaperLayer = [[CAShapeLayer alloc]init];
    _debtShaperLayer = [self setShapeLayer:_debtShaperLayer withFrame:CGRectMake(0, 0, 240*SPScaleNumber, 240*SPScaleNumber) withsStrokeColor:DSHexColor(@"#771fd9") andstrokeStart:0.25 andstrokeEnd:0.6];
    _financingShaperLayer = [[CAShapeLayer alloc]init];
    _financingShaperLayer = [self setShapeLayer:_financingShaperLayer withFrame:CGRectMake(0, 0, 180*SPScaleNumber, 180*SPScaleNumber) withsStrokeColor:DSHexColor(@"#24d9b9") andstrokeStart:0.25 andstrokeEnd:0.5];
    _nProjectShaperLayer = [[CAShapeLayer alloc]init];
    _nProjectShaperLayer = [self setShapeLayer:_nProjectShaperLayer withFrame:CGRectMake(0, 0, 120*SPScaleNumber, 120*SPScaleNumber) withsStrokeColor:DSHexColor(@"#5196fc") andstrokeStart:0.25 andstrokeEnd:0.45];
    [self.contentView.layer addSublayer:_stockShapeLayer];
    [self.contentView.layer addSublayer:_debtShaperLayer];
    [self.contentView.layer addSublayer:_financingShaperLayer];
    [self.contentView.layer addSublayer:_nProjectShaperLayer];

}
- (void)createSameUI {
    if (!_toprightLogoIV) {
        _topleftLogoIV = [UIImageView newAutoLayoutView];
        [self.contentView addSubview:_topleftLogoIV];
        [_topleftLogoIV autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:20*SPScaleNumber];
        [_topleftLogoIV autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:20*SPScaleNumber];
        [_topleftLogoIV autoSetDimensionsToSize:CGSizeMake(71*SPScaleNumber, 71*SPScaleNumber)];
        _topleftLogoIV.image = [UIImage imageNamed:@"债务情况"];
    }
    
    if (!_topNameLab) {
        _topNameLab = [UILabel newAutoLayoutView];
        [self.contentView addSubview:_topNameLab];
        [_topNameLab autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:_topleftLogoIV withOffset:10];
        [_topNameLab autoSetDimension:ALDimensionHeight toSize:30*SPScaleNumber];
        [_topNameLab autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:_topleftLogoIV];
        _topNameLab.text = @"债务情况";
        _topNameLab.font = [UIFont systemFontOfSize:26*SPScaleNumber];
        _topNameLab.textColor = DSHexColor(@"#000000");
    }
    if (!_bottomNameLab) {
        _bottomNameLab = [UILabel newAutoLayoutView];
        [self.contentView addSubview:_bottomNameLab];
        [_bottomNameLab autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:_topNameLab];
        [_bottomNameLab autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_topNameLab];
        _bottomNameLab.textColor = DSHexColor(@"#bababa");
        _bottomNameLab.font = [UIFont systemFontOfSize:24*SPScaleNumber];
        _bottomNameLab.text = @"2017年至2021年";
    }
    
    if (!_toprightLogoIV) {
        _toprightLogoIV = [UIImageView newAutoLayoutView];
        [self.contentView addSubview:_toprightLogoIV];
        [_toprightLogoIV autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:20*SPScaleNumber];
        [@[_toprightLogoIV,_topleftLogoIV]autoAlignViewsToAxis:ALAxisHorizontal];
        [_toprightLogoIV autoSetDimensionsToSize:CGSizeMake(32*SPScaleNumber, 10*SPScaleNumber)];
        _toprightLogoIV.image = [UIImage imageNamed:@"多选项"];
    }
    
}
/**
 *  绘制shapelayer
 *
 *  @param layer       需要绘制的layer
 *  @param frame       大小
 *  @param strokeColor 线条的颜色
 *  @param strokeStart 开始的值
 *  @param strokeEnd   结束的值
 *
 *  @return shapeLayer
 */
- (CAShapeLayer *)setShapeLayer:(CAShapeLayer*)layer withFrame:(CGRect)frame withsStrokeColor:(UIColor *)strokeColor andstrokeStart:(double)strokeStart andstrokeEnd:(double)strokeEnd{
    layer.frame = frame;
    layer.position = CGPointMake(RRScreenWith/3, 579*SPScaleNumber/2);
    layer.fillColor = UIColor.clearColor.CGColor;
    //宽度以及填充颜色
    layer.lineWidth = 30.f*SPScaleNumber;
    layer.strokeColor = strokeColor.CGColor;
    
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:frame];
    //反转当前路径的路径对象.(反方向绘制path)
    path = [path bezierPathByReversingPath];
    layer.path = path.CGPath;
    layer.strokeStart = strokeStart;
    layer.strokeEnd = strokeEnd;
    
    // 创建Animation
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    animation.fromValue = @(strokeStart);
    animation.toValue = @(strokeEnd);
    layer.autoreverses = NO;
    animation.duration = 3.0;
    
    // 设置layer的animation
    [layer addAnimation:animation forKey:nil];
    return layer;
}
- (void)createOwnUI {
  
    _stockDecView = [SPHalfCircleLabView newAutoLayoutView];
    [self.contentView addSubview:_stockDecView];
    [_stockDecView autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:_topNameLab withOffset:10*SPScaleNumber];
    [_stockDecView autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_bottomNameLab withOffset:40*SPScaleNumber];
    [_stockDecView autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:20*SPScaleNumber];
    [_stockDecView autoSetDimension:ALDimensionHeight toSize:30*SPScaleNumber];
    _stockDecView.percentLab.text = @"52%";
    _stockDecView.logoView.backgroundColor = DSHexColor(@"#fc4f1e");
    _stockDecView.describeLab.text = @"22.00亿元  存量债务类";
    
    _debtView = [SPHalfCircleLabView newAutoLayoutView];
    [self.contentView addSubview:_debtView];
    [_debtView autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:_stockDecView];
    [_debtView autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_stockDecView];
    [_debtView autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:20*SPScaleNumber];
    [_debtView autoSetDimension:ALDimensionHeight toSize:30*SPScaleNumber];
    _debtView.percentLab.text = @"37%";
    _debtView.logoView.backgroundColor = DSHexColor(@"#771fd9");
    _debtView.describeLab.text = @"22.00亿元  中长期支出债务类";
    
    _financingView = [SPHalfCircleLabView newAutoLayoutView];
    [self.contentView addSubview:_financingView];
    [_financingView autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:_stockDecView];
    [_financingView autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_debtView];
    [_financingView autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:20*SPScaleNumber];
    [_financingView autoSetDimension:ALDimensionHeight toSize:30*SPScaleNumber];
    _financingView.percentLab.text = @"19%";
    _financingView.logoView.backgroundColor = DSHexColor(@"#24d9b9");
    _financingView.describeLab.text = @"22.00亿元  在建后续融资类";
    
    _nProjectView = [SPHalfCircleLabView newAutoLayoutView];
    [self.contentView addSubview:_nProjectView];
    [_nProjectView autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:_stockDecView];
    [_nProjectView autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_financingView];
    [_nProjectView autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:20*SPScaleNumber];
    [_nProjectView autoSetDimension:ALDimensionHeight toSize:30*SPScaleNumber];
    _nProjectView.percentLab.text = @"11%";
    _nProjectView.logoView.backgroundColor = DSHexColor(@"#5196fc");
    _nProjectView.describeLab.text = @"22.00亿元  新建项目类";
}
@end
