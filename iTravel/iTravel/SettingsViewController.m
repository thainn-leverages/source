//
//  SettingsViewController.m
//  iTravel
//
//  Created by Thainq on 14/11/2013.
//  Copyright (c) 2013 Thainq. All rights reserved.
//

#import "SettingsViewController.h"
#import "SettingCells.h"
#import "LanguageList.h"

@interface SettingsViewController ()

@property (nonatomic, strong) NSString* boldFontName;
@property (nonatomic, strong) UIColor* onColor;

@end

@implementation SettingsViewController{

    NSArray *list;
    LanguageList *varpassed;
}



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
  //  UIColor* mainColor = [UIColor colorWithRed:100.0/255 green:168.0/255 blue:228.0/255 alpha:1.0f];
  //  self.tableView.backgroundColor = mainColor;
    
    list = [NSArray arrayWithObjects:@"Việt Nam", @"English", nil];
    SettingCells *langlist = [SettingCells new];
    langlist.name = @"LANGUAGE";//NSLocalizedString(@"LANGUAGE_CHOOSEN",@"Language");
    langlist.detail = @"LANGUAGE";//NSLocalizedString(@"LANGUAGE_LABEL",@"English");
    
    self.boldFontName = @"Avenir-Black";
     self.onColor = [UIColor colorWithRed:222.0/255 green:59.0/255 blue:47.0/255 alpha:1.0f];
  //  langlist.imageFile = @"language.png";

  //  self.tableView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"c-2-1-1.png"]];
  //  UINavigationBar *myBar = [[UINavigationBar alloc]initWithFrame:CGRectMake(0, 0, 320, 44)];
 //   [self.view addSubview:myBar];

   
	// Do any additional setup after loading the view.
    [self ReadDataFromPlist];
    //NSLog(@"%@", strlang);
}

- (IBAction)cancel:(id)sender {
        [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)choose:(id)sender {
    
        [self SavePlist:strlang];
        [self dismissViewControllerAnimated:YES completion:nil];
}
- (void) SavePlist:(NSString *)str{
    
    NSArray *sysPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory ,NSUserDomainMask, YES);
    
    NSString *documentsDirectory = [sysPaths objectAtIndex:0];
    
    NSString *filePath =  [documentsDirectory stringByAppendingPathComponent:@"config.plist"];
    NSError *errors;
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    if (![fileManager fileExistsAtPath: filePath])
    {
        NSString *bundle = [[NSBundle mainBundle] pathForResource:@"config" ofType:@"plist"]; //5
        
        [fileManager copyItemAtPath:bundle toPath: filePath error:&errors];
        
    }
    
    NSString *plistPath_1 = [[NSBundle mainBundle] pathForResource:@"config" ofType:@"plist"];
    
    NSDictionary *plistDict = [NSDictionary dictionaryWithObject:str forKey:@"Language"];
    
    
    NSString *error = nil;
    // create NSData from dictionary
    NSData *plistData = [NSPropertyListSerialization dataFromPropertyList:plistDict format:NSPropertyListXMLFormat_v1_0 errorDescription:&error];
    
    if(plistData)
    {
        
        [plistData writeToFile:plistPath_1 atomically:YES];
        

    }

    else
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Có lỗi xảy ra!"
                                                        message:@"Thực hiện lại thao tác chọn ngôn ngữ"
                                                       delegate:nil
                                              cancelButtonTitle:@"Tắt thông báo"
                                              otherButtonTitles:nil];
        [alert show];
    }
    
}

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
    
    strlang = [propertyDict objectForKey:@"Language"];
   
  //
  
    
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
    
    label.text =@"LANGUAGE"; //NSLocalizedString(@"LANGUAGE",@"LANGUAGE");
    
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

    
    UILabel *langLabel = (UILabel *)[cell viewWithTag:101];
    langLabel.text = @"LANGUAGE";//NSLocalizedString(@"LANGUAGE_CHOOSEN",@"Language");//@"Language";
    
    UILabel *langDetailLabel = (UILabel *)[cell viewWithTag:102];
   
   // NSLog(@"%@",[[NSUserDefaults standardUserDefaults] valueForKey:@"KEY1"]);
   // NSLog(@"%@", strlang);
    if([strlang integerValue]==0 ){
        langDetailLabel.text = @"Viet Nam";
    }
    else{
        langDetailLabel.text = @"English";
    }
    //NSLocalizedString(@"LANGUAGE_LABEL",@"English");//@"Viet Nam";//recipe.detail;

   
    return cell;
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"languagechoose"])
    {
      //  NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
       
        varpassed = segue.destinationViewController;
        varpassed.langdata = strlang;
      
        
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
