//
//  addNotesVC.h
//  LoginPage
//
//  Created by Aditya Kumar on 06/02/17.
//  Copyright © 2017 mindfire. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface addNotesVC : UIViewController
@property (weak, nonatomic) IBOutlet UITextField* titleInputTextField;

@property (weak, nonatomic) IBOutlet UITextView *descriptionTextView;


- (IBAction)saveNotes:(id)sender;

- (IBAction)backButton:(id)sender;

@end
