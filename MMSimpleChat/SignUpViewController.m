//
//  SignUpViewController.m
//  MMSimpleChat
//
//  Created by Kartik's MacG on 15/04/17.
//  Copyright © 2017 Kartik's MacG. All rights reserved.
//

#import "SignUpViewController.h"
#import "User.h"
@import Firebase;


@interface SignUpViewController () <UITextFieldDelegate, UIAlertViewDelegate>
@property (weak, nonatomic) IBOutlet UITextField *firstNameField;
@property (weak, nonatomic) IBOutlet UITextField *lastNameField;
@property (weak, nonatomic) IBOutlet UITextField *userNameField;
@property (weak, nonatomic) IBOutlet UIButton *saveButton;
@property (strong, nonatomic) FIRDatabaseReference *ref;

@end

@implementation SignUpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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

- (IBAction)signUpBtnClicked:(id)sender {
    self.ref = [[FIRDatabase database] reference];
    
    NSString *emailID = [NSString stringWithFormat:@"%@@simplechat.com",self.userNameField.text];
    [[FIRAuth auth] createUserWithEmail:emailID  password:@"AB123@mm" completion:^(FIRUser * _Nullable user, NSError * _Nullable error) {
//        if (error.description) {
//            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
//                                                            message:[NSString stringWithFormat:@"User %@ is not registered! Please try again!!",user]
//                                                           delegate:nil
//                                                  cancelButtonTitle:@"OK"
//                                                  otherButtonTitles:nil];
//            [alert show];
//            
//        } else {
            [[[_ref child:@"users"] child:self.userNameField.text] setValue:@{@"username": self.userNameField.text}];
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Done"
                                                            message:[NSString stringWithFormat:@"User %@ is registered!",self.userNameField.text]
                                                           delegate:self
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil];
            [alert show];
//        }
        
    }];
}


- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - UITextFieldDelegate methods



-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    if (self.firstNameField.text.length > 0 && self.lastNameField.text.length > 0 && self.userNameField.text.length > 0) {
        [self.saveButton setEnabled:YES];
    } else {
        [self.saveButton setEnabled:NO];
    }
    
    [self.firstNameField resignFirstResponder];
    [self.lastNameField resignFirstResponder];
    [self.userNameField resignFirstResponder];
    return YES;
}

@end
