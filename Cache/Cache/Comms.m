//
//  Comms.m
//  Cache
//
//  Created by Manish Shukla on 4/21/15.
//  Copyright (c) 2015 Cache. All rights reserved.
//

#import "Comms.h"
#import <ParseFacebookUtilsV4/PFFacebookUtils.h>

@implementation Comms

+ (void) login:(id<CommsDelegate>)delegate
{
    // Basic User information and your friends are part of the standard permissions
    // so there is no reason to ask for additional permissions
    [PFFacebookUtils logInInBackgroundWithPublishPermissions:nil block:^(PFUser *user, NSError *error) {
        // Was login successful ?
        if (!user) {
            if (!error) {
                NSLog(@"The user cancelled the Facebook login.");
            } else {
                NSLog(@"An error occurred: %@", error.localizedDescription);
            }
            
            // Callback - login failed
            if ([delegate respondsToSelector:@selector(commsDidLogin:)]) {
                [delegate commsDidLogin:NO];
            }
        } else {
            if (user.isNew) {
                NSLog(@"User signed up and logged in through Facebook!");
            } else {
                NSLog(@"User logged in through Facebook!");
            }
            
            // Callback - login successful
            if ([delegate respondsToSelector:@selector(commsDidLogin:)]) {
                [delegate commsDidLogin:YES];
            }
        }
    }];
}

@end
