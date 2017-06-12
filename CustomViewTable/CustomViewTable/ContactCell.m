//
//  ContactCell.m
//  CustomViewTable
//
//  Created by Aditya Kumar on 17/01/17.
//  Copyright © 2017 mindfire. All rights reserved.
//

#import "ContactCell.h"
#import "ContactFile.h"

@implementation ContactCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)setData:(ContactFile *)contactDeatil
{
    _textLabelName.text = contactDeatil._nameData;
    _textLabelPhone.text = contactDeatil._phoneData;
    _textLabelEmail.text = contactDeatil._emailData;
    _image.image = [UIImage imageNamed:contactDeatil._imageData];
    _textLabelName.textColor = [UIColor blackColor];
    _textLabelPhone.textColor = [UIColor darkGrayColor];
    _textLabelEmail.textColor = [UIColor lightGrayColor];
}
@end
