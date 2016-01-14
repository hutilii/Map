//
//  ViewController.m
//  mapapp
//
//  Created by hutilii on 16/1/14.
//  Copyright © 2016年 hutilii. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<BMKMapViewDelegate, BMKLocationServiceDelegate> {
    
    BMKLocationService *_locService;
    BMKMapView *mapView;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    mapView = [[BMKMapView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    self.view = mapView;
    
    //  适配ios9
    if ([[[UIDevice currentDevice] systemVersion] doubleValue] >= 9.0) {
        self.navigationController.navigationBar.translucent = NO;
    }
    _locService = [[BMKLocationService alloc] init];
    
    [self startLocation];
}

- (void)viewWillAppear:(BOOL)animated {
    
    [mapView viewWillAppear];
    mapView.delegate = self;
    _locService.delegate = self;
}

- (void)viewWillDisappear:(BOOL)animated {
    
    [mapView viewWillDisappear];
    //  不用时置为nil
    mapView.delegate = nil;
    _locService.delegate = nil;
}

- (void)startLocation {
    
    [_locService startUserLocationService];
    //  先关闭显示的定位图层
    mapView.showsUserLocation = NO;
    //  设置定位的状态
    mapView.userTrackingMode = BMKUserTrackingModeFollow;
    //  显示定位图层
    mapView.showsUserLocation = YES;
}
/**
 *  在地图View将要启动定位时，调用
 */
- (void)willStartLocatingUser {
    
    NSLog(@"start locate");
}
/**
 *  用户方向更新后调用
 *
 *  @param userLocation 用户的新位置
 */
- (void)didUpdateUserHeading:(BMKUserLocation *)userLocation {
    
    [mapView updateLocationData:userLocation];
    NSLog(@"%@",userLocation.heading);
}

- (void)didUpdateBMKUserLocation:(BMKUserLocation *)userLocation {
    
    [mapView updateLocationData:userLocation];
}
/**
 *在地图View停止定位后，会调用此函数
 */
- (void)didStopLocatingUser {
    
    NSLog(@"stop locate");
}
/**
 *定位失败后，会调用此函数
 *@param error 错误号，参考CLError.h中定义的错误号
 */
- (void)didFailToLocateUserWithError:(NSError *)error {
    
    NSLog(@"failed locate");
}
@end
