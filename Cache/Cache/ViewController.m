//
//  ViewController.m
//  Cache
//
//  Created by Manish Shukla on 4/20/15.
//  Copyright (c) 2015 Cache. All rights reserved.
//

#import "ViewController.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //UIImageView *backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"background"]];
    //[self.view addSubview:backgroundView];
    FBSDKLoginButton *loginButton = [[FBSDKLoginButton alloc] init];
    //loginButton.center = self.view.center;
    UIImageView *backgroundImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"background"]];
    [backgroundImageView setFrame:CGRectMake(0, 0, 380, 675)];
    [self.view addSubview:backgroundImageView];
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
