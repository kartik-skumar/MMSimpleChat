//
//  ViewController.m
//  MMSimpleChat
//
//  Created by Kartik's MacG on 15/04/17.
//  Copyright © 2017 Kartik's MacG. All rights reserved.
//

#import "ViewController.h"
#import "User.h"
#import "UsersAppViewController.h"
@import Firebase;

@interface ViewController () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *usernameField;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@property (strong, nonatomic) FIRDatabaseReference *ref;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.loginButton setEnabled:NO];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewWillAppear:(BOOL)animated {
    self.usernameField.text = @"";
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)loginBtnClicked:(id)sender {
    self.ref = [[FIRDatabase database] reference];
    NSString *emailID = [NSString stringWithFormat:@"%@@simplechat.com",self.usernameField.text];
    [[FIRAuth auth] signInWithEmail:emailID password:@"" completion:^(FIRUser * _Nullable user, NSError * _Nullable error) {
        [[[_ref child:@"users"] child:self.usernameField.text]
         observeEventType:FIRDataEventTypeValue
         withBlock:^(FIRDataSnapshot * _Nonnull snapshot) {
             if (![snapshot exists]) {
                 [self promptForNewUserName:self.usernameField.text];
             } else {
                 [[User sharedInstance] setIsSignedIn:YES];
                 UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main"
                                                                      bundle:nil];
                 UsersAppViewController *usersVC =
                 (UsersAppViewController *)
                 [storyboard instantiateViewControllerWithIdentifier:@"usersListView"];
                 [self.navigationController pushViewController:usersVC animated:YES];
             }
         }];
    }];
}

- (void)promptForNewUserName:(NSString*)user {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                    message:[NSString stringWithFormat:@"User %@ is not registered! Please sign up!!",user]
                                                   delegate:nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
    self.usernameField.text = @"";
}

    
- (IBAction)signUpBtnClicked:(id)sender {
}

#pragma mark - UITextFieldDelegate methods

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    return YES;
}


-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (self.usernameField.text.length > 0) {
        [self.loginButton setEnabled:YES];
    } else {
        [self.loginButton setEnabled:NO];
    }
    
    [self.usernameField resignFirstResponder];
    return YES;
}

@end
