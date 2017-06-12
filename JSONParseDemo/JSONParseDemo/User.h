//
//  User.h
//  JSONParseDemo
//
//  Created by Naheed Shamim on 20/01/17.
//  Copyright © 2017 Naheed Shamim. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

@property (nonatomic) int userID;
@property (nonatomic,strong) NSString* firstName;
@property (nonatomic,strong) NSString* lastName;
@property (nonatomic,strong) NSString* profileImageUrl;

- (instancetype) initWithDictionary:(NSDictionary*)dict;

@end
