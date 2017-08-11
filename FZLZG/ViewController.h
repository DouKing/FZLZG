//
//  ViewController.h
//  FZLZG
//
//  Created by iosci on 2017/7/12.
//  Copyright © 2017年 secoo. All rights reserved.
//

#import <UIKit/UIKit.h>

//在main函数前调用。数越小，优先级越高
__attribute__((constructor(101)))
static void beforeMain(void) {
  NSLog(@"beforeMain");
}

__attribute__((constructor(102)))
static void beforeMain2(void) {
  NSLog(@"beforeMain2");
}

//在main函数后调用。数越小，优先级越低
__attribute__((destructor(101)))
static void afterMain(void) {
  NSLog(@"afterMain");
}

__attribute__((destructor(102)))
static void afterMain2(void) {
  NSLog(@"afterMain2");
}


__attribute__((objc_runtime_name("40ea43d7629d01e4b8d6289a132482d0dd5df4fa***自定义信息")))
@interface ViewController : UIViewController


@end

