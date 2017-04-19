//
//  UsersAppViewController.m
//  MMSimpleChat
//
//  Created by Kartik's MacG on 15/04/17.
//  Copyright © 2017 Kartik's MacG. All rights reserved.
//

#import "UsersAppViewController.h"
#import "UsersTableViewCell.h"
#import "UserPopoverViewController.h"
#import "UIPopoverController+iPhone.h"
#import "User.h"
@import Firebase;

@interface UsersAppViewController () <UITableViewDelegate, UITableViewDataSource, UserLoggedOutDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation UsersAppViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:YES];
    // Do any additional setup after loading the view.
}



- (void)viewWillAppear:(BOOL)animated {
    if (![[User sharedInstance] isSignedIn]) {
        [self.navigationController popViewControllerAnimated:YES];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)afterLoggedOut {
    if (![[User sharedInstance] isSignedIn]) {
        [self.navigationController popViewControllerAnimated:YES];
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


- (IBAction)optionsButtonClicked:(id)sender {
    UIButton* senderButton = (UIButton*)sender;
    UserPopoverViewController *userPop = [[UserPopoverViewController alloc] init];
    UIPopoverController *popVC = [[UIPopoverController alloc] initWithContentViewController:userPop];
    userPop.delegate = self;
    [popVC setPopoverContentSize:CGSizeMake(300, 300) animated:YES];
    [popVC presentPopoverFromRect:senderButton.bounds inView:self.view permittedArrowDirections:UIPopoverArrowDirectionUp animated:YES];
}

#pragma mark -UITableView Datasource and Delegate methods 

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UsersTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"userCells"];
    return cell;
}

@end
