//
//  ViewController.m
//  Cache
//
//  Created by Manish Shukla on 4/20/15.
//  Copyright (c) 2015 Cache. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()
@property (strong, nonatomic) UILabel* loading;
@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //UIImageView *backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"background"]];
    //[self.view addSubview:backgroundView];
    FBSDKLoginButton *loginButton = [[FBSDKLoginButton alloc] init];
    //loginButton.center = self.view.center;
    UIImageView *backgroundImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"background"]];
    [backgroundImageView setFrame:CGRectMake(0, 0, 380, 675)];
    [self.view addSubview:backgroundImageView];
    UILabel * loading = [[UILabel alloc] initWithFrame:CGRectMake(80, 75, 300, 75)];
    [loading setFont:[UIFont fontWithName:@"Avenir Next" size:75.0]];
    [loading setTextColor:[UIColor whiteColor]];
    [loading setBackgroundColor:[UIColor clearColor]];
    [loading setText:@"Cache"];
    [self.view addSubview:loading];
    //    self.loading = [[UILabel alloc] initWithFrame:CGRectMake(165, 50, 400.0, 400.0)];
    //    self.loading.adjustsFontSizeToFitWidth = YES;
    //    [self.loading setFont:[UIFont fontWithName:@"AvenirNext" size:200.0]];
    //    [self.loading setTextColor:[UIColor whiteColor]];
    //    [self.loading setBackgroundColor:[UIColor clearColor]];
    //    [self.loading setText:@"Cache"];
    //    [self.view addSubview:self.loading];
    //[loading setCenter:self.view.center];
    UIImageView *iconImageView = [[UIImageView alloc] init];
    UIImage *iconImage = [UIImage imageNamed:@"sqre"];
    iconImageView.frame = CGRectMake(75, 200, 250, 200);
    [iconImageView setImage:iconImage];
    [self.view addSubview:iconImageView];
    loginButton.frame = CGRectMake(55, 500, 271, 37);
    [self.view addSubview:loginButton];
    PFObject *testObject = [PFObject objectWithClassName:@"TestObject"];
    testObject[@"foo"] = @"bar";
    [testObject saveInBackground];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)_loginWithFacebook
{
        NSLog(@"In the login function");
        // Set permissions required from the facebook user account
        NSArray *permissionsArray = @[ @"user_about_me", @"user_relationships", @"user_birthday", @"user_location"];
    
        // Login PFUser using Facebook
        [PFFacebookUtils logInInBackgroundWithReadPermissions:permissionsArray block:^(PFUser *user, NSError *error)
        {
            if (!user)
            {
                NSLog(@"Uh oh. The user cancelled the Facebook login.");
            }
            else if (user.isNew)
            {
                NSLog(@"User signed up and logged in through Facebook!");
            }
            else
            {
                NSLog(@"User logged in through Facebook!");
                [[self presentingViewController] dismissViewControllerAnimated:NO completion:nil];
            }
       }];
}

-(IBAction) fbLogIn
{
    [self _loginWithFacebook];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
