//
//  ListTourViewController.m
//  iTravel
//
//  Created by Thainq on 12/12/2013.
//  Copyright (c) 2013 Thainq. All rights reserved.
//

#import "ListTourViewController.h"
#import "ListTourCell.h"


@interface ListTourViewController ()

@end

@implementation ListTourViewController

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
   
	// Do any additional setup after loading the view.
}
- (IBAction)back:(id)sender {
     [self.navigationController popViewControllerAnimated:TRUE];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    ListTourCell* cell = [tableView dequeueReusableCellWithIdentifier:@"TourCell"];
    
    cell.fromLabel.text = @"Tp. Hồ Chí Minh";
    cell.toLabel.text = @"141213VN	Bắc Kinh -Tô Châu-Vô Tích -Hàng Châu - Thượng Hải (ECO - Siêu tiết kiệm) ";
    
    cell.dateLabel.text = @"2014-05-01";
    cell.likeCountLabel.text = @"2014-04-27";
    cell.priceLabel.text = @"20.000.000 VND";
    
   // NSString* profileImageName = self.profileImages[indexPath.row%self.profileImages.count];
    cell.profileImageView.image = [UIImage imageNamed:@"profile-1.jpg"];
    
    return cell;
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
