//
//  SelectRecipientsViewController.h
//  ContactJump
//
//  Created by Raman on 09/01/14.
//  Copyright (c) 2014 iyasoft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ContactSignUpDataService.h"

@interface SelectRecipientsViewController : UIViewController<UISearchDisplayDelegate, UITableViewDataSource, UITableViewDelegate,UISearchBarDelegate,ContactSignUpDelegate, UIAlertViewDelegate>
{
    NSMutableArray *contentList;
    NSMutableArray *filteredContentList;
    BOOL isSearching;
    UILabel *navbartitle;
    UITableView *tableview;
    UIView *topview;
    UILabel *selectAll_lbl;
    UILabel *noofselected;
    UIActivityIndicatorView* activityIndicator;
  
    UIButton *back_btn;
    
    NSArray *sectionIndex;
    UIButton   * checkBox_all;
    
    UILabel  *name_lbl;
    UIButton   * checkBox;
    UIButton   * editbtn;
    ContactGlobalDataClass *obj;
    
    BOOL forwardData;
}

-(void)sendID:(NSString *)recordId :(BOOL)forward ;


@property (nonatomic,strong) NSString* recordID;
@property (nonatomic,retain) NSMutableDictionary *alphabetsArray;
@property (nonatomic,retain) NSMutableDictionary *checkboxClicked_Dict;
@end
