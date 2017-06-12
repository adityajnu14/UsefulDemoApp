
//
//  LogInPageVC.m
//  LoginPage
//
//  Created by Aditya Kumar on 02/02/17.
//  Copyright © 2017 mindfire. All rights reserved.
//

#import "LogInPageVC.h"
#import "userPageVC.h"
#import "Utility.h"

@interface LogInPageVC ()

@end

@implementation LogInPageVC
@synthesize checkBox;


- (void)viewDidLoad {
    // Do any additional setup after loading the view.
    
    [super viewDidLoad];
    [self.passwordTextField setSecureTextEntry:YES];
    
}

-(void)loginCheck
{
    if([self logMeIn])
    {
        [self performSegueWithIdentifier:@"loginSegue" sender:nil];
        
    }
}
-(BOOL)logMeIn
{
    Utility* utilObjectToFetchData = [[Utility alloc]init];
    return [utilObjectToFetchData fetchNSUserDataForKey:@"isSaved"].boolValue;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)viewDidAppear:(BOOL)animated
{
    
    [super viewDidAppear:YES];
    self.userNameTextField.text = @"";
    self.passwordTextField.text = @"";
    [self addImageIntoUserAndPasswordField];
    [self addCheckBox];
    [self loginCheck];

    
    
}

-(void)addImageIntoUserAndPasswordField
{
    UIImageView *lockIcon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"profile.png"]];
    lockIcon.frame = CGRectMake(0, 0, 30.f, 30.f);
    self.userNameTextField.leftView = lockIcon;
    self.userNameTextField.leftViewMode = UITextFieldViewModeAlways;
   // [self.imageView addSubview:self.userNameTextField];
    
    UIImageView *psdIcon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"lockIcon.png"]];
    psdIcon.frame = CGRectMake(0, 0, 30.f, 30.f);
    self.passwordTextField.leftView = psdIcon;
    self.passwordTextField.leftViewMode = UITextFieldViewModeAlways;
   // [self.imageView addSubview:self.passwordTextField];
    
    
}

-(void)addCheckBox
{

    
  
    // this will set image in background according to state
    [self.checkBox setBackgroundImage:[UIImage imageNamed:@"logOff.png"] forState:UIControlStateNormal];
    [self.checkBox setBackgroundImage:[UIImage imageNamed:@"Loging.png"] forState:UIControlStateSelected];
    [self.checkBox addTarget:self action:@selector(checkBoxSelected:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.checkBox];
}

-(void)checkBoxSelected:(id)sender
{
    if([self.checkBox isSelected]==YES)
    {
        [self.checkBox setSelected:NO];
    }
    else{
        [self.checkBox setSelected:YES];
    }
    
}





- (IBAction)logIn:(id)sender {

    Utility* utilObjectToFetchData = [[Utility alloc]init];
    
    if([self.userNameTextField.text isEqualToString:[utilObjectToFetchData fetchNSUserDataForKey:@"userName"]]  && [self.passwordTextField.text isEqualToString:[utilObjectToFetchData fetchNSUserDataForKey:@"password"]] )
    {
        [self saveLoginCredential];
        [self performSegueWithIdentifier:@"loginSegue" sender:nil];
        
    }
    else
    {
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Wrong" message:@"Password" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction* action){}];
        
        
        [alert addAction:ok];
        
        [self presentViewController:alert animated:YES completion:nil];
    }
}

-(void)saveLoginCredential
{
    Utility* utilObjectTosetData = [[Utility alloc]init];
//    [utilObjectTosetData saveUserDataToNSUserDefaultForKey:@"userName" withValue:self.userNameTextField.text];
//    [utilObjectTosetData saveUserDataToNSUserDefaultForKey:@"password" withValue:self.passwordTextField.text];

    NSString* login;
    if(self.checkBox.selected)
        login = @"YES";
    else
        login = @"NO";
    
    [utilObjectTosetData saveUserDataToNSUserDefaultForKey:@"isSaved" withValue:login];
    
}

- (IBAction)signUp:(id)sender {
}
@end
