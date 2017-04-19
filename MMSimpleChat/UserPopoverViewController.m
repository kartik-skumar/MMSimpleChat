//
//  UserPopoverViewController.m
//  MMSimpleChat
//
//  Created by Kartik's MacG on 16/04/17.
//  Copyright © 2017 Kartik's MacG. All rights reserved.
//

#import "UserPopoverViewController.h"
#import "User.h"
#import "UsersAppViewController.h"

@import Firebase;

@interface UserPopoverViewController () <UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) FIRDatabaseReference *ref;

@end

@implementation UserPopoverViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


#pragma mark -UItableView Datasource and Delegate methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    switch (indexPath.row) {
            case 0:
            cell.textLabel.text = @"Logout";
            break;
            case 1:
            cell.textLabel.text = @"Profile";
            break;
        default:
            break;
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
            case 0:
        {
            NSError *signOutError;
            BOOL status = [[FIRAuth auth] signOut:&signOutError];
            if (!status) {
                NSLog(@"Error signing out: %@", signOutError);
                return;
            }else{
                NSLog(@"Successfully Signout");
                [[User sharedInstance] setIsSignedIn:NO];
                [self dismissViewControllerAnimated:NO completion:nil];
                [self.delegate afterLoggedOut];
            }
        }
            break;
            case 1:
            
            break;
        default:
            break;
    }
}

@end
