//
//  travelViewController.h
//  Newstest
//
//  Created by Thainq on 07/11/2013.
//  Copyright (c) 2013 Thainq. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PSCollectionView.h"

@interface travelViewController : UIViewController<PSCollectionViewDelegate,PSCollectionViewDataSource>
@property (nonatomic,retain) PSCollectionView *collectionView;

//データを格納する配列
@property (nonatomic,retain) NSMutableArray *items;

@end
