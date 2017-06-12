//
//  ViewController.h
//  CameraApp
//
//  Created by Aditya Kumar on 31/01/17.
//  Copyright © 2017 mindfire. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIImagePickerControllerDelegate, UINavigationControllerDelegate>
@property (weak, nonatomic) IBOutlet UIImageView* imageView;

- (IBAction)savePhoto:(id)sender;
- (IBAction)takePhoto:(id)sender;

@end

