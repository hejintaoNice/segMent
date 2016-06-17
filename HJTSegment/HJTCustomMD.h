//
//  HJTCustomMD.h
//  HJTSegment
//
//  Created by celia on 16/6/7.
//  Copyright (c) 2016年 celia. All rights reserved.
//

#ifndef HJTSegment_HJTCustomMD_h
#define HJTSegment_HJTCustomMD_h
#define WS __weak typeof(self) weakSelf = self;
#define SS __strong typeof(self) strongSelf = weakSelf;

#define HEIGHT_HALF(view) view.frame.size.height / 2;

#define GPSET(obj,key) [[NSUserDefaults standardUserDefaults] setObject:obj forKey:key];\
[[NSUserDefaults standardUserDefaults] synchronize];
#define GPGET(key) [[NSUserDefaults standardUserDefaults] objectForKey:key]
#define VerSion [[[UIDevice currentDevice] systemVersion] floatValue]
#define ScreenWidth [[UIScreen mainScreen] bounds].size.width
#define ScreenHeight [[UIScreen mainScreen] bounds].size.height

#endif
