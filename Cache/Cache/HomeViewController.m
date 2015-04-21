//
//  HomeViewController.m
//  Cache
//
//  Created by Manish Shukla on 4/21/15.
//  Copyright (c) 2015 Cache. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()

@property (weak, nonatomic) UIButton* logoutButton;
@property (weak, nonatomic) UIButton* searchButton;
@property (retain, nonatomic) UILabel* welcomeLabel;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.welcomeLabel = [[UILabel alloc] initWithFrame:CGRectMake(80, 75, 300, 75)];
    [self.welcomeLabel setFont:[UIFont fontWithName:@"Avenir Next" size:75.0]];
    [self.welcomeLabel setTextColor:[UIColor whiteColor]];
    [self.welcomeLabel setBackgroundColor:[UIColor clearColor]];
    [self.welcomeLabel setText:@"Cache"];
    [self.view addSubview:self.welcomeLabel];
    NSLog(@"View did load");
    [self.logoutButton addTarget:self
                          action:@selector(logout)
                forControlEvents:UIControlEventTouchUpInside];
    [self.searchButton addTarget:self
                          action:@selector(searchButtonPressed)
                forControlEvents:UIControlEventTouchUpInside];
    
    // Do any additional setup after loading the view.
}

-(void) searchButtonPressed
{
    NSLog(@"Search button pressed");
}

-(void) viewWillAppear:(BOOL)animated
{
    NSLog(@"View will appear");
}

-(void) viewDidAppear:(BOOL)animated
{
    NSLog(@"VIEW DID APPEAR");
    [super viewDidAppear:animated];
    
    if (!([PFUser currentUser] && // Check if user is cached
        [PFFacebookUtils isLinkedWithUser:[PFUser currentUser]]))
    {
        NSLog(@"in if statement");
        LoginViewController *logInController = [[LoginViewController alloc] init];
        /*logInController.delegate = self;
        logInController.facebookPermissions = @[@"friends_about_me"];
        logInController.fields = PFLogInFieldsTwitter | PFLogInFieldsFacebook | PFLogInFieldsDismissButton; // Show Twitter login, Facebook login, and a Dismiss button.*/
        
        [self presentViewController:logInController animated:YES completion:nil];
    }
    
    
    
}
-(void)logout
{
    [PFUser logOut];
    LoginViewController *logInController = [[LoginViewController alloc] init];
    [self presentViewController:logInController animated:YES completion:nil];
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

@end
