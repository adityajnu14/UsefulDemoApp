//
//  DragView.m
//  DragImage
//
//  Created by Aditya Kumar on 18/01/17.
//  Copyright © 2017 mindfire. All rights reserved.
//

#import "DragView.h"

@implementation DragView

-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    CGFloat* p = [[touches anyObject] locationInView:self.superview];
    self.center = p;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
