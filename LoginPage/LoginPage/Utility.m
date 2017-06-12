//
//  Utility.m
//  LoginPage
//
//  Created by Aditya Kumar on 07/02/17.
//  Copyright © 2017 mindfire. All rights reserved.
//

#import "Utility.h"

@implementation Utility

-(void)saveUserDataToNSUserDefaultForKey:(NSString *)key withValue:(NSString *)value
{
    NSUserDefaults* defaultsDataStore = [NSUserDefaults standardUserDefaults];
    [defaultsDataStore setObject:value forKey:key];
    [defaultsDataStore synchronize];

}


-(NSString *)fetchNSUserDataForKey:(NSString *)keyString
{
    NSUserDefaults* defaultsDataStore = [NSUserDefaults standardUserDefaults];
    return  [defaultsDataStore objectForKey:keyString];
        
}
@end
