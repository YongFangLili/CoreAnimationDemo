//
//  CATransitionExampleVC.m
//  CoreAnimation
//
//  Created by liyongfang on 2017/5/12.
//  Copyright © 2017年 liYongfang. All rights reserved.
//

#import "CATransitionExampleVC.h"

@interface CATransitionExampleVC ()

@property (nonatomic, strong) UIView *myView;

@property (nonatomic, strong) UIImageView *imageView;

@property (nonatomic, strong) NSArray *animateArray;




@end

static int i = 1;
@implementation CATransitionExampleVC

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.imageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    self.imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%d",1]];
    self.animateArray = @[@"fade",@"push",@"moveIn",@"reveal",
                          @"cube",@"oglFlip",@"suckEffect",
                          @"rippleEffect",@"pageCurl",@"cameraIrisHollowOpen",
                          @"cameraIrisHollowClose"];
    [self.view addSubview:self.imageView];
}



- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    [self transitionAnimations];
}

// 各种转场私有动画展示效果
/*
 fade : 交叉淡化过渡
 push : 新视图把旧视图推出去
 moveIn: 新视图移到旧视图上面
 reveal: 将旧视图移开,显示下面的新视图
 cube : 立方体翻滚效果
 oglFlip : 上下左右翻转效果
 suckEffect : 收缩效果，如一块布被抽走,不支持过渡方向
 rippleEffect: 水滴效果  不支持过渡方向
 pageCurl : 向上翻页效果X
 cameraIrisHollowOpen:相机镜头打开效果,不支持过渡方向
 cameraIrisHollowClose:相机镜头关闭效果 不支持过渡方向
 **/
- (void)transitionAnimations {
    
    i++;
    if (i == self.animateArray.count) {
        i = 0;
    }
    self.imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%d",i]];
    // 添加转场动画
    
    //    kCATransitionFade   交叉淡化过渡
    //    kCATransitionMoveIn 新视图移到旧视图上面
    //    kCATransitionPush   新视图把旧视图推出去
    //    kCATransitionReveal 将旧视图移开,显示下面的新视图
    CATransition * anim = [CATransition animation];

    anim.type = self.animateArray[i];
//    anim.type = kCATransitionPush;
//    kCATransitionFromRight；
//    kCATransitionFromLeft;
//    kCATransitionFromTop;
//    kCATransitionFromBottom
    anim.subtype = kCATransitionFromLeft;
    anim.duration = 1;
    
    // 如果不需要动画执行的整个过程(就是只要动画执行到中间部分就停止),可以指定startProgress(动画开始的进度),endProgress(动画结束的进度)属性.  endProgress > startProgress
    // 动画开始的点
    anim.startProgress = 0;
    anim.endProgress = 0.5;
    
    [self.imageView.layer addAnimation:anim forKey:nil];
    
    
}


@end
