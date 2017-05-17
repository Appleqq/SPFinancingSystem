//
//  SPFinancingMainCollectionCell.h
//  Taurus
//
//  Created by ppan on 2017/5/3.
//  Copyright © 2017年 ppan. All rights reserved.
//

#import "SPBaseTableViewCell.h"
#import "SPScreeningView.h"
typedef NS_ENUM(NSInteger,SPFinancingCellType){
            FinancingCellMapType,      //地图类型
            FinacingCellRadarChartType,  //雷达图
            FinacingCellLineChartType     //直线图
    
};
@interface SPFinancingMainTableCell : UITableViewCell
@property (nonatomic , strong)NSDictionary   *data;
@property (nonatomic ,strong) UIImageView  *blowupImageIV; /**< 放大*/
@property (nonatomic ,strong) BMKMapView   *mapView;
@property (nonatomic ,strong) UIImageView  *toprightLogoIV;
@property (nonatomic ,assign) BOOL           isShow;/**< 是否显示筛选视图*/
@property (nonatomic , strong) UIView       *toprigthView;/**< 点击右上角的视图*/
@property (nonatomic ,strong) SPScreeningView *screeningIV;/**< 筛选视图*/

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
                     withType:(SPFinancingCellType)type;
- (void)showScreeningView;
- (void)hidderScreeningView;
@end
