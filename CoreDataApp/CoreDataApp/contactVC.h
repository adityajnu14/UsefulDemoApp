//
//  contactVC.h
//  CoreDataApp
//
//  Created by Aditya Kumar on 25/01/17.
//  Copyright © 2017 mindfire. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface contactVC : UIViewController<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic)IBOutlet UITableView* tableView;
@end
