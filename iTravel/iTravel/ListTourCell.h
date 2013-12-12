//
//  ListTourCell.h
//  iTravel
//
//  Created by Thainq on 12/12/2013.
//  Copyright (c) 2013 Thainq. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ListTourCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIButton *fav;

@property (nonatomic, weak) IBOutlet UIImageView* profileImageView;

@property (nonatomic, weak) IBOutlet UIImageView* picImageView;

@property (nonatomic, weak) IBOutlet UIView* picImageContainer;

@property (nonatomic, weak) IBOutlet UILabel* fromLabel;

@property (nonatomic, weak) IBOutlet UILabel* toLabel;

@property (nonatomic, weak) IBOutlet UILabel* dateLabel;

@property (nonatomic, weak) IBOutlet UILabel* priceLabel;

@property (nonatomic, weak) IBOutlet UILabel* likeCountLabel;

@end
