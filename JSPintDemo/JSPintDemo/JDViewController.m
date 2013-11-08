//
//  JDViewController.m
//  JSPintDemo
//
//  Created by Jay Slupesky on 10/7/12.
//

#import "JDViewController.h"

@interface JDViewController ()
@property (strong,nonatomic) IBOutlet UICollectionView *collectionView;
@property (strong,nonatomic) NSMutableArray* photoList;
@end

#define kCollectionCellBorderTop 17.0
#define kCollectionCellBorderBottom 17.0
#define kCollectionCellBorderLeft 17.0
#define kCollectionCellBorderRight 17.0


@implementation JDViewController



#pragma mark - UIViewController



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // set up delegates
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    
    // set inter-item spacing in the layout
    PintCollectionViewLayout* customLayout = (PintCollectionViewLayout*)self.collectionView.collectionViewLayout;
    customLayout.interitemSpacing = 14.0;

    // make up some test data
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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - Target Actions



- (IBAction)onAddCell:(id)sender
{
    [self.photoList addObject:@"egret.png"];

    NSUInteger newNumCells = [self.photoList count];
    NSIndexPath* newIndexPath = [NSIndexPath indexPathForItem:newNumCells - 1
                                                    inSection:0];
    [self.collectionView insertItemsAtIndexPaths:[NSArray arrayWithObject:newIndexPath]];
    
    [self.collectionView scrollToItemAtIndexPath:newIndexPath
                                atScrollPosition:UICollectionViewScrollPositionCenteredVertically
                                        animated:YES];
}



#pragma mark - UICollectionViewDelegateJSPintLayout




- (CGFloat)columnWidthForCollectionView:(UICollectionView*)collectionView layout:(UICollectionViewLayout*)collectionViewLayout
{
    return 222.0;
}

- (NSUInteger)maximumNumberOfColumnsForCollectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout
{
    NSUInteger numColumns = 4;

    return numColumns;
}

- (CGFloat)collectionView:(UICollectionView*)collectionView layout:(UICollectionViewLayout*)collectionViewLayout heightForItemAtIndexPath:(NSIndexPath*)indexPath
{
    NSUInteger index = [indexPath indexAtPosition:1];
    
    UIImageView* imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:self.photoList[index]]];
    CGSize rctSizeOriginal = imageView.bounds.size;
    double scale = (222  - (kCollectionCellBorderLeft + kCollectionCellBorderRight)) / rctSizeOriginal.width;
    CGSize rctSizeFinal = CGSizeMake(rctSizeOriginal.width * scale,rctSizeOriginal.height * scale);
    imageView.frame = CGRectMake(kCollectionCellBorderLeft,kCollectionCellBorderTop,rctSizeFinal.width,rctSizeFinal.height);

    CGFloat height = imageView.bounds.size.height + 100;
    
    return height;
}

- (BOOL)collectionView:(UICollectionView*)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath*)indexPath
{
    return YES;
}

- (BOOL)collectionView:(UICollectionView*)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath*)indexPath withSender:(id)sender
{
    return([NSStringFromSelector(action) isEqualToString:@"cut:"]);
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath*)indexPath withSender:(id)sender
{
    if([NSStringFromSelector(action) isEqualToString:@"cut:"])
    {
        NSUInteger index = [indexPath indexAtPosition:1];
        
        [self.photoList removeObjectAtIndex:index];
        
        [self.collectionView deleteItemsAtIndexPaths:[NSArray arrayWithObject:indexPath]];
    }
}



#pragma mark = UICollectionViewDataSource



- (NSInteger)collectionView:(UICollectionView*)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [self.photoList count];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView*)collectionView
{
    return 1;
}

- (UICollectionViewCell*)collectionView:(UICollectionView*)collectionView cellForItemAtIndexPath:(NSIndexPath*)indexPath
{
    UICollectionViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"PintReuse" forIndexPath:indexPath];
    
    CGRect rectReference = cell.bounds;
    
    PNCollectionCellBackgroundView* backgroundView = [[PNCollectionCellBackgroundView alloc] initWithFrame:rectReference];
    cell.backgroundView = backgroundView;
    
    UIView* selectedBackgroundView = [[UIView alloc] initWithFrame:rectReference];
    selectedBackgroundView.backgroundColor = [UIColor clearColor];   // no indication of selection
    cell.selectedBackgroundView = selectedBackgroundView;
    
    // remove subviews from previous usage of this cell
    [[cell.contentView subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    NSUInteger index = [indexPath indexAtPosition:1];
    
    UIImageView* imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:self.photoList[index]]];
    CGSize rctSizeOriginal = imageView.bounds.size;
    double scale = (cell.bounds.size.width  - (kCollectionCellBorderLeft + kCollectionCellBorderRight)) / rctSizeOriginal.width;
    CGSize rctSizeFinal = CGSizeMake(rctSizeOriginal.width * scale,rctSizeOriginal.height * scale);
    imageView.frame = CGRectMake(kCollectionCellBorderLeft,kCollectionCellBorderTop,rctSizeFinal.width,rctSizeFinal.height);
    
    [cell.contentView addSubview:imageView];
     
    CGRect rctLabel = CGRectMake(kCollectionCellBorderLeft,kCollectionCellBorderTop + rctSizeFinal.height + 5,rctSizeFinal.width,65);
    
    UILabel* label = [[UILabel alloc] initWithFrame:rctLabel];
    label.numberOfLines = 0;
    label.font = [UIFont systemFontOfSize:12];

    label.text = @"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum";
    
    [cell.contentView addSubview:label];
    
    
    return cell;

}

@end
