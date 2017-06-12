//
//  DataManager.m
//  JSONParseDemo
//
//  Created by Naheed Shamim on 20/01/17.
//  Copyright © 2017 Naheed Shamim. All rights reserved.
//

#import "DataManager.h"
#import "User.h"

@implementation DataManager

- (NSMutableArray*) getUserListFromDictionary:(NSDictionary*)userDict
{
    NSMutableArray* userListArr = [[NSMutableArray alloc] init];
    
    NSArray* userArr = [userDict objectForKey:@"data"];
    
    for (NSDictionary* aUserDict in userArr)
    {
        User* user = [[User alloc] initWithDictionary:aUserDict];
        [userListArr addObject:user];
    }
    return userListArr;
}

@end
