//
//  SPPChartBaseViewController.m
//  xietongwork
//
//  Created by ppan on 16/5/14.
//  Copyright © 2016年 shipu. All rights reserved.
//

#import "SPChartBaseViewController.h"

@interface SPChartBaseViewController ()

@end

@implementation SPChartBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImageView *imageIV = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 28*SPScaleNumber, 25 *SPScaleNumber)];
    imageIV.image = [UIImage imageNamed:@"ic_back_white"];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc]initWithCustomView:imageIV];
    [imageIV ds_tappedWithBlock:^{
        [self.navigationController popViewControllerAnimated:YES];
    }];
    self.tabBarController.navigationItem.leftBarButtonItem = backItem;
//    self.navigationController.navigationItem.leftBarButtonItem = [self itemWithImage:[UIImage imageNamed:@"ic_back_white"] title:nil tapBlock:^{
//        [self.navigationController popViewControllerAnimated:YES];
//    }];
}
#pragma mark - Common option actions
    
- (void)handleOption:(NSString *)key forChartView:(ChartViewBase *)chartView
    {
        if ([key isEqualToString:@"toggleValues"])
        {
            for (id<IChartDataSet> set in chartView.data.dataSets)
            {
                set.drawValuesEnabled = !set.isDrawValuesEnabled;
            }
            
            [chartView setNeedsDisplay];
        }
        
        if ([key isEqualToString:@"toggleHighlight"])
        {
            chartView.data.highlightEnabled = !chartView.data.isHighlightEnabled;
            [chartView setNeedsDisplay];
        }
        
        if ([key isEqualToString:@"animateX"])
        {
            [chartView animateWithXAxisDuration:3.0];
        }
        
        if ([key isEqualToString:@"animateY"])
        {
            [chartView animateWithYAxisDuration:3.0];
        }
        
        if ([key isEqualToString:@"animateXY"])
        {
            [chartView animateWithXAxisDuration:3.0 yAxisDuration:3.0];
        }
        
        if ([key isEqualToString:@"saveToGallery"])
        {
            UIImageWriteToSavedPhotosAlbum([chartView getChartImageWithTransparent:NO], nil, nil, nil);
        }
        
        if ([key isEqualToString:@"togglePinchZoom"])
        {
            BarLineChartViewBase *barLineChart = (BarLineChartViewBase *)chartView;
            barLineChart.pinchZoomEnabled = !barLineChart.isPinchZoomEnabled;
            
            [chartView setNeedsDisplay];
        }
        
        if ([key isEqualToString:@"toggleAutoScaleMinMax"])
        {
            BarLineChartViewBase *barLineChart = (BarLineChartViewBase *)chartView;
            barLineChart.autoScaleMinMaxEnabled = !barLineChart.isAutoScaleMinMaxEnabled;
            
            [chartView notifyDataSetChanged];
        }
        
        if ([key isEqualToString:@"toggleData"])
        {
            _shouldHideData = !_shouldHideData;
            [self updateChartData];
        }
        
        if ([key isEqualToString:@"toggleBarBorders"])
        {
            for (id<IBarChartDataSet, NSObject> set in chartView.data.dataSets)
            {
                if ([set conformsToProtocol:@protocol(IBarChartDataSet)])
                {
                    set.barBorderWidth = set.barBorderWidth == 1.0 ? 0.0 : 1.0;
                }
            }
            
            [chartView setNeedsDisplay];
        }
    }

#pragma mark - Stubs for chart view

- (void)updateChartData
{
    // Override this
}

- (void)setupPieChartView:(PieChartView *)chartView
{
    chartView.usePercentValuesEnabled = YES;
    chartView.drawSlicesUnderHoleEnabled = NO;
    chartView.drawSliceTextEnabled = YES;
    chartView.holeRadiusPercent = 0.;
    chartView.transparentCircleRadiusPercent = 0.01;
    chartView.descriptionText = @"";
    [chartView setExtraOffsetsWithLeft:5.f top:10.f right:5.f bottom:5.f];
    
    chartView.drawCenterTextEnabled = YES;
    
    NSMutableParagraphStyle *paragraphStyle = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
    paragraphStyle.lineBreakMode = NSLineBreakByTruncatingTail;
    paragraphStyle.alignment = NSTextAlignmentCenter;
    
    NSMutableAttributedString *centerText = [[NSMutableAttributedString alloc] initWithString:@"iOS Charts\nby Daniel Cohen Gindi"];
    [centerText setAttributes:@{
                                NSFontAttributeName: [UIFont fontWithName:@"HelveticaNeue-Light" size:12.f],
                                NSParagraphStyleAttributeName: paragraphStyle
                                } range:NSMakeRange(0, centerText.length)];
    [centerText addAttributes:@{
                                NSFontAttributeName: [UIFont fontWithName:@"HelveticaNeue-Light" size:10.f],
                                NSForegroundColorAttributeName: UIColor.grayColor
                                } range:NSMakeRange(10, centerText.length - 10)];
    [centerText addAttributes:@{
                                NSFontAttributeName: [UIFont fontWithName:@"HelveticaNeue-LightItalic" size:10.f],
                                NSForegroundColorAttributeName: [UIColor colorWithRed:51/255.f green:181/255.f blue:229/255.f alpha:1.f]
                                } range:NSMakeRange(centerText.length - 19, 19)];
    chartView.centerAttributedText = centerText;
    
    chartView.drawHoleEnabled = YES;
    chartView.rotationAngle = 0.0;
    chartView.rotationEnabled = YES;
    chartView.highlightPerTapEnabled = YES;
    
    ChartLegend *l = chartView.legend;
    l.position = ChartLegendPositionRightOfChart;
    l.xEntrySpace = 7.0;
    l.yEntrySpace = 0.0;
    l.yOffset = 0.0;
}

- (void)setupRadarChartView:(RadarChartView *)chartView
    {
        chartView.chartDescription.enabled = NO;
    }
    
- (void)setupBarLineChartView:(BarLineChartViewBase *)chartView
    {
        chartView.chartDescription.enabled = NO;
        chartView.drawGridBackgroundEnabled = NO;
        chartView.dragEnabled = YES;
        [chartView setScaleEnabled:YES];
        chartView.pinchZoomEnabled = NO;
        
    }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end
