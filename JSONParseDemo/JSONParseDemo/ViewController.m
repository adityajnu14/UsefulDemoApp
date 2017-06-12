//
//  ViewController.m
//  JSONParseDemo
//
//  Created by Naheed Shamim on 20/01/17.
//  Copyright © 2017 Naheed Shamim. All rights reserved.
//

#import "ViewController.h"
#import "DataManager.h"
#import "User.h"

@interface ViewController ()
{
    NSMutableArray* userDataArr;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self fetchUserDetails];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//TO BE MOVED TO DATAMANAGER
- (void) fetchUserDetails
{
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask* dataTask = [session dataTaskWithURL:[NSURL URLWithString:@"https://www.reqres.in/api/users?page=2"] completionHandler:^(NSData* data, NSURLResponse* response, NSError* error)
    {
        DataManager* dataManager = [[DataManager alloc] init];
        
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        userDataArr = [dataManager getUserListFromDictionary:json];
        [userListTable reloadData];
    }];
    
    [dataTask resume];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return userDataArr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell* cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    
    User* user = [userDataArr objectAtIndex:indexPath.row];
    cell.textLabel.text = [user.firstName stringByAppendingFormat:@" %@", user.lastName];
    // TO BE DONE IN SEPARATE THREAD
    cell.imageView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:user.profileImageUrl]]];
    return cell;
}



@end
