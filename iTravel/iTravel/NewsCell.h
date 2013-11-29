//
//  NewsCell.h
//  iTravel
//
//  Created by Thainq on 27/11/2013.
//  Copyright (c) 2013 Thainq. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NewsCell : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *desc; 
@property (nonatomic, strong) NSString *imageFile;
@property (nonatomic, retain) NSData* imageData;


-(void)loadData;

@end
