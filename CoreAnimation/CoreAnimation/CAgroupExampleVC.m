//
//  CAgroupExampleVC.m
//  CoreAnimation
//
//  Created by liyongfang on 2017/5/12.
//  Copyright © 2017年 liYongfang. All rights reserved.
//

#import "CAgroupExampleVC.h"

@interface CAgroupExampleVC ()

@property (nonatomic, strong) UIView *myView;
@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation CAgroupExampleVC

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.myView = [[UIView alloc] init];
    self.myView.frame = CGRectMake(20, 300, 100, 100);
    self.myView.backgroundColor = [UIColor grayColor];
    self.myView.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.myView];
    
    self.imageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:self.imageView];

    
    // Do any additional setup after loading the view.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    switch (self.index) {
        case 0:
            [self groupAnimate1];
            break;
            
        default:
            break;
    }
    
}

- (void)groupAnimate1 {
    
    // 动画1：3秒的大小缩放
    CABasicAnimation *scaleAnimte = [CABasicAnimation animation];
    scaleAnimte.keyPath = @"transform.scale";
    scaleAnimte.duration = 3.0;
    scaleAnimte.removedOnCompletion = NO;
    scaleAnimte.fillMode = kCAFillModeForwards;
//    scaleAnimte.fromValue = @[@1, @1, @1];
    scaleAnimte.toValue = @[@0.5, @0.5, @0.5];// x,y,z轴上的缩放

    // 动画逐渐透明
    CABasicAnimation *alphaAnimte = [CABasicAnimation animation];
//    alphaAnimte.beginTime = 1;
    alphaAnimte.keyPath = @"opacity";
    alphaAnimte.duration = 3.0f;
    alphaAnimte.toValue = @0.0;
    
    // 动画旋转
    CABasicAnimation *rotationAnimate = [CABasicAnimation animation];
    
//    rotationAnimate.beginTime =2;
    rotationAnimate.duration = 3.0;
    rotationAnimate.keyPath = @"transform.rotation";
    rotationAnimate.toValue = @((4 * M_PI));
    
    // 动画移动
//    CABasicAnimation *moveAnimate = [CABasicAnimation animation];
//    moveAnimate.duration = 1.0;
//    moveAnimate.keyPath  = @"transform.translation";
//    moveAnimate.toValue = [NSValue valueWithCGPoint:CGPointMake(300, 300)];
    
    // position的改变
    CAKeyframeAnimation *keyAnimation= [CAKeyframeAnimation animation];
//    keyAnimation.beginTime = 3;
    keyAnimation.duration = 3.0;

    keyAnimation.keyPath = @"position";
    
    NSValue *v3 = [NSValue valueWithCGPoint:(CGPoint){20, 300}];
    NSValue *v1 = [NSValue valueWithCGPoint:(CGPoint){150, 100}];
    NSValue *v2 = [NSValue valueWithCGPoint:(CGPoint){300, 500}];
    keyAnimation.calculationMode = kCAAnimationCubic;
    keyAnimation.keyTimes = @[@(0),@(0.5),@(1.0)];
    keyAnimation.values = @[v3,v1,v2];
    
    
    
    // 如果两个动画设置时间一样，并且总时间与 group 时间一样，两组动画会同时进行
    CAAnimationGroup *animGroup = [CAAnimationGroup animation];
    animGroup.duration = 3.0f;
    animGroup.animations = @[scaleAnimte,rotationAnimate,alphaAnimte,keyAnimation];
    
    //kCAFillModeForwards 当动画结束后,layer会一直保持着动画最后的状态
    // kCAFillModeBackwards layer便立即进入动画的初始状态并等待动画开始
//    animGroup.removedOnCompletion = NO;
//    animGroup.fillMode = kCAFillModeForwards;
    [self.myView.layer addAnimation:animGroup forKey:nil];

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
