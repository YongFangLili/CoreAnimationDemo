//
//  CABasicAnimateVC.m
//  CoreAnimation
//
//  Created by liyongfang on 2017/5/12.
//  Copyright © 2017年 liYongfang. All rights reserved.
//

#import "CABasicAnimateVC.h"
#import "CABaseAnimateExampleVCViewController.h"

@interface CABasicAnimateVC ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tabelView;

@property (nonatomic, strong) NSArray *dataArray;

@end

@implementation CABasicAnimateVC

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.title = @"CABasic";
    [self setUpTableView];
    
}

- (void)setUpTableView {
    
    self.dataArray = @[@"平移",@"缩放",@"旋转"];
    self.tabelView.frame = CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width,  [UIScreen mainScreen].bounds.size.height);
    [self.view addSubview:self.tabelView];
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellIdentifier = @"cellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        
    }
    cell.textLabel.text = self.dataArray[indexPath.row];
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CABaseAnimateExampleVCViewController *exampleVC = [[CABaseAnimateExampleVCViewController alloc] init];
    exampleVC.title = self.dataArray[indexPath.row];
    exampleVC.index = indexPath.row;
    [self.navigationController pushViewController:exampleVC animated:YES];
    
    

}



- (NSArray *)dataArray {
    
    if (!_dataArray) {
        _dataArray = [NSArray array];
    }
    return _dataArray;
}

-(UITableView *)tabelView {
    
    if (!_tabelView) {
        _tabelView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width,  [UIScreen mainScreen].bounds.size.height) style:UITableViewStylePlain];
        _tabelView.delegate = self;
        _tabelView.separatorColor = [UIColor blackColor];
        _tabelView.dataSource = self;
        
        
    }
    return _tabelView;
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
