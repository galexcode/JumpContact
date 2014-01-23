//
//  SelectRecipientsViewController.h
//  ContactJump
//
//  Created by Raman on 09/01/14.
//  Copyright (c) 2014 iyasoft. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SelectRecipientsViewController : UIViewController<UISearchDisplayDelegate, UITableViewDataSource, UITableViewDelegate,UISearchBarDelegate>
{
    NSMutableArray *contentList;
    NSMutableArray *filteredContentList;
    BOOL isSearching;
    UILabel *navbartitle;
    UITableView *tableview;
    UIView *topview;
    UILabel *selectAll_lbl;
    UILabel *noofselected;
     NSMutableArray *alphabetsArray;
    NSArray * namesArry;
}
@property(nonatomic,retain)UITableView *tblContentList;
@property(strong, nonatomic)UISearchBar *searchBar1;
@property(strong, nonatomic)UISearchDisplayController *searchBarController;
@end
