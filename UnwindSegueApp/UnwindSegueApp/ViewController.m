//
//  ViewController.m
//  UnwindSegueApp
//
//  Created by Aditya Kumar on 19/01/17.
//  Copyright © 2017 mindfire. All rights reserved.
//

#import "ViewController.h"
#import "GreenVC.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)unwindToRed:(UIStoryboardSegue *)unwindSegue
{
    GreenVC* greenVC=unwindSegue.sourceViewController;
    self._nameLabel.text = greenVC._nameTextField.text;
    self._emailLabel.text = greenVC._emailTextField.text;
    self._phoneLabel.text = greenVC._phoneTextField.text;
}

@end
