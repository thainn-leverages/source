//
//  DetailNewsiTravelViewController.h
//  iTravel
//
//  Created by Thainq on 28/11/2013.
//  Copyright (c) 2013 Thainq. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewsCell.h"

@interface DetailNewsiTravelViewController : UIViewController

@property (nonatomic, strong) NSString *news;
@property (weak, nonatomic) IBOutlet UIWebView *detailweb;
@property (weak, nonatomic) IBOutlet UIButton *back;

@end
