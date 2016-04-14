//
//  ByTypeViewController.m
//  CardeHolder
//
//  Created by ahex-mac on 04/01/16.
//  Copyright © 2016 AhexTechnologies. All rights reserved.
//

#import "ByTypeViewController.h"

@interface ByTypeViewController ()
{
    Header *header;
    AppDelegate *delegate ;
}
@end

@implementation ByTypeViewController
@synthesize tblContentList;
@synthesize searchBar;
@synthesize searchBarController;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    nameArray = [[NSMutableArray alloc]init];
    companyArray = [[NSMutableArray alloc]init];
    emailArray = [[NSMutableArray alloc]init];
    phoneArray = [[NSMutableArray alloc]init];
    noteArray = [[NSMutableArray alloc]init];
    dateArray = [[NSMutableArray alloc]init];
    
    self.view.backgroundColor = [UIColor colorWithHexString:@"#2E3540"];

    
    
    header = [[Header alloc]initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, self.view.frame.size.height/9.5)];
    header.backgroundColor = [UIColor colorWithHexString:@"#171E29"];
    header.delegate = self;
    [self.view addSubview:header];
    
    
    searchBar = [[UISearchBar alloc]initWithFrame:CGRectMake(0, self.view.frame.size.height/4, self.view.frame.size.width, 40)];
    searchBar.delegate = self;
    [self.view addSubview:searchBar];
    
    
    self.searchBarController
    = [[UISearchDisplayController alloc] initWithSearchBar:searchBar
                                        contentsController:self];
    self.searchBarController.searchResultsDelegate = self;
    self.searchBarController.searchResultsDataSource = self;
    self.searchBarController.delegate = self;
    self.searchBarController.searchResultsDelegate = self;
    self.searchBarController.searchResultsDataSource = self;
    // searchBar.frame = CGRectMake(0, 0, 0, 38);
    
    self.searchObj = [[UITextField alloc]initWithFrame:CGRectMake(30, 150, 200, 40)];
    self.searchObj.backgroundColor = [UIColor whiteColor];
    //[self.view addSubview:self.searchObj];
    
    filteredContentList = [[NSMutableArray alloc] init];
    delegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    if (isSearching) {
        return [filteredContentList count];
    }
    else {
        return [contentList count];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell...
    if (isSearching) {
        cell.textLabel.text = [filteredContentList objectAtIndex:indexPath.row];
    }
    else {
        cell.textLabel.text = [contentList objectAtIndex:indexPath.row];
    }
    return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"!!!!!%@",[filteredContentList objectAtIndex:indexPath.row]);
    NSLog(@"%lu",(unsigned long)[contentList indexOfObject:[filteredContentList objectAtIndex:indexPath.row]]);
    
   NSUInteger indexIs =  [contentList indexOfObject:[filteredContentList objectAtIndex:indexPath.row]];
    NSArray *array_user=[self getRecords];
    
    User *user = array_user[indexIs];
    NSArray *currentData = [[NSArray alloc]initWithObjects:user, nil];
    
    AllCardViewController *allCardVc = [[AllCardViewController alloc]init];
    allCardVc.datarray = currentData;
    [self presentViewController:allCardVc animated:YES completion:nil];
}

- (void)searchTableList {
    NSString *searchString = searchBar.text;
    
    NSString *expression=[NSString stringWithFormat:@"SELF contains[cd] '%@'",searchString];
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:expression];
    
    NSMutableArray *mArrayFiltered = [[contentList filteredArrayUsingPredicate:predicate] mutableCopy];
    
    filteredContentList=mArrayFiltered;
    [self.tblContentList reloadData];
    
    
    
//    for (NSString *tempStr in contentList) {
//        NSComparisonResult result = [tempStr compare:searchString options:(NSCaseInsensitiveSearch|NSDiacriticInsensitiveSearch) range:NSMakeRange(0, [searchString length])];
//        if (result == NSOrderedSame) {
//            [filteredContentList addObject:tempStr];
//        }
//    }
}

#pragma mark - Search Implementation

- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar {
    isSearching = YES;
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    NSLog(@"Text change - %d",isSearching);
    
    //Remove all objects first.
    [filteredContentList removeAllObjects];
    
    if([searchText length] != 0) {
        isSearching = YES;
        [self searchTableList];
    }
    else {
        isSearching = NO;
    }
    [self.tblContentList reloadData];
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    NSLog(@"Cancel clicked");
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    NSLog(@"Search Clicked");
    [self searchTableList];
}


-(void)viewWillAppear:(BOOL)animated
{
    NSLog(@"%f",self.view.frame.size.width);
    
    self.searchObj.placeholder = [NSString stringWithFormat:@"Search By %@",self.byTypeDataObj.type];
    
    header.frame = CGRectMake(0, 20, self.view.frame.size.width, self.view.frame.size.height/9.5);
    
    
    int a = [self.index intValue];
    
    NSArray *array_user=[self getRecords];
    
    NSLog(@"%@",array_user);
 
    for (int i=0; i<[array_user count]; i++)
    {
        User *user = array_user[i];
        
        [nameArray addObject:user.byname];
        [companyArray addObject:user.bycompany];
        [emailArray addObject:user.byemail];
        [phoneArray addObject:user.byphone];
        [noteArray addObject:user.bynote];
        [dateArray addObject:user.bydate];
    }
    
    [contentList removeAllObjects];
    switch (a)
    {
            
        case 0:
            contentList = nameArray;
            break;
        case 1:
            contentList = companyArray;
            break;
        case 2:
            contentList = emailArray;
            break;
        case 3:
            contentList = phoneArray;
            break;
        case 4:
            contentList = noteArray;
            break;
        case 5:
            contentList = dateArray;
            break;
        default:
            break;
    }
    
}

-(void)goHome
{
    ViewController *vc = [[ViewController alloc]init];
    [self presentViewController:vc animated:YES completion:nil];
}
-(void)goAddVc
{
    AddNewCardViewController *addVc = [[AddNewCardViewController alloc]init];
    [self presentViewController:addVc animated:YES completion:nil];
}
-(void)goShowVc
{
    AllCardViewController *allCardVc = [[AllCardViewController alloc]init];
    [self presentViewController:allCardVc animated:YES completion:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - DB Data
-(NSArray*)getRecords
{
    // initializing NSFetchRequest
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    
    
    //Setting Entity to be Queried
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"User"
                                              inManagedObjectContext:delegate.managedObjectContext];
    [fetchRequest setEntity:entity];
    NSError* error;
    
    // Query on managedObjectContext With Generated fetchRequest
    NSArray *fetchedRecords = [delegate.managedObjectContext executeFetchRequest:fetchRequest error:&error];
    
    
    // Returning Fetched Records
    return fetchedRecords;
}
@end
