//
//  ViewController.m
//  CALayerDemo
//
//  Created by 李永方 on 2017/5/1.
//  Copyright © 2017年 ;. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<CAAnimationDelegate>

@property (nonatomic, strong) UIView *myView;

@property (nonatomic, strong) UIImageView *imageView;

@end

static int i = 1;
@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.myView = [[UIView alloc] init];
    self.myView.frame = CGRectMake(100, 100, 100, 100);
    self.myView.backgroundColor = [UIColor grayColor];
    self.myView.layer.position = CGPointMake(100, 100);
        self.myView.layer.bounds = CGRectMake(0, 0, 100, 100);
    self.myView.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.myView];
    
    self.imageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:self.imageView];
    //    [self layerDemo];
    
    // Do any additional setup after loading the view, typically from a nib.
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
//    [self layerDemo];
    // 平移
    [self horMoveAnimate];
    
    // 缩放
//    [self scaleAnimate];
    // 旋转
//    [self rotateAnimate];
    // 关键帧动画
//    [self keyAnimation];
    // 转场动画
//    [self transitonAnimationn];
//    [self transitionAnimations];
    // 动画组
//    [self animationGroup];
}

- (void)layerDemo {
    
    UIButton *button = [[UIButton alloc] init];
    button.frame = CGRectMake(100, 100, 100, 100);
    button.backgroundColor = [UIColor grayColor];
    CALayer *myLayer = [CALayer layer];
    myLayer.bounds =  _myView.bounds;
    
    // 设置层的背景颜色：红色
    myLayer.backgroundColor = [UIColor redColor].CGColor;
    // 指定 layer 上的某个点在什么上面
    myLayer.anchorPoint = CGPointMake(0.5, 0.5);
    // 指定 lay上指定的 anchorPoint的店在 view 的那个位置上
    myLayer.position = CGPointMake(300, 300);
    // 添加视图
    myLayer.beginTime = CACurrentMediaTime() + 10.0;
    myLayer.duration = 2.0;
    [button.layer addSublayer:myLayer];
    
    [self.view addSubview:button];
}


// CABaseView 动画
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
    CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"transform"];
    anim.beginTime = CACurrentMediaTime()  + 1.0;
    anim.duration = 3.0;
    // timeOffet  先从2s以后播放后8秒的动画，之后会回到起点，播放2.0s的动画
//    anim.timeOffset = 2.0;
//    anim.autoreverses = YES;
    // 设置0与1都只执行1次， 动画执行的次数
//    anim.repeatCount = 2;
    CATransform3D form = CATransform3DMakeTranslation(350, 350, 0);
    anim.toValue = [NSValue valueWithCATransform3D:form];
    anim.removedOnCompletion = NO;
    anim.fillMode = kCAFillModeForwards;
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



// 关键帧动画
- (void)keyAnimation {

    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    animation.keyPath  = @"position";
    animation.values = @[[NSValue valueWithCGPoint:CGPointMake(100, 200)],
                         [NSValue valueWithCGPoint:CGPointMake(200, 300)],
                         [NSValue valueWithCGPoint:CGPointMake(300, 400)]];
    animation.keyTimes = @[@(0),@(0.5),@(1)];
    animation.duration = 2;

    
//    // 1. 动画
//    CAKeyframeAnimation *anim = [CAKeyframeAnimation animationWithKeyPath:@"transform.rotation"];
//    
//    // 2. 设置角度
//    CGFloat angle = M_PI_4 / 10;
//    
//    anim.values = @[@(-angle), @(angle), @(-angle)];
//    
//    anim.duration = 0.2f;
//    anim.repeatCount = HUGE_VALF;
    [_myView.layer addAnimation:animation forKey:nil];
}



// 转场动画
-(void)transitonAnimationn {
    
    //定义个转场动画
    CATransition *animation = [CATransition animation];
    //转场动画持续时间
    animation.duration = 2.0f;
    //计时函数，从头到尾的流畅度？？？
    /*
     速度控制函数(CAMediaTimingFunction)
     kCAMediaTimingFunctionLinear（线性）：匀速，给你一个相对静态的感觉
     kCAMediaTimingFunctionEaseIn（渐进）：动画缓慢进入，然后加速离开
     kCAMediaTimingFunctionEaseOut（渐出）：动画全速进入，然后减速的到达目的地
     kCAMediaTimingFunctionEaseInEaseOut（渐进渐出）：动画缓慢的进入，中间加速，然后减速的到达目的地。这个是默认的动画行为。
     **/
    animation.timingFunction= [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    //转场动画类型
//    animation.type = kCATransitionPush;
    animation.type = @"rippleEffect";
    //转场动画将去的方向
    animation.subtype = kCATransitionFromLeft;
    [_myView.layer addAnimation:animation forKey:nil];

}

// 各种转场动画展示效果
- (void)transitionAnimations {
    
    i++;
    self.imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%d",i]];
    // 添加转场动画
    CATransition * anim = [CATransition animation];
    anim.type = @"rippleEffect";
    anim.duration = 1;
    anim.startProgress = 0.5;
    
    [self.imageView.layer addAnimation:anim forKey:nil];
    
    if (i == 3) {
        i = 0;
    }
}

- (void)animationGroup {
    
    // 添加基础动画
    CABasicAnimation * a1 = [CABasicAnimation animation];
    a1.keyPath = @"position";
    NSValue * value = [NSValue valueWithCGPoint:CGPointMake(300, 300)];
    a1.toValue = value;
    
    CABasicAnimation * a2 = [CABasicAnimation animation];
    a2.keyPath = @"transform.scale";
    a2.toValue = @0.5;
    
    CABasicAnimation * a3 = [CABasicAnimation animation];
    a3.keyPath = @"transform.rotation";
    a3.toValue = @(45 / 180.0 * M_PI);
    
    
    // 添加动画组
    CAAnimationGroup * anim = [CAAnimationGroup animation];
    anim.animations = @[a1,a2,a3];
    // 不反弹
    anim.removedOnCompletion = NO;
    anim.fillMode = kCAFillModeForwards;
    [_myView.layer addAnimation:anim forKey:nil];

}

#pragma mark -CAA delegate
-(void)animationDidStart:(CAAnimation *)anim {
    
    // 动画开始
    NSLog(@"动画开始了");
    
}

// 动画结束
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    
    // 查看一下动画执行完毕后的position值
    NSString *string = NSStringFromCGPoint(_myView.layer.position);
    NSLog(@"动画结束了，position:%@", string);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
