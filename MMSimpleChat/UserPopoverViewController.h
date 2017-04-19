//
//  UserPopoverViewController.h
//  MMSimpleChat
//
//  Created by Kartik's MacG on 16/04/17.
//  Copyright © 2017 Kartik's MacG. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol UserLoggedOutDelegate <NSObject>

@required

- (void)afterLoggedOut;

@end


@interface UserPopoverViewController : UIViewController

@property (weak, nonatomic) id<UserLoggedOutDelegate> delegate;

@end
