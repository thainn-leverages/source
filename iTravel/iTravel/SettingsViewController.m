//
//  SettingsViewController.m
//  iTravel
//
//  Created by Thainq on 14/11/2013.
//  Copyright (c) 2013 Thainq. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()

@end

@implementation SettingsViewController

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
    self.view.backgroundColor = [UIColor greenColor];
 //   UINavigationBar *myBar = [[UINavigationBar alloc]initWithFrame:CGRectMake(0, 0, 320, 44)];
  //  [self.view addSubview:myBar];
/*
    UIImageView* menuView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"chosen.png"]];
    menuView.frame = CGRectMake(0, 0, 33, 25);
    
    UIBarButtonItem* menuItem = [[UIBarButtonItem alloc] initWithCustomView:menuView];
    
    self.navigationItem.rightBarButtonItem = menuItem;
    
    UIImageView* menuViewleft = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"close.png"]];
    menuView.frame = CGRectMake(0, 0, 40, 40);
    
    UIBarButtonItem* menuView1 = [[UIBarButtonItem alloc] initWithCustomView:menuViewleft];
    
    self.navigationItem.leftBarButtonItem = menuView1;
*/
    
	// Do any additional setup after loading the view.
}

- (IBAction)cancel:(id)sender {
        [self dismissViewControllerAnimated:YES completion:nil];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
