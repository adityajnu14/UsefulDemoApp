//
//  UserDataFile.h
//  LoginPage
//
//  Created by Aditya Kumar on 03/02/17.
//  Copyright © 2017 mindfire. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface UserDataFile : NSObject
@property (nonatomic, strong)NSString* titleOfTheNotes;
@property (nonatomic, strong)NSString* descriptionOfTheNotes;

-(instancetype) initWithTitle:(NSString *)title description:(NSString *)desc;
@end
