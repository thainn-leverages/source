//
//  LanguageList.h
//  iTravel
//
//  Created by Thainq on 25/11/2013.
//  Copyright (c) 2013 Thainq. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LanguageList : UITableViewController{

    NSString *languageSet;
}

@property (nonatomic, strong) NSString* langdata;
@property(nonatomic,retain) IBOutlet id tableview;

@end
