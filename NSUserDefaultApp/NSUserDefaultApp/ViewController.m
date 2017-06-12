//
//  ViewController.m
//  NSUserDefaultApp
//
//  Created by Aditya Kumar on 24/01/17.
//  Copyright © 2017 mindfire. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    
    NSUserDefaults* defaultData = [NSUserDefaults standardUserDefaults];
    NSString* firstName = [defaultData objectForKey:@"firstName"];
    NSString* lastName = [defaultData objectForKey:@"lastName"];
    NSString* age = [defaultData objectForKey:@"age"];
    NSData* imageData = [defaultData objectForKey:@"image"];
    UIImage* image = [UIImage imageWithData:imageData];
    
    _firstNameTextField.text = firstName;
    _lastNameTextField.text = lastName;
    _ageTextField.text = age;
    _imageView.image = image;
    

    
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)save:(id)sender
{
    //hide keyboard
    [_firstNameTextField resignFirstResponder];
    [_lastNameTextField resignFirstResponder];
    [_ageTextField resignFirstResponder];
    
    //converting data into string and nsdata format so that we can save these
    
    NSString* firstName = [_firstNameTextField text];
    NSString* lastName = [_lastNameTextField text];
    NSString* age = [_ageTextField text];
    UIImage* image = _imageView.image;
    NSData* imageData = UIImageJPEGRepresentation(image, 100);
    
    NSUserDefaults* defaultsDataStore = [NSUserDefaults standardUserDefaults];
    [defaultsDataStore setObject:firstName forKey:@"firstName"];
    [defaultsDataStore setObject:lastName forKey:@"lastName"];
    [defaultsDataStore setObject:age forKey:@"age"];
    [defaultsDataStore setObject:imageData forKey:@"image"];
    
    [defaultsDataStore synchronize];
    
    NSLog(@"\n User Data Saved ");
    
}

-(IBAction)chooseImage:(id)sender
{
    UIImagePickerController* picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    [self presentViewController:picker animated:YES completion:nil];
    
}

#pragma - Image Picker Delegate

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(nullable NSDictionary<NSString *,id> *)editingInfo
{
    _imageView.image = image;
    [picker dismissViewControllerAnimated:YES completion:nil];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    
[picker dismissViewControllerAnimated:YES completion:nil];
}

@end
