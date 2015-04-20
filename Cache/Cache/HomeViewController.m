//
//  HomeViewController.m
//  Cache
//
//  Created by Sean Leonard on 4/19/15.
//  Copyright (c) 2015 Sean Leonard. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSLog(@"view DId Load");
    
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    NSLog(@"view will appear");

    /*
    if (!([PFUser currentUser] && // Check if user is cached
        [PFFacebookUtils isLinkedWithUser:[PFUser currentUser]])) { // Check if user is linked to Facebook
        
        LogInViewController *logInController = [[LogInViewController alloc] init];
        
        [self presentViewController:logInController animated:YES completion:nil];
    }*/
}


- (void)viewDidAppear:(BOOL)animated {
    NSLog(@"view DId appear");

    [super viewDidAppear:animated];
    if (!([PFUser currentUser] && // Check if user is cached
          [PFFacebookUtils isLinkedWithUser:[PFUser currentUser]])) { // Check if user is linked to Facebook
        NSLog(@"in if statement");
        LogInViewController *logInController = [[LogInViewController alloc] init];
        /*logInController.delegate = self;
        logInController.facebookPermissions = @[@"friends_about_me"];
        logInController.fields = PFLogInFieldsTwitter | PFLogInFieldsFacebook | PFLogInFieldsDismissButton; // Show Twitter login, Facebook login, and a Dismiss button.*/
        
        [self presentViewController:logInController animated:YES completion:nil];
    }
    
   /* // Check if user is logged in
    if (![PFUser currentUser]) {
        // If not logged in, we will show a PFLogInViewController
        PFLogInViewController *logInViewController = [[PFLogInViewController alloc] init];
        
        // Customize the Log In View Controller
        logInViewController.delegate = self;
        logInViewController.facebookPermissions = @[@"friends_about_me"];
        logInViewController.fields = PFLogInFieldsTwitter | PFLogInFieldsFacebook | PFLogInFieldsDismissButton; // Show Twitter login, Facebook login, and a Dismiss button.
        
        // Present Log In View Controller
        [self presentViewController:logInViewController animated:YES completion:NULL];
    }*/
}

-(IBAction)logOut {
    [PFUser logOut];
    LogInViewController *logInController = [[LogInViewController alloc] init];
    [self presentViewController:logInController animated:YES completion:nil];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
