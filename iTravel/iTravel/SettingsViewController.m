//
//  SettingsViewController.m
//  iTravel
//
//  Created by Thainq on 14/11/2013.
//  Copyright (c) 2013 Thainq. All rights reserved.
//

#import "SettingsViewController.h"
#import "SettingCells.h"

@interface SettingsViewController ()

@property (nonatomic, strong) NSString* boldFontName;
@property (nonatomic, strong) UIColor* onColor;

@end

@implementation SettingsViewController



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
    UIColor* mainColor = [UIColor colorWithRed:100.0/255 green:168.0/255 blue:228.0/255 alpha:1.0f];
    self.tableView.backgroundColor = mainColor;
    
      
    SettingCells *langlist = [SettingCells new];
    langlist.name = NSLocalizedString(@"LANGUAGE_CHOOSEN",@"Language");
    langlist.detail = NSLocalizedString(@"LANGUAGE_LABEL",@"English");
    
    self.boldFontName = @"Avenir-Black";
     self.onColor = [UIColor colorWithRed:222.0/255 green:59.0/255 blue:47.0/255 alpha:1.0f];
  //  langlist.imageFile = @"language.png";

  //  self.tableView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"c-2-1-1.png"]];
  //  UINavigationBar *myBar = [[UINavigationBar alloc]initWithFrame:CGRectMake(0, 0, 320, 44)];
 //   [self.view addSubview:myBar];

    
	// Do any additional setup after loading the view.
}

- (IBAction)cancel:(id)sender {
        [self dismissViewControllerAnimated:YES completion:nil];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}
/*
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return NSLocalizedString(@"LANGUAGE_CHOOSEN",nil);
}
*/
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    UIView* headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 50)];
    headerView.backgroundColor = [UIColor clearColor];
    
    
    UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake(30, 9, 250, 40)];
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont fontWithName:self.boldFontName size:15.0f];
    label.textColor = self.onColor;
    
    label.text = NSLocalizedString(@"LANGUAGE_CHOOSEN",@"Language");
    
    [headerView addSubview:label];
    
    return headerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 44;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"settingscell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
  //  cell.textLabel.text = NSLocalizedString(@"Language",nil);
    
  //  UIImageView *langImageView = (UIImageView *)[cell viewWithTag:100];
   // langImageView.image = [UIImage imageNamed:@"language.png"];
    
    UILabel *langLabel = (UILabel *)[cell viewWithTag:101];
    langLabel.text = NSLocalizedString(@"LANGUAGE_CHOOSEN",@"Language");//@"Language";
    
    UILabel *langDetailLabel = (UILabel *)[cell viewWithTag:102];
    langDetailLabel.text = NSLocalizedString(@"LANGUAGE_LABEL",@"English");//@"Viet Nam";//recipe.detail;

   
    return cell;
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
