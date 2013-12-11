//
//  SettingsViewController.h
//  iTravel
//
//  Created by Thainq on 14/11/2013.
//  Copyright (c) 2013 Thainq. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SettingsViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>{

    NSString *strlang;
    NSUserDefaults *defaults;// = [NSUserDefaults standardUserDefaults];
    
    NSString *strsave;
}

@property (nonatomic, strong) IBOutlet UITableView* tableView;
//@property (assign)  int rowsave;
//@property (nonatomic, strong)  NSString *rowsave;

@end
