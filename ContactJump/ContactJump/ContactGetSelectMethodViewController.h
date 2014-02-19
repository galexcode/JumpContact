//
//  ContactGetSelectMethodViewController.h
//  ContactJump
//
//  Created by Raman on 11/01/14.
//  Copyright (c) 2014 iyasoft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ContactSignUpDataService.h"
#import "Base64.h"
#import "SendContactsViewController.h"

@interface ContactGetSelectMethodViewController : UIViewController<UITextFieldDelegate,ContactSignUpDelegate >{
    
    UILabel *navbartitle;
    UITextField* psw_Txt;
    UITextField *id_Txt;
    UIScrollView* scrollview;
    UIActivityIndicatorView* activityIndicator;
    NSMutableArray *person_RecordRef;
}

@end
