//
//  Obj.m
//  FZLZG
//
//  Created by iosci on 2017/7/12.
//  Copyright © 2017年 secoo. All rights reserved.
//

#import "Obj.h"

@implementation Obj

- (void)dealloc {
  NSLog(@"Obj <%p> 释放了 %@", self, [NSThread currentThread]);
}

@end
