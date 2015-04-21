//
//  ViewController.m
//  Cache
//
//  Created by Manish Shukla on 4/20/15.
//  Copyright (c) 2015 Cache. All rights reserved.
//

#import "LoginViewController.h"
#import "HomeViewController.h"

@interface LoginViewController ()
@property (strong, nonatomic) UILabel* loading;
@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self _loadData];
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
            if (![PFFacebookUtils isLinkedWithUser:user])
            {
                [PFFacebookUtils linkUserInBackground:user withReadPermissions:nil block:^(BOOL succeeded, NSError *error) {
                    if (succeeded) {
                        NSLog(@"Woohoo, user is linked with Facebook!");
                    }
                }];
            }
            
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
    HomeViewController *HVC = [[HomeViewController alloc] init];
    [self presentViewController:HVC animated:YES completion:nil];
}

-(void) fbLogIn
{
    [self _loginWithFacebook];
}

- (void)_loadData {
    // ...
    FBSDKGraphRequest *request = [[FBSDKGraphRequest alloc] initWithGraphPath:@"me" parameters:nil];
    [request startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error)
    {
        if (!error)
        {
            // result is a dictionary with the user's Facebook data
            NSDictionary *userData = (NSDictionary *)result;
            
            NSString *facebookID = userData[@"id"];
            NSString *name = userData[@"name"];
            NSString *location = userData[@"location"][@"name"];
            NSString *gender = userData[@"gender"];
            NSString *birthday = userData[@"birthday"];
            NSString *relationship = userData[@"relationship_status"];
            
            NSURL *pictureURL = [NSURL URLWithString:[NSString stringWithFormat:@"https://graph.facebook.com/%@/picture?type=large&return_ssl_resources=1", facebookID]];
            
            NSURLRequest *urlRequest = [NSURLRequest requestWithURL:pictureURL];
            
            // Run network request asynchronously
            [NSURLConnection sendAsynchronousRequest:urlRequest
                                               queue:[NSOperationQueue mainQueue]
                                   completionHandler:
             ^(NSURLResponse *response, NSData *data, NSError *connectionError) {
                 if (connectionError == nil && data != nil) {
                     // Set the image in the imageView
                     // ...
                 }
             }];
            
            // Now add the data to the UI elements
            // ...
        }
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
