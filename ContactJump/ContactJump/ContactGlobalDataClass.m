//
//  ContactGlobalDataClass.m
//  ContactJump
//
//  Created by Dex on 21/01/14.
//  Copyright (c) 2014 iyasoft. All rights reserved.
//

#import "ContactGlobalDataClass.h"

@implementation ContactGlobalDataClass
@synthesize contactDetails;

static ContactGlobalDataClass *instance =nil;
+(ContactGlobalDataClass *)getInstance
{
    @synchronized(self)
    {
        if(instance==nil)
        {
            
            instance= [ContactGlobalDataClass new];
        }
    }
    return instance;
}
@end
