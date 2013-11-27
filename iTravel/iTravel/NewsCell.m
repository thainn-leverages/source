//
//  NewsCell.m
//  iTravel
//
//  Created by Thainq on 27/11/2013.
//  Copyright (c) 2013 Thainq. All rights reserved.
//

#import "NewsCell.h"

@implementation NewsCell

@synthesize name;
@synthesize desc;
@synthesize imageFile;

-(void)loadData
{
    NSURL* url = [NSURL URLWithString:self.imageFile];
    self.imageData = [NSData dataWithContentsOfURL:url];
    
}

@end
