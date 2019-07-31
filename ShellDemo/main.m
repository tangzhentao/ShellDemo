//
//  main.m
//  cmdDemo
//
//  Created by itang on 2019/7/31.
//  Copyright © 2019 itang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ShellDemo.h"
#import "CmdUtil.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        NSString *udid = [userDefaults objectForKey:@"udid"];
        NSString *account = [userDefaults objectForKey:@"account"];
        NSString *ipaPath = [userDefaults objectForKey:@"ipaPath"];
        
        NSLog(@"udid: %@", udid);
        NSLog(@"account: %@", account);
        NSLog(@"ipaPath: %@", ipaPath);
        
        ShellDemo *shellDemo = [ShellDemo new];
        [shellDemo executeLS];
//        [shellDemo executeHelloWorld];
        
        int status;
        NSData* result = runCommandSync(@"/usr/bin/curl -fsSL taobao.com", YES, &status);
        NSLog(@"data length: %ld, status: %d", [result length], status);
        
        NSData* data = runCommandSync(@"echo md5 | md5", YES, nil);
        NSLog(@"md5 is %@", [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
        
        runCommandAsync(@"/usr/bin/curl -fsSL taobao.com", YES, ^(NSData * _Nonnull data, int exitStatus) {
            NSLog(@"data length: %ld, status: %d", [data length], exitStatus);
        });


    }
    
    NSLog(@"end");
    return 0;
}
