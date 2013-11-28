//
//  NewsViewController.h
//  iTravel
//
//  Created by Thainq on 27/11/2013.
//  Copyright (c) 2013 Thainq. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"

@interface NewsViewController : UITableViewController <MBProgressHUDDelegate>
{
    MBProgressHUD *HUD;
    NSString *str;
    NSURL *urlResult;
  
    int count;
    
            
}
@property (strong, nonatomic)  NSMutableArray *keysResult;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentnews;

@property (strong, nonatomic) IBOutlet UITableView *tableview;

@end
