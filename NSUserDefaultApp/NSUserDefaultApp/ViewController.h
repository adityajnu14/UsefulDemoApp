//
//  ViewController.h
//  NSUserDefaultApp
//
//  Created by Aditya Kumar on 24/01/17.
//  Copyright © 2017 mindfire. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIImagePickerControllerDelegate, UINavigationControllerDelegate>
{
    
    __weak IBOutlet UIImageView* _imageView;
    __weak IBOutlet UITextField* _firstNameTextField;
    __weak IBOutlet UITextField* _lastNameTextField;
    __weak IBOutlet UITextField* _ageTextField;
}

- (IBAction)save:(id)sender;
-(IBAction)chooseImage:(id)sender;

@end

