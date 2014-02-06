//
//  ContactMainViewController.h
//  ContactJump
//
//  Created by Raman on 02/01/14.
//  Copyright (c) 2014 iyasoft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ContactGlobalDataClass.h"
#import "CustomUIASView.h"
#import "ContactSendContactDetailDelegate.h"

@interface ContactMainViewController : UIViewController<UITextFieldDelegate,SendContactDetailDelegate,UIAlertViewDelegate>
{
    ContactGlobalDataClass *obj;
    int popUp;
    UIView* bg;
    UIActivityIndicatorView *activityIndicator;
    NSString *result;
    NSString* verficationCode;
    NSString* userID;
}
@property (nonatomic, retain) CustomUIASView *uiasView;
@end
