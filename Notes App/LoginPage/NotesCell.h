//
//  NotesCell.h
//  LoginPage
//
//  Created by Aditya Kumar on 03/02/17.
//  Copyright © 2017 mindfire. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Note.h"


@interface NotesCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *titleUILabelField;
@property (weak, nonatomic) IBOutlet UILabel *descriptionUILabelField;

-(void)setValueIntoCell:(Note *)Note;
@end
