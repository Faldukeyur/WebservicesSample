//
//  ViewController.h
//  WebservicesSample
//
//  Created by keyur on 01/05/17.
//  Copyright © 2017 Keyur. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
{
    NSMutableArray *arrResult;
   
    IBOutlet UILabel *lblName;
    IBOutlet UILabel *lblCity;
    IBOutlet UILabel *lblCountry;
    
    IBOutlet UITableView *tblView;
    
}
@end

