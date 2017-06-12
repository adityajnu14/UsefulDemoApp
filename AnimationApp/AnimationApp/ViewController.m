//
//  ViewController.m
//  AnimationApp
//
//  Created by Aditya Kumar on 31/01/17.
//  Copyright © 2017 mindfire. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    NSArray *imageNames = @[@"win_1.png", @"win_2.png", @"win_3.png", @"win_4.png",
                            @"win_5.png", @"win_6.png", @"win_7.png", @"win_8.png",
                            @"win_9.png", @"win_10.png", @"win_11.png", @"win_12.png",
                            @"win_13.png", @"win_14.png", @"win_15.png", @"win_16.png"];
    
    NSMutableArray *images = [[NSMutableArray alloc] init];
    for (int i = 0; i < imageNames.count; i++) {
        [images addObject:[UIImage imageNamed:[imageNames objectAtIndex:i]]];
    }
    
    // Normal Animation
    UIImageView *fastanimationImageView = [[UIImageView alloc] initWithFrame:CGRectMake(60, 95, 86, 193)];
    fastanimationImageView.animationImages = images;
    fastanimationImageView.animationDuration = 0.5;
    
    [self.view addSubview:fastanimationImageView];
    [fastanimationImageView startAnimating];
    
    
    // Normal Animation
    UIImageView *slowanimationImageView = [[UIImageView alloc] initWithFrame:CGRectMake(160, 95, 86, 193)];
    slowanimationImageView.animationImages = images;
    slowanimationImageView.animationDuration = 1;
//    slowanimationImageView.animationRepeatCount = 10;
    [self.view addSubview:slowanimationImageView];
    [slowanimationImageView startAnimating];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
