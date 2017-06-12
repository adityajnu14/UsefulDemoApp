//
//  User.m
//  JSONParseDemo
//
//  Created by Naheed Shamim on 20/01/17.
//  Copyright © 2017 Naheed Shamim. All rights reserved.
//

#import "User.h"

@implementation User

- (instancetype) initWithDictionary:(NSDictionary*)dict
{
    self = [super init];
    if (self)
    {
        self.userID = ((NSString*)[dict objectForKey:@"id"]).intValue;
        self.firstName = [dict objectForKey:@"first_name"];
        self.lastName = [dict objectForKey:@"last_name"];
        self.profileImageUrl = [dict objectForKey:@"avatar"];
    }
    return self;
}

@end
