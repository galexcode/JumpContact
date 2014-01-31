//
//  ContactEditDetailsViewController.h
//  ContactJump
//
//  Created by Dex on 27/01/14.
//  Copyright (c) 2014 iyasoft. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ContactEditDetailsViewController : UIViewController <UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate>
{
    UIImageView *img;
    UITextField *first_Name;
    UITextField *last_Name;
    UITextField *company_Name;
    UITableView *tblVw;
    UILabel *navbartitle;
    
    NSString *fname;
    NSString *lname;
    NSString*cname;
    
    NSMutableArray *phoneNumber_home;
    NSMutableArray *address;
    NSMutableArray *emailIDs;
    NSMutableArray *socialProfiles;
    NSMutableArray *IMProfiles;
    NSMutableArray *URLs;
    NSMutableArray *dates;
    
}


- (id)initWithPerson:(Person *)person;
@end
