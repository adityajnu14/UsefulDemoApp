//
//  NotesCell.m
//  LoginPage
//
//  Created by Aditya Kumar on 03/02/17.
//  Copyright © 2017 mindfire. All rights reserved.
//

#import "NotesCell.h"

@implementation NotesCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setValueIntoCell:(UserDataFile *)userData
{
    self.titleUILabelField.text = userData.titleOfTheNotes;
    self.descriptionUILabelField.text = userData.descriptionOfTheNotes;
}


@end
