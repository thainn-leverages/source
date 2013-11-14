//
//  DetailnewsViewController.m
//  JSPintDemo
//
//  Created by Thainq on 08/11/2013.
//  Copyright (c) 2013 Fall Creek Software. All rights reserved.
//

#import "DetailnewsViewController.h"

@interface DetailnewsViewController ()

@end

@implementation DetailnewsViewController
@synthesize tabledata = tabelData;


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
    _text.text = tabelData;
    NSLog(@"%@", tabelData);

    
    //NSLog(@"%@",  self.text);
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
