//
//  NSObject+Weak.m
//  FZLZG
//
//  Created by iosci on 2017/7/12.
//  Copyright © 2017年 secoo. All rights reserved.
//

#import "NSObject+Weak.h"
#import <objc/runtime.h>

@implementation NSObject (Weak)

- (void)setDelegate:(id)delegate {
  __weak id weakObj = delegate;
  id (^block)() = ^(){
    return weakObj;
  };
  objc_setAssociatedObject(self, @selector(delegate), block, OBJC_ASSOCIATION_COPY);
}

- (id)delegate {
  id (^block)() = objc_getAssociatedObject(self, @selector(delegate));
  return block ? block() : nil;
}

@end
