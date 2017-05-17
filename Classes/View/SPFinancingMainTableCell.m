//
//  SPFinancingMainCollectionCell.m
//  Taurus
//
//  Created by ppan on 2017/5/3.
//  Copyright © 2017年 ppan. All rights reserved.
//

#import "SPFinancingMainTableCell.h"
#import "SPScreeningView.h"
@interface SPFinancingMainTableCell ()<BMKLocationServiceDelegate,BMKMapViewDelegate,ChartViewDelegate,IChartAxisValueFormatter>
{
    BMKLocationService       *_locationServer;
}
@property (nonatomic , assign,readwrite)SPFinancingCellType cellType;

@property (nonatomic ,strong) UIImageView  *topleftLogoIV;
@property (nonatomic ,strong) UILabel      *topNameLab;
@property (nonatomic ,strong) UILabel      *bottomNameLab;
@property (nonatomic ,strong) UILabel      *totallProjectLab;/**< 项目总数*/
@property (nonatomic ,strong) UILabel      *totallMoneyLab;/**< 项目总投资*/
@property (nonatomic ,strong) UILabel      *simulateLab;/**< 模拟项目*/
@property (nonatomic ,strong) UILabel      *neProjectLab;/**< 新建项目*/
@property (nonatomic ,strong) UILabel      *ingProjectLab;/**< 持续项目*/
@property (nonatomic ,strong) UILabel      *finishProjectLab;/**< 完成项目*/
/**<  ----------------------------------------------------------------------*/

@property (nonatomic ,strong) UILabel       *descripLab; /**<描述 */
@property (nonatomic ,strong) RadarChartView *radarChartView;/**<雷达图 */

@property (nonatomic ,strong) PieChartView   *halfPieChartView;/**<半圆图 */
@property (nonatomic ,strong) LineChartView  *lineChartView;/**<折线图 */
@property (nonatomic ,strong) NSArray        *xAxisDatas; /**< x坐标的数据*/

@end
@implementation SPFinancingMainTableCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier withType:(SPFinancingCellType)type {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.cellType = type;
        [self createUI];
    }
    return self;
}

- (void)createUI {
    switch (_cellType) {
        case FinancingCellMapType:    [self createMapUI];                break;
        case FinacingCellRadarChartType:  [self createRadarChartUI];     break;
        case FinacingCellLineChartType:  [self createaLineChartUI];      break;
            
        default:
            break;
    }
}
- (void)createSameUI {
    if (!_toprightLogoIV) {
        _topleftLogoIV = [UIImageView newAutoLayoutView];
        [self.contentView addSubview:_topleftLogoIV];
        [_topleftLogoIV autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:20*SPScaleNumber];
        [_topleftLogoIV autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:20*SPScaleNumber];
        [_topleftLogoIV autoSetDimensionsToSize:CGSizeMake(71*SPScaleNumber, 71*SPScaleNumber)];
        _topleftLogoIV.image = [UIImage imageNamed:@"债务到期"];
    }
    
    if (!_topNameLab) {
        _topNameLab = [UILabel newAutoLayoutView];
        [self.contentView addSubview:_topNameLab];
        [_topNameLab autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:_topleftLogoIV withOffset:10];
        [_topNameLab autoSetDimension:ALDimensionHeight toSize:30*SPScaleNumber];
        [_topNameLab autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:_topleftLogoIV];
        _topNameLab.text = @"债务到期";
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
- (void)showScreeningView {
    if (!_screeningIV) {
        _screeningIV = [[SPScreeningView alloc]initWithSubView:_toprightLogoIV];
        [self.contentView addSubview:_screeningIV];
    }
    _screeningIV.hidden = NO;
}
- (void)hidderScreeningView {
    _screeningIV.hidden = YES;
    _screeningIV = nil;
}
- (void)createMapUI {
    if (!_toprightLogoIV) {
        _topleftLogoIV = [UIImageView newAutoLayoutView];
        [self.contentView addSubview:_topleftLogoIV];
        [_topleftLogoIV autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:20*SPScaleNumber];
        [_topleftLogoIV autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:20*SPScaleNumber];
        [_topleftLogoIV autoSetDimensionsToSize:CGSizeMake(71*SPScaleNumber, 71*SPScaleNumber)];
        _topleftLogoIV.image = [UIImage imageNamed:@"项目分布"];
    }
    
    if (!_topNameLab) {
        _topNameLab = [UILabel newAutoLayoutView];
        [self.contentView addSubview:_topNameLab];
        [_topNameLab autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:_topleftLogoIV withOffset:10];
        [_topNameLab autoSetDimension:ALDimensionHeight toSize:30*SPScaleNumber];
        [@[_topleftLogoIV,_topNameLab]autoAlignViewsToAxis:ALAxisHorizontal];
        _topNameLab.text = @"项目分布";
        _topNameLab.font = [UIFont systemFontOfSize:26*SPScaleNumber];
        _topNameLab.textColor = DSHexColor(@"#000000");
    }
    if (!self.toprigthView) {
        _toprigthView = [UIView newAutoLayoutView];
        [self.contentView addSubview:_toprigthView];
        [_toprigthView autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:20*SPScaleNumber];
        [@[_toprigthView,_topNameLab]autoAlignViewsToAxis:ALAxisHorizontal];
        [_toprigthView autoSetDimensionsToSize:CGSizeMake(50*SPScaleNumber, 50*SPScaleNumber)];
    }
    if (!_toprightLogoIV) {
        _toprightLogoIV = [UIImageView newAutoLayoutView];
        [self.contentView addSubview:_toprightLogoIV];
        [_toprightLogoIV autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:20*SPScaleNumber];
        [@[_toprightLogoIV,_topNameLab]autoAlignViewsToAxis:ALAxisHorizontal];
        [_toprightLogoIV autoSetDimensionsToSize:CGSizeMake(32*SPScaleNumber, 10*SPScaleNumber)];
        _toprightLogoIV.image = [UIImage imageNamed:@"多选项"];
    }
    
    if (!_totallProjectLab) {
        _totallProjectLab = [UILabel newAutoLayoutView];
        [self.contentView addSubview:_totallProjectLab];
        [_totallProjectLab autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:_topleftLogoIV];
        [_totallProjectLab autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_topleftLogoIV withOffset:27*SPScaleNumber];
        [_totallProjectLab autoSetDimension:ALDimensionHeight toSize:30*SPScaleNumber];
        _totallProjectLab.font = [UIFont systemFontOfSize:26*SPScaleNumber];
        _totallProjectLab.textColor = DSHexColor(@"#bababa");
        _totallProjectLab.textAlignment = NSTextAlignmentCenter;
        NSString *title = @"项目总数:196 个";
        NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc]initWithString:title];
        
        //设置字体和设置字体的范围
        [attrStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:34.0*SPScaleNumber] range:NSMakeRange(5, 3)];
        //添加文字颜色
        [attrStr addAttribute:NSForegroundColorAttributeName value:DSHexColor(@"#00b5fe") range:NSMakeRange(5, 3)];
        _totallProjectLab.attributedText = attrStr;
    }
    if (!_totallMoneyLab) {
        _totallMoneyLab = [UILabel newAutoLayoutView];
        [self.contentView addSubview:_totallMoneyLab];
        [_totallMoneyLab autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:20*SPScaleNumber];
        [_totallMoneyLab autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_topleftLogoIV withOffset:27*SPScaleNumber];
        [_totallMoneyLab autoSetDimension:ALDimensionHeight toSize:30*SPScaleNumber];
        _totallMoneyLab.font = [UIFont systemFontOfSize:26*SPScaleNumber];
        _totallMoneyLab.textColor = DSHexColor(@"#bababa");
        _totallMoneyLab.textAlignment = NSTextAlignmentCenter;
        
        NSString *title = @"投资总金额:305 亿元";
        NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc]initWithString:title];
        
        //设置字体和设置字体的范围
        [attrStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:34.0*SPScaleNumber] range:NSMakeRange(6, 3)];
        //添加文字颜色
        [attrStr addAttribute:NSForegroundColorAttributeName value:DSHexColor(@"#00b5fe") range:NSMakeRange(6, 3)];
        _totallMoneyLab.attributedText = attrStr;
        
    }
    
    if (!_mapView) {
        NSString* path = [[NSBundle mainBundle] pathForResource:@"custom_config_0323(黑夜)" ofType:@""];
        [BMKMapView customMapStyle:path];
        _mapView = [BMKMapView newAutoLayoutView];
        [self.contentView addSubview:_mapView];
        [_mapView autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_totallProjectLab withOffset:20*SPScaleNumber];
        [_mapView autoSetDimensionsToSize:CGSizeMake(RRScreenWith, 332*SPScaleNumber)];
        _mapView.mapType = BMKMapTypeStandard;
        //_mapView.delegate = self;
        _mapView.showsUserLocation = YES;
        _mapView.zoomLevel = 13;
        _mapView.showMapScaleBar = YES;
        _mapView.showsUserLocation = YES;
        _mapView.userTrackingMode = BMKUserTrackingModeFollow;
        
        _locationServer = [[BMKLocationService alloc]init];
        _locationServer.delegate = self;
        [_locationServer startUserLocationService];
    }
    if (!_blowupImageIV) {
        _blowupImageIV = [UIImageView newAutoLayoutView];
        [_mapView addSubview:_blowupImageIV];
        [_blowupImageIV autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:30*SPScaleNumber];
        [_blowupImageIV autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:10*SPScaleNumber];
        [_blowupImageIV autoSetDimensionsToSize:CGSizeMake(40*SPScaleNumber, 40*SPScaleNumber)];
        _blowupImageIV.image = [UIImage imageNamed:@"放大"];
    }
    CGFloat width = RRScreenWith/4;
    if (!_simulateLab) {
        _simulateLab = [UILabel newAutoLayoutView];
        [self.contentView addSubview:_simulateLab];
        [_simulateLab autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_mapView withOffset:27*SPScaleNumber];
        [_simulateLab autoPinEdgeToSuperviewEdge:ALEdgeLeft];
        [_simulateLab autoSetDimension:ALDimensionHeight toSize:30*SPScaleNumber];
        [_simulateLab autoSetDimension:ALDimensionWidth toSize:width];
        _simulateLab.font = [UIFont systemFontOfSize:26*SPScaleNumber];
        _simulateLab.textColor = DSHexColor(@"#bababa");
        _simulateLab.text = @"模拟70 个";
        _simulateLab.textAlignment = NSTextAlignmentCenter;
        
        UIView *lineIV = [UIView newAutoLayoutView];
        [self.contentView addSubview:lineIV];
        [lineIV autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:_simulateLab];
        [lineIV autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:_simulateLab];
        [lineIV autoSetDimensionsToSize:CGSizeMake(1, 30*SPScaleNumber)];
        lineIV.backgroundColor = DSHexColor(@"#bababa");
        
        //        NSString *title = @"新建项目:77 个";
        //        NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc]initWithString:title];
        //
        //        //设置字体和设置字体的范围
        //        [attrStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:34.0*SPScaleNumber] range:NSMakeRange(5, 2)];
        //        //添加文字颜色
        //        [attrStr addAttribute:NSForegroundColorAttributeName value:DSHexColor(@"#00b5fe") range:NSMakeRange(5, 2)];
        //        _simulateLab.attributedText = attrStr;
        
    }
    if (!_neProjectLab) {
        _neProjectLab = [UILabel newAutoLayoutView];
        [self.contentView addSubview:_neProjectLab];
        [_neProjectLab autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_mapView withOffset:27*SPScaleNumber];
        [_neProjectLab autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:_simulateLab withOffset:2];
        [_neProjectLab autoSetDimension:ALDimensionHeight toSize:30*SPScaleNumber];
        [_neProjectLab autoSetDimension:ALDimensionWidth toSize:width];
        _neProjectLab.font = [UIFont systemFontOfSize:26*SPScaleNumber];
        _neProjectLab.textColor = DSHexColor(@"#bababa");
        _neProjectLab.text = @"新建77 个";
        _neProjectLab.textAlignment = NSTextAlignmentCenter;
        
        UIView *lineIV = [UIView newAutoLayoutView];
        [self.contentView addSubview:lineIV];
        [lineIV autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:_neProjectLab];
        [lineIV autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:_neProjectLab];
        [lineIV autoSetDimensionsToSize:CGSizeMake(1, 30*SPScaleNumber)];
        lineIV.backgroundColor = DSHexColor(@"#bababa");
        
        //        NSString *title = @"新建项目:77 个";
        //        NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc]initWithString:title];
        //
        //        //设置字体和设置字体的范围
        //        [attrStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:34.0*SPScaleNumber] range:NSMakeRange(5, 2)];
        //        //添加文字颜色
        //        [attrStr addAttribute:NSForegroundColorAttributeName value:DSHexColor(@"#00b5fe") range:NSMakeRange(5, 2)];
        //        _neProjectLab.attributedText = attrStr;
        
    }
    
    if (!_ingProjectLab) {
        _ingProjectLab = [UILabel newAutoLayoutView];
        [self.contentView addSubview:_ingProjectLab];
        [_ingProjectLab autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:_neProjectLab withOffset:2];
        [_ingProjectLab autoSetDimension:ALDimensionHeight toSize:30*SPScaleNumber];
        [_ingProjectLab autoSetDimension:ALDimensionWidth toSize:width];
        [_ingProjectLab autoSetDimension:ALDimensionWidth toSize:width];
        _ingProjectLab.font = [UIFont systemFontOfSize:26*SPScaleNumber];
        _ingProjectLab.textColor = DSHexColor(@"#bababa");
        _ingProjectLab.text = @"续建34 个";
        _ingProjectLab.textAlignment = NSTextAlignmentCenter;
        
        UIView *lineIV = [UIView newAutoLayoutView];
        [self.contentView addSubview:lineIV];
        [lineIV autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:_ingProjectLab];
        [lineIV autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:_ingProjectLab];
        [lineIV autoSetDimensionsToSize:CGSizeMake(1, 30*SPScaleNumber)];
        lineIV.backgroundColor = DSHexColor(@"#bababa");
        
        //        NSString *title = @"续建项目:25个";
        //        NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc]initWithString:title];
        //
        //        //设置字体和设置字体的范围
        //        [attrStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:34.0*SPScaleNumber] range:NSMakeRange(5, 2)];
        //        //添加文字颜色
        //        [attrStr addAttribute:NSForegroundColorAttributeName value:DSHexColor(@"#00b5fe") range:NSMakeRange(5, 2)];
        //        _ingProjectLab.attributedText = attrStr;
        
    }
    if (!_finishProjectLab) {
        _finishProjectLab = [UILabel newAutoLayoutView];
        [self.contentView addSubview:_finishProjectLab];
        [_finishProjectLab autoPinEdgeToSuperviewEdge:ALEdgeRight];
        [_finishProjectLab autoSetDimension:ALDimensionHeight toSize:30*SPScaleNumber];
        [_finishProjectLab autoSetDimension:ALDimensionWidth toSize:width];
        _finishProjectLab.font = [UIFont systemFontOfSize:26*SPScaleNumber];
        _finishProjectLab.textColor = DSHexColor(@"#bababa");
        _finishProjectLab.text = @"完工80 个";
        _finishProjectLab.textAlignment = NSTextAlignmentCenter;
        
        //        NSString *title = @"完建项目:80 个";
        //        NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc]initWithString:title];
        //
        //        //设置字体和设置字体的范围
        //        [attrStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:34.0*SPScaleNumber] range:NSMakeRange(5, 2)];
        //        //添加文字颜色
        //        [attrStr addAttribute:NSForegroundColorAttributeName value:DSHexColor(@"#00b5fe") range:NSMakeRange(5, 2)];
        //        _finishProjectLab.attributedText = attrStr;
        
    }
    [@[_neProjectLab,_ingProjectLab,_finishProjectLab]autoAlignViewsToAxis:ALAxisHorizontal];
    
}

- (void)setLineDataCount:(int)count range:(double)range
{
    NSMutableArray *yVals1 = [[NSMutableArray alloc] init];
    NSMutableArray *yVals2 = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < count; i++)
    {
        double mult = range / 2.0;
        double val = (double) (arc4random_uniform(mult)) + 50;
        [yVals1 addObject:[[ChartDataEntry alloc] initWithX:i y:val]];
    }
    
    for (int i = 0; i < count - 1; i++)
    {
        double mult = range;
        double val = (double) (arc4random_uniform(mult)) + 450;
        [yVals2 addObject:[[ChartDataEntry alloc] initWithX:i y:val]];
    }
    
    LineChartDataSet *set1 = nil, *set2 = nil;
    
    if (_lineChartView.data.dataSetCount > 0)
    {
        set1 = (LineChartDataSet *)_lineChartView.data.dataSets[0];
        set2 = (LineChartDataSet *)_lineChartView.data.dataSets[1];
        set1.values = yVals1;
        set2.values = yVals2;
        [_lineChartView.data notifyDataChanged];
        [_lineChartView notifyDataSetChanged];
    }
    else
    {
        set1 = [[LineChartDataSet alloc] initWithValues:yVals1 label:@"利息"];
        set1.axisDependency = AxisDependencyLeft;
        [set1 setColor:[UIColor colorWithRed:51/255.f green:181/255.f blue:229/255.f alpha:1.f]];
        [set1 setCircleColor:[UIColor colorWithRed:51/255.f green:181/255.f blue:229/255.f alpha:1.f]];
        set1.lineWidth = 2.0;
        set1.circleRadius = 3.0;
        set1.fillAlpha = 65/255.0;
        //set1.fillColor = [UIColor colorWithRed:51/255.f green:181/255.f blue:229/255.f alpha:1.f];
        set1.highlightColor = [UIColor colorWithRed:244/255.f green:117/255.f blue:117/255.f alpha:1.f];
        set1.drawCircleHoleEnabled = NO;
        
        set2 = [[LineChartDataSet alloc] initWithValues:yVals2 label:@"本金"];
        set2.axisDependency = AxisDependencyRight;
        [set2 setColor:UIColor.redColor];
        [set2 setCircleColor:[UIColor colorWithRed:244/255.f green:117/255.f blue:117/255.f alpha:1.f]];
        set2.lineWidth = 2.0;
        set2.circleRadius = 3.0;
        set2.fillAlpha = 65/255.0;
        //set2.fillColor = UIColor.redColor;
        set2.highlightColor = [UIColor colorWithRed:244/255.f green:117/255.f blue:117/255.f alpha:1.f];
        set2.drawCircleHoleEnabled = NO;
        
        
        NSMutableArray *dataSets = [[NSMutableArray alloc] init];
        [dataSets addObject:set1];
        [dataSets addObject:set2];
        // [dataSets addObject:set3];
        
        LineChartData *data = [[LineChartData alloc] initWithDataSets:dataSets];
        [data setValueTextColor:DSHexColor(@"#bababa")];
        [data setValueFont:[UIFont systemFontOfSize:9.f]];
        
        _lineChartView.data = data;
    }
}

- (void)createRadarChartUI {
    [self createSameUI];
    _xAxisDatas = @[@"到位资金",@"财政预算偿债",@"还款额度",@"资金存量",@"国有资本偿债",@"款项支付"];
    _topleftLogoIV.image = [UIImage imageNamed:@"还款能力预测"];
    _topNameLab.text = @"还款能力预测";
    if (!_radarChartView) {
        _radarChartView = [[RadarChartView alloc]initWithFrame:CGRectMake(0, 111*SPScaleNumber, RRScreenWith, 400*SPScaleNumber)];
        [self.contentView addSubview:_radarChartView];
        _radarChartView.delegate = self;
        
        _radarChartView.chartDescription.enabled = NO;
        _radarChartView.webLineWidth = 1.0;
        _radarChartView.innerWebLineWidth = 1.0;
        _radarChartView.webColor = UIColor.lightGrayColor;
        _radarChartView.innerWebColor = RRBaseColor;
        _radarChartView.webAlpha = 1.0;
        
        ChartXAxis *xAxis = _radarChartView.xAxis;
        xAxis.labelFont = [UIFont fontWithName:@"HelveticaNeue-Light" size:9.f];
        xAxis.xOffset = 0.0;
        xAxis.yOffset = 0.0;
        xAxis.valueFormatter = self;
        xAxis.labelTextColor = DSHexColor(@"#000000");
        xAxis.labelRotationAngle = -30;
        
        ChartYAxis *yAxis = _radarChartView.yAxis;
        yAxis.labelFont = [UIFont fontWithName:@"HelveticaNeue-Light" size:9.f];
        yAxis.labelCount = 6;
        yAxis.axisMinimum = 0.0;
        yAxis.axisMaximum = 80.0;
        yAxis.drawLabelsEnabled = NO;
        
        ChartLegend *l = _radarChartView.legend;
        l.horizontalAlignment = ChartLegendHorizontalAlignmentCenter;
        l.verticalAlignment = ChartLegendVerticalAlignmentCenter;
        l.orientation = ChartLegendOrientationVertical;
        l.drawInside = NO;
        l.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:10.f];
        l.xEntrySpace = 7.0;
        l.yEntrySpace = 5.0;
        l.textColor = DSHexColor(@"#f0f0f0");
        
        [self updateRadarChartData];
        _radarChartView.transform = CGAffineTransformMakeRotation(M_PI/6);
        [_radarChartView animateWithXAxisDuration:1.4 yAxisDuration:1.4 easingOption:ChartEasingOptionEaseOutBack];
        
    }
    //给每个坐标加logo图片，每个坐标差60度
    for (NSInteger i = 0; i < _xAxisDatas.count; i++) {
        // dist 为半径，angle 为角度，不需要转换，直接传入多少度数即可
        CGPoint imagePos = [_radarChartView getPositionWithCenter:_radarChartView.center dist:150*SPScaleNumber angle:60*i];
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(imagePos.x, imagePos.y, 30*SPScaleNumber, 30*SPScaleNumber)];
        imageView.image = [UIImage imageNamed:_xAxisDatas[i]];
        [self.contentView addSubview:imageView];
    }
    
}

- (void)createaLineChartUI {
    _xAxisDatas = @[@"2017年",@"2018年",@"2019年",@"2020年",@"2021年"];
    [self createSameUI];
    if (!_lineChartView) {
        _lineChartView = [[LineChartView alloc]initWithFrame:CGRectMake(0, 91*SPScaleNumber+20*SPScaleNumber, RRScreenWith, 400*SPScaleNumber)];
        [self.contentView addSubview:_lineChartView];
        _lineChartView.delegate = self;
        
        _lineChartView.chartDescription.enabled = NO;
        
        _lineChartView.dragEnabled = YES;
        [_lineChartView setScaleEnabled:YES];
        _lineChartView.pinchZoomEnabled = YES;
        _lineChartView.drawGridBackgroundEnabled = NO;
        //x 坐标
        ChartXAxis *xAxis = _lineChartView.xAxis;
        xAxis.labelPosition = XAxisLabelPositionBottom;
        xAxis.labelFont = [UIFont systemFontOfSize:10.f];
        xAxis.drawGridLinesEnabled = NO;
        xAxis.valueFormatter = self;
        // y坐标
        ChartYAxis *leftAxis = _lineChartView.leftAxis;
        [leftAxis removeAllLimitLines];
        leftAxis.axisMaximum = 200.0;
        leftAxis.axisMinimum = 0.0;
        leftAxis.gridLineDashLengths = @[@5.f, @5.f];
        leftAxis.drawZeroLineEnabled = NO;
        leftAxis.drawLimitLinesBehindDataEnabled = YES;
        
        _lineChartView.rightAxis.enabled = NO;
        _lineChartView.legend.form = ChartLegendFormLine;
        _lineChartView.legend.position = ChartLegendPositionAboveChartRight;
        _lineChartView.legend.form = ChartLegendFormSquare;
        _lineChartView.legend.formSize = 9.0;
        _lineChartView.legend.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:11.f];
        _lineChartView.legend.xEntrySpace = 4.0;
        _lineChartView.xAxis.granularity = 1;
        
        [_lineChartView animateWithXAxisDuration:2.5];
        [self setLineDataCount:10 range:10];
    }
    
}

- (void)didUpdateBMKUserLocation:(BMKUserLocation *)userLocation{
    _mapView.centerCoordinate = userLocation.location.coordinate;
    _mapView.showsUserLocation = YES;//显示定位图层
    [_mapView updateLocationData:userLocation];
    _mapView.userTrackingMode = BMKUserTrackingModeHeading;
    
}
#pragma -mark 雷达图的方法
- (void)updateRadarChartData {
    [self setRadarChartData];
}

- (void)setRadarChartData {
    double mult = 80;
    double min = 20;
    int cnt = 6;
    
    NSMutableArray *entries1 = [[NSMutableArray alloc] init];
    NSMutableArray *entries2 = [[NSMutableArray alloc] init];
    
    // NOTE: The order of the entries when being added to the entries array determines their position around the center of the chart.
    for (int i = 0; i < cnt; i++) {
        RadarChartDataEntry *entry1 = [[RadarChartDataEntry alloc] initWithValue:(arc4random_uniform(mult) + min)];
        [entries1 addObject:entry1];
        [entries2 addObject:[[RadarChartDataEntry alloc] initWithValue:(arc4random_uniform(mult) + min)]];
    }
    RadarChartDataSet *set1 = [[RadarChartDataSet alloc] initWithValues:entries1 label:@""];
    [set1 setColor:RRBaseColor alpha:1.0];
    set1.fillColor = RRBaseColor;
    set1.drawFilledEnabled = YES;
    set1.fillAlpha = 0.7;
    set1.lineWidth = 2.0;
    set1.drawHighlightCircleEnabled = YES;
    [set1 setDrawHighlightIndicators:NO];
    
    RadarChartData *data = [[RadarChartData alloc] initWithDataSets:@[set1]];
    [data setValueFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:8.f]];
    [data setDrawValues:NO];
    data.valueTextColor = UIColor.whiteColor;
    
    _radarChartView.data = data;
    
}
#pragma mark - radarChartViewDelegate
- (void)chartValueSelected:(ChartViewBase * __nonnull)radarChartView entry:(ChartDataEntry * __nonnull)entry highlight:(ChartHighlight * __nonnull)highlight
{
    NSLog(@"chartValueSelected");
}

- (void)chartValueNothingSelected:(ChartViewBase * __nonnull)radarChartView
{
    NSLog(@"chartValueNothingSelected");
}
- (NSString * _Nonnull)stringForValue:(double)value axis:(ChartAxisBase * _Nullable)axis {
    if (_xAxisDatas) {
        NSInteger index = (NSInteger )value;
        return  [_xAxisDatas objectOrNilAtIndex:index];
    }else
        return @"到位资金";
}

- (void)setData:(NSDictionary *)data {
    
}
@end
