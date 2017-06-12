//
//  secondViewController.m
//  CustomViewTable
//
//  Created by Aditya Kumar on 18/01/17.
//  Copyright © 2017 mindfire. All rights reserved.
//

#import "secondViewController.h"

@interface secondViewController ()

@end

@implementation secondViewController

@synthesize _secondControllerName;
@synthesize _secondControllerPhone;
@synthesize _secondControllerEmail;

@synthesize _secondControllerImage;

- (void)viewDidLoad {
    [super viewDidLoad];
    _secondControllerName.text = contactDetails._nameData;
    _secondControllerPhone.text = contactDetails._phoneData;
    _secondControllerEmail.text = contactDetails._emailData;
    _secondControllerImage.image = [UIImage imageNamed:contactDetails._imageData];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) setDataToSecondViewController:(ContactFile *)contactDetail
{
    contactDetails = contactDetail;

}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
