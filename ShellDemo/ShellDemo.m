//
//  ShellDemo.m
//  cmdDemo
//
//  Created by itang on 2019/7/31.
//  Copyright © 2019 itang. All rights reserved.
//

#import "ShellDemo.h"

@implementation ShellDemo

- (int)executeLS
{
    _task = [[NSTask alloc] init];
    [_task setLaunchPath:@"/bin/ls"];
    
    NSArray *arguments = [NSArray arrayWithObjects:@"-l", @"-a", @"-t", nil];
    [_task setArguments:arguments];
    
    NSPipe *pipe = [NSPipe pipe];
    [_task setStandardOutput:pipe];
    NSFileHandle *file = [pipe fileHandleForReading];

    [_task setArguments:arguments];
    
    [_task launch];
    
    NSData *data = [file readDataToEndOfFile];
    NSString *string = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"woop! got\n%@", string);
    
    return 0;
}

- (void)executeHelloWorld
{
    NSTask *task = [NSTask new];
    NSURL *helloURL = [NSURL URLWithString:@"/Users/tang/codes/HelloWorld"];
    [task setExecutableURL:helloURL];
    [task launch];

}

@end
