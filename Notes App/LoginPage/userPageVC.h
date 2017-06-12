//
//  userPageVC.h
//  LoginPage
//
//  Created by Aditya Kumar on 03/02/17.
//  Copyright © 2017 mindfire. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface userPageVC : UIViewController<UITableViewDataSource , UITableViewDelegate>
@property IBOutlet UITableView* tableView;


- (IBAction)logOut:(id)sender;

@end
