//
//  ShortCutManager.m
//  ForceTouch
//
//  Created by ak on 2017/3/6.
//  Copyright © 2017年 ak. All rights reserved.
//

#import "ShortCutManager.h"

@implementation ShortCutManager

+(bool)bootByShortcut:(NSDictionary*)launchOptions{
    
    if([UIDevice currentDevice].systemVersion.floatValue>=9){
        
        UIApplicationShortcutItem* shortcut =  launchOptions[UIApplicationLaunchOptionsShortcutItemKey];
        
        
        if (shortcut) {
            NSLog(@"3dTouch启动 shortcut %@",shortcut);
//            [ShortCutManager handleShortcut:shortcut];
           
            [ShortCutManager alert:@"launch" msg:shortcut.localizedTitle];
            
            return YES;
        }
        
        //add shortcut dynamic
//        [ShortCutManager addShortcut];
       
        
    }
    
    return NO;
}

+(void)addShortcut{
    UIApplication* application = [UIApplication sharedApplication];
    NSArray* exitsItems=application.shortcutItems;
    
    
    //动态添加ShortCut
    
    NSLog(@"before:%@",exitsItems);
    if (exitsItems.count==0) {
        
        //如果没有动态shortcut时，添加
        UIApplicationShortcutIcon * icon = [UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypeLove];
        
        UIMutableApplicationShortcutItem* item = [[UIMutableApplicationShortcutItem alloc]initWithType:@"customType1" localizedTitle:@"最爱" localizedSubtitle:@"点击查看我的最爱" icon:icon userInfo:@{@"name":@"myfav"}];
        
        //图片必须为35x35，并在当前bundle中
        UIApplicationShortcutIcon * icon2 = [UIApplicationShortcutIcon iconWithTemplateImageName:@"finger.png"];
        
        UIMutableApplicationShortcutItem* item2 = [[UIMutableApplicationShortcutItem alloc]initWithType:@"customType2" localizedTitle:@"订单" localizedSubtitle:@"点击查看订单" icon:icon2 userInfo:@{@"name":@"order"}];
        application.shortcutItems=@[item,item2];
        
      NSLog(@"after:%@",exitsItems);
    }
}

+(void)removeShortcut{
    [UIApplication sharedApplication].shortcutItems=@[];
}

+(void)handleShortcut:(UIApplicationShortcutItem*)shortcutItem{
    
    [ShortCutManager alert:@"shortcut" msg:shortcutItem.localizedTitle];

}

+(void)alert:(NSString*)title msg:(NSString*)msg{
    UIAlertAction* action  = [UIAlertAction actionWithTitle:msg style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    UIAlertController * alert = [UIAlertController alertControllerWithTitle:title message:@"" preferredStyle:UIAlertControllerStyleActionSheet];
    [alert addAction:action];
    
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alert animated:YES completion:^{
        
    }];
}
@end
