//
//  ContactDetailesViewController.h
//  ContactJump
//
//  Created by Raman on 12/01/14.
//  Copyright (c) 2014 iyasoft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ContactSignUpDataService.h"
@interface ContactDetailesViewController : UIViewController<ContactSignUpDelegate>
{
    NSString *noteText;
     NSString *time_shared;
     NSString *name_sender;
     NSString *size_withoutImage;
     NSString *size_withImage;
     NSString *numberOfContact_shared;
    UIActivityIndicatorView *activityIndicator;
    NSMutableArray *person_RecordRef;
}


-(void)senderNoteText:(NSString *)note :(NSString*)recordId :(NSString*)name :(NSString*)time :(NSString*)totalContactsShared :(NSString*)sizewithimage :(NSString*)sizeWithoutimage ;

@property (nonatomic,strong) NSString* recordID;
@end
