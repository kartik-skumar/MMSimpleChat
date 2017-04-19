//
//  UsersTableViewCell.h
//  MMSimpleChat
//
//  Created by Kartik's MacG on 15/04/17.
//  Copyright © 2017 Kartik's MacG. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UsersTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *userImageView;
@property (weak, nonatomic) IBOutlet UILabel *userNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *userUnreadCountLabel;

@end
