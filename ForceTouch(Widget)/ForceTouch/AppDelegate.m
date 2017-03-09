//
//  AppDelegate.m
//  ForceTouch
//
//  Created by ak on 2017/3/6.
//  Copyright © 2017年 ak. All rights reserved.
//

#import "AppDelegate.h"
#import "ShortCutManager.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    self.window.rootViewController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateInitialViewController];
    
    self.window.backgroundColor = [UIColor whiteColor];
    
    [self.window makeKeyAndVisible];

    
    bool bootFromShorcut = [ShortCutManager bootByShortcut:launchOptions];
    
//    [ShortCutManager addShortcut];
    
    //如果是从shortcut启动需返回no，否则将执行performActionForShortcutItem
    return !bootFromShorcut;
}
-(void)applicationDidBecomeActive:(UIApplication *)application{
    NSLog(@"did become active");
}


//ios9 or +
//Handle ShortCut
-(void)application:(UIApplication *)application performActionForShortcutItem:(UIApplicationShortcutItem *)shortcutItem completionHandler:(void (^)(BOOL))completionHandler{
    
    //app在后台时，处理3DTouch点击
    NSLog(@"perform Action %@",shortcutItem);
   
    [ShortCutManager handleShortcut:shortcutItem];
    
    bool result = YES;//YES 处理完成，NO 没处理完成
    completionHandler(result);
} 


-(BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options{
    NSLog(@"openURL:%@ %@",url,options);
    [ShortCutManager alert:@"openURL" msg:url.absoluteString];
    return YES;
    
}

@end
