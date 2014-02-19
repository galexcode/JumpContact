//
//  ContactBackUpViewController.h
//  ContactJump
//
//  Created by Raman on 15/01/14.
//  Copyright (c) 2014 iyasoft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ContactBackupService.h"
#import "CustomUIViewForBackUp.h"
#import "ContactSignUpDataService.h"
#import "SendContactsViewController.h"
#import "Base64.h"
@interface ContactBackUpViewController : UIViewController<ContactBackupDelegate,UIAlertViewDelegate,ContactSignUpDelegate>
{
    UILabel                 *navbartitle;
    UIActivityIndicatorView * activityIndicator;
    ContactGlobalDataClass  *obj;
    UIView                  * bg;
    UILabel                 *lastBackup_Date;
    NSString                *jsonString;
    NSString                *jsonString_withoutImages;
    UILabel                 *downloadwithoutimgsubtitle_lbl;
    UILabel                 *downloadwithimgsubtitle_lbl;
    NSMutableArray          *person_RecordRef;
    BOOL backupWithImage;
    int popUp;
}
@property (nonatomic, retain) CustomUIViewForBackUp *uiasView;
@end
