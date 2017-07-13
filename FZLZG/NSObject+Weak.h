//
//  NSObject+Weak.h
//  FZLZG
//
//  Created by iosci on 2017/7/12.
//  Copyright © 2017年 secoo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Weak)

//category weak reference
@property (nonatomic, weak) id delegate;

@end
