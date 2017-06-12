//
//  DetailVC.h
//  CoreDataApp
//
//  Created by Aditya Kumar on 27/01/17.
//  Copyright © 2017 mindfire. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CoreData/CoreData.h"
#import "Contact.h"

@interface DetailVC : UIViewController
@property (weak, nonatomic) IBOutlet UITextField* nameTextField;
@property (weak, nonatomic) IBOutlet UITextField* phoneTextField;
@property (weak, nonatomic) IBOutlet UITextField* emailTextField;
@property (weak, nonatomic) IBOutlet UIImageView* imageView;

@property (strong) Contact* contact;

- (IBAction)save:(id)sender;
- (IBAction)cancel:(id)sender;
- (IBAction)chooseImage:(id)sender;
@end
