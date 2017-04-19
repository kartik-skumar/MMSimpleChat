//
//  User.m
//  MMSimpleChat
//
//  Created by Kartik's MacG on 16/04/17.
//  Copyright © 2017 Kartik's MacG. All rights reserved.
//

#import "User.h"

@implementation User

+ (instancetype)sharedInstance {
    static User *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[User alloc] init];
    });
    return sharedInstance;
}

@end
