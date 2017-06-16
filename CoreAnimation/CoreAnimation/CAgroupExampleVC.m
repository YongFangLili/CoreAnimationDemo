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
    self.myView.frame = CGRectMake(100, 200, 100, 100);
    self.myView.backgroundColor = [UIColor grayColor];
    
    self.myView.layer.bounds = CGRectMake(0, 0, 100, 100);
    self.myView.layer.position = CGPointMake(100, 200);
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
//        case 1:
//            [self scaleAnimate];
//            break;
//        case 2:
//            [self rotateAnimate];
//            break;
//        case 3:
//            [self additiveAnimate];
            
        default:
            break;
    }
    
}

- (void)groupAnimate1 {
    
    // 动画1：3秒的大小缩放
    CABasicAnimation *anim1 = [CABasicAnimation animation];
    anim1.keyPath = @"transform.scale";
    anim1.duration = 3.0;
    anim1.fromValue = @[@1, @1, @1];
    anim1.toValue = @[@0.8, @0.8, @1];// x,y,z轴上的缩放
    
    // 在animationGroup里的动画，以下两个属性设置是不起作用的
    anim1.removedOnCompletion = NO;
    // anim1.delegate = self;
    
    // 动画2：5秒的逐渐透明
    CABasicAnimation *anim2 = [CABasicAnimation animation];
    anim2.keyPath = @"opacity";
    
    anim2.duration = 5.0f;
    anim2.toValue = @0.0;
    
    // 动画组：10秒的动画组，虽然组内动画在3秒和5秒的时候已经结束了
    // 但组是持续10秒的，10秒后才结束
    CAAnimationGroup *animGroup = [CAAnimationGroup animation];
    animGroup.duration = 8.0f;
    animGroup.animations = @[anim1];
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
