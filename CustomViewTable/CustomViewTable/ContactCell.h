//
//  ContactCell.h
//  CustomViewTable
//
//  Created by Aditya Kumar on 17/01/17.
//  Copyright © 2017 mindfire. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ContactFile.h"
@interface ContactCell : UITableViewCell
{
    IBOutlet UILabel* _textLabelName;
    IBOutlet UILabel* _textLabelPhone;
    IBOutlet UILabel* _textLabelEmail;
    
    IBOutlet UIImageView* _image;


}
-(void)setData:(ContactFile *) contactDeatil;

@end
