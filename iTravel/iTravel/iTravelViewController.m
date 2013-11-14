//
//  iTravelViewController.m
//  iTravel
//
//  Created by Thainq on 11/11/2013.
//  Copyright (c) 2013 Thainq. All rights reserved.
//

#import "iTravelViewController.h"
//#import "SWRevealViewController.h"
@interface iTravelViewController ()

@end

@implementation iTravelViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg.png"]];
 /*   _sidebarButton.tintColor = [UIColor colorWithWhite:0.96f alpha:0.2f];
    
    // Set the side bar button action. When it's tapped, it'll show up the sidebar.
    _sidebarButton.target = self.revealViewController;
    _sidebarButton.action = @selector(revealToggle:);
    
    // Set the gesture
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
*/


    
 //  UIImage *navBackgroundImage = [UIImage imageNamed:@"c-2-1-1.png"];
 //  [[UINavigationBar appearance] setBackgroundImage:navBackgroundImage forBarMetrics:UIBarMetricsDefault];

    // NSString* boldFontName = @"UVN Mua Thu";  
 //   [self styleNavigationBarWithFontName:boldFontName];
/*
    UIImageView* menuView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"settings.png"]];
    menuView.frame = CGRectMake(0, 0, 40, 40);
    
    UIBarButtonItem* menuItem = [[UIBarButtonItem alloc] initWithCustomView:menuView];
    
    self.navigationItem.rightBarButtonItem = menuItem;
 */    
	// Do any additional setup after loading the view, typically from a nib.
}


/*
-(void)styleNavigationBarWithFontName:(NSString*)navigationTitleFont{
    
    
    CGSize size = CGSizeMake(320, 44);
    UIColor* color = [UIColor colorWithRed:65.0/255 green:75.0/255 blue:89.0/255 alpha:1.0];
    
    UIGraphicsBeginImageContext(size);
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    CGRect fillRect = CGRectMake(0,0,size.width,size.height);
    CGContextSetFillColorWithColor(currentContext, color.CGColor);
    CGContextFillRect(currentContext, fillRect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    
    UINavigationBar* navAppearance = [UINavigationBar appearance];
    
    [navAppearance setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
    
    [navAppearance setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                           [UIColor whiteColor], UITextAttributeTextColor,
                                           [UIFont fontWithName:navigationTitleFont size:20.0f], UITextAttributeFont,
                                           nil]];
    //self.title = @"Du Lịch";

    
    UIImageView* menuView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"menu"]];
    menuView.frame = CGRectMake(0, 0, 20, 20);
    
    UIBarButtonItem* menuItem = [[UIBarButtonItem alloc] initWithCustomView:menuView];
    
    self.navigationItem.rightBarButtonItem = menuItem;
   
}
*/
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
