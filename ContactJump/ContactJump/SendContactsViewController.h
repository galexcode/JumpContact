//
//  SendContactsViewController.h
//  ContactJump
//
//  Created by Raman on 04/01/14.
//  Copyright (c) 2014 iyasoft. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SendContactsViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>
{
    NSMutableArray *contentList;
    
    UILabel *navbartitle;
    UITableView *tableview;
    UIView *topview;
    UILabel *selectAll_lbl;
    UILabel *noofselected;
    NSArray *namesArry;
    NSMutableArray *alphabetsArray;
    
}


@end