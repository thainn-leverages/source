//
//  CollectionViewCell.m
//  Newstest
//
//  Created by Thainq on 07/11/2013.
//  Copyright (c) 2013 Thainq. All rights reserved.
//

#import "CollectionViewCell.h"

@implementation CollectionViewCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        //背景色とテキストラベル設定
        self.backgroundColor = [UIColor lightGrayColor];
       
       // self.captionLabel = [[UILabel alloc] initWithFrame:CGRectZero];
      //  self.captionLabel.backgroundColor = [UIColor greenColor];
        
       // [self addSubview:self.captionLabel];
    }
    return self;
}

//セルの再利用
- (void)prepareForReuse
{
    [super prepareForReuse];
    
    //テキストラベルをクリア
   // self.captionLabel.text = nil;
}

//サブビューのレイアウト
-(void)layoutSubviews
{
    [super layoutSubviews];
    //self.captionLabel.frame = CGRectInset(self.bounds, 4, 4);
}

//表示処理
- (void)collectionView:(PSCollectionView *)collectionView fillCellWithObject:(id)object atIndex:(NSInteger)index
{
    [super collectionView:collectionView fillCellWithObject:object atIndex:index];

    //オブジェクトから値を取り出す
  //  NSString *name = object[@"image"];
    UIImage *image = [UIImage imageNamed: object[@"image"]];

   // self.captionLabel.text = name;
    self.image = image;
    //NSLog(@"%@", self.image);

}

//セルの高さ設定
+ (CGFloat)rowHeightForObject:(id)object inColumnWidth:(CGFloat)columnWidth
{
    //オブジェクトから高さを取り出し、セルの高さを返す
    return [object[@"height"] floatValue];
}

@end
