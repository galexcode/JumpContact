//
//  ContactGlobalDataClass.h
//  ContactJump
//
//  Created by Dex on 21/01/14.
//  Copyright (c) 2014 iyasoft. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ContactGlobalDataClass : NSObject
{
    
}

@property (nonatomic, retain) NSMutableArray   *contactDetails;
@property (nonatomic, retain) NSMutableArray   *contactsArray;
@property (nonatomic, retain) NSMutableArray   *recipientsArray;
@property (nonatomic, retain) NSMutableArray   *vcs;
@property (nonatomic, retain) NSString         *userID;
@property (nonatomic, retain) NSString         *jsonString;
@property (nonatomic, retain) NSString         *jsonString_withoutImages;
@property (nonatomic, retain) NSString         *jsonString_recipients;
@property (nonatomic, retain) NSString      *contactsToBeShared_selected;
@property (nonatomic, retain) NSString      *recipients_selected;
@property (nonatomic, retain) NSString      *backBtnActivate;
@property (nonatomic, retain) NSString      *from_ShareMethodViewController;



+(ContactGlobalDataClass*)getInstance;
@end
