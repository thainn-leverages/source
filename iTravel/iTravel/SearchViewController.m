//
//  SearchViewController.m
//  iTravel
//
//  Created by Thainq on 13/11/2013.
//  Copyright (c) 2013 Thainq. All rights reserved.
//

#import "SearchViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface SearchViewController ()

@end

@implementation SearchViewController

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
    UIColor* mainColor = [UIColor colorWithRed:47.0/255 green:168.0/255 blue:228.0/255 alpha:1.0f];
  //  UIColor* darkColor = [UIColor colorWithRed:10.0/255 green:78.0/255 blue:108.0/255 alpha:1.0f];
    
//    NSString* fontName = @"Avenir-Black";
    NSString* boldFontName = @"Avenir-Black";
 //   self.view.backgroundColor = mainColor;
    
    self.search.backgroundColor = mainColor;
    self.search.layer.cornerRadius = 3.0f;
    self.search.titleLabel.font = [UIFont fontWithName:boldFontName size:20.0f];
    [self.search setTitle:@"SEARCH" forState:UIControlStateNormal];
    [self.search setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.search setTitleColor:[UIColor colorWithWhite:1.0f alpha:0.5f] forState:UIControlStateHighlighted];
    
    
    //self.view.backgroundColor = [UI012Color greenColor];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
