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
    self.myView = [[UIView alloc] init];
    self.myView.frame = CGRectMake(100, 200, 100, 100);
    self.myView.backgroundColor = [UIColor grayColor];
    
    self.myView.layer.bounds = CGRectMake(0, 0, 100, 100);
//    self.myView.layer.position = CGPointMake(100, 200);
//    self.myView.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.myView];
    
    self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(100, 200, 100, 100)];
    self.imageView.image = [UIImage imageNamed:@"timg"];
    self.customerLayer = [CALayer layer];
    self.customerLayer.backgroundColor = [UIColor cyanColor].CGColor;
    self.customerLayer.bounds = CGRectMake(0, 0, 100, 100);
    self.customerLayer.anchorPoint = CGPointMake(0, 0);
    self.customerLayer.position = CGPointMake(0, 0);
    [self.myView.layer addSublayer:self.customerLayer];
    
    
    
    [self.view addSubview:self.imageView];
    // Do any additional setup after loading the view.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    switch (self.index) {
        case 0:
            [self valuesAndKeyTimes];
            break;
        case 1:
            [self timingFunctionsAnimate];
//            break;
        case 2:
            [self rotationAnimete];
            break;
        case 3:
            [self caculationModeAnimate];
            break;
        case 4:
            [self flyAnimate];
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
    [self.imageView.layer addAnimation:keyAnimate forKey:nil];
}

- (void)valuesAndKeyTimes {
    
    CAKeyframeAnimation *anim = [CAKeyframeAnimation animation];
    anim.keyPath = @"position";// 动画类型为位置变化动画
    anim.duration = 3.0f;
    
    // keyTime=0.0f，即在keyTime*duration = 0.0秒时刻，layer呈现为position = v1的值
    // keyTime=0.2f，即在0.6秒时刻，呈现为v2
    // keyTime=1.0f，即在3.0秒时刻，呈现为v3
    // 中间的空隙，自动进行补间插值
    NSValue *v1 = [NSValue valueWithCGPoint:(CGPoint){20, 350}];
    NSValue *v2 = [NSValue valueWithCGPoint:(CGPoint){150, 150}];
    NSValue *v3 = [NSValue valueWithCGPoint:(CGPoint){280, 350}];
    anim.values = @[v1, v2, v3];
    anim.keyTimes = @[@0.0f, @0.5f, @1.0f];// 把@0.2f改成@0.5f，更方便观察
    [self.customerLayer addAnimation:anim forKey:nil];
    
}

// timingFunctions
- (void)timingFunctionsAnimate {

    CAKeyframeAnimation *anim = [CAKeyframeAnimation animation];
    anim.keyPath = @"position";// 动画类型为位置变化动画
    anim.duration = 3.0f;
    NSValue *v1 = [NSValue valueWithCGPoint:(CGPoint){20, 350}];
    NSValue *v2 = [NSValue valueWithCGPoint:(CGPoint){150, 150}];
    NSValue *v3 = [NSValue valueWithCGPoint:(CGPoint){280, 350}];
    anim.values = @[v1, v2, v3];
    anim.keyTimes = @[@0.0f, @0.5f, @1.0f];// 把@0.2f改成@0.5f，更方便观察
    // 不同补间插值分段，使用各自的时间函数
    // v1到v2段时间函数，慢入快出
//    CAMediaTimingFunction *v1v2 = [CAMediaTimingFunction functionWithControlPoints:0.62f :0.12f :0.93f :0.17f];
//    // v2到v3段时间函数，快入慢出
//    CAMediaTimingFunction *v2v3 = [CAMediaTimingFunction functionWithControlPoints:0.81f :0.12f :0.25f :0.92f];
//    anim.timingFunctions = @[v1v2, v2v3];// 元素个数应当为keyTimes个数-1，默认为线性
    [self.customerLayer addAnimation:anim forKey:nil];

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
    CAMediaTimingFunction *v1v2 = [CAMediaTimingFunction functionWithControlPoints:0.62f :0.12f :0.93f :0.17f];
    // v2到v3段时间函数，快入慢出
    CAMediaTimingFunction *v2v3 = [CAMediaTimingFunction functionWithControlPoints:0.81f :0.12f :0.25f :0.92f];
    anim.timingFunctions = @[v1v2, v2v3];// 元素个数应当为keyTimes个数-1，默认为线性
    
    // 设置运动轨迹
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, 20, 350);
    CGPathAddLineToPoint(path, NULL, 150, 150);
    CGPathAddLineToPoint(path, NULL, 280, 350);
    anim.path = path;// path赋值时自动copy
    CGPathRelease(path);// 手动释放内存
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
    yAnim.calculationMode = kCAAnimationCubicPaced;
    yAnim.removedOnCompletion = YES;

    [self.imageView.layer addAnimation:yAnim forKey:nil];
    [self.imageView.layer addAnimation:xAnim forKey:nil];

}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
