//
//  CustomCell.m
//  WebservicesSample
//
//  Created by keyur on 01/05/17.
//  Copyright © 2017 Keyur. All rights reserved.
//

#import "CustomCell.h"

@implementation CustomCell

@synthesize lblName;
@synthesize lblCity;
@synthesize lblCountry;

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
