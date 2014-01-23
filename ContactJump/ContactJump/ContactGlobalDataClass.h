//
//  ContactGlobalDataClass.h
//  ContactJump
//
//  Created by Dex on 21/01/14.
//  Copyright (c) 2014 iyasoft. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ContactGlobalDataClass : NSObject

@property (nonatomic, retain) NSMutableArray      *contactDetails;


+(ContactGlobalDataClass*)getInstance;
@end
