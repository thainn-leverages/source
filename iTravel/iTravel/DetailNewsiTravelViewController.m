//
//  DetailNewsiTravelViewController.m
//  iTravel
//
//  Created by Thainq on 28/11/2013.
//  Copyright (c) 2013 Thainq. All rights reserved.
//

#import "DetailNewsiTravelViewController.h"


@interface DetailNewsiTravelViewController ()

@end

@implementation DetailNewsiTravelViewController
@synthesize detailweb, news;

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
    //NSLog(@"%@", news);
    
    [detailweb loadHTMLString:news baseURL:nil];
   
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
