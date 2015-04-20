//
//  LogInViewController.m
//  Cache
//
//  Created by Manish Shukla on 4/15/15.
//  Copyright (c) 2015 Sean Leonard. All rights reserved.
//

#import "LogInViewController.h"



@interface LogInViewController ()

@end

@implementation LogInViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    NSLog(@"viewdidload Login View");
    
   // FBSDKLoginButton *loginButton = [[FBSDKLoginButton alloc] init];
    //loginButton.center = self.view.center;
   //[self.view addSubview:loginButton];
    
  /*  PFObject *testObject = [PFObject objectWithClassName:@"TestObject"];
    testObject[@"foo"] = @"bar";
    [testObject saveInBackground];*/
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)_loginWithFacebook {
    NSLog(@"In the login function");
    // Set permissions required from the facebook user account
    NSArray *permissionsArray = @[ @"user_about_me", @"user_relationships", @"user_birthday", @"user_location"];
    
    // Login PFUser using Facebook
    [PFFacebookUtils logInInBackgroundWithReadPermissions:permissionsArray block:^(PFUser *user, NSError *error) {
        if (!user) {
            NSLog(@"Uh oh. The user cancelled the Facebook login.");
        } else if (user.isNew) {
            NSLog(@"User signed up and logged in through Facebook!");
        } else {
            NSLog(@"User logged in through Facebook!");
            [[self presentingViewController] dismissViewControllerAnimated:NO completion:nil];
        }
    }];
}

-(IBAction)fbLogIn{
    [self _loginWithFacebook];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
