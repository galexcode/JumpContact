//
//  RecievedContactDetailsViewController.h
//  ContactJump
//
//  Created by Dex on 14/02/14.
//  Copyright (c) 2014 iyasoft. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RecievedContactDetailsViewController : UIViewController <UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate>
{
    UILabel *navbartitle;
    UITextField * first_Name;
    UITextField *last_Name;
    UITextField *company_Name;
    UITableView *tblVw;
    
    
    NSString *fname;
    NSString *lname;
    NSString*cname;
    UIImage* image1;
    
    NSMutableDictionary *section_Names;
    NSMutableDictionary *section_LabelType;
    ABRecordRef per;
    
    NSMutableArray *phoneNumber_Type;
    NSMutableArray *phoneNumber_Value;
    
    NSMutableArray *address_Type;
    NSMutableArray *address_Value;
    
    NSMutableArray *email_Type;
    NSMutableArray *email_Value;
    
    NSMutableArray *url_Type;
    NSMutableArray *url_Value;
    
    NSMutableArray *socialProfile_Type;
    NSMutableArray *socialProfile_Value;
    
    NSMutableArray *IM_Type;
    NSMutableArray *IM_Value;
    
    NSMutableArray *date_Type;
    NSMutableArray *date_Value;
    
    NSString       *date_bday;
}
- (id)initWithPerson:(ABRecordRef)person;

@end
