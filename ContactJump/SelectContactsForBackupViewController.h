//
//  SelectContactsForBackupViewController.h
//  ContactJump
//
//  Created by Dex on 23/01/14.
//  Copyright (c) 2014 iyasoft. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SelectContactsForBackupViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>
{
    NSMutableArray *contentList;
    
    UILabel *navbartitle;
    UITableView *tableview;
    UIView *topview;
    UILabel *selectAll_lbl;
    UILabel *noofselected;
   
   
    
    NSArray *sectionIndex;
    UIButton   * checkBox_all;
    
    UILabel  *name_lbl;
    UIButton   * checkBox;
    UIButton   * editbtn;
    ContactGlobalDataClass *obj;
}
@property(nonatomic,retain)NSString *string1;
@property (nonatomic,retain) NSMutableDictionary *alphabetsArray;
@property (nonatomic,retain) NSMutableDictionary *checkboxClicked_Dict;


@end
