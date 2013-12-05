//
//  LanguageList.m
//  iTravel
//
//  Created by Thainq on 25/11/2013.
//  Copyright (c) 2013 Thainq. All rights reserved.
//

#import "LanguageList.h"

@interface LanguageList ()

@end

@implementation LanguageList {

    NSArray *langlist;
    NSIndexPath* checkedIndexPath;

}


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
  // self.tableView.backgroundColor = [UIColor clearColor];
// self.tableView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"c-2-1-1.png"]];
    langlist = [NSArray arrayWithObjects:@"Việt Nam", @"English", nil];
    
   // [self.tableView setBackgroundView:nil];
    //[self.tableView setBackgroundView:[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"c-2-1-1.png"]]] ;
    
   // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
   
   // [[self navigationItem] setBackBarButtonItem:backButton];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)back:(id)sender {
    
    [self.navigationController popViewControllerAnimated:TRUE];
    
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
    return [langlist count];
}

- (NSString *)getKeyForIndex:(int)index
{
    return [NSString stringWithFormat:@"KEY%d",index];
}

- (BOOL) getCheckedForIndex:(int)index
{
    if([[[NSUserDefaults standardUserDefaults] valueForKey:[self getKeyForIndex:index]] boolValue]==YES)
    {
        return YES;
    }
    else
    {
        return NO;
    }
}

- (void) checkedCellAtIndex:(int)index
{
    BOOL boolChecked = [self getCheckedForIndex:index];
    
    [[NSUserDefaults standardUserDefaults] setValue:[NSNumber numberWithBool:!boolChecked] forKey:[self getKeyForIndex:index]];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"languagelist";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    
    cell.textLabel.text = [langlist objectAtIndex:indexPath.row];
    if([self getCheckedForIndex:indexPath.row]==YES){
        NSLog(@"1");
              cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }

    else
    {

        cell.accessoryType = UITableViewCellAccessoryNone;
    }
/*
    if([self->checkedIndexPath isEqual:indexPath])
    {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }
    else
    {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
 */
   // cell.backgroundView = [UIImage imageNamed:@"c-2-1-1.png"];
   
    // Configure the cell...
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Uncheck the previous checked row
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    [self checkedCellAtIndex:indexPath.row];
    
    if([self getCheckedForIndex:indexPath.row]==YES)
    {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }
    else
    {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
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

- (void)ReadDataFromPlist{
    
    NSArray *sysPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory ,NSUserDomainMask, YES);
    
    NSString *documentsDirectory = [sysPaths objectAtIndex:0];
    
    NSString *filePath =  [documentsDirectory stringByAppendingPathComponent:@"config.plist"];
    
    NSError *error;
    
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    if (![fileManager fileExistsAtPath: filePath]) //4
        
    {
        NSString *bundle = [[NSBundle mainBundle] pathForResource:@"config" ofType:@"plist"]; //5
        
        [fileManager copyItemAtPath:bundle toPath: filePath error:&error];
        
        
    }
    
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"config" ofType:@"plist"];
    
    NSMutableDictionary * propertyDict = [[NSMutableDictionary alloc] initWithContentsOfFile:plistPath];
    
    languageSet = [propertyDict objectForKey:@"Language"];
    
    NSLog(@"%@", languageSet);
   
    

}

- (void)viewWillAppear:(BOOL)animated {
    
    [self ReadDataFromPlist];
    
    
}



@end
