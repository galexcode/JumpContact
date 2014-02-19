//
//  ContactShareViaIDViewController.h
//  ContactJump
//
//  Created by Raman on 08/01/14.
//  Copyright (c) 2014 iyasoft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ContactGlobalDataClass.h"
#import "ContactSignUpDataService.h"
#import "SelectContact toShareViewController.h"
@interface ContactShareViaIDViewController : UIViewController<UITextFieldDelegate,ContactSignUpDelegate,UIAlertViewDelegate>{
    
     UILabel *navbartitle;
    
    
    UILabel *selectContact_lbl;
    UILabel *selectContact_lbl1;
    
    UIButton *check_btn;
    UIScrollView *scrollview3;
    UITextField *psw_Txt ;
    UILabel *enterpsw_lbl;
    ContactGlobalDataClass* obj;
    UIActivityIndicatorView *activityIndicator;
    UILabel *id_lbl;
}

@end
