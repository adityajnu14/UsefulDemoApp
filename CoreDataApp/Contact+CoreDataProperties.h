//
//  Contact+CoreDataProperties.h
//  CoreDataApp
//
//  Created by Aditya Kumar on 02/02/17.
//  Copyright © 2017 mindfire. All rights reserved.
//  This file was automatically generated and should not be edited.
//

#import "Contact+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Contact (CoreDataProperties)

+ (NSFetchRequest<Contact *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *contact_id;
@property (nullable, nonatomic, copy) NSString *email;
@property (nullable, nonatomic, copy) NSString *name;
@property (nullable, nonatomic, copy) NSString *phone;

@end

NS_ASSUME_NONNULL_END
