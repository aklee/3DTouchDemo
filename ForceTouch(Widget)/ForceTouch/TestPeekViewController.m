//
//  TestPeekViewController.m
//  ForceTouch
//
//  Created by ak on 2017/3/7.
//  Copyright © 2017年 ak. All rights reserved.
//

#import "TestPeekViewController.h"

@interface TestPeekViewController ()
{
    UILabel* label ;
}
@end

@implementation TestPeekViewController
-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    label.center=self.view.center;
}


//-(UIViewController *)targetViewControllerForAction:(SEL)action sender:(id)sender{
//    
//}


- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor=[UIColor whiteColor];
    
    label=({
        UILabel * lb = [UILabel new];
        lb.textColor=[UIColor purpleColor];
        lb.text=self.title;
        [lb sizeToFit];
        [self.view addSubview:lb];
        lb;
    });
    
}
-(NSArray<id<UIPreviewActionItem>> *)previewActionItems{
    
    UIPreviewAction* item1_0 = [UIPreviewAction actionWithTitle:@"标为未读" style:UIPreviewActionStyleDefault handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        NSLog(@"标为未读");
    }];
    
    UIPreviewAction* item1_1 = [UIPreviewAction actionWithTitle:@"取消免打扰" style:UIPreviewActionStyleDefault handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        NSLog(@"取消免打扰");
    }];
    
    
    UIPreviewAction * item2 = [UIPreviewAction actionWithTitle:@"选择" style:UIPreviewActionStyleSelected handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        NSLog(@"Selected");
    }];
    
    
    UIPreviewAction * item3 = [UIPreviewAction actionWithTitle:@"Cancle" style:UIPreviewActionStyleDestructive handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        NSLog(@"Cancle");
    }];
    
    
    UIPreviewAction * item4 = [UIPreviewAction actionWithTitle:@"更多的选项..." style:UIPreviewActionStyleDestructive handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        NSLog(@"更多的选项...");
    }];
    
    UIPreviewActionGroup * group = [UIPreviewActionGroup actionGroupWithTitle:@"更多" style:UIPreviewActionStyleDefault actions:@[item4]];
    
    
    return @[item1_0,item1_1,item2,item3,group];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
