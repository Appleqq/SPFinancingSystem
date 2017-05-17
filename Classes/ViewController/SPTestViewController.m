//
//  SPTestViewController.m
//  SPFinancingSystem
//
//  Created by ppan on 2017/5/17.
//  Copyright © 2017年 ppan. All rights reserved.
//

#import "SPTestViewController.h"

@interface SPTestViewController ()<BMKLocationServiceDelegate,BMKMapViewDelegate>{
    BMKLocationService       *_locationServer;
}

@property (nonatomic ,strong) BMKMapView   *mapView;
@end

@implementation SPTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //[self createUI];
    UIView *cententVI = [UIView newAutoLayoutView];
    [self.view addSubview:cententVI];
    [cententVI autoCenterInSuperview];
    [cententVI autoSetDimensionsToSize:CGSizeMake(100, 100)];
    cententVI.backgroundColor = [UIColor grayColor];
    
    _mapView = [BMKMapView newAutoLayoutView];
    [self.view addSubview:_mapView];
    [_mapView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(0, 0, 0, 0)];

}
- (void)createUI {
    
    _mapView = [BMKMapView newAutoLayoutView];
    [self.view addSubview:_mapView];
    [_mapView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
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

- (void)didUpdateBMKUserLocation:(BMKUserLocation *)userLocation{
    _mapView.centerCoordinate = userLocation.location.coordinate;
    _mapView.showsUserLocation = YES;//显示定位图层
    [_mapView updateLocationData:userLocation];
    _mapView.userTrackingMode = BMKUserTrackingModeHeading;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
