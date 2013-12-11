//
//  SearchViewController.m
//  iTravel
//
//  Created by Thainq on 13/11/2013.
//  Copyright (c) 2013 Thainq. All rights reserved.
//

#import "SearchViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface SearchViewController ()

@end

@implementation SearchViewController

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
    UIColor* mainColor = [UIColor colorWithRed:47.0/255 green:168.0/255 blue:228.0/255 alpha:1.0f];
  //  UIColor* darkColor = [UIColor colorWithRed:10.0/255 green:78.0/255 blue:108.0/255 alpha:1.0f];
    
//    NSString* fontName = @"Avenir-Black";
    NSString* boldFontName = @"Avenir";
 //   self.view.backgroundColor = mainColor;
  
    
   //conveert date to string for title of button date
  /**/
     dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd/MM/yyyy"];
     NSString *dateString = [dateFormatter stringFromDate:[NSDate date]];
 /**/
     self.search.backgroundColor = mainColor;
     self.search.layer.cornerRadius = 3.0f;
     self.search.titleLabel.font = [UIFont fontWithName:boldFontName size:20.0f];
    
    
    [self.search setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.search setTitleColor:[UIColor colorWithWhite:1.0f alpha:0.5f] forState:UIControlStateHighlighted];
    
    [self.DateSearch setTitle:dateString forState:UIControlStateNormal];
    //self.view.backgroundColor = [UI012Color greenColor];
	// Do any additional setup after loading the view.
    
    regionDataFrom = [NSMutableArray arrayWithObjects:@"---All---",@"Tp. Hồ Chí Minh",@"Hà Nội", @"Đà Nẵng", @"Cần Thơ", @"Hải Phòng", @"Nha Trang", @"Huế", nil];
    regionDataTo = [NSMutableArray arrayWithObjects:@"---All---",@"Đồng Tháp",@"Trà Vinh",@"Bến Tre", @"Kiên Giang", @"Cần Thơ", @"Đà Lạt", @"Long An", @"Tiền Giang", nil];
    
    priceData      = [NSMutableArray arrayWithObjects:@"---All---",@"Dưới 3 triệu",@"3-7 triệu", @"7-12 triệu", @"12-15 triệu", @"15-18 triệu", @"18-22 triệu", @"22-32 triệu",@"Trên 32 triệu", nil];

}

- (void)showPicker: (int ) tag{
    
    /* first create a UIActionSheet, where you define a title, delegate and a button to close the sheet again */
    if(tag==1){
        obj_actionSheet_placefrom = [[UIActionSheet alloc]initWithTitle:@"" delegate:self cancelButtonTitle:nil  destructiveButtonTitle:nil otherButtonTitles:nil, nil];
        
        [obj_actionSheet_placefrom showInView:self.view.superview];
        [obj_actionSheet_placefrom setFrame:CGRectMake(0,225,320,300)];
        [obj_actionSheet_placefrom setTag:tag];
        UIToolbar *pickerToolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
        pickerToolbar.barStyle = UIBarStyleBlackOpaque;
        [pickerToolbar sizeToFit];
        NSMutableArray *barItems = [[NSMutableArray alloc] init];
        UIBarButtonItem *flexSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
        [barItems addObject:flexSpace];
        
        UIBarButtonItem *doneBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(PickerPlaceFromDone)];
        [barItems addObject:doneBtn];
        [pickerToolbar setItems:barItems animated:YES];
        [obj_actionSheet_placefrom addSubview:pickerToolbar];
    }
    if(tag==2){
        obj_actionSheet_placeto = [[UIActionSheet alloc]initWithTitle:@"" delegate:self cancelButtonTitle:nil  destructiveButtonTitle:nil otherButtonTitles:nil, nil];
        
        [obj_actionSheet_placeto showInView:self.view.superview];
        [obj_actionSheet_placeto setFrame:CGRectMake(0,225,320,300)];
        [obj_actionSheet_placeto setTag:tag];
        UIToolbar *pickerToolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
        pickerToolbar.barStyle = UIBarStyleBlackOpaque;
        [pickerToolbar sizeToFit];
        NSMutableArray *barItems = [[NSMutableArray alloc] init];
        UIBarButtonItem *flexSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
        [barItems addObject:flexSpace];
        
        UIBarButtonItem *doneBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(PickerPlaceToDone)];
        [barItems addObject:doneBtn];
        [pickerToolbar setItems:barItems animated:YES];
        [obj_actionSheet_placeto addSubview:pickerToolbar];
    }
    if(tag==3){
        obj_actionSheet_price = [[UIActionSheet alloc]initWithTitle:@"" delegate:self cancelButtonTitle:nil  destructiveButtonTitle:nil otherButtonTitles:nil, nil];
        
        [obj_actionSheet_price showInView:self.view.superview];
        [obj_actionSheet_price setFrame:CGRectMake(0,225,320,300)];
        [obj_actionSheet_price setTag:tag];
        UIToolbar *pickerToolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
        pickerToolbar.barStyle = UIBarStyleBlackOpaque;
        [pickerToolbar sizeToFit];
        NSMutableArray *barItems = [[NSMutableArray alloc] init];
        UIBarButtonItem *flexSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
        [barItems addObject:flexSpace];        
        UIBarButtonItem *doneBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(PickerPriceDone)];
        [barItems addObject:doneBtn];
        [pickerToolbar setItems:barItems animated:YES];
        [obj_actionSheet_price addSubview:pickerToolbar];
    }

}

- (void)PickerPriceDone{

    [obj_actionSheet_price dismissWithClickedButtonIndex:1 animated:YES];
    if(!flagPrice){
        [self.Price setTitle:@"---All---" forState:UIControlStateNormal];
    }
    else{
        [self.Price setTitle:pPricelbl forState:UIControlStateNormal];

    }
     
}

- (void)PickerPlaceToDone{
    
    [obj_actionSheet_placeto dismissWithClickedButtonIndex:1 animated:YES];
    if(!flagTo){
        [self.PlaceTo setTitle:@"---All---" forState:UIControlStateNormal];
    }
    else{
        [self.PlaceTo setTitle:pTolbl forState:UIControlStateNormal];
        
    }
    
}

- (void)PickerPlaceFromDone{
    
    [obj_actionSheet_placefrom dismissWithClickedButtonIndex:1 animated:YES];
    if(!flagFrom){
        [self.PlaceFrom setTitle:@"---All---" forState:UIControlStateNormal];
    }
    else{
        [self.PlaceFrom setTitle:pFromlbl forState:UIControlStateNormal];
        
    }
}

- (void)PickerDateDone{
     [obj_actionSheet_date dismissWithClickedButtonIndex:1 animated:YES];
    
    datesave = datepicker.date;
    dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd/MM/yyyy"];
    Date_str = [dateFormatter stringFromDate:datesave];
    [self.DateSearch setTitle:Date_str forState:UIControlStateNormal];
}

- (IBAction)CallshowPicker:(id)sender {
    [self showPicker:[sender tag]];
}

- (IBAction)CallShowDatePicker:(id)sender {
    
    [self showDatePicker];
}

//delegate fucntion for uipicker view

- (void)willPresentActionSheet:(UIActionSheet *)actionSheet{
    
    if(actionSheet == obj_actionSheet_placefrom){
  
        pFrom=[[UIPickerView alloc]initWithFrame:CGRectMake(0,40,0,216)];
        pFrom.showsSelectionIndicator = YES;
      //  pFrom.autoresizingMask = UIViewAutoresizingFlexibleHeight;
        pFrom.delegate = self;
        pFrom.dataSource = self;
        [actionSheet addSubview:pFrom];
        [pFrom setTag:104];
        [pFrom selectRow:flagFrom inComponent:0 animated:NO];
    }
    if(actionSheet == obj_actionSheet_placeto){
    
        pTo=[[UIPickerView alloc]initWithFrame:CGRectMake(0,40,0,216)];
        pTo.showsSelectionIndicator = YES;
       // pTo.autoresizingMask = UIViewAutoresizingFlexibleHeight;
        pTo.delegate = self;
        pTo.dataSource = self;
        [actionSheet addSubview:pTo];
        [pTo setTag:105];
        [pTo selectRow:flagTo inComponent:0 animated:NO];
    }
    
    if(actionSheet == obj_actionSheet_price){
        
        pPrice=[[UIPickerView alloc]initWithFrame:CGRectMake(0,40,0,216)];
        pPrice.showsSelectionIndicator = YES;
        // pTo.autoresizingMask = UIViewAutoresizingFlexibleHeight;
        pPrice.delegate = self;
        pPrice.dataSource = self;
        [actionSheet addSubview:pPrice];
        [pPrice setTag:106];
        [pPrice selectRow:flagPrice inComponent:0 animated:NO];
    }
    
    if(actionSheet == obj_actionSheet_date){

        datepicker=[[UIDatePicker alloc]initWithFrame:CGRectMake(0,40,0,100)];
        datepicker.datePickerMode=UIDatePickerModeDate;
        NSString *maxdatefromtring = @"01/01/2020";
        NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
        
        [dateFormat setDateFormat:@"dd/MM/yyyy"];
 
        NSDate *maxdate = [dateFormat dateFromString:maxdatefromtring];
        
        datepicker.minimumDate = [NSDate date];
        datepicker.maximumDate = maxdate;
        [actionSheet addSubview:datepicker];
        [datepicker setTag:107];        
        if(datesave){
            [datepicker setDate:datesave animated:NO];
        }
           
    }

}

- (void) showDatePicker{

    obj_actionSheet_date=[[UIActionSheet alloc]initWithTitle:@"" delegate:self cancelButtonTitle:nil  destructiveButtonTitle:nil otherButtonTitles:nil, nil];
    [obj_actionSheet_date showInView:self.view.superview];
    [obj_actionSheet_date setFrame:CGRectMake(0,225,320,300)];
    [obj_actionSheet_date setTag:101];
    UIToolbar *pickerToolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
    pickerToolbar.barStyle = UIBarStyleBlackOpaque;
    [pickerToolbar sizeToFit];
    NSMutableArray *barItems = [[NSMutableArray alloc] init];
    UIBarButtonItem *flexSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    [barItems addObject:flexSpace];
    
    UIBarButtonItem *doneBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(PickerDateDone)];
    [barItems addObject:doneBtn];
    [pickerToolbar setItems:barItems animated:YES];
    [obj_actionSheet_date addSubview:pickerToolbar];
    
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component {
    CGFloat componentWidth = 0.0;
	componentWidth = self.view.frame.size.width;
	return componentWidth;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if(pickerView.tag==104){
        return [regionDataFrom count];
    }
    else if(pickerView.tag==105){
        return [regionDataTo count];
    }
    else
        return [priceData count];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    
    if(pickerView.tag==104){
        return [regionDataFrom objectAtIndex:row];
    }
    else if(pickerView.tag==105){
        return [regionDataTo objectAtIndex:row];
    }
    else
        return [priceData objectAtIndex:row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    
    if(pickerView.tag == 104){
        pFromlbl = [NSString stringWithFormat:@"%@",[regionDataFrom objectAtIndex:[pFrom selectedRowInComponent:0]]];
        flagFrom = [pFrom selectedRowInComponent:0];
    }
    
    if(pickerView.tag == 105){
        pTolbl = [NSString stringWithFormat:@"%@",[regionDataTo objectAtIndex:[pTo selectedRowInComponent:0]]];
        flagTo = [pTo selectedRowInComponent:0];
    }
    if(pickerView.tag == 106){
        pPricelbl = [NSString stringWithFormat:@"%@",[priceData objectAtIndex:[pPrice selectedRowInComponent:0]]];
        flagPrice = [pPrice selectedRowInComponent:0];
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

}
    
- (void)viewWillAppear:(BOOL)animated {
    [self ReadDataFromPlist];
    if([strlang integerValue] == 0){
        [self.search setTitle:  @"TÌM KIẾM" forState:UIControlStateNormal];
        self.lbl_from.text   =  @"Nơi đi:";
        self.lbl_place.text  =  @"Nơi đến:";
        self.lbl_price.text  =  @"Giá tiền:";        
        self.lbl_date.text   =  @"Ngày xuất phát:";
        
    }else{
        [self.search setTitle: @"SEARCH" forState:UIControlStateNormal];
        self.lbl_from.text  =  @"Departure place:";
        self.lbl_place.text =  @"Destination:";
        self.lbl_price.text =  @"Price:";
        self.lbl_date.text  =  @"Departure date:";
    }

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
