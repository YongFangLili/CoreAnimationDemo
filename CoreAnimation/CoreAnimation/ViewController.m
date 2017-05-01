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

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.myView = [[UIView alloc] init];
    self.myView.frame = CGRectMake(100, 100, 100, 100);
    self.myView.backgroundColor = [UIColor grayColor];
    self.myView.layer.position = CGPointMake(100, 100);
    //    self.myView.layer.bounds = CGRectMake(0, 0, 100, 100);
    self.myView.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.myView];
    
    
    
    
    
    //    [self layerDemo];
    
    // Do any additional setup after loading the view, typically from a nib.
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    // 平移
//    [self horMoveAnimate];
    
    // 缩放
//    [self scaleAnimate];
    // 旋转
    [self rotateAnimate];
}

- (void)layerDemo {
    
    UIButton *button = [[UIButton alloc] init];
    button.frame = CGRectMake(100, 100, 100, 100);
    button.backgroundColor = [UIColor grayColor];
    CALayer *myLayer = [CALayer layer];
    myLayer.bounds =  CGRectMake(0, 0, 100, 100);
    
    // 设置层的背景颜色：红色
    myLayer.backgroundColor = [UIColor redColor].CGColor;
    // 指定 layer 上的某个点在什么上面
    myLayer.anchorPoint = CGPointMake(0.5, 0.5);
    // 指定 lay上指定的 anchorPoint的店在 view 的那个位置上
    myLayer.position = CGPointMake(100, 100);
    // 添加视图
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
    anim.duration = 1;
    
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
    anim.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(M_PI_2, 0, 0, 1)];
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
