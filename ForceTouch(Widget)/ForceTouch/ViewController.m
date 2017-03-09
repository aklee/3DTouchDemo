//
//  ViewController.m
//  ForceTouch
//
//  Created by ak on 2017/3/6.
//  Copyright © 2017年 ak. All rights reserved.
//

#import "ViewController.h"
#import "ShortCutManager.h"
#import "ViewController+Peek.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    
    NSMutableArray* titles;
    NSMutableArray* vcNames;
    
    
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    titles = @[].mutableCopy;
    vcNames = @[].mutableCopy;
    
    //设置peek vc的宽高,可自定义
    data  = @[
              @{
                  @"title":@"短内容Peek",
                  @"width":@"0",
                  @"height":@"160"
                  },
              @{
                  @"title":@"中长内容Peek",
                  @"width":@"0",
                  @"height":@"320"
                  },
              @{
                  @"title":@"全屏内容Peek",
                  @"width":@"0",
                  @"height":@"0"//
                  }
              
              ];
    
    UITableView* tb =  [[UITableView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:tb];
    tb.dataSource=self;
    tb.delegate=self;
    self.tb = tb ;
    
    [self addCell:@"添加shortcut" des:@""];
    [self addCell:@"移除shortcut" des:@""];
    
    
    if (self.traitCollection.forceTouchCapability==UIForceTouchCapabilityAvailable) {
        
        [self registerForPreviewingWithDelegate:self  sourceView:self.tb];
    }else{
        NSLog(@"未打开3DTouch");
        [ShortCutManager alert:@"tip" msg:@"未打开3DTouch"];
    }
    
    [self addCell:@"重按Cell 测试peek" des:@""];
}

-(void)addCell:(NSString*)title des:(NSString*)clsName{
    [titles addObject:title];
    [vcNames addObject:clsName];
}

//MARK:TB
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return titles.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell*cell= [tableView dequeueReusableCellWithIdentifier:@"maincell"];
    if (!cell) {
        cell=  [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"maincell"];
        cell.backgroundColor=[UIColor clearColor];
    }
    
    NSString*title = titles[indexPath.row];
    
    cell.textLabel.text=title;
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
//    UIViewController*vc= [[NSClassFromString(vcNames[indexPath.row]) alloc]init];
//    
//    [self.navigationController pushViewController:vc animated:YES];

    
    switch (indexPath.row) {
        case 0:
              [ShortCutManager addShortcut];
            break;
        case 1:
              [ShortCutManager removeShortcut];
            break;
        case 2:
            
            break;
            
        default:
            break;
    }
    
}

@end
