
//
//  ViewController+Peek.m
//  ForceTouch
//
//  Created by ak on 2017/3/7.
//  Copyright © 2017年 ak. All rights reserved.
//

#import "ViewController+Peek.h"
#import "TestPeekViewController.h"

@implementation ViewController(Peek)

// If you return nil, a preview presentation will not be performed
- (nullable UIViewController *)previewingContext:(id <UIViewControllerPreviewing>)previewingContext viewControllerForLocation:(CGPoint)location NS_AVAILABLE_IOS(9_0){
    NSLog(@"previewingContext:%@ ForLocation:%@",previewingContext,NSStringFromCGPoint(location));
    
    NSIndexPath* ip =  [self.tb indexPathForRowAtPoint:location];
    
    UITableViewCell* cell = [self.tb cellForRowAtIndexPath:ip];
    
    NSLog(@"用户touch cell 行%ld",(long)ip.row);
    
    TestPeekViewController * vc = [TestPeekViewController new];
    
    
    
    unsigned long idx = ip.row%self->data.count;
    NSDictionary* dic =  self->data[idx];
    
    vc.index=idx;
    
    vc.title=dic[@"title"];
    
    //预览vc视图大小
    vc.preferredContentSize=CGSizeMake([dic[@"width"] floatValue], [dic[@"height"] floatValue]);
    
    //cell.frame以外的区域自动模糊
    previewingContext.sourceRect=cell.frame;
    
    return vc;
    
}
- (void)previewingContext:(id <UIViewControllerPreviewing>)previewingContext commitViewController:(UIViewController *)viewControllerToCommit NS_AVAILABLE_IOS(9_0){
    NSLog(@"viewControllerToCommit");
    //    [self showViewController:viewControllerToCommit sender:self];
    
}

@end
