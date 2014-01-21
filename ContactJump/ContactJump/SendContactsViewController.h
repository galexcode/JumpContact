//
//  SendContactsViewController.h
//  ContactJump
//
//  Created by Raman on 04/01/14.
//  Copyright (c) 2014 iyasoft. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SendContactsViewController : UIViewController<UISearchDisplayDelegate, UITableViewDataSource, UITableViewDelegate,UISearchBarDelegate>
{
    NSMutableArray *contentList;
    NSMutableArray *filteredContentList;
    BOOL isSearching;
    UILabel *navbartitle;
    UITableView *tableview;
    UIView *topview;
    UILabel *selectAll_lbl;
    UILabel *noofselected;
    NSArray *namesArry;
    NSMutableArray *alphabetsArray;
    
}

@property(nonatomic,retain)UITableView *tblContentList;
@property(strong, nonatomic)UISearchBar *searchBar1;
@property(strong, nonatomic)UISearchDisplayController *searchBarController;

@end
