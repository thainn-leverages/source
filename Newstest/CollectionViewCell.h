//
//  CollectionViewCell.h
//  Newstest
//
//  Created by Thainq on 07/11/2013.
//  Copyright (c) 2013 Thainq. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PSCollectionViewCell.h"


@interface CollectionViewCell : PSCollectionViewCell

//テスト用に表示させるテキストラベル
@property (nonatomic,retain) UILabel *captionLabel;

@end
