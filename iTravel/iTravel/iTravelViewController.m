//
//  iTravelViewController.m
//  iTravel
//
//  Created by Thainq on 11/11/2013.
//  Copyright (c) 2013 Thainq. All rights reserved.
//

#import "iTravelViewController.h"
#import "Reachability.h"
@interface iTravelViewController ()

@end

@implementation iTravelViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    Reachability *networkReachability = [Reachability reachabilityForInternetConnection];
    NetworkStatus networkStatus = [networkReachability currentReachabilityStatus];
    
    if (networkStatus == NotReachable) {
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Thông báo lỗi!"
                                                        message:@"Ứng dụng cần có kết nối mạng để truy cập"
                                                       delegate:nil
                                              cancelButtonTitle:@"Tắt thông báo"
                                              otherButtonTitles:nil];
        [alert show];
    }
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg.png"]];
    
   
 	// Do any additional setup after loading the view, typically from a nib.
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
