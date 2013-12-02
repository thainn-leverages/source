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
    NSString* boldFontName = @"Avenir-Black";
 //   self.view.backgroundColor = mainColor;
    
    self.search.backgroundColor = mainColor;
    self.search.layer.cornerRadius = 3.0f;
    self.search.titleLabel.font = [UIFont fontWithName:boldFontName size:20.0f];
    [self.search setTitle:@"SEARCH" forState:UIControlStateNormal];
    [self.search setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.search setTitleColor:[UIColor colorWithWhite:1.0f alpha:0.5f] forState:UIControlStateHighlighted];
    
    
    //self.view.backgroundColor = [UI012Color greenColor];
	// Do any additional setup after loading the view.
    
    regionDataFrom = [NSMutableArray arrayWithObjects:@"---All---",@"Tp. Hồ Chí Minh",@"Hà Nội", @"Đà Nẵng", @"Cần Thơ", @"Hải Phòng", @"Nha Trang", @"Huế", nil];
}


- (void) showPicker: (int ) tag{
    
    /* first create a UIActionSheet, where you define a title, delegate and a button to close the sheet again */
    obj_actionSheet_placefrom = [[UIActionSheet alloc]initWithTitle:@"" delegate:self cancelButtonTitle:nil  destructiveButtonTitle:nil otherButtonTitles:nil, nil];
    
    [obj_actionSheet_placefrom showInView:self.view.superview];
    [obj_actionSheet_placefrom setFrame:CGRectMake(0,260,320,300)];
    [obj_actionSheet_placefrom setTag:tag];
    UIToolbar *pickerToolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
    pickerToolbar.barStyle = UIBarStyleBlackOpaque;
    [pickerToolbar sizeToFit];
    NSMutableArray *barItems = [[NSMutableArray alloc] init];
    UIBarButtonItem *flexSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    [barItems addObject:flexSpace];
    
    UIBarButtonItem *doneBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(pickerDone)];
    [barItems addObject:doneBtn];
    [pickerToolbar setItems:barItems animated:YES];
    [obj_actionSheet_placefrom addSubview:pickerToolbar];
 
    
}

- (void)pickerDone{

    [obj_actionSheet_placefrom dismissWithClickedButtonIndex:1 animated:YES];
    if(!flag){
        [self.PlaceFrom setTitle:@"---All---" forState:UIControlStateNormal];
    }
    else{
        [self.PlaceFrom setTitle:pFromlbl forState:UIControlStateNormal];

    }
     
}

- (IBAction)CallshowPicker:(id)sender {
   
    [self showPicker:[sender tag]];
}

//delegate fucntion for uipicker view

- (void)willPresentActionSheet:(UIActionSheet *)actionSheet{
    
    if(actionSheet == obj_actionSheet_placefrom ){
  
        pFrom=[[UIPickerView alloc]initWithFrame:CGRectMake(0,40,0,216)];
        pFrom.showsSelectionIndicator = YES;
        pFrom.autoresizingMask = UIViewAutoresizingFlexibleHeight;
        pFrom.delegate = self;
        pFrom.dataSource = self;
        [actionSheet addSubview:pFrom];
        [pFrom setTag:105];
    }

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
   if(0)
    return [regionDataFrom count];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    
    return [regionDataFrom objectAtIndex:row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    
    if(pickerView.tag == 105){
        pFromlbl = [NSString stringWithFormat:@"%@",[regionDataFrom objectAtIndex:[pFrom selectedRowInComponent:0]]];
        flag = [pFrom selectedRowInComponent:0];
    }

}
- (void) showDate{
    
    obj_actionSheet_date=[[UIActionSheet alloc]initWithTitle:@"" delegate:self cancelButtonTitle:@"Cancel"  destructiveButtonTitle:@"Done" otherButtonTitles:nil, nil];
    [obj_actionSheet_date showInView:self.view];
    [obj_actionSheet_date setFrame:CGRectMake(0,65,320,450)];
    [obj_actionSheet_date setTag: 101];
    datepicker.hidden = NO;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
