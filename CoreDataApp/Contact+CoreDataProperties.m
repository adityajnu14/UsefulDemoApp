//
//  Contact+CoreDataProperties.m
//  CoreDataApp
//
//  Created by Aditya Kumar on 02/02/17.
//  Copyright © 2017 mindfire. All rights reserved.
//  This file was automatically generated and should not be edited.
//

#import "Contact+CoreDataProperties.h"

@implementation Contact (CoreDataProperties)

+ (NSFetchRequest<Contact *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Contact"];
}

@dynamic contact_id;
@dynamic email;
@dynamic name;
@dynamic phone;

@end
