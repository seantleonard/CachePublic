//
//  LogInViewController.h
//  Cache
//
//  Created by Manish Shukla on 4/15/15.
//  Copyright (c) 2015 Sean Leonard. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import <ParseUI/PFLogInViewController.h>
#import <ParseUI/PFSignUpViewController.h>
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import <ParseFacebookUtilsV4/PFFacebookUtils.h>

#import <Foundation/Foundation.h>



@interface LogInViewController : UIViewController <PFLogInViewControllerDelegate>

@property (nonatomic, weak) UIButton *fbLoginButton;

-(IBAction) fbLogIn;

@end

