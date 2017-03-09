//
//  ShortCutManager.h
//  ForceTouch
//
//  Created by ak on 2017/3/6.
//  Copyright © 2017年 ak. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ShortCutManager : NSObject

//boot app by 3d touch on home screen
//YES shortcut启动
//NO  非shortcut启动
//如果是从shortcut  app启动方法didFinishLaunchingWithOptions需返回no，否则将执行performActionForShortcutItem
+(bool)bootByShortcut:(NSDictionary*)launchOptions;


//dynamic add shortcut
//在info.plist基础上添加shortcut
+(void)addShortcut;

//删除shortcut  剩下info.plist的shortcut
+(void)removeShortcut;

//handle shortcut when user tap 3d touch on home screen
+(void)handleShortcut:(UIApplicationShortcutItem*)shortcutItem;

+(void)alert:(NSString*)title msg:(NSString*)msg;



@end
