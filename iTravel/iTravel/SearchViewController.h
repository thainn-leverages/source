//
//  SearchViewController.h
//  iTravel
//
//  Created by Thainq on 13/11/2013.
//  Copyright (c) 2013 Thainq. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate, UIActionSheetDelegate>{

    IBOutlet UIActionSheet *obj_actionSheet_placefrom;
    IBOutlet UIActionSheet *obj_actionSheet_placeto;
    IBOutlet UIActionSheet *obj_actionSheet_price;
    IBOutlet UIActionSheet *obj_actionSheet_date;
    UIDatePicker *datepicker;
    UIPickerView *pFrom;
    UIPickerView *pTo;
    UIPickerView *pPrice;
    NSMutableArray *regionDataFrom;
    NSString *pFromlbl;
    int flag;
                     
   
}


@property (weak, nonatomic) IBOutlet UIButton *search;
@property (weak, nonatomic) IBOutlet UIButton *PlaceFrom;
@property (weak, nonatomic) IBOutlet UIButton *Price;

@property (weak, nonatomic) IBOutlet UIButton *DateSearch;

@end
