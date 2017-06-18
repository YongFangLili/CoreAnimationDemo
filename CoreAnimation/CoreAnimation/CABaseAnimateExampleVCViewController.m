//
//  CABaseAnimateExampleVCViewController.m
//  CoreAnimation
//
//  Created by liyongfang on 2017/5/12.
//  Copyright © 2017年 liYongfang. All rights reserved.
//

#import "CABaseAnimateExampleVCViewController.h"
#import "UIView+Utility.h"

@interface CABaseAnimateExampleVCViewController ()

@property (nonatomic, strong) UIView *myView;
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UIView *view1;
@property (nonatomic, strong) UIView *view2;

@end

@implementation CABaseAnimateExampleVCViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.backgroundColor = [UIColor whiteColor];
    self.myView = [[UIView alloc] init];
    self.myView.frame = CGRectMake(100, 200, 100, 100);
    self.myView.backgroundColor = [UIColor grayColor];
    
    self.myView.layer.bounds = CGRectMake(0, 0, 100, 100);
    self.myView.layer.position = CGPointMake(100, 200);
    self.myView.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.myView];
    
    self.imageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:self.imageView];
    
    
    self.myView = [[UIView alloc] initWithFrame:CGRectMake(20, 300, 100, 100)];
    self.myView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:self.myView];
    
    self.view1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
    _view1.backgroundColor = [UIColor yellowColor];
    _view1.alpha = 1.0;
    [self.myView addSubview:_view1];
    
    _view2 = [[UIView alloc] initWithFrame:CGRectMake(50, 50, 50, 50)];
    _view2.backgroundColor = [UIColor blueColor];
//    [self.myView addSubview:_view2];
    // Do any additional setup after loading the view.
}

- (void)viewDidAppear:(BOOL)animated {
    
    [super viewDidAppear:animated];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    switch (self.index) {
        case 0:
            [self horMoveAnimate];
            break;
        case 1:
            [self scaleAnimate];
            break;
        case 2:
            [self rotateAnimate];
            break;
        case 3:
            [self additiveAnimate];
        default:
            break;
    }

}

//y轴上移动视图上升250
- (void)animatedView: (UIView *)view withIndex:(NSInteger)index
{
//    [UIView animateWithDuration: 0.5 delay:(index * 0.5) options: UIViewAnimationOptionCurveEaseInOut animations: ^{
//        CGPoint center = view.center;
//        center.y -= 100;
//        view.center = center;
//    } completion: nil];
    // dampingRatio：速度衰减比例。取值范围0 ~ 1，值越低震动越强
//    velocity：初始化速度，值越高则物品的速度越快
    [UIView animateWithDuration:0.5 delay:(index * 0.05) usingSpringWithDamping:0.3 initialSpringVelocity:1.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        
        CGPoint center = view.center;
        center.y -= 100;
        view.center = center;
        
    } completion:^(BOOL finished) {
        
    }];
}


// 平移动画
- (void)horMoveAnimate {
    
    //    CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"position"];
    //
    //    // 动画持续
    //    anim.duration = 1.5;
    //    anim.delegate  = self;
    //
    //    // position属性值从(50, 80)渐变到(300, 350)
    //    anim.fromValue = [NSValue valueWithCGPoint:CGPointMake(50, 80)];
    ////    anim.toValue = [NSValue valueWithCGPoint:CGPointMake(300, 350)];
    //    anim.byValue = [NSValue valueWithCGPoint:CGPointMake(100, 350)];
    //
    //    // 保持动画执行后的状态 默认情况下，动画执行完毕后，动画会自动从CALayer上移除，CALayer又会回到原来的状态。
    //    anim.removedOnCompletion = NO;
    //    anim.fillMode = kCAFillModeForwards;
    //
    //    // 添加动画对象到图层 @"translate"是给动画对象起个名称，以后可以调用CALayer的removeAnimationForKey:方法根据动画名称停止相应的动画
    //    [self.myView.layer addAnimation:anim forKey:@"translate"];
    
    //方法2
    CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"position.x"];
    //    anim.beginTime = CACurrentMediaTime()  + 1.0;
    anim.duration = 3.0;
    anim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];//[CAMediaTimingFunction functionWithControlPoints:46 :1 :97 :96];//;
    //
    // timeOffet  先从2s以后播放后8秒的动画，之后会回到起点，播放2.0s的动画
    //    anim.timeOffset = 2.0;
    //    anim.autoreverses = YES;
    // 设置0与1都只执行1次， 动画执行的次数
    //    anim.repeatCount = 2;
    CATransform3D form = CATransform3DMakeTranslation(100, 150, 0);
    anim.fromValue = @100;
    
    anim.toValue = @300;
    //    anim.removedOnCompletion = NO;
    //    anim.fillMode = kCAFillModeForwards;
    [self.myView.layer addAnimation:anim forKey:nil];
}



// 缩放动画
- (void)scaleAnimate {
    
    //    CABasicAnimation *anima = [CABasicAnimation animationWithKeyPath:@"bounds"];
    //    anima.toValue = [NSValue valueWithCGRect:CGRectMake(100, 100, 30, 30)];
    //    anima.delegate = self;
    //    anima.removedOnCompletion = NO;
    //    anima.fillMode = kCAFillModeForwards;
    //    anima.duration = 2.0;
    //    [self.myView.layer addAnimation:anima forKey:@"bounds"];
    //
    //    CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"transform"];
    //    anim.duration = 1.5; // 动画持续1.5s
    
    // CALayer的宽度从0.5倍变为2倍
    // CALayer的高度从0.5倍变为1.5倍
    CABasicAnimation *anima = [CABasicAnimation animationWithKeyPath:@"transform"];
    anima.fromValue = [NSValue valueWithCATransform3D:CATransform3DMakeScale(0.5, 0.5, 1)];
    anima.toValue  = [NSValue valueWithCATransform3D:CATransform3DMakeScale(2, 1.5, 1)];
    anima.duration = 2;
    
    [_myView.layer addAnimation:anima forKey:nil];
    
}


// 旋转动画
- (void)rotateAnimate {
    
    CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"transform"];
    anim.duration = 1.5;
    
    // 绕着(0, 0, 1)这个向量轴顺时针旋转45°
    anim.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeRotation( M_PI, 0, 0, 1)];
    [_myView.layer addAnimation:anim forKey:nil];
    
    
}

// additive的使用
- (void)additiveAnimate {

    CABasicAnimation *animate = [CABasicAnimation animation];
    animate.duration = 3;
    animate.keyPath = @"position.y";
    animate.fromValue = @200;
    animate.toValue = @300;
    // NO,坐标Y从200 到300   YES 坐标y从当前的y+200 到y+300
    animate.additive = NO;
    animate.repeatCount = 2;
    // 默认为NO 循环动画时，仍然从其实位置进行   YES 从下一次循环开始，每次结束后，讲从当前的y+200 到y+300开始平移
    animate.cumulative = NO;
    [_myView.layer addAnimation:animate forKey:nil];
}


@end
