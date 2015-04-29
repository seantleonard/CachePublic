//
//  MenuViewController.m
//  Cache
//
//  Created by Manish Shukla on 4/28/15.
//  Copyright (c) 2015 Cache. All rights reserved.
//

#import "MenuViewController.h"
#import "HomeViewController.h"
#import "WantsViewController.h"

@interface MenuViewController ()
@property (retain, nonatomic) UIImageView* menuImageView;
@property (weak, nonatomic) NSString* fullName;
@property UINavigationController* navC;
@property WantsViewController* wantController;
@end

@implementation MenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImageView *backgroundImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"menu"]];
    [backgroundImageView setFrame:CGRectMake(0, 0, 380, 675)];
    [self.view addSubview:backgroundImageView];
    [self getProfilePicture];
    [self getUserName];
    UIButton* exitButton = [[UIButton alloc] initWithFrame:CGRectMake(0,0, 380, 675)];
    [exitButton addTarget:self
                        action:@selector(exit)
              forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:exitButton];
    UIButton *wantsButton = [[UIButton alloc] initWithFrame:CGRectMake(20, 200, 250,50)];
   // [wantsButton setImage:[UIImage imageNamed:@"signIn"] forState:UIControlStateNormal];
    [wantsButton addTarget:self
                    action:@selector(showWants)
          forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:wantsButton];

    // Do any additional setup after loading the view.
}

-(void) showWants
{
   // NSLog(@"Wnats clicked:");
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

-(void) exit
{
    HomeViewController *HVC = [[HomeViewController alloc] init];
    [self presentViewController:HVC animated:YES completion:nil];
}

-(void) viewDidAppear:(BOOL)animated
{
    [self.view addSubview:self.menuImageView];
}

-(void) setProfilePicture:(UIImageView*) imageView
{
    self.menuImageView = imageView;
}

-(void) getProfilePicture
{
    [self.view addSubview:self.menuImageView];
}

-(void) getUserName
{
    UILabel* nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(120, 65, 200, 50)];
    nameLabel.text = self.fullName;
    [nameLabel setTextColor:[UIColor whiteColor]];
    [nameLabel setFont:[UIFont fontWithName:@"Avenir Next" size:18]];
    [self.view addSubview:nameLabel];
}

-(void) setUserName:(NSString*) name
{
    self.fullName = name;
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
