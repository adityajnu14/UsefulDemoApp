//
//  ViewController.m
//  CustomViewTable
//
//  Created by Aditya Kumar on 17/01/17.
//  Copyright © 2017 mindfire. All rights reserved.
//

#import "ViewController.h"
#import "ContactFile.h"
#import "ContactCell.h"
#import "secondViewController.h"
@interface ViewController ()
@end

@implementation ViewController
 NSArray* contacts;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    ContactFile *c1 = [ContactFile new];
    c1._nameData = @"Naheed";
    c1. _emailData= @"asasa.com";
    c1._phoneData = @"1232";
    c1._imageData = @"1.jpg";
    
    ContactFile *c2 = [ContactFile new];
    c2._nameData = @"Aditya";
    c2. _emailData= @"aditya.com";
    c2._phoneData = @"4564";
    c2._imageData = @"2.jpg";
    
    
    ContactFile *c3 = [ContactFile new];
    c3._nameData = @"shivangi";
    c3. _emailData= @"shivangi.com";
    c3._phoneData = @"7683";
    c3._imageData = @"3.jpg";
   
    ContactFile *c4 = [ContactFile new];
    c4._nameData = @"Niraj";
    c4. _emailData= @"Niraj.com";
    c4._phoneData = @"3243";
    c4._imageData = @"4.jpg";
    
    ContactFile *c5 = [ContactFile new];
    c5._nameData = @"Abhijit";
    c5. _emailData= @"abhijit.com";
    c5._phoneData = @"8433";
    c5._imageData = @"5.jpg";
    
    ContactFile *c6 = [ContactFile new];
    c6._nameData = @"Shamshad";
    c6. _emailData= @"shamshad.com";
    c6._phoneData = @"45343";
    c6._imageData = @"6.jpg";
    
    ContactFile *c7 = [ContactFile new];
    c7._nameData = @"Vishal";
    c7. _emailData= @"vishal.com";
    c7._phoneData = @"1322";
    c7._imageData = @"3.jpg";
    
    contacts = [NSArray arrayWithObjects:c1,c2,c3,c4,c5,c6,c7,nil];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return contacts.count;
}

- (UITableViewCell *)tableView:(UITableView* )tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"contactsCell";
    ContactCell* cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // Configure the cell...
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    CGFloat red = arc4random() % 255 / 255.0;
    CGFloat green = arc4random() % 255 / 255.0;
    CGFloat blue = arc4random() % 255 / 255.0;
    UIColor* color = [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
    
    UIColor* nameColor=[UIColor blackColor];
    UIColor* phoneColor=[UIColor darkGrayColor];
    UIColor* emailColor=[UIColor lightGrayColor];
    
    if(![color isEqual:nameColor] && ![color isEqual:phoneColor] && ![color isEqual:emailColor])
    [cell setBackgroundColor:color];
    
    [cell setData:[contacts objectAtIndex:indexPath.row]];
    
    

    return cell;
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"detailInformation"]) {
        NSIndexPath* indexPath = [self.tableView indexPathForSelectedRow];
        ContactFile* dataToSet = [contacts objectAtIndex:indexPath.row];
        secondViewController* newViewController = segue.destinationViewController;
        [newViewController setDataToSecondViewController:dataToSet];
        
    }
}



@end
