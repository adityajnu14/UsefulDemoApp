//
//  Contact.h
//  CoreDataApp
//
//  Created by Aditya Kumar on 02/02/17.
//  Copyright © 2017 mindfire. All rights reserved.
//

#import <CoreData/CoreData.h>

@interface Contact : NSManagedObject

@property (nonatomic, nullable, copy)NSString* contact_id;
@property (nonatomic, nullable, copy)NSString* email;
@property (nonatomic, nullable, copy)NSString* name;
@property (nonatomic, nullable, copy)NSString* phone;

@end
