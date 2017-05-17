//
//  SPProjectDistributionViewController.m
//  Taurus
//
//  Created by ppan on 2017/5/5.
//  Copyright © 2017年 ppan. All rights reserved.
//

#import "SPProjectDistributionViewController.h"

@interface SPProjectDistributionViewController ()<BMKLocationServiceDelegate,BMKMapViewDelegate>{
      BMKLocationService       *_locationServer;
}

@end

@implementation SPProjectDistributionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"项目分布";
}

- (void)createUI {
    NSString* path = [[NSBundle mainBundle] pathForResource:@"custom_config_0323(黑夜)" ofType:@""];
    [BMKMapView customMapStyle:path];
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
   
}



@end
