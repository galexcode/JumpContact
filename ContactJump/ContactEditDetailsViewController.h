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
    
 
    
    NSMutableDictionary *section_Names;
    NSMutableDictionary *section_LabelType;
    Person *per;
    
}

//@property (nonatomic,retain) NSMutableDictionary *checkboxClicked_Dict;
- (id)initWithPerson:(Person *)person;
@end
