//
//  HomeViewController.m
//  Cache
//
//  Created by Manish Shukla on 4/21/15.
//  Copyright (c) 2015 Cache. All rights reserved.
//

#import "HomeViewController.h"
#import "LoginViewController.h"

@interface HomeViewController ()

@property (weak, nonatomic) UIButton* logoutButton;
@property (retain, nonatomic) UILabel* welcomeLabel;
@property LoginViewController* logInController;
@property PFUser* user;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.user = [PFUser currentUser];
    FBSDKGraphRequest *request = [[FBSDKGraphRequest alloc] initWithGraphPath:@"me" parameters:nil];
    [request startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error)
     {
         if (!error)
         {
             NSLog(@"User is in here");
             NSDictionary *userData = (NSDictionary *)result;
             NSString* facebookID = userData[@"id"];
             
             NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"https://graph.facebook.com/%@/picture?type=large", facebookID]];
             NSData *data = [NSData dataWithContentsOfURL:url];
             UIImage *profilePic = [[UIImage alloc] initWithData:data];
             UIImageView* profileImageView = [[UIImageView alloc] initWithFrame:CGRectMake(85, 350, 200, 200)];
            // UIImageView* profileImageView = [[UIImageView alloc] init];
             profileImageView.layer.cornerRadius = profileImageView.frame.size.height /2;
             profileImageView.layer.masksToBounds = YES;
             profileImageView.layer.borderWidth = 0;
             [profileImageView setImage:profilePic];
             [self.view addSubview:profileImageView];
             
             
            // profileImageView.frame = CGRectMake(0, 0, 250, 200);
            // [self.view addSubview:profileImageView];

             

        }
     }];

    //self.logInController = [[LoginViewController alloc] init];
    self.welcomeLabel = [[UILabel alloc] initWithFrame:CGRectMake(75, 75, 300, 75)];
    [self.welcomeLabel setFont:[UIFont fontWithName:@"Avenir Next" size:25.0]];
    [self.welcomeLabel setTextColor:[UIColor whiteColor]];
    [self.welcomeLabel setBackgroundColor:[UIColor clearColor]];
    [self.welcomeLabel setText:@"Welcome to Cache"];
    [self.view addSubview:self.welcomeLabel];
    NSLog(@"View did load");
    self.logoutButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.logoutButton setFrame:CGRectMake(150, 200, 75, 25)];
    [self.logoutButton addTarget:self
                          action:@selector(logout)
                forControlEvents:UIControlEventTouchUpInside];
    [self.logoutButton setBackgroundColor:[self colorWithHexString:@"3b5998"]];
    [self.logoutButton setTitle:@"Logout" forState:UIControlStateNormal];
    [self.view addSubview:self.logoutButton];
    // Do any additional setup after loading the view.
}

-(void) viewWillAppear:(BOOL)animated
{
    NSLog(@"View will appear");
   /* if ([PFUser currentUser] && // Check if user is cached
        [PFFacebookUtils isLinkedWithUser:[PFUser currentUser]]) { // Check if user is linked to Facebook
        
        PFLogInViewController *controller = [[PFLogInViewController alloc] init];
        self.logInController.fields = (PFLogInFieldsUsernameAndPassword
                                  | PFLogInFieldsFacebook
                                  | PFLogInFieldsDismissButton);
        [self presentViewController:controller animated:YES];
    }
*/
}

-(void) viewDidAppear:(BOOL)animated
{
    NSLog(@"VIEW DID APPEAR");
    [super viewDidAppear:animated];
    
    
  /*  if (!([PFUser currentUser] && // Check if user is cached
        [PFFacebookUtils isLinkedWithUser:[PFUser currentUser]]))
    {
        NSLog(@"in if statement");
        LoginViewController *logInController = [[LoginViewController alloc] init];
        logInController.delegate = self;
        logInController.facebookPermissions = @[@"friends_about_me"];
        logInController.fields = PFLogInFieldsTwitter | PFLogInFieldsFacebook | PFLogInFieldsDismissButton; // Show Twitter login, Facebook login, and a Dismiss button.
        
        [self presentViewController:logInController animated:YES completion:nil];
   
    }
   */
    
    
    
    
}



- (void) logout
{
    [PFUser logOut]; // Log out
    NSLog(@"Logged out");
    self.logInController = [[LoginViewController alloc] init];
    [self presentViewController:self.logInController animated:YES completion:nil];
}
     
-(UIColor*)colorWithHexString:(NSString*)hex
{
        NSString *cString = [[hex stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
        
        // String should be 6 or 8 characters
        if ([cString length] < 6) return [UIColor grayColor];
        
        // strip 0X if it appears
        if ([cString hasPrefix:@"0X"]) cString = [cString substringFromIndex:2];
        
        if ([cString length] != 6) return  [UIColor grayColor];
        
        // Separate into r, g, b substrings
        NSRange range;
        range.location = 0;
        range.length = 2;
        NSString *rString = [cString substringWithRange:range];
        
        range.location = 2;
        NSString *gString = [cString substringWithRange:range];
        
        range.location = 4;
        NSString *bString = [cString substringWithRange:range];
        
        // Scan values
        unsigned int r, g, b;
        [[NSScanner scannerWithString:rString] scanHexInt:&r];
        [[NSScanner scannerWithString:gString] scanHexInt:&g];
        [[NSScanner scannerWithString:bString] scanHexInt:&b];
        
        return [UIColor colorWithRed:((float) r / 255.0f)
                               green:((float) g / 255.0f)  
                                blue:((float) b / 255.0f)  
                               alpha:1.0f];  
}

/*
-(void)logout
{
    [PFUser logOut];
    LoginViewController *logInController = [[LoginViewController alloc] init];
    [self presentViewController:logInController animated:YES completion:nil];
}
*/

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

@end
