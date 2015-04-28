//
//  HomeViewController.m
//  Cache
//
//  Created by Manish Shukla on 4/21/15.
//  Copyright (c) 2015 Cache. All rights reserved.
//

#import "HomeViewController.h"
#import "LoginViewController.h"
#import "WantsViewController.h"
#import "ProductSearchViewController.h"

@interface HomeViewController ()

@property (weak, nonatomic) UIButton* logoutButton;
@property (weak, nonatomic) UIButton* wantViewButton;
@property (weak, nonatomic) UIButton* productSearchViewButton;
@property (retain, nonatomic) UILabel* welcomeLabel;
@property LoginViewController* logInController;
@property ProductSearchViewController* prodSearchController;
@property UINavigationController* navC;
@property WantsViewController* wantController;
@property PFUser* user;
@property NSString* name;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (![PFUser currentUser]){
        self.logInController = [[LoginViewController alloc] init];
        [self presentViewController:self.logInController animated:YES completion:nil];
        
        
       
    }
    UIImageView *backgroundImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"home screen"]];
    [backgroundImageView setFrame:CGRectMake(0, 0, 380, 675)];
    [self.view addSubview:backgroundImageView];
    self.user = [PFUser currentUser];
  
  /*  PFQuery *query = [PFQuery queryWithClassName:@"_User"];
    [query getObjectInBackgroundWithId:@"dfBWrcNBHF" block:^(PFObject *user, NSError *error) {
        // Do something with the returned PFObject in the gameScore variable.
        self.name = user[@"first_name"];
    }];    //NSString* userFirstName = [theUser objectForKey:@"first_name"];
  */
    self.name = self.user[@"first_name"];
 /*   NSString* urlString = self.user[@"pictureLink"];
    NSURL* url = [NSURL URLWithString:urlString];
    NSLog(urlString);
    NSData* data = [NSData dataWithContentsOfURL:url];
    UIImage *profilePic = [[UIImage alloc] initWithData:data];
    UIImageView* profileImageView = [[UIImageView alloc] initWithFrame:CGRectMake(85, 350, 200, 200)];
    profileImageView.layer.cornerRadius = profileImageView.frame.size.height /2;
    profileImageView.layer.masksToBounds = YES;
    profileImageView.layer.borderWidth = 0;
    [profileImageView setImage:profilePic];
    [self.view addSubview:profileImageView];
  */
  /*  PFQuery *query = [PFQuery queryWithClassName:@"_User"];
    [query fromLocalDatastore];
    [[query getObjectInBackgroundWithId:[self.user objectForKey:@"objectId"]] continueWithBlock:^id(BFTask *task) {
        if (task.error) {
            // something went wrong;
            return task;
        }
        self.user = task.result;
        self.name = self.user[@"first_name"];
        NSData* data = self.user[@"profile_picture"];
        UIImage *profilePic = [[UIImage alloc] initWithData:data];
        UIImageView* profileImageView = [[UIImageView alloc] initWithFrame:CGRectMake(85, 350, 200, 200)];
        profileImageView.layer.cornerRadius = profileImageView.frame.size.height /2;
        profileImageView.layer.masksToBounds = YES;
        profileImageView.layer.borderWidth = 0;
        [profileImageView setImage:profilePic];
        [self.view addSubview:profileImageView];        // task.result will be your game score
        return task;
    }];
*/
/*    FBSDKGraphRequest *request = [[FBSDKGraphRequest alloc] initWithGraphPath:@"me" parameters:nil];
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
             profileImageView.layer.cornerRadius = profileImageView.frame.size.height /2;
             profileImageView.layer.masksToBounds = YES;
             profileImageView.layer.borderWidth = 0;
             [profileImageView setImage:profilePic];
             [self.view addSubview:profileImageView];
             
             
            // profileImageView.frame = CGRectMake(0, 0, 250, 200);
            // [self.view addSubview:profileImageView];

             

        }
     }];
 */

    //self.logInController = [[LoginViewController alloc] init];
    self.welcomeLabel = [[UILabel alloc] initWithFrame:CGRectMake(75, 75, 300, 75)];
    [self.welcomeLabel setFont:[UIFont fontWithName:@"Avenir" size:30]];
    [self.welcomeLabel setTextColor:[UIColor whiteColor]];
    [self.welcomeLabel setBackgroundColor:[UIColor clearColor]];
    NSString* welcomeString = [NSString stringWithFormat:@"Welcome, %@",self.name];
    //NSLog(self.name);
    //welcomeString = [welcomeString stringByAppendingString:self.name];
    //[welcomeString appendString:userFirstName];
    [self.welcomeLabel setText:welcomeString];
    [self.view addSubview:self.welcomeLabel];
    NSLog(@"View did load");
    
    //Add the Log Out button to the screen
    self.logoutButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.logoutButton setFrame:CGRectMake(150, 250, 75, 25)];
    [self.logoutButton addTarget:self
                          action:@selector(logout)
                forControlEvents:UIControlEventTouchUpInside];
    [self.logoutButton setBackgroundColor:[self colorWithHexString:@"3b5998"]];
    [self.logoutButton setTitle:@"Logout" forState:UIControlStateNormal];
  //  [self.view addSubview:self.logoutButton];
    
    //Add the Product Search button to the screen
    self.productSearchViewButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.productSearchViewButton setFrame:CGRectMake(150, 300, 150, 25)];
    [self.productSearchViewButton addTarget:self
                          action:@selector(searchPage)
                forControlEvents:UIControlEventTouchUpInside];
    [self.productSearchViewButton setBackgroundColor:[self colorWithHexString:@"3b5998"]];
    [self.productSearchViewButton setTitle:@"Product Search" forState:UIControlStateNormal];
  //  [self.view addSubview:self.productSearchViewButton];
    
    //Add the want view button to the screen
    self.wantViewButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.wantViewButton setFrame:CGRectMake(150, 200, 100, 25)];
    [self.wantViewButton addTarget:self
                          action:@selector(wantShow)
                forControlEvents:UIControlEventTouchUpInside];
    [self.wantViewButton setBackgroundColor:[self colorWithHexString:@"3b5998"]];
    [self.wantViewButton setTitle:@"My Wants" forState:UIControlStateNormal];
   // [self.view addSubview:self.wantViewButton];

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

-(void) wantShow
{
    
    
    self.wantController = [[WantsViewController alloc] init];
    //self.wantController =
    
    //UIViewController *foo = [[UIViewController alloc] initWithNibName:@"PopoverView" bundle:nil];
    // Here you pass through properties if you need too.
    // ...
    self.navC = [[UINavigationController alloc] initWithRootViewController: self.wantController ];
  //  self.navC = [initWithNavigationBarClass: ];
   // [self.wantController release];
    
    [self presentViewController:self.navC animated:YES completion:nil];
    //[self presentViewController:self. animated:YES completion:nil];

}



- (void) logout
{
    [PFUser logOut]; // Log out
    NSLog(@"Logged out");
    self.logInController = [[LoginViewController alloc] init];
    [self presentViewController:self.logInController animated:YES completion:nil];
}

- (void) searchPage
{
   
    self.prodSearchController = [[ProductSearchViewController alloc] init];
    [self presentViewController:self.prodSearchController animated:YES completion:nil];
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
