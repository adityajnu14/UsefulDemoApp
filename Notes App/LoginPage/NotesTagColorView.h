//
//  NotesTagColorView.h
//  LoginPage
//
//  Created by Aditya Kumar on 13/02/17.
//  Copyright © 2017 mindfire. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NotesTagColorView : UIView

@property (weak, nonatomic) IBOutlet UIView *contentView;

@property (weak, nonatomic) IBOutlet UIButton *redNotesTagButton;

@property (weak, nonatomic) IBOutlet UIButton *greenNotesTagButton;
@property (weak, nonatomic) IBOutlet UIButton *yellowNotesTagButton;

//
//+(instancetype)loadRGBButton;

@end
