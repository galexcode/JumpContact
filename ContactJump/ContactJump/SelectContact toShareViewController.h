//
//  SelectContact toShareViewController.h
//  ContactJump
//
//  Created by Raman on 07/01/14.
//  Copyright (c) 2014 iyasoft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SelectShareMethodViewController.h"
#import "ContactEditDetailsViewController.h"
@interface SelectContact_toShareViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
{
    NSMutableArray *contentList;
    NSMutableArray *filteredContentList;
    
    UILabel *navbartitle;
    UITableView *tableview;
    UIView *topview;
    UILabel *selectAll_lbl;
    UILabel *noofselected;
    NSArray *namesArry;
    
    BOOL  isBulkContacts;
    
   
    
   
    NSArray *sectionIndex;
    UIButton   * checkBox_all;
   
    UILabel  *name_lbl;
    UIButton   * checkBox;
    UIButton   * editbtn;
    ContactGlobalDataClass *obj;
    
}

@property(assign,nonatomic)BOOL isBulkContacts;
@property(nonatomic,retain)NSString *string1;

@property (nonatomic,retain) NSMutableDictionary *alphabetsArray;
@property (nonatomic,retain) NSMutableDictionary *checkboxClicked_Dict;
@end
