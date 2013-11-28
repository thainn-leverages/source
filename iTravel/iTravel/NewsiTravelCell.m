//
//  NewsiTravelCell.m
//  iTravel
//
//  Created by Thainq on 27/11/2013.
//  Copyright (c) 2013 Thainq. All rights reserved.
//

#import "NewsiTravelCell.h"

@implementation NewsiTravelCell

@synthesize newsImageView;
@synthesize newsTitle;
@synthesize newsDesc;
@synthesize imgbackground;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
   
    if(selected)
    {
        //UIImage* imgbg = [UIImage imageNamed:@"photo-frame.png"];
        UIImage* disclosureImage = [UIImage imageNamed:@"ipad-arrow-selected.png"];
        
        //[self.imgbackground setImage:imgbg];
        [self.disclosureImage setImage:disclosureImage];
        
        [self.newsTitle setTextColor:[UIColor whiteColor]];
        [self.newsTitle setShadowColor:[UIColor colorWithRed:50.0/255 green:68.0/255 blue:200.0/255 alpha:1.0]];
        [self.newsTitle setShadowOffset:CGSizeMake(0, 1)];
        
        [self.newsDesc setTextColor:[UIColor whiteColor]];
        [self.newsDesc setShadowColor:[UIColor colorWithRed:50.0/255 green:68.0/255 blue:200.0/255 alpha:1.0]];
        [self.newsDesc setShadowOffset:CGSizeMake(0, 1)];
        
       
        
    }
  
    else
    {
       // UIImage* bg = [UIImage imageNamed:@"ipad-list-element.png"];
        UIImage* disclosureImage = [UIImage imageNamed:@"ipad-arrow.png"];
        
      //  [self.imgbackground setImage:bg];
        [self.disclosureImage setImage:disclosureImage];
        
        [self.newsTitle setTextColor:[UIColor colorWithRed:0.0 green:68.0/255 blue:125.0/255 alpha:1.0]];
        [self.newsTitle setShadowColor:[UIColor whiteColor]];
        [self.newsTitle setShadowOffset:CGSizeMake(0, 1)];
        
        [self.newsDesc setTextColor:[UIColor colorWithRed:0.0 green:68.0/255 blue:118.0/255 alpha:1.0]];
        [self.newsDesc setShadowColor:[UIColor whiteColor]];
        [self.newsDesc setShadowOffset:CGSizeMake(0, 1)];
        
   
        
    }

    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setDetailsWithNews:(NewsCell*)news;
{
    newsTitle.text = news.name;
    newsTitle.numberOfLines = 0;
   // [newsTitle sizeToFit];
    newsDesc.text  = news.desc;
  //    [newsDesc sizeToFit];
    newsDesc.numberOfLines = 0;
    imgbackground.image = [UIImage imageNamed:@"photo-frame.png"];
    
    if(news.imageData)
    {
        UIImage *image = [UIImage imageWithData:news.imageData];
        newsImageView.image = image;
    }
    else
    {
        [news loadData];
        UIImage *image = [UIImage imageWithData:news.imageData];
        
        newsImageView.image = image;
    }
}

@end
