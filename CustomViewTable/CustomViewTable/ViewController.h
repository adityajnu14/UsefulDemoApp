//
//  ViewController.h
//  CustomViewTable
//
//  Created by Aditya Kumar on 17/01/17.
//  Copyright © 2017 mindfire. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
{

}
@property (nonatomic,weak) IBOutlet UITableView* tableView;

@end

