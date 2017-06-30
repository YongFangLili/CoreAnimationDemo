//
//  UIViewAnimateExample.m
//  CoreAnimation
//
//  Created by 李永方 on 2017/6/18.
//  Copyright © 2017年 liYongfang. All rights reserved.
//

#import "UIViewAnimateExample.h"
#import "UIView+Utility.h"

@interface UIViewAnimateExample ()

@property (nonatomic, strong) UIView *myView;

@property (nonatomic, strong) UIImageView *planeImage;

@property (nonatomic, strong) NSMutableArray *animateArray;

// view 动画需要的
@property (nonatomic,strong) UIView *view1;
@property (nonatomic, strong) UIView *view2;

@end

@implementation UIViewAnimateExample

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.backgroundColor = [UIColor whiteColor];

    
    self.planeImage = [[UIImageView alloc] initWithFrame:CGRectMake(119, 264, 137, 138)];
    self.planeImage.image = [UIImage imageNamed:@"plane"];
    [self.view addSubview:self.planeImage];
    
    
    _myView = [[UIView alloc] initWithFrame:CGRectMake(20, 300, 100, 100)];
    _myView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:_myView];
    
    _view1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
    _view1.backgroundColor = [UIColor yellowColor];
    _view2 = [[UIView alloc] initWithFrame:CGRectMake(50, 50, 50, 50)];
    _view2.backgroundColor = [UIColor blueColor];
    
    [self.myView addSubview:self.view1];
    [self.myView addSubview:self.view2];
    
    [self hideViews];
}
- (void)viewDidAppear:(BOOL)animated {
    
    [super viewDidAppear:animated];
}

- (void)hideViews {

    switch (self.index) {
        case 0:
            self.planeImage.hidden = YES;
            break;
        case 1:
            self.planeImage.hidden = YES;
            self.myView.hidden = YES;
            break;
        case 2:
            self.planeImage.hidden = YES;
            break;
        case 3:
            self.myView.hidden = YES;
            
        default:
            break;
    }
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    UITouch *touchView = touches.anyObject;
    
    switch (self.index) {
        case 0:
            [self UIViewAnimateExample];
            break;
        case 1:
            [self UIViewBlockAnimateExample];
            break;
        case 2:
            [self UIViewAnimateTransitonWithView:touchView.view];
            break;
        case 3:
            [self UIViewKeyAnimation];
            
            
        default:
            break;
    }
    
}

#pragma mark - 基本动画
- (void)UIViewAnimateExample {
    
    //设置动画
    [UIView beginAnimations:@"animationID" context:NULL];
    // 动画代理
    [UIView setAnimationDelegate:self];
    // 动画时长
    [UIView setAnimationDuration:1];
    // 动画的速度
    [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
    // 是否反向
    [UIView setAnimationRepeatAutoreverses:YES];
    // 动画的回调代理，可以回调所设置的方法 默认为nil
    [UIView setAnimationDelegate:self];
    // 开始动画事件回调
    [UIView setAnimationWillStartSelector:@selector(willStartAnimate)];
    // 动画停止事件回调
    [UIView setAnimationDidStopSelector:@selector(didStopAnimate)];
    // 动画重复次数
    [UIView setAnimationRepeatCount:3];
    // 此处默认为NO，设置为YES 感觉没有多大的区别
    [UIView setAnimationBeginsFromCurrentState:YES];
    // 动画效果是否可用
    [UIView setAnimationsEnabled:YES];
    //切记：下面的三句和上边的两句位置千万不能搞错啦
    CGRect frame = self.myView.frame;
    frame = CGRectMake(200, 300, 100, 100);
    self.myView.frame = frame;

    // 当设置多个transForm时，只有一个有效
    self.myView.transform = CGAffineTransformMakeScale(0.7, 1.2);
    self.myView.transform = CGAffineTransformMakeRotation(M_PI / 2);
    self.myView.alpha = 0.1;
    // 动画提交
    [UIView commitAnimations];
}

#pragma mark -自定义动画回调方法
- (void)willStartAnimate {
    NSLog(@"开始动画");
//    self.myView.transform = CGAffineTransformMakeScale(0.7, 1.2);
}

- (void)didStopAnimate {
    NSLog(@"动画停止");
    // 重置位置
    self.myView.alpha = 1.0;
    self.myView.transform = CGAffineTransformIdentity;
}

- (void)transFormAnimate {
    
    //设置动画
    [UIView beginAnimations:@"animationID" context:NULL];
    // 设置代理
    [UIView setAnimationDelegate:self];
    
    //    self.myView.transform = CGAffineTransformMakeTranslation(0.7, 1.2);
    // CGAffineTransformEqualToTransform 判断两个转换是否是一致的
    //    self.myView.transform =CGAffineTransformScale(self.myView.transform, 0.5, 0.5);
    //    self.myView.layer.transform= CATransform3DMakeScale(0.4, 0.5, 0.5);
    
    NSLog(@"%@",NSStringFromCGAffineTransform(self.myView.transform));
}



#pragma mark -block动画
- (void)UIViewBlockAnimateExample {
    
    // 苹果推荐使用block动画，使用block动画
    //    UIViewAnimationOptionCurveEaseInOut   //先加速后减速，默认
    //    UIViewAnimationOptionCurveEaseIn      //由慢到快
    //    UIViewAnimationOptionCurveEaseOut     //由快到慢
    //    UIViewAnimationOptionCurveLinear      //匀速
    // 1、常用的基本动画
    //    [UIView animateWithDuration:(0.3) animations:^{
    //
    //        CGRect frame = self.myView.frame;
    //        frame = CGRectMake(200, 300, 100, 100);
    //        self.myView.frame = frame;
    //    }];
    //
    // 2.带有动画的完成效果
    //    [UIView animateWithDuration:0.3 animations:^{
    //
    //        self.myView.alpha = 0.2;
    //    } completion:^(BOOL finished) {
    //        // 处理完成后的结果
    //
    //       self.myView.alpha = 1.0;
    //    }];
    
    UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(100, 400, 40, 40)];
    UIView *view2 = [[UIView alloc] initWithFrame:CGRectMake(140 + 5, 400, 40, 40)];
    UIView *view3 = [[UIView alloc] initWithFrame:CGRectMake(100 + 80 + 10, 400, 40, 40)];
    UIView *view4 = [[UIView alloc] initWithFrame:CGRectMake(100 + 120 + 15, 400, 40, 40)];
    view1.backgroundColor = [UIColor orangeColor];
    view2.backgroundColor = [UIColor orangeColor];
    view3.backgroundColor = [UIColor orangeColor];
    view4.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:view1];
    [self.view addSubview:view2];
    [self.view addSubview:view3];
    [self.view addSubview:view4];
    
    [self animatedView:view1 withIndex:0];
    [self animatedView:view2 withIndex:1];
    [self animatedView:view3 withIndex:2];
    [self animatedView:view4 withIndex:3];
}

//y轴上移动视图上升250
- (void)animatedView: (UIView *)view withIndex:(NSInteger)index {
    
    // 1.delay 延迟时间
    // 2、options 动画速度快慢
//    [UIView animateWithDuration: 0.5 delay:(index * 0.5) options: UIViewAnimationOptionCurveEaseInOut animations: ^{
//        
//        CGPoint center = view.center;
//        center.y -= 100;
//        view.center = center;
//    } completion: nil];
    
    
    // 1、dampingRatio：速度衰减比例。取值范围0 ~ 1，值越低震动越强
    //  2、velocity：初始化速度，值越高则物品的速度越快
    [UIView animateWithDuration:0.5 delay:(index * 0.05) usingSpringWithDamping:0.3 initialSpringVelocity:1.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        
        CGPoint center = view.center;
        center.y -= 100;
        view.center = center;
        
    } completion:^(BOOL finished) {
        
    }];
}

// 过渡动画
- (void)UIViewAnimateTransitonWithView:(UIView *)view {
    
    // 1.transitionWithView
    //    UIViewAnimationOptionTransitionNone            = 0 << 20, // default
    //    UIViewAnimationOptionTransitionFlipFromLeft  从左往右翻转  = 1 << 20,
    //    UIViewAnimationOptionTransitionFlipFromRight 从右往左翻转  = 2 << 20,
    //    UIViewAnimationOptionTransitionCurlUp        从下往上卷    = 3 << 20,
    //    UIViewAnimationOptionTransitionCurlDown      从上往下卷    = 4 << 20,
    //    UIViewAnimationOptionTransitionCrossDissolve  转场交叉消失 = 5 << 20,
    //    UIViewAnimationOptionTransitionFlipFromTop    从上翻转 = 6 << 20,
    //    UIViewAnimationOptionTransitionFlipFromBottom  从下翻转= 7 << 20,
    [UIView transitionWithView:view duration:1.5 options:UIViewAnimationOptionTransitionFlipFromRight animations:^{
        
//        self.view2.alpha = 0.1;
    } completion:^(BOOL finished) {

    }];
    
    // 2.transitionFromView
    // 注意前提之前的View一定没有被加到父View中  frowFrame
    // toView added to fromView.superview, fromView removed from its superview
//    UIView *toView = [[UIView alloc] initWithFrame:CGRectMake(50, 0, 50, 50)];
//    toView.backgroundColor = [UIColor purpleColor];
//    [UIView transitionFromView:self.view1 toView:toView duration:3 options:UIViewAnimationOptionTransitionNone completion:nil];
    
    
    // 3.系统动画，删除 view 动画 performSystemAnimation
//    [UIView performSystemAnimation:UISystemAnimationDelete onViews:@[self.view1,self.view2] options:UIViewAnimationOptionTransitionCurlUp animations:^{
//        
//    } completion:nil];
}

#pragma mark - 关键帧动画
- (void)UIViewKeyAnimation {

    CGPoint originalCenter = self.planeImage.center;
    
    [UIView animateKeyframesWithDuration:1.5 delay:0 options:UIViewKeyframeAnimationOptionRepeat animations:^{
        
        [UIView addKeyframeWithRelativeStartTime:0.0 relativeDuration:0.25 animations:^{
           
            self.planeImage.centerX += 80.0;
            self.planeImage.centerY -= 10.0;
        }];

        [UIView addKeyframeWithRelativeStartTime:0.1 relativeDuration:0.4 animations:^{
            
            self.planeImage.transform = CGAffineTransformMakeRotation(-M_PI_4/2);
        }];

        [UIView addKeyframeWithRelativeStartTime:0.25 relativeDuration:0.25 animations:^{
            
            self.planeImage.centerX += 100.0;
            self.planeImage.centerY -= 50.0;
            self.planeImage.alpha = 0.0;
        }];
        
        [UIView addKeyframeWithRelativeStartTime:0.51 relativeDuration:0.01 animations:^{
            self.planeImage.transform = CGAffineTransformIdentity;
            self.planeImage.center = CGPointMake(0.0, originalCenter.y);
        }];

        [UIView addKeyframeWithRelativeStartTime:0.55 relativeDuration:0.45 animations:^{
            self.planeImage.alpha = 1.0;
            self.planeImage.center = originalCenter;
        }];
        
    } completion:^(BOOL finished) {
        
    }];

}



// puper

- (NSMutableArray *)animateArray {
    
    if (!_animateArray) {
        _animateArray = [NSMutableArray array];
    }
    
    return _animateArray;
}


@end
