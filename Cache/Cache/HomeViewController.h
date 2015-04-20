//
//  HomeViewController.h
//  Cache
//
//  Created by Sean Leonard on 4/19/15.
//  Copyright (c) 2015 Sean Leonard. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import <ParseFacebookUtilsV4/PFFacebookUtils.h>
#import "LogInViewController.h"


@interface HomeViewController : UIViewController 

@property (nonatomic, weak) IBOutlet UIButton *logoutButton;
@property (nonatomic, weak) IBOutlet UIButton *searchProductButton;
@property (nonatomic, weak) IBOutlet UIButton *settingsButton;
@property (nonatomic, strong) IBOutlet UILabel *welcomeLabel;


- (IBAction)logOut;

@end
