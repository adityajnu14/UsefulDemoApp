//
//  SignUpVC.m
//  LoginPage
//
//  Created by Aditya Kumar on 06/02/17.
//  Copyright © 2017 mindfire. All rights reserved.
//

#import "SignUpVC.h"
#import "Utility.h"

@interface SignUpVC ()<UITextFieldDelegate>
{
    BOOL formFieldCheck;
}
@end

@implementation SignUpVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    formFieldCheck = true;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// This method is is to check input data

- (IBAction)signUp_Action:(id)sender {
    if(formFieldCheck == NO)
    {
        [self promptErrorMassage:@"Invalid Email id"];
    }
    
    else if([self.passwordTextField.text isEqualToString:self.confirmPasswordTextField.text])
    {
    
        Utility* utilObjectTosetData = [[Utility alloc]init];
        [utilObjectTosetData saveUserDataToNSUserDefaultForKey:@"firstName" withValue:self.firstNameTextField.text];
        [utilObjectTosetData saveUserDataToNSUserDefaultForKey:@"lastName" withValue:self.lastNameTextField.text];
        [utilObjectTosetData saveUserDataToNSUserDefaultForKey:@"userName" withValue:self.userNameTextField.text];
        [utilObjectTosetData saveUserDataToNSUserDefaultForKey:@"password" withValue:self.passwordTextField.text];
        [utilObjectTosetData saveUserDataToNSUserDefaultForKey:@"phone" withValue:self.phoneTextField.text];
        [utilObjectTosetData saveUserDataToNSUserDefaultForKey:@"email" withValue:self.emailTextField.text];
        
        [self dismissViewControllerAnimated:YES completion:nil];
        
    }
    else
    {
        [self promptErrorMassage:@"Pasword does not match"];
        
    }
    
}


- (IBAction)backButton_Action:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}


-(void)promptErrorMassage:(NSString *)errorMassage
{
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Alert !" message:errorMassage preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction* action){}];
    
    
    [alert addAction:ok];
    
    [self presentViewController:alert animated:YES completion:nil];
}

#pragma mark - UITextFieldDelegate

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    if(textField.text.length == 0)
    {
        if(textField.tag == 0)
            [self promptErrorMassage:@"First Name Cannot be null"];
        else if(textField.tag == 1)
            [self promptErrorMassage:@"Last Name Cannot be null"];
        else if(textField.tag == 2)
            [self promptErrorMassage:@"User Name Cannot be null"];
        else if(textField.tag == 3 || textField.tag == 4)
            [self promptErrorMassage:@"Password Cannot be null"];
        else if(textField.tag == 5)
            [self promptErrorMassage:@"Phone No Cannot be null"];
        else if(textField.tag == 6)
            [self promptErrorMassage:@"Email Cannot be null"];
        
    }
    if(textField.tag == 6)
    {
        formFieldCheck = [self validateEmailWithString:self.emailTextField.text];
    }


}

- (BOOL)validateEmailWithString:(NSString*)email
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}

//- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
//    
//    NSCharacterSet *numbersOnly = [NSCharacterSet characterSetWithCharactersInString:@"0123456789"];
//    NSCharacterSet *characterSetFromTextField = [NSCharacterSet characterSetWithCharactersInString:textField.text];
//    
//    BOOL stringIsValid = [numbersOnly isSupersetOfSet:characterSetFromTextField];
//    return stringIsValid;
//    
//}




@end
