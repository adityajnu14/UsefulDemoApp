//
//  ContactCell.m
//  CoreDataApp
//
//  Created by Aditya Kumar on 30/01/17.
//  Copyright © 2017 mindfire. All rights reserved.
//

#import "ContactCell.h"
#import "Contact.h"

@implementation ContactCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setData:(Contact *) contactDeatil;
{
    
    
    [self.textLabelName setText:contactDeatil.name];
    [self.textLabelPhone setText:contactDeatil.phone];
    [self.textLabelEmail setText:contactDeatil.email];
    
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsPath = [paths objectAtIndex:0]; //Get the docs directory
    NSString *filePath = [documentsPath stringByAppendingPathComponent:contactDeatil.contact_id];
    
    NSData *pngData = [NSData dataWithContentsOfFile:filePath];
    UIImage *imageData = [UIImage imageWithData:pngData];
    self.image.image = imageData;


}
@end
