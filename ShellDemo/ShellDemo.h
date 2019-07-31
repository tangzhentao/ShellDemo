//
//  ShellDemo.h
//  cmdDemo
//
//  Created by itang on 2019/7/31.
//  Copyright © 2019 itang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ShellDemo : NSObject

@property (strong, nonatomic) NSTask *task;

- (int)executeLS;
- (void)executeHelloWorld;

@end

NS_ASSUME_NONNULL_END
