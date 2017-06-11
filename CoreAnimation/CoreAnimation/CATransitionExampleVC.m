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


@end

static int i = 1;
@implementation CATransitionExampleVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    self.myView = [[UIView alloc] init];
//    self.myView.frame = CGRectMake(100, 200, 100, 100);
//    self.myView.backgroundColor = [UIColor grayColor];
//    
//    self.myView.layer.bounds = CGRectMake(0, 0, 100, 100);
//    self.myView.layer.position = CGPointMake(100, 200);
//    self.myView.backgroundColor = [UIColor redColor];
//    [self.view addSubview:self.myView];
    
    
    self.imageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    self.imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%d",1]];
    [self.view addSubview:self.imageView];
}



- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    [self transitionAnimations];
}

// 各种转场动画展示效果
/*
 fade : 交叉淡化过渡
 push : 新视图把旧视图推出去
 moveIn: 新视图移到旧视图上面
 reveal: 将旧视图移开,显示下面的新视图
 cube : 立方体翻滚效果
 oglFlip : 上下左右翻转效果
 suckEffect : 收缩效果，如一块布被抽走
 rippleEffect: 水滴效果
 pageCurl : 向上翻页效果
 **/
- (void)transitionAnimations {
    
    i++;
    self.imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%d",i]];
    // 添加转场动画
    CATransition * anim = [CATransition animation];
    anim.type = @"suckEffect";
    anim.duration = 1;
    anim.startProgress = 0.5;
    [self.imageView.layer addAnimation:anim forKey:nil];
    
    if (i == 3) {
        i = 0;
    }
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
