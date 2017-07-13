//
//  Manager.m
//  FZLZG
//
//  Created by iosci on 2017/7/12.
//  Copyright © 2017年 secoo. All rights reserved.
//

#import "Manager.h"

@implementation Manager

- (void)dealloc {
  NSLog(@"Manager 释放了");
}

+ (instancetype)sharedManager {
  static __weak Manager *weakInstance = nil;
  Manager *sharedInstance = weakInstance;
  @synchronized (self) {
    if (sharedInstance == nil) {
      sharedInstance = [[Manager alloc] init];
      weakInstance = sharedInstance;
    }
  }
  return sharedInstance;
}


@end
