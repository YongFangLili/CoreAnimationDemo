//
//  MainTabBarVC.m
//  CoreAnimation
//
//  Created by liyongfang on 2017/5/12.
//  Copyright © 2017年 liYongfang. All rights reserved.
//


#import "MainTabBarVC.h"
#import "CABasicAnimateVC.h"
#import "CAKeyframeAnimateVC.h"
#import "CAAnimateGroupVC.h"
#import "CAAnimateGroupNav.h"
#import "CAKeyframeAnimateNAV.h"
#import "CABasicAnimateNav.h"
#import "CATransitionVC.h"
#import "CATransitionNav.h"


@interface MainTabBarVC ()

@end

@implementation MainTabBarVC

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self setUpChildVc];
}

- (void)setUpChildVc {
    
    CABasicAnimateVC *baseVC = [[CABasicAnimateVC alloc] init];
    baseVC.title = @"CABase";
    baseVC.view.backgroundColor = [UIColor whiteColor];
    CABasicAnimateNav *baseNAV = [[CABasicAnimateNav alloc] initWithRootViewController:baseVC];
    [self addChildViewController:baseNAV];
    
    CAKeyframeAnimateVC *keyVC = [[CAKeyframeAnimateVC alloc] init];
    keyVC.title = @"CAKeyframe";
    keyVC.view.backgroundColor = [UIColor whiteColor];
    CAKeyframeAnimateNAV *keyNAV = [[CAKeyframeAnimateNAV alloc] initWithRootViewController:keyVC];
    [self addChildViewController:keyNAV];
    
    
    CAAnimateGroupVC *groupVC = [[CAAnimateGroupVC alloc] init];
    groupVC.title = @"CAAGroup";
    CAAnimateGroupNav *groupNAV = [[CAAnimateGroupNav alloc] initWithRootViewController:groupVC];
    groupVC.view.backgroundColor = [UIColor whiteColor];
    [self addChildViewController:groupNAV];
    
    CATransitionVC *trasiVC = [[CATransitionVC alloc] init];
    trasiVC.title = @"CATransition";
    trasiVC.view.backgroundColor = [UIColor whiteColor];
    CATransitionNav *trasiNav = [[CATransitionNav alloc] initWithRootViewController:trasiVC];
    [self addChildViewController:trasiNav];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
