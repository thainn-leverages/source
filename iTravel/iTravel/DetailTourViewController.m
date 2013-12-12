//
//  DetailTourViewController.m
//  iTravel
//
//  Created by Thainq on 12/12/2013.
//  Copyright (c) 2013 Thainq. All rights reserved.
//

#import "DetailTourViewController.h"

@interface DetailTourViewController ()

@end

@implementation DetailTourViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}
- (IBAction)back:(id)sender {
      [self.navigationController popViewControllerAnimated:TRUE];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
