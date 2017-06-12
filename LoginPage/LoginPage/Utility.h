//
//  Utility.h
//  LoginPage
//
//  Created by Aditya Kumar on 07/02/17.
//  Copyright © 2017 mindfire. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Utility : NSObject

-(void)saveUserDataToNSUserDefaultForKey:(NSString *)key withValue:(NSString *)value;
-(NSString *)fetchNSUserDataForKey:(NSString *)keyString;

@end
