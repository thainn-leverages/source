//
//  NewsViewController.m
//  iTravel
//
//  Created by Thainq on 27/11/2013.
//  Copyright (c) 2013 Thainq. All rights reserved.
//
/*
 
    Becarefull, program can crah when using with MBProgressHUD
*/

#define kBgQueue dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)
#import "NewsViewController.h"
#import "NewsCell.h"
#import "NewsiTravelCell.h"
#import "DetailNewsiTravelViewController.h"

@interface NewsViewController ()
@property (nonatomic, strong) NSArray* newsList;

@end

@implementation NewsViewController
@synthesize segmentnews;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.keysResult = [[NSMutableArray alloc] init];

  //  self.navigationController.title

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    
  
    [self showLoading];
   // [self loadData];
  //  NSLog(@"%d", count);
}

- (void) loadData
{
     
    str = [NSString stringWithFormat:@"http://192.168.1.224/tourAPI/Tours/getNews"];
    urlResult =[NSURL URLWithString:str];
    NSData* data = [NSData dataWithContentsOfURL:urlResult];
    self.newsList = [NSArray arrayWithArray:[self fetchedDatatoResult:data]];
 
}

-(NSMutableArray *)fetchedDatatoResult: (NSData *)responseData{

    NSMutableArray *news_tmp = [NSMutableArray array];
    
    NSError *errorResult = nil;
    NSString *jsonResult = [NSString stringWithContentsOfURL:urlResult
                                                    encoding:NSUTF8StringEncoding
                                                       error:&errorResult];
    
    if(!errorResult) {
        NSData *jsonDataResult = [jsonResult dataUsingEncoding:NSUTF8StringEncoding];
        NSDictionary *jsonDictResult = [NSJSONSerialization JSONObjectWithData:jsonDataResult
                                                                       options:kNilOptions
                                                                         error:&errorResult];
        
         self.keysResult = [jsonDictResult valueForKey:@"News"] ;
<<<<<<< HEAD
         NewsCell *news = [[NewsCell alloc] init];
         news.name = [self.keysResult valueForKey:@"title"];
         news.imageData = [self.keysResult valueForKey:@"img"];
         news.desc = [self.keysResult valueForKey:@"description"];
        // [news_tmp addObject:news];
=======
        
        for(int i=0;i<[self.keysResult count];i++){
        
            NewsCell *news = [[NewsCell alloc] init];
            news.name = [[self.keysResult valueForKey:@"title"] objectAtIndex:i];
            news.imageFile = [[self.keysResult valueForKey:@"img"] objectAtIndex:i];
            news.desc = [[self.keysResult valueForKey:@"description"] objectAtIndex:i];
            [news_tmp addObject:news];
        }
         
       [self.tableView reloadData];
>>>>>>> ab3069c1245f01b829cbc7632dd7ca67df5044a6
     }
    
    else{
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Không tải được tin tức!"
                                                        message:@"Vui lòng thử lại"
                                                       delegate:nil
                                              cancelButtonTitle:@"Tắt thông báo"
                                              otherButtonTitles:nil];
        [alert show];
        
    }
  
<<<<<<< HEAD
    [HUD removeFromSuperview];
    return news;
=======
   // [HUD removeFromSuperview];
    return news_tmp;
>>>>>>> ab3069c1245f01b829cbc7632dd7ca67df5044a6
    
}

- (void) showLoading{
  
    HUD = [[MBProgressHUD alloc] initWithView:self.view];
    [self.view addSubview:HUD];
    HUD.mode = MBProgressHUDModeAnnularDeterminate;
    HUD.delegate = self;
    HUD.labelText = @"Loading...";
    [HUD show:YES];
    
    [HUD showWhileExecuting:@selector(loadData) onTarget:self withObject:nil animated:YES];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    // Return the number of rows in the section.
    return [self.keysResult count];
   
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"NewsCell";
<<<<<<< HEAD
    NewsiTravelCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
=======
    NewsiTravelCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
 /*
>>>>>>> ab3069c1245f01b829cbc7632dd7ca67df5044a6
    if (cell == nil) {
        cell = [[NewsiTravelCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
 */ 
      NewsCell *newss = [self.newsList objectAtIndex:indexPath.row];
      [cell setDetailsWithNews:newss];
    NSLog(@"%ld", (long)segmentnews.selectedSegmentIndex);
    
/*
   // NSLog(@"%@", self.keysResult);
      UIImageView *langImageView = (UIImageView *)[cell viewWithTag:100];
    
  langImageView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[[self.keysResult objectAtIndex:indexPath.row]  valueForKey:@"img"]]]];
                  
    UILabel *langLabel = (UILabel *)[cell viewWithTag:101];
    langLabel.text = [[self.keysResult objectAtIndex:indexPath.row]  valueForKey:@"title"];

    
    UILabel *langDetailLabel = (UILabel *)[cell viewWithTag:102];
    langDetailLabel.text =[[self.keysResult objectAtIndex:indexPath.row] valueForKey:@"description"];
*/    
    return cell;
}
/*
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    [self performSegueWithIdentifier:@"detailnews" sender:self];
    
    
  //   <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
   //  [self.navigationController pushViewController:detailViewController animated:YES];
    
}
*/
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    DetailNewsiTravelViewController *detail = segue.destinationViewController;
    
    NSIndexPath* indexPath = [self.tableView indexPathForSelectedRow];

    detail.news = [[self.keysResult valueForKey:@"detail"] objectAtIndex:indexPath.row];
    
    
}


- (IBAction)NewsTypeChanged:(UISegmentedControl*)segmentedControl
{
    switch (segmentedControl.selectedSegmentIndex)
    {
        case 0:
            NSLog(@"0");
            break;
        case 1:
            NSLog(@"1");
            break;
        case 2:
             NSLog(@"2");
            break;
            
        default:
            break;
    }
    NSLog(@"List news");
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate



- (void)viewWillAppear:(BOOL)animated {
  
  //  [self.tableView reloadData];
       
    
}
@end
