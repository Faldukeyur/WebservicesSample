//
//  CustomCell.h
//  WebservicesSample
//
//  Created by keyur on 01/05/17.
//  Copyright © 2017 Keyur. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomCell : UITableViewCell

@property (nonatomic,strong) IBOutlet UILabel *lblName;
@property (nonatomic,strong) IBOutlet UILabel *lblCity;
@property (nonatomic,strong) IBOutlet UILabel *lblCountry;

@end
