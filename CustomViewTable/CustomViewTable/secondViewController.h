//
//  secondViewController.h
//  CustomViewTable
//
//  Created by Aditya Kumar on 18/01/17.
//  Copyright © 2017 mindfire. All rights reserved.
//

#import "ViewController.h"
#import "ContactFile.h"
@interface secondViewController : ViewController
{
    ContactFile* contactDetails;
}

@property (nonatomic, strong) IBOutlet UILabel*  _secondControllerName;
@property (nonatomic, strong) IBOutlet UILabel*  _secondControllerPhone;
@property (nonatomic, strong) IBOutlet UILabel*  _secondControllerEmail;

@property (nonatomic, strong) IBOutlet UIImageView*  _secondControllerImage;

-(void)setDataToSecondViewController:(ContactFile *)contactDetail;
@end
