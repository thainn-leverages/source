//
//  NewsiTravelCell.h
//  iTravel
//
//  Created by Thainq on 27/11/2013.
//  Copyright (c) 2013 Thainq. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewsCell.h"

@interface NewsiTravelCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *newsImageView;
@property (weak, nonatomic) IBOutlet UILabel *newsTitle;
@property (weak, nonatomic) IBOutlet UILabel *newsDesc;
@property (weak, nonatomic) IBOutlet UIImageView *imgbackground;

- (void)setDetailsWithNews:(NewsCell*)news;

@end
