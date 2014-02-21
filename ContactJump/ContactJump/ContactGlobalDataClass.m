//
//  ContactGlobalDataClass.m
//  ContactJump
//
//  Created by Dex on 21/01/14.
//  Copyright (c) 2014 iyasoft. All rights reserved.
//

#import "ContactGlobalDataClass.h"

@implementation ContactGlobalDataClass

@synthesize contactDetails,contactsToBeShared_selected,recipients_selected,from_ShareMethodViewController,edit_cname,edit_fullName,edit_lname;
@synthesize vcs,backBtnActivate,contactsArray,jsonString,recipientsArray,jsonString_recipients,userID,jsonString_withoutImages,fromRecievedDetailsPage;


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
        fromRecievedDetailsPage=@"0";
        contactsArray = [[NSMutableArray alloc] init];
        recipientsArray = [[NSMutableArray alloc] init];
    }
    
    return self;
    
}
@end
