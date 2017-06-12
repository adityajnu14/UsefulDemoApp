//
//  ViewController.h
//  ImageDownloadApp
//
//  Created by Aditya Kumar on 20/01/17.
//  Copyright © 2017 mindfire. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <NSURLSessionDelegate, NSURLSessionDownloadDelegate>

@property (weak, nonatomic)IBOutlet UIImageView* _imageData;

- (IBAction)clickToDownload:(id)sender;
@end

