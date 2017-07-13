//
//  Manager.h
//  FZLZG
//
//  Created by iosci on 2017/7/12.
//  Copyright © 2017年 secoo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSObject+Weak.h"

@interface Manager : NSObject

/**
 weak singleton

 @return singleton
 */
+ (instancetype)sharedManager;

@end
