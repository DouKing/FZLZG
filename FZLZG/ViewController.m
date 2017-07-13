//
//  ViewController.m
//  FZLZG
//
//  Created by iosci on 2017/7/12.
//  Copyright © 2017年 secoo. All rights reserved.
//

#import "ViewController.h"
#import "DemoViewController.h"
#import "Obj.h"

typedef NS_ENUM(NSInteger, XXType){
  XXType1,
  XXType2
};

int sum(a, b, c)
int a, b; int c;
{
  int s = ((void)(a + b), c);//逗号表达式，前面计算，结果=后面的: s = c
  return a + b + s;
}

@interface ViewController ()

@property (nonatomic, strong) Obj *obj;

- (void):(id)arg1 :(id)arg2;

@end

@implementation ViewController

- (void)awakeFromNib {
  [super awakeFromNib];
  self.obj = [[Obj alloc] init];
}

- (void)viewDidLoad {
  [super viewDidLoad];
  NSLog(@"线程:%@", [NSThread currentThread]);

  [self demo1];
  [self demo2];
  [self demo3];
  [self demo4];
  [self demo5];
  [self demo6];
  [self demo7];
}

- (void)viewDidAppear:(BOOL)animated {
  [super viewDidAppear:animated];

  __weak typeof(self) weakSelf = self;
  dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
    //2s后释放
    Obj *temp = weakSelf.obj;
    weakSelf.obj = nil;
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
      [temp class];//捕获到 block 里可以在后台释放
    });
  });
}

- (void)demo1 {
  NSLog(@"DEMO1----------------------");
  NSLog(@"%@！ %@", [self foo:nil], [self _]);
  [self :@"没有方法名 参数1" :@"参数2"];
}

- (void)demo2 {
  NSLog(@"DEMO2----------------------");
//  CGRect rect1 = {1, 2, 3, 4};
//  CGRect rect2 = {.origin.x=5, .size={10, 10}}; // {5, 0, 10, 10}
//  CGRect rect3 = {1, 2}; // {1, 2, 0, 0}
}

- (void)demo3 {
  NSLog(@"DEMO3----------------------");
  const NSString *XXTypeNameMapping[] = {
    [XXType1] = @"Type1",
    [XXType2] = @"Type2"
  };
  NSLog(@"enum string:%@", XXTypeNameMapping[XXType2]);
}

- (void)demo4 {
  NSLog(@"DEMO4----------------------");
  void(^block1)(void) = ^{
    NSLog(@"block1");
  };
  void(^block2)(int) = ^(int a) {
    NSLog(@"block2");
  };
  void(^block3)(NSNumber *, NSString *) = ^(NSNumber *a, NSString *b) {
    NSLog(@"block3: %@, %@", a, b);
  };

  void(^block)();
  block = block1;
  block = block2;
  block = block3;

  block(@2, @"呵呵🙄");
  block(@3, nil);
}

- (void)demo5 {
  NSLog(@"DEMO5----------------------");
  //小括号内联复合表达式
  UIView *backgroundView = ({
    CGRect frame = {10, 70, 100, 100};
    UIView *v = [[UIView alloc] initWithFrame:frame];
    v.backgroundColor = [UIColor redColor];
    v;
  });

  [self.view addSubview:backgroundView];
}

- (void)demo6 {
  NSLog(@"DEMO6----------------------");
  int a = 10, b = 20, c = 30;
  NSLog(@"sum: %d", sum(a, b, c));
}

// ((void)OBJ.PATH, NO)可以有编译器提示，编译后不执行，返回值是 #PATH,即 c字符串
#define keypath(OBJ, PATH) \
(((void)(NO && ((void)OBJ.PATH, NO)), # PATH))

//预处理时计算参数个数
#define COUNT_PARMS2(_a1, _a2, _a3, _a4, _a5, RESULT, ...) RESULT
#define COUNT_PARMS(...) COUNT_PARMS2(__VA_ARGS__, 5, 4, 3, 2, 1)

//预处理时断言
#define C_ASSERT(test) \
switch(0) {\
case 0:\
case test:;\
}

- (void)demo7 {
  NSLog(@"DEMO7----------------------");
  NSLog(@"%s", keypath(self, view));
  int count = COUNT_PARMS(1, 2, 3, 4);
  NSLog(@"count:%d", count);
  C_ASSERT(COUNT_PARMS(1, 2, 3, 4) == 4);
}

// 如果返回值、参数类型不写，默认是id类型
- foo:arg {
  return @"哈哈，我没写类型";
}

// 没有方法名
- (void):(id)arg1 :(id)arg2 {
  NSLog(@"%@ %@", arg1, arg2);
}

- _ {
  return @"最短的方法";
}




- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
  self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:NULL];
  [self.navigationController pushViewController:[[DemoViewController alloc] init] animated:YES];
}

@end
