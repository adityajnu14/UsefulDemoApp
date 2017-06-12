//
//  DataManager.h
//  LoginPage
//
//  Created by Aditya Kumar on 08/02/17.
//  Copyright © 2017 mindfire. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Note.h"

@interface DataManager : NSObject

-(void)saveNote:(Note *)note;

-(NSMutableArray *)getNotesData;

@end
