//
//  Progress.h
//  WebservicesSample
//
//  Created by keyur on 01/05/17.
//  Copyright © 2017 Keyur. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SVProgressHUD.h"


@interface Progress : NSObject

+ (Progress *) getInstance;

-(void)showProgress;
-(void)stopProgress;
@end
