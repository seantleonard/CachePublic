//
//  User.m
//  Cache
//
//  Created by Manish Shukla on 4/21/15.
//  Copyright (c) 2015 Cache. All rights reserved.
//

#import "User.h"

@interface User ()

@property(retain, nonatomic) NSString* fullName;
@property (retain, nonatomic) NSString* firstName;


@end

@implementation User

-(id) initWithFirstName:(NSString*) firstName
               fullName:(NSString*) fullName
{
    self = [super init];
    if (self)
    {
        self.fullName = fullName;
        self.firstName = firstName;
        
    }
    return self;
}

-(void) setFullName:(NSString *)fullName
{
    self.fullName = fullName;
}

-(void) setFirstName:(NSString *)firstName
{
    self.firstName = firstName;
}

@end
