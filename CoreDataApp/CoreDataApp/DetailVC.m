//
//  DetailVC.m
//  CoreDataApp
//
//  Created by Aditya Kumar on 27/01/17.
//  Copyright © 2017 mindfire. All rights reserved.
//

#import "DetailVC.h"

@interface DetailVC ()<UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@end

@implementation DetailVC
@synthesize contact;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.imageView.layer.cornerRadius = self.imageView.frame.size.width / 2;
    self.imageView.clipsToBounds = YES;
    
    if(self.contact)
        [self showUserDataFromCoreData];
}



-(void)showUserDataFromCoreData
{
    [self.nameTextField setText:[self.contact valueForKey:@"name"]];
    [self.phoneTextField setText:[self.contact valueForKey:@"phone"]];
    [self.emailTextField setText:[self.contact valueForKey:@"email"]];
    
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsPath = [paths objectAtIndex:0]; //Get the docs directory
    NSString *filePath = [documentsPath stringByAppendingPathComponent:[NSString stringWithFormat:@"%@",[self.contact valueForKey:@"contact_id"]]];
    
    NSData *pngData = [NSData dataWithContentsOfFile:filePath];
    UIImage *imageData = [UIImage imageWithData:pngData];
    self.imageView.image = imageData;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (NSManagedObjectContext *)managedObjectContext {
    NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication] delegate];
    if ([delegate performSelector:@selector(managedObjectContext)]) {
        context = [delegate managedObjectContext];
    }
    return context;
}





- (IBAction)save:(id)sender {
   
    NSManagedObjectContext *context = [self managedObjectContext];
    
    
    if(!self.contact)
    {
         Contact *newContact = [NSEntityDescription insertNewObjectForEntityForName:@"Contact" inManagedObjectContext:context];
        self.contact = newContact;
    }
   
        
    self.contact.name = _nameTextField.text;
    self.contact.phone = _phoneTextField.text;
    self.contact.email = _emailTextField.text;
    
    
        NSData *pngData = UIImagePNGRepresentation(_imageView.image);
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *documentsPath = [paths objectAtIndex:0]; //Get the docs directory
        NSDate* dateForContactId = [NSDate date];
        NSString* filePath = [documentsPath stringByAppendingPathComponent:[NSString stringWithFormat:@"%@",dateForContactId]]; //Add the file name
        [pngData writeToFile:filePath atomically:YES]; //Write the file
    
    
    self.contact.contact_id = [NSString stringWithFormat:@"%@",dateForContactId];
    
    NSError *error = nil;
    // Save the object to persistent store
    if (![context save:&error]) {
        NSLog(@"Can't Save! %@ %@", error, [error localizedDescription]);
    }
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
    
}

- (IBAction)cancel:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];

}


- (IBAction)chooseImage:(id)sender
{
    UIImagePickerController* picker = [[UIImagePickerController alloc]init];
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
