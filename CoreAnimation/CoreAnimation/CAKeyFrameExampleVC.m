//
//  CAKeyFrameExampleVC.m
//  CoreAnimation
//
//  Created by liyongfang on 2017/5/12.
//  Copyright © 2017年 liYongfang. All rights reserved.
//

#import "CAKeyFrameExampleVC.h"

@interface CAKeyFrameExampleVC ()

@property (nonatomic, strong) UIView *myView;

@property (nonatomic, strong) UIImageView *imageView;

@property (nonatomic, strong) CALayer *customerLayer;

@end

@implementation CAKeyFrameExampleVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.backgroundColor = [UIColor whiteColor];

    self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(100, 200, 100, 100)];
    self.imageView.image = [UIImage imageNamed:@"timg"];
    
//    self.myView = [[UIView alloc] init];
//    self.myView.frame = CGRectMake(100, 200, 100, 100);
//    self.myView.backgroundColor = [UIColor grayColor];
//
//    self.myView.layer.bounds = CGRectMake(0, 0, 100, 100);
//    [self.view addSubview:self.myView];
//    self.customerLayer = [CALayer layer];
//    self.customerLayer.bounds = CGRectMake(0, 0, 100, 100);
//    self.customerLayer.anchorPoint = CGPointMake(0, 0);
//    self.customerLayer.position = CGPointMake(0, 0);
//    [self.myView.layer addSublayer:self.customerLayer];
    
    [self.view addSubview:self.imageView];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    switch (self.index) {
        case 0:
            [self valuesAndKeyTimes];
            break;
        case 1:
            [self timingFunctionsAnimate];
            break;
        case 2:
            [self rotationAnimete];
            break;
        case 3:
            [self caculationModeAnimate];
            break;
        case 4:
            [self flyAnimation];
            break;
            
        default:
            break;
    }
    
}

- (void)flyAnimate {
    
    self.imageView.frame = CGRectMake(50, 100, 50, 50);
    UIBezierPath *pathLine = [UIBezierPath bezierPath];
    [pathLine moveToPoint:CGPointMake(50, 100)];
    [pathLine addLineToPoint:CGPointMake(300, 100)];
    [pathLine addArcWithCenter:CGPointMake(200, 200) radius:150 startAngle:0 endAngle:M_PI_2 clockwise:true];
    CAKeyframeAnimation *keyAnimate = [CAKeyframeAnimation animation];
    keyAnimate.duration = 2.0;
    keyAnimate.path = pathLine.CGPath;
    keyAnimate.keyPath = @"position";
    keyAnimate.fillMode = kCAFillModeForwards;
    keyAnimate.removedOnCompletion = NO;
    keyAnimate.calculationMode =  kCAAnimationCubicPaced;
    [self.imageView.layer addAnimation:keyAnimate forKey:nil];
}

- (void)valuesAndKeyTimes {
    
    CAKeyframeAnimation *anim = [CAKeyframeAnimation animation];
    anim.keyPath = @"position";// 动画类型为位置变化动画
    anim.duration = 3.0f;
    
    // keyTime=0.0f，即在keyTime*duration = 0.0秒时刻，layer呈现为position = v1的值
    // keyTime=0.5f，即在1.5秒时刻，呈现为v2
    // keyTime=1.0f，即在3.0秒时刻，呈现为v3
    // 中间的空隙，自动进行补间插值
    NSValue *v1 = [NSValue valueWithCGPoint:(CGPoint){20, 350}];
    NSValue *v2 = [NSValue valueWithCGPoint:(CGPoint){150, 150}];
    NSValue *v3 = [NSValue valueWithCGPoint:(CGPoint){280, 350}];
    anim.values = @[v1, v2, v3];
    anim.keyTimes = @[@0.0f, @0.5f, @1.0f];
    [self.imageView.layer addAnimation:anim forKey:nil];
    
}

// timingFunctions
- (void)timingFunctionsAnimate {

    self.myView.hidden = YES;
    CAKeyframeAnimation *anim = [CAKeyframeAnimation animation];
    anim.keyPath = @"position";// 动画类型为位置变化动画
    anim.duration = 3.0f;
    NSValue *v1 = [NSValue valueWithCGPoint:(CGPoint){20, 350}];
    NSValue *v2 = [NSValue valueWithCGPoint:(CGPoint){150, 150}];
    NSValue *v3 = [NSValue valueWithCGPoint:(CGPoint){280, 350}];
    anim.values = @[v1, v2, v3];
    // 每一帧所开始的时间
    anim.keyTimes = @[@0.0f, @0.5f, @1.0f];
//    anim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    // 不同补间插值分段，使用各自的时间函数
    // v1到v2段时间函数，慢入快出
    CAMediaTimingFunction *v1v2 = [CAMediaTimingFunction functionWithControlPoints:0.62f :0.12f :0.93f :0.17f];
    // v2到v3段时间函数，快入慢出
    CAMediaTimingFunction *v2v3 = [CAMediaTimingFunction functionWithControlPoints:0.81f :0.12f :0.25f :0.92f];
    anim.timingFunctions = @[v1v2, v2v3];// 元素个数应当为keyTimes个数-1，默认为线性
    [self.imageView.layer addAnimation:anim forKey:nil];

}

- (void)rotationAnimete {
    
    CAKeyframeAnimation *anim = [CAKeyframeAnimation animation];
    anim.keyPath = @"position";// 动画类型为位置变化动画
    anim.duration = 3.0f;
    NSValue *v1 = [NSValue valueWithCGPoint:(CGPoint){20, 350}];
    NSValue *v2 = [NSValue valueWithCGPoint:(CGPoint){150, 150}];
    NSValue *v3 = [NSValue valueWithCGPoint:(CGPoint){280, 350}];
    anim.values = @[v1, v2, v3];
    anim.keyTimes = @[@0.0f, @0.5f, @1.0f];// 把@0.2f改成@0.5f，更方便观察
//    CAMediaTimingFunction *v1v2 = [CAMediaTimingFunction functionWithControlPoints:0.62f :0.12f :0.93f :0.17f];
//    // v2到v3段时间函数，快入慢出
//    CAMediaTimingFunction *v2v3 = [CAMediaTimingFunction functionWithControlPoints:0.81f :0.12f :0.25f :0.92f];
//    anim.timingFunctions = @[v1v2, v2v3];// 元素个数应当为keyTimes个数-1，默认为线性
    
//    // 设置运动轨迹
//    CGMutablePathRef path = CGPathCreateMutable();
//    CGPathMoveToPoint(path, NULL, 20, 350);
//    CGPathAddLineToPoint(path, NULL, 150, 150);
//    CGPathAddLineToPoint(path, NULL, 280, 350);
//    anim.path = path;// path赋值时自动copy
//    CGPathRelease(path);// 手动释放内存
    // 注意，当且仅当动画设置了path，旋转才有效果
    // kCAAnimationRotateAuto 沿着切线方向旋转
    anim.rotationMode = kCAAnimationRotateAutoReverse;
    [self.imageView.layer addAnimation:anim forKey:nil];
}



- (void)caculationModeAnimate {

    self.myView.hidden = YES;
    CABasicAnimation *xAnim = [CABasicAnimation animation];
    xAnim.keyPath = @"position.x";
    xAnim.duration = 3.0f;
    xAnim.byValue = @290;
    
    CAKeyframeAnimation *yAnim = [CAKeyframeAnimation animation];
    yAnim.duration = 3.0f;
    yAnim.keyPath =  @"position.y";
    yAnim.values = @[@200, @120, @200, @160, @350];
    
//    kCAAnimationLinear   默认值,表示当关键帧为座标点的时候,关键帧之间直接直线相连进行插值计算;
//    kCAAnimationDiscrete 离散的,就是不进行插值计算,所有关键帧直接逐个进行显示;
//    kCAAnimationPaced    使得动画均匀进行,而不是按keyTimes设置的或者按关键帧平分时间,此时keyTimes和timingFunctions无效;
//    kCAAnimationCubic  对关键帧为座标点的关键帧进行圆滑曲线相连后插值计算,主要目的是使得运行的轨迹变得圆滑;
//    kCAAnimationCubicPaced 看这个名字就知道和kCAAnimationCubic有一定联系,其实就是在kCAAnimationCubic的基础上使得动画运行变得均匀,就是系统时间内运动的距离相同,此时keyTimes以及timingFunctions也是无效的
    yAnim.calculationMode = kCAAnimationDiscrete;
    yAnim.removedOnCompletion = YES;

    [self.imageView.layer addAnimation:yAnim forKey:nil];
    [self.imageView.layer addAnimation:xAnim forKey:nil];

}

- (void)flyAnimation {
    
    self.imageView.hidden = YES;
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(50, 50, 50, 50)];
    imageView.image = [UIImage imageNamed:@"plane"];

    [self.view addSubview:imageView];
    CGMutablePathRef pathLine = CGPathCreateMutable();
    CGPathMoveToPoint(pathLine, NULL, 50, 100);
    CGPathAddArc(pathLine, NULL, 200, 300, 150, 0, M_PI_2, YES);
    CAKeyframeAnimation *keyAnimation = [CAKeyframeAnimation animation];
    keyAnimation.keyPath = @"position";
    keyAnimation.fillMode = kCAFillModeForwards;
    keyAnimation.removedOnCompletion = NO;
    keyAnimation.path = pathLine;
    keyAnimation.duration = 3.0;
    [imageView.layer addAnimation:keyAnimation forKey:Nil];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
