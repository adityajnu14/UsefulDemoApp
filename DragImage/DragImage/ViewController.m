//
//  ViewController.m
//  DragImage
//
//  Created by Aditya Kumar on 18/01/17.
//  Copyright © 2017 mindfire. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    CGPoint _firstTouchPoint;
    float _xCordinate;
    float _yCordinate;
    
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[self _movableImage]setUserInteractionEnabled:YES];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch* currentTouchPoint = [touches anyObject];
    if([currentTouchPoint.view isEqual:[self _movableImage]])
    {
        _firstTouchPoint = [currentTouchPoint locationInView:[self view]];
        _xCordinate = _firstTouchPoint.x - [[currentTouchPoint view]center].x;
        _yCordinate = _firstTouchPoint.y - [[currentTouchPoint view]center].y;
        
    }
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch* currentTouch=[touches anyObject];
    
    if(currentTouch.view == self._movableImage)
    {
        CGPoint newPoint = [currentTouch locationInView:[self view]];
        [[currentTouch view]setCenter:CGPointMake(newPoint.x-_xCordinate, newPoint.y-_yCordinate)];
    }
}


@end
