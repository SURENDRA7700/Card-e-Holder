//
//  ByTypeViewController.h
//  CardeHolder
//
//  Created by ahex-mac on 04/01/16.
//  Copyright © 2016 AhexTechnologies. All rights reserved.
//









#import <UIKit/UIKit.h>
#import "DataHolder.h"
#import "Header.h"
#import "AddNewCardViewController.h"
#import "ViewController.h"
#import "AllCardViewController.h"
#import "AppDelegate.h"
#import "User.h"
@interface ByTypeViewController : UIViewController <HeaderDelegate,UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate,UISearchDisplayDelegate>
{
    NSMutableArray *contentList;
    NSMutableArray *filteredContentList;
    BOOL isSearching;
    NSMutableArray *nameArray,*companyArray,*emailArray,*phoneArray,*noteArray,*dateArray;
}

@property (strong, nonatomic) NSString *index;
@property (strong, nonatomic)   UITableView *tblContentList;
@property (strong, nonatomic)   UISearchBar *searchBar;
@property (strong, nonatomic)  UISearchDisplayController *searchBarController;


@property (strong, nonatomic) DataHolder *byTypeDataObj;
@property (strong, nonatomic) UITextField *searchObj;
@property (strong, nonatomic) UIButton *searchButton;@end
