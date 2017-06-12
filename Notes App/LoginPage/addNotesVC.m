//
//  addNotesVC.m
//  LoginPage
//
//  Created by Aditya Kumar on 06/02/17.
//  Copyright © 2017 mindfire. All rights reserved.
//

#import "addNotesVC.h"
#import "Note.h"
#import "DataManager.h"

@interface addNotesVC ()
@end

@implementation addNotesVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self addPlaceholderInUITextView];
    
}


-(void)addPlaceholderInUITextView
{
    self.descriptionTextView.text = @"Enter Notes description";
    self.descriptionTextView.textColor = [UIColor lightGrayColor];
    
}

- (BOOL) textViewShouldBeginEditing:(UITextView *)textView
{
    self.descriptionTextView.text = @"";
    self.descriptionTextView.textColor = [UIColor blackColor];
    return YES;
}

- (void)textViewDidEndEditing:(UITextView *)textView;
{
    if(self.descriptionTextView.text.length == 0){
        self.descriptionTextView.textColor = [UIColor lightGrayColor];
        self.descriptionTextView.text = @"Enter Notes description";
        [self.descriptionTextView resignFirstResponder];
    }

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidAppear:(BOOL)animated
{
    self.descriptionTextView.layer.borderWidth = 1.0;
    self.descriptionTextView.layer.cornerRadius = 5.0;
    self.descriptionTextView.layer.borderColor = [UIColor whiteColor].CGColor;

    
    self.titleInputTextField.layer.borderWidth = 1.0;
    self.titleInputTextField.layer.cornerRadius = 5.0;
    self.titleInputTextField.layer.borderColor = [UIColor whiteColor].CGColor;
    [self customizeButton];

}

-(void)promptErrorMassage:(NSString *)errorMassage
{
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Alert !" message:errorMassage preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction* action){}];
    
    
    [alert addAction:ok];
    
    [self presentViewController:alert animated:YES completion:nil];
}

-(void)customizeButton
{
    self.tagButton.layer.cornerRadius = self.tagButton.frame.size.width/2.0f;
    self.secureButton.layer.cornerRadius = self.tagButton.frame.size.width/2.0f;
    [self.tagButton setTitle:@"Tag" forState:UIControlStateNormal];
    self.secureButton.backgroundColor = [UIColor yellowColor];
    self.tagButton.backgroundColor = [UIColor yellowColor];
    [self.secureButton setBackgroundImage:[UIImage imageNamed:@"roundLock.png"] forState:UIControlStateNormal];
}

- (IBAction)saveNotes:(id)sender {
    
    
    if(self.titleInputTextField.text.length == 0 )
        [self promptErrorMassage:@"Empty Notes title"];
    if(self.descriptionTextView.text.length == 0  || [self.descriptionTextView.text isEqualToString:@"Enter Notes description"])
        [self promptErrorMassage:@"Empty Notes description"];
    else
    {
        Note* aNote = [[Note alloc]initNotesWithTitle:self.titleInputTextField.text andDescription:self.descriptionTextView.text];
        DataManager* dataManager = [[DataManager alloc]init];
        [dataManager saveNote:aNote];
        [self dismissViewControllerAnimated:YES completion:nil];
    }
    
    
}


- (IBAction)backButton:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
