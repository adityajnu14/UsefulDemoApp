//
//  userPageCollectionVC.m
//  LoginPage
//
//  Created by Aditya Kumar on 08/02/17.
//  Copyright © 2017 mindfire. All rights reserved.
//

#import "userPageCollectionVC.h"
#import "DataManager.h"
#import "NotesCollectionCell.h"
#import "Utility.h"
#import "Note.h"
#import "DetailsNotesVC.h"
#import "DetailsNotesVC.h"

@interface userPageCollectionVC ()
{
    NSMutableArray* dataFromPlist;
    
}
@end

@implementation userPageCollectionVC


- (void)viewDidLoad {
    [super viewDidLoad];
    [self customizeNavigationBar];
   

    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self fetechDataFromPlist];
    [self.collectionView reloadData];
}


-(void)fetechDataFromPlist
{
    DataManager* dataManager = [[DataManager alloc]init];
    dataFromPlist = [dataManager getNotesData];
    
}

- (void)logOut{
    
    Utility* utilityObjectToSaveData = [[Utility alloc]init];
    [utilityObjectToSaveData saveUserDataToNSUserDefaultForKey:@"isSaved" withValue:@"NO"];
    [self.navigationController popToRootViewControllerAnimated:true];

    
    
}

- (void)customizeNavigationBar
{
    [self addNewNoteBtn];
    [self addLogOutButton];
    self.navigationItem.hidesBackButton = YES;
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.00 green:0.36 blue:0.57 alpha:1.0];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    self.navigationItem.title = @"Notes";
    
}


-(void)addLogOutButton
{
    
    
    
    UIBarButtonItem* logoutBtn=[[UIBarButtonItem alloc] initWithTitle:@"Logout" style:UIBarButtonItemStyleDone target:self action:@selector(logOut)];
        self.navigationItem.leftBarButtonItem = logoutBtn ;
        logoutBtn.tintColor = [UIColor whiteColor];

}


- (void)addNewNoteBtn
{
    UIBarButtonItem *addNewBtn = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(gotoAddNewNoteVC)];
    self.navigationController.topViewController.navigationItem.rightBarButtonItem = addNewBtn;
    addNewBtn.enabled=TRUE;
    addNewBtn.tintColor = [UIColor whiteColor];
    addNewBtn.style=UIBarButtonSystemItemRefresh;
}


-(void)gotoAddNewNoteVC
{
    [self performSegueWithIdentifier:@"addNote" sender:nil];
}

#pragma mark - UICollectionView delegate method


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return dataFromPlist.count;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString * const reuseIdentifier = @"Cell";
    NotesCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    NSMutableDictionary* aNotesDict = [dataFromPlist objectAtIndex:indexPath.row];
    
    Note* aNote = [[Note alloc]initNotesWithTitle:[aNotesDict objectForKey:@"title"] andDescription:[aNotesDict objectForKey:@"description"] withTag:[aNotesDict objectForKey:@"tagColor"] andLock:[[aNotesDict objectForKey:@"lock"] boolValue]];
    
    UICollectionViewFlowLayout *aFlowLayout = [[UICollectionViewFlowLayout alloc] init];
    [aFlowLayout setSectionInset:UIEdgeInsetsMake(10, 10, 10, 10)];
    [cell setValueIntoCell:aNote];
    
    return cell;
}

// This will set margin of the uicollection cell
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(10, 10 , 20, 10);
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"notesDetails"]) {
        NSIndexPath *indexPath = [[self.collectionView indexPathsForSelectedItems] lastObject];
        NSMutableDictionary* aNotesDict = [dataFromPlist objectAtIndex:indexPath.row];
        Note* aNote = [[Note alloc]initNotesWithTitle:[aNotesDict objectForKey:@"title"] andDescription:[aNotesDict objectForKey:@"description"] withTag:[aNotesDict objectForKey:@"tagColor"] andLock:[[aNotesDict objectForKey:@"lock"] boolValue]];
        
        DetailsNotesVC* newViewController = segue.destinationViewController;
        [newViewController setDataToViewController:aNote];
        
    }
}



-(BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender
{
    if([identifier isEqualToString:@"notesDetails"])
    {
        NSIndexPath *indexPath = [[self.collectionView indexPathsForSelectedItems] lastObject];
        NSMutableDictionary* aNotesDict = [dataFromPlist objectAtIndex:indexPath.row];
        
        if([[aNotesDict objectForKey:@"lock"] boolValue])
        {
            return [self fetchPasswordForNote];
        }
        
        
    }
    return  YES;
}





-(BOOL)fetchPasswordForNote
{
    UIAlertController * alertController = [UIAlertController alertControllerWithTitle: @"Alert!"
                                                                              message: @"Input Your Password"
                                                                       preferredStyle:UIAlertControllerStyleAlert];
    [alertController addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        textField.placeholder = @"Password";
        textField.textColor = [UIColor blackColor];
        textField.clearButtonMode = UITextFieldViewModeWhileEditing;
        textField.borderStyle = UITextBorderStyleRoundedRect;
        textField.secureTextEntry = YES;
    }];
    
    
    
    
    
    
    [alertController addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        NSArray* textfields = alertController.textFields;
        UITextField * TextFieldPassword = textfields[0];
        
        Utility* utilObjectToFetchData = [[Utility alloc]init];
            if([TextFieldPassword.text isEqualToString:[utilObjectToFetchData fetchNSUserDataForKey:@"password"]])
            {
                [self performSegueWithIdentifier:@"notesDetails" sender:nil];
            }
        
    }]];
    

    [self presentViewController:alertController animated:YES completion:nil];
    
    
    return NO;

}

@end
