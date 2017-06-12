//
//  userPageVC.m
//  LoginPage
//
//  Created by Aditya Kumar on 03/02/17.
//  Copyright © 2017 mindfire. All rights reserved.
//

#import "userPageVC.h"
#import "NotesCell.h"
#import "UserDataFile.h"
#import "Utility.h"
#import "DataManager.h"

@interface userPageVC ()
{
    NSMutableArray* dataFromPlist;
    
}
@end

@implementation userPageVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
   }

-(void)fetechDataFromPlist
{
    DataManager* dataManager = [[DataManager alloc]init];
    dataFromPlist = [dataManager getNotesData];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self fetechDataFromPlist];
    [self.tableView reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return dataFromPlist.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
   NotesCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    if (cell == nil) {
        cell = (NotesCell*)[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    
    NSDictionary* aNotesDict = [dataFromPlist objectAtIndex:indexPath.row];
    UserDataFile* aNotes = [[UserDataFile alloc]initWithTitle:[aNotesDict objectForKey:@"title"] description:[aNotesDict objectForKey:@"description"]];
    
    [cell setValueIntoCell:aNotes];
    
    return cell;
}



- (IBAction)logOut:(id)sender {
    
    Utility* utilityObjectToSaveData = [[Utility alloc]init];
    [utilityObjectToSaveData saveUserDataToNSUserDefaultForKey:@"isSaved" withValue:@"NO"];
    
    [self dismissViewControllerAnimated:self completion:nil];
    

}
@end
