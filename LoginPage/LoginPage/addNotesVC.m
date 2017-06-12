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
    

}


- (IBAction)saveNotes:(id)sender {
    
    
    
    Note* aNote = [[Note alloc]initNotesWithTitle:self.titleInputTextField.text andDescription:self.descriptionTextView.text];
    DataManager* dataManager = [[DataManager alloc]init];
    [dataManager saveNote:aNote];
    [self dismissViewControllerAnimated:YES completion:nil];
        
    
}

- (IBAction)backButton:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
