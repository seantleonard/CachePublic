//
//  MenuViewController.h
//  Cache
//
//  Created by Manish Shukla on 4/28/15.
//  Copyright (c) 2015 Cache. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import <ParseUI/PFLogInViewController.h>
#import <ParseUI/PFSignUpViewController.h>
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import <ParseFacebookUtilsV4/PFFacebookUtils.h>

@interface MenuViewController : UIViewController
-(void) setProfilePicture:(UIImageView*) imageView;
-(void) setUserName:(NSString*) name;
@end
