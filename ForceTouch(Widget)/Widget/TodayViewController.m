//
//  TodayViewController.m
//  Widget
//
//  Created by ak on 2017/3/8.
//  Copyright © 2017年 ak. All rights reserved.
//

#import "TodayViewController.h"
#import <NotificationCenter/NotificationCenter.h>

@interface TodayViewController () <NCWidgetProviding>
- (IBAction)btnClick:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *dataLb;

@end

@implementation TodayViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //设置最大高度可变  可折叠
    self.extensionContext.widgetLargestAvailableDisplayMode = NCWidgetDisplayModeExpanded;
    
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(willEnterForeground:) name:NSExtensionHostWillEnterForegroundNotification object:nil];
    
}


-(void)willEnterForeground:(NSNotification*)note{
    NSLog(@"willEnterForeground");
}

- (void)widgetPerformUpdateWithCompletionHandler:(void (^)(NCUpdateResult))completionHandler {
    // Perform any setup necessary in order to update the view.
    
    // If an error is encountered, use NCUpdateResultFailed
    // If there's no update required, use NCUpdateResultNoData
    // If there's an update, use NCUpdateResultNewData

    completionHandler(NCUpdateResultNewData);
}

// If implemented, called when the active display mode changes.
// The widget may wish to change its preferredContentSize to better accommodate the new display mode.
- (void)widgetActiveDisplayModeDidChange:(NCWidgetDisplayMode)activeDisplayMode withMaximumSize:(CGSize)maxSize NS_AVAILABLE_IOS(10_0){
    NSLog(@"activeDisplayMode:%@ %@",@(activeDisplayMode),NSStringFromCGSize(maxSize));
    if(activeDisplayMode == NCWidgetDisplayModeCompact){
        NSLog(@"折叠");
        self.preferredContentSize = maxSize;
    }
    if(activeDisplayMode ==NCWidgetDisplayModeExpanded){
        NSLog(@"展开");
        //动态设置高度
        self.preferredContentSize = CGSizeMake(0, 200);
    }
}

// Widgets wishing to customize the default margin insets can return their preferred values.
// Widgets that choose not to implement this method will receive the default margin insets.
- (UIEdgeInsets)widgetMarginInsetsForProposedMarginInsets:(UIEdgeInsets)defaultMarginInsets NS_DEPRECATED_IOS(8_0, 10_0, "This method will not be called on widgets linked against iOS versions 10.0 and later."){
    return UIEdgeInsetsZero;
}
- (IBAction)btnClick:(id)sender {
    NSLog(@"按钮点击");
    [self.extensionContext openURL:[NSURL URLWithString:@"aklee://"] completionHandler:^(BOOL success) {
        
    }];
}
@end
