//
//  UserDataFile.m
//  LoginPage
//
//  Created by Aditya Kumar on 03/02/17.
//  Copyright © 2017 mindfire. All rights reserved.
//

#import "UserDataFile.h"

@implementation UserDataFile

-(instancetype) initWithTitle:(NSString *)title description:(NSString *)desc
{
    self = [super init];
    
    if(self)
    {
    self.titleOfTheNotes = title;
    self.descriptionOfTheNotes = desc;
    }
    
    return self;
}

@end
