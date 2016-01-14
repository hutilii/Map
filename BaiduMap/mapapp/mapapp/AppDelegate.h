//
//  AppDelegate.h
//  mapapp
//
//  Created by hutilii on 16/1/14.
//  Copyright © 2016年 hutilii. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <BaiduMapAPI_Base/BMKBaseComponent.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate> {
    
    BMKMapManager *_mapManager;
}

@property (strong, nonatomic) UIWindow *window;


@end

