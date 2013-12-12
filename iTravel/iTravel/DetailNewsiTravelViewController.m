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
    
    [self ReadDataFromPlist];
    
    if([strlang integerValue] == 0 ){
        
        self.navigationItem.title = @"Tin Chi Tiết";
        
    }
    else{
        self.navigationItem.title = @"Detail News";
    }

    [detailweb loadHTMLString:news baseURL:nil];
   
	// Do any additional setup after loading the view.
}

- (IBAction)back:(id)sender {
    
    [self.navigationController popViewControllerAnimated:TRUE];
    
}

- (void)ReadDataFromPlist{
    
    //Run on mobile
    /*
     NSArray *sysPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory ,NSUserDomainMask, YES);
     
     NSString *documentsDirectory = [sysPaths objectAtIndex:0];
     
     NSString *filePath =  [documentsDirectory stringByAppendingPathComponent:@"config.plist"];
     
     NSError *error;
     
     
     NSFileManager *fileManager = [NSFileManager defaultManager];
     
     if (![fileManager fileExistsAtPath: filePath]) //4
     
     {
     NSString *bundle = [[NSBundle mainBundle] pathForResource:@"config" ofType:@"plist"]; //5
     
     [fileManager copyItemAtPath:bundle toPath: filePath error:&error];
     
     
     }
     
     NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"config" ofType:@"plist"];
     */
    
    //Run on simulator
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsPath = [paths objectAtIndex:0];
    
    NSString *plistPath = [documentsPath stringByAppendingPathComponent:@"config.plist"];
    
    NSString *bundleFile = [[NSBundle mainBundle]pathForResource:@"config" ofType:@"plist"];
    
    
    //copy the file from the bundle to the doc directory
    [[NSFileManager defaultManager]copyItemAtPath:bundleFile toPath:plistPath error:nil];
    
    //End run on simulator
    NSMutableDictionary * propertyDict = [[NSMutableDictionary alloc] initWithContentsOfFile:plistPath];
    
    strlang = [propertyDict objectForKey:@"Language"];
    
    //
    
    
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
   
    // Dispose of any resources that can be recreated.
}

@end
