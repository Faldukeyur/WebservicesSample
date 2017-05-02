//
//  ViewController.m
//  WebservicesSample
//
//  Created by keyur on 01/05/17.
//  Copyright © 2017 Keyur. All rights reserved.
//

#import "ViewController.h"
#import "CustomCell.h"
#import "AFNetworking.h"
#import "Progress.h"

@interface ViewController ()
{
    NSString *stringUrl;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    arrResult =[[NSMutableArray alloc]init];
    
    stringUrl = [NSString stringWithFormat:@""];

    //[self callWebServices];
    [[Progress getInstance]showProgress];
    [self CallWebServicesAF];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
-(void)CallWebServicesAF{
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    
    NSURL *URL = [NSURL URLWithString:stringUrl];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    
    NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:request completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
        if (error) {
            
            NSLog(@"Error: %@", error);
            
        } else {
            
            NSLog(@"%@", responseObject);
            
            
            arrResult=[responseObject valueForKey:@"results"];
            //  [arrResult addObject:dicYourResponse];
            
            NSLog(@"arrResult :- %@",arrResult);
            [tblView reloadData];
            [[Progress getInstance]stopProgress];
        }
    }];
    [dataTask resume];

}

-(void)callWebServices{
    
    NSURL *url = [NSURL URLWithString:stringUrl];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response,
                                               NSData *data, NSError *connectionError)
    {
        if (data.length > 0 && connectionError == nil)
        {
            NSDictionary *dicYourResponse = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
            NSLog(@"Result :- %@",dicYourResponse);
            
            arrResult=[dicYourResponse valueForKey:@"results"];
          //  [arrResult addObject:dicYourResponse];
            
            NSLog(@"arrResult :- %@",arrResult);
            [tblView reloadData];
        }
    }];
    
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;    //count of section
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [arrResult count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *CellIdentifier = @"CustomCell";
    
    CustomCell *cell = (CustomCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:CellIdentifier owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    cell.lblName =[[arrResult objectAtIndex:indexPath.row]valueForKey:@"name"];
    cell.lblCity.text = [[arrResult objectAtIndex:indexPath.row]valueForKey:@"city"];
    cell.lblCountry.text = [[arrResult objectAtIndex:indexPath.row]valueForKey:@"country"];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 100;
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
   
    
}
@end
