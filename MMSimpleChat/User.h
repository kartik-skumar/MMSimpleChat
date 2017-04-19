//
//  User.h
//  MMSimpleChat
//
//  Created by Kartik's MacG on 16/04/17.
//  Copyright © 2017 Kartik's MacG. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

@property BOOL isSignedIn;

+ (instancetype)sharedInstance;

@end
