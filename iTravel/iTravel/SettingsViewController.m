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
    NSString *keysave;
}
//@synthesize rowsave = _rowsave;



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
   // defaults = [NSUserDefaults standardUserDefaults];
 
    [self ReadDataFromPlist];
    defaults = [NSUserDefaults standardUserDefaults];
   /*
    UIColor* mainColor = [UIColor colorWithRed:100.0/255 green:168.0/255 blue:228.0/255 alpha:1.0f];
    self.tableView.backgroundColor = mainColor;
  */
  //  NSString *appDomain = [[NSBundle mainBundle] bundleIdentifier];
 //   [[NSUserDefaults standardUserDefaults] removePersistentDomainForName:appDomain];
    list = [NSArray arrayWithObjects:@"Việt Nam", @"English", nil];
    SettingCells *langlist = [SettingCells new];
    langlist.name = @"LANGUAGE";//NSLocalizedString(@"LANGUAGE_CHOOSEN",@"Language");
    langlist.detail = @"LANGUAGE";//NSLocalizedString(@"LANGUAGE_LABEL",@"English");
    
    self.boldFontName = @"Avenir-Black";
     self.onColor = [UIColor colorWithRed:222.0/255 green:59.0/255 blue:47.0/255 alpha:1.0f];

/*
    self.tableView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"c-2-1-1.png"]];
    UINavigationBar *myBar = [[UINavigationBar alloc]initWithFrame:CGRectMake(0, 0, 320, 44)];
    [self.view addSubview:myBar];
*/
   
	// Do any additional setup after loading the view.
    
   
}

- (IBAction)cancel:(id)sender {
    NSDictionary *defaultsDictionary = [[NSUserDefaults standardUserDefaults] dictionaryRepresentation];
    for (NSString *key in [defaultsDictionary allKeys]) {
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:key];
    }
    [[NSUserDefaults standardUserDefaults] synchronize];
    
        [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)choose:(id)sender {
    if ([defaults objectForKey:@"langset"]!=NULL) {
         [self SavePlist:[defaults objectForKey:@"langset"]];
    }
    else{
         [self SavePlist:strlang ];
    }

   
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void) SavePlist:(NSString *)str{
  
    
    //run on real device
   /*
  
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
  */
    
    //run on simulator

    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsPath = [paths objectAtIndex:0];
    
    NSString *plistPath_1 = [documentsPath stringByAppendingPathComponent:@"config.plist"];
    
    NSString *bundleFile = [[NSBundle mainBundle]pathForResource:@"config" ofType:@"plist"];
    
    
    //copy the file from the bundle to the doc directory
    [[NSFileManager defaultManager]copyItemAtPath:bundleFile toPath:plistPath_1 error:nil];
 //End codes run on simulator
    NSString *error;
    NSDictionary *plistDict = [NSDictionary dictionaryWithObject:str forKey:@"Language"];
    
    // create NSData from dictionary
    NSData *plistData = [NSPropertyListSerialization dataFromPropertyList:plistDict format:NSPropertyListXMLFormat_v1_0 errorDescription:&error];
   
   // NSLog(@"%@", plistPath_1);
    if(plistData)
    {
        
        [plistData writeToFile:plistPath_1 atomically:YES];
        
       // NSLog(@"Write file:%@", plistData);
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
  
    //Run on mobile
/*
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
  */
    
    //Run on simulator
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsPath = [paths objectAtIndex:0];
    
    NSString *plistPath = [documentsPath stringByAppendingPathComponent:@"config.plist"];
    
    NSString *bundleFile = [[NSBundle mainBundle]pathForResource:@"config" ofType:@"plist"];
    
    
    //copy the file from the bundle to the doc directory
    [[NSFileManager defaultManager]copyItemAtPath:bundleFile toPath:plistPath error:nil];
    
    //End run on simulator
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
    
    
    UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake(30, 9, 250, 42)];
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


  //   int rowsave = [defaults integerForKey:@"langset"];
  ///   NSLog(@"%d",rowsave );
      if([defaults objectForKey:@"langset"]){

        langDetailLabel.text =[list objectAtIndex:[defaults integerForKey:@"langset"]];
      }
      else{
          
        langDetailLabel.text = [list objectAtIndex:[strlang integerValue]];
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

- (void)viewWillAppear:(BOOL)animated {
  //  [self ReadDataFromPlist];
   // NSLog(@"%@", [defaults objectForKey:@"langset"]);
    [self.tableView reloadData];
   
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
