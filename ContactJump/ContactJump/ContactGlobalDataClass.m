//
//  ContactGlobalDataClass.m
//  ContactJump
//
//  Created by Dex on 21/01/14.
//  Copyright (c) 2014 iyasoft. All rights reserved.
//

#import "ContactGlobalDataClass.h"

@implementation ContactGlobalDataClass

@synthesize contactDetails,contactsToBeShared_selected,recipients_selected,from_ShareMethodViewController;
@synthesize vcs,backBtnActivate,contactsArray,jsonString;


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

-(id)init
{
    if(self = [super init]){
        
        NSLog(@"creating array");
        contactsArray = [[NSMutableArray alloc] init];
    }
    
    return self;
    
}
@end
