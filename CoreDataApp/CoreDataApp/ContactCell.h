//
//  ContactCell.h
//  CoreDataApp
//
//  Created by Aditya Kumar on 30/01/17.
//  Copyright © 2017 mindfire. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CoreData/CoreData.h"

@interface ContactCell : UITableViewCell

@property (weak,nonatomic) IBOutlet UILabel* textLabelName;
@property (weak,nonatomic) IBOutlet UILabel* textLabelPhone;
@property (weak,nonatomic) IBOutlet UILabel* textLabelEmail;
    
@property (weak,nonatomic) IBOutlet UIImageView* image;
    

-(void)setData:(NSManagedObject *) contactDeatil;

@end
