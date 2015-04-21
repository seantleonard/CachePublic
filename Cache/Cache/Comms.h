//
//  Comms.h
//  Cache
//
//  Created by Manish Shukla on 4/21/15.
//  Copyright (c) 2015 Cache. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol CommsDelegate <NSObject>
@optional
- (void) commsDidLogin:(BOOL)loggedIn;
@end

@interface Comms : NSObject
+ (void) login:(id<CommsDelegate>)delegate;
@end