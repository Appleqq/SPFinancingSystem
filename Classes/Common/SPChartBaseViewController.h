//
//  SPPChartBaseViewController.h
//  xietongwork
//
//  Created by ppan on 16/5/14.
//  Copyright © 2016年 shipu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SPChartBaseViewController : UIViewController
@property (nonatomic, assign) BOOL shouldHideData;
@property (nonatomic , strong)NSMutableArray *months;

- (void)handleOption:(NSString *)key forChartView:(ChartViewBase *)chartView;

- (void)updateChartData;

- (void)setupPieChartView:(PieChartView *)chartView;
- (void)setupRadarChartView:(RadarChartView *)chartView;
- (void)setupBarLineChartView:(BarLineChartViewBase *)chartView;
@end
