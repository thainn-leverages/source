//
//  travelViewController.m
//  Newstest
//
//  Created by Thainq on 07/11/2013.
//  Copyright (c) 2013 Thainq. All rights reserved.
//

#import "travelViewController.h"
#import "PSCollectionViewCell.h"
#import "CollectionViewCell.h"


@interface travelViewController ()
@property (strong,nonatomic) NSMutableArray* photoList;

@end

@implementation travelViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //セルに表示する文字列を格納する配列
    self.items = [NSMutableArray array];

    self.photoList = [NSMutableArray arrayWithCapacity:1];
    [self.photoList addObject:@"danielle.jpg"];
    [self.photoList addObject:@"bodegahead.png"];
    [self.photoList addObject:@"egret.png"];
    [self.photoList addObject:@"betceemay.jpg"];
    [self.photoList addObject:@"baby.jpg"];
    [self.photoList addObject:@"danielle.jpg"];
    [self.photoList addObject:@"bodegahead.png"];
    [self.photoList addObject:@"egret.png"];
    [self.photoList addObject:@"betceemay.jpg"];
    [self.photoList addObject:@"baby.jpg"];
    [self.photoList addObject:@"danielle.jpg"];
    [self.photoList addObject:@"bodegahead.png"];
    [self.photoList addObject:@"egret.png"];
    [self.photoList addObject:@"betceemay.jpg"];
    [self.photoList addObject:@"baby.jpg"];
  //  NSLog(@"%@", _photoList);
    
    //配列にオブジェクトを挿入
    for (int i=0;  i<6; i++) {
        
     //   NSString *name = [NSString stringWithFormat:@"PICT %d",i];
        
     
      //  UIImageView* imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:self.photoList[i]]];
        
      //  UIImage *imageView = [[UIImage alloc]init]
        NSNumber *height = @(70 + arc4random() % 90);
        NSDictionary *dictionary = @{@"image":[self.photoList objectAtIndex:i],@"height":height};
        
        [self.items addObject:dictionary];
        //NSLog(@"%@", self.items);
    }
    
    //collectionView生成
    self.collectionView = [[PSCollectionView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    
    [self.view addSubview:self.collectionView];
    
    //collectionViewの各種設定
    self.collectionView.collectionViewDelegate = self;
    self.collectionView.collectionViewDataSource = self;
    self.collectionView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    //表示する列数
    self.collectionView.numColsPortrait = 2;
    self.collectionView.numColsLandscape = 3;
    
    //データのリロード
    [self.collectionView reloadData];
}

//表示するセルの数
- (NSInteger)numberOfRowsInCollectionView:(PSCollectionView *)collectionView
{
    return [self.items count];
}

//セルの高さ
- (CGFloat)collectionView:(PSCollectionView *)collectionView heightForRowAtIndex:(NSInteger)index
{
    NSDictionary *item = [self.items objectAtIndex:index];
    
    return [CollectionViewCell rowHeightForObject:item inColumnWidth:self.collectionView.colWidth];
}

//セルの描画処理
- (PSCollectionViewCell *)collectionView:(PSCollectionView *)collectionView cellForRowAtIndex:(NSInteger)index
{
    NSDictionary *item = [self.items objectAtIndex:index];
    
    CollectionViewCell *cell = (CollectionViewCell *)[self.collectionView dequeueReusableViewForClass:[CollectionViewCell class]];
    
    if (cell == nil) {
        cell = [[CollectionViewCell alloc] initWithFrame:CGRectZero];
    }
    
    [cell collectionView:collectionView fillCellWithObject:item atIndex:index];
    //cell.cellLabel
    
    return cell;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
