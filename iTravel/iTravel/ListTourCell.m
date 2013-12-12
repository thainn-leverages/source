//
//  ListTourCell.m
//  iTravel
//
//  Created by Thainq on 12/12/2013.
//  Copyright (c) 2013 Thainq. All rights reserved.
//

#import "ListTourCell.h"

@implementation ListTourCell

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
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)awakeFromNib{
    
    UIColor* mainColor = [UIColor colorWithRed:47.0/255 green:168.0/255 blue:228.0/255 alpha:1.0f];
    UIColor* neutralColor = [UIColor colorWithWhite:0.4 alpha:1.0];
    
 //   UIColor* mainColorLight = [UIColor colorWithRed:28.0/255 green:158.0/255 blue:121.0/255 alpha:0.4f];
   // UIColor* lightColor = [UIColor colorWithWhite:0.7 alpha:1.0];
    
    NSString* fontName = @"Avenir-Book";
    NSString* boldItalicFontName = @"Avenir-BlackOblique";
    NSString* boldFontName = @"Avenir-Black";
    
    self.fromLabel.textColor =  mainColor;
    self.fromLabel.font =  [UIFont fontWithName:boldFontName size:14.0f];
    
    self.toLabel.textColor =  neutralColor;
    self.toLabel.font =  [UIFont fontWithName:fontName size:12.0f];
    
    self.dateLabel.textColor = mainColor;
    self.dateLabel.font = [UIFont fontWithName:boldItalicFontName size:10.0f];//[UIFont fontWithName:boldItalicFontName size:8.0f];
    
    self.priceLabel.textColor = mainColor;
    self.priceLabel.font =  [UIFont fontWithName:boldItalicFontName size:10.0f];
    
    self.likeCountLabel.textColor = mainColor;
    self.likeCountLabel.font =  [UIFont fontWithName:boldItalicFontName size:10.0f];
    
 /*   self.picImageView.contentMode = UIViewContentModeScaleAspectFill;
    self.picImageView.clipsToBounds = YES;
    self.picImageView.layer.cornerRadius = 2.0f;
    
    self.picImageContainer.backgroundColor = [UIColor whiteColor];
    self.picImageContainer.layer.borderColor = [UIColor colorWithWhite:0.8f alpha:0.6f].CGColor;
    self.picImageContainer.layer.borderWidth = 1.0f;
    self.picImageContainer.layer.cornerRadius = 2.0f;*/
    
    
    self.profileImageView.clipsToBounds = YES;
    self.profileImageView.layer.cornerRadius = 20.0f;
    self.profileImageView.layer.borderWidth = 2.0f;
    self.profileImageView.layer.borderColor = mainColor.CGColor;
    
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
}
- (IBAction)favourites:(id)sender {
    
    if (self.fav.currentTitle == NULL) {
        
        [self.fav setImage:[UIImage imageNamed:@"002.png"] forState:UIControlStateNormal];
        self.fav.titleLabel.hidden = true;
        [self.fav setTitle:@"fav" forState:UIControlStateNormal];
    }
    
    else{
    
        [self.fav setImage:[UIImage imageNamed:@"002_2.png"] forState:UIControlStateNormal];
        self.fav.titleLabel.hidden = true;
        [self.fav setTitle:NULL forState:UIControlStateNormal];
    }
    
    
    //[self.fav.currentTitle isEqualToString:@"fav"]) {
    
}





@end
