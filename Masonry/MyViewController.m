//
//  ViewController.m
//  Masonry
//
//  Created by 黄世光 on 2017/2/24.
//  Copyright © 2017年 黄世光. All rights reserved.
//

#import "MyViewController.h"
#import "Masonry.h"

#import "NextViewController.h"
@interface MyViewController ()

@end

@implementation MyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self baseViewWithMasonry];
}
-(void)baseViewWithMasonry{
    UIView *greenView = UIView.new;
    greenView.backgroundColor = UIColor.greenColor;
    greenView.layer.borderColor = UIColor.blackColor.CGColor;
    greenView.layer.borderWidth = 2;
    [self.view addSubview:greenView];
    
    UIView *redView = UIView.new;
    redView.backgroundColor = UIColor.redColor;
    redView.layer.borderColor = UIColor.blackColor.CGColor;
    redView.layer.borderWidth = 2;
    [self.view addSubview:redView];
    
    UIView *blueView = UIView.new;
    blueView.backgroundColor = UIColor.blueColor;
    blueView.layer.borderColor = UIColor.blackColor.CGColor;
    blueView.layer.borderWidth = 2;
    [self.view addSubview:blueView];
    
    UIButton *btn = [[UIButton alloc]init];
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    btn.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:btn];
    
    UIView *superView = self.view;
    int topPadding = 20+64;
    int padding = 20;
    //内部边距用+，外部边距用-
    [greenView mas_makeConstraints:^(MASConstraintMaker *make) {
        //大于或等于
        make.top.greaterThanOrEqualTo(superView.mas_top).offset(topPadding);
        make.left.equalTo(superView.mas_left).offset(padding);
        make.bottom.equalTo(blueView.mas_top).offset(-padding);
        make.right.equalTo(redView.mas_left).offset(-padding);
        make.width.equalTo(redView.mas_width);
        
        make.height.equalTo(redView.mas_height);
        make.height.equalTo(blueView.mas_height);
    }];
    [redView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(superView.mas_top).offset(topPadding);
        make.left.equalTo(greenView.mas_right).offset(-padding);
        make.right.equalTo(superView.mas_right).offset(-padding);
        make.bottom.equalTo(blueView.mas_top).offset(-padding);
    }];
    [blueView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(superView.mas_left).offset(padding);
        make.top.equalTo(greenView.mas_bottom).offset(-padding);
        make.right.equalTo(superView.mas_right).offset(-padding);
        make.bottom.equalTo(superView.mas_bottom).offset(-padding);
    }];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@100);
        make.width.equalTo(@100);
        make.centerX.equalTo(superView.mas_centerX);
        make.centerY.equalTo(superView.mas_centerY);
    }];;
}
- (void)btnClick{
    NextViewController *vc = [[NextViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
