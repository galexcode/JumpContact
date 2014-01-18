//
//  SelectContact toShareViewController.h
//  ContactJump
//
//  Created by Raman on 07/01/14.
//  Copyright (c) 2014 iyasoft. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SelectContact_toShareViewController : UIViewController<UISearchDisplayDelegate, UITableViewDataSource, UITableViewDelegate,UISearchBarDelegate>
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
    
    BOOL  isBulkContacts;
    
    BOOL isSelectAll;
    
    
}
@property(nonatomic,retain)NSString *string1;
@property(nonatomic,retain)UITableView *tblContentList;
@property(strong, nonatomic)UISearchBar *searchBar1;
@property(strong, nonatomic)UISearchDisplayController *searchBarController;

@property(assign,nonatomic)BOOL isBulkContacts;

@end
