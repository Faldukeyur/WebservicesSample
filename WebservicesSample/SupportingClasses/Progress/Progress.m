//
//  Progress.m
//  WebservicesSample
//
//  Created by keyur on 01/05/17.
//  Copyright © 2017 Keyur. All rights reserved.
//

#import "Progress.h"

static Progress *sharedInstance = nil;

@implementation Progress


+ (Progress *) getInstance{
    
    if(sharedInstance == nil)
    {
        sharedInstance  = [[Progress alloc] init];
    }
    return sharedInstance;
}

-(void)showProgress{
    
    [SVProgressHUD setMinimumSize:CGSizeMake(120 , 120)];
    [SVProgressHUD setBackgroundColor:[UIColor grayColor]];
    [SVProgressHUD setRingRadius:10.0f];
    [SVProgressHUD setRingThickness:10.0f];
    [SVProgressHUD setForegroundColor:[UIColor redColor]];
    [SVProgressHUD show];
}

-(void)stopProgress{
    
    [SVProgressHUD dismiss];

}


@end
