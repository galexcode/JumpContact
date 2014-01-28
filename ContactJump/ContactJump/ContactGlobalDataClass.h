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

@property (nonatomic, retain) NSMutableArray      *contactDetails;

@property (nonatomic, retain) NSMutableArray      *vcs;
@property (nonatomic, retain) NSString      *contactsToBeShared_selected;
@property (nonatomic, retain) NSString      *recipients_selected;
@property (nonatomic, retain) NSString      *from_ShareMethodViewController;
+(ContactGlobalDataClass*)getInstance;
@end
