//
//  DemoViewController.m
//  FZLZG
//
//  Created by iosci on 2017/7/12.
//  Copyright © 2017年 secoo. All rights reserved.
//

#import "DemoViewController.h"
#import "Manager.h"

// 强符号 会覆盖 弱符号
void symbol1() {
    NSLog(@"测试 symbol1");
};

@interface DemoViewController ()

@property (nonatomic, strong) Manager *manager;

@end

@implementation DemoViewController

- (void)dealloc {
  NSLog(@"DemoViewController %p 释放了", self);
}

- (void)viewDidLoad {
  [super viewDidLoad];
  symbol1();
  self.view.backgroundColor = [UIColor whiteColor];
  self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:NULL];
  self.title = [NSString stringWithFormat:@"%p", self];
}

- (void)viewDidAppear:(BOOL)animated {
  [super viewDidAppear:animated];

  __weak typeof(self) weakSelf = self;
  dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
    NSLog(@"pre delegate: %p", weakSelf.manager.delegate);
    weakSelf.manager.delegate = weakSelf;
  });
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
  [self.navigationController pushViewController:[[DemoViewController alloc] init] animated:YES];
}

- (Manager *)manager {
  if (!_manager) {
    _manager = [Manager sharedManager];
  }
  return _manager;
}

@end
