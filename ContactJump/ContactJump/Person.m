//
//  Person.m
//  ContactJump
//
//  Created by Dex on 27/01/14.
//  Copyright (c) 2014 iyasoft. All rights reserved.
//

#import "Person.h"

@implementation Person


@synthesize address_Type,address_Value,
            email_Type,email_Value,
            url_Type,url_Value,
            socialProfile_Type,socialProfile_Value,
            IM_Type,IM_Value,
            phoneNumber_Type,phoneNumber_Value,
            date_Type,date_Value,date_bday;

@synthesize editableAddress_Type,editableAddress_Value,
            editableDate_Type,editableDate_Value,
            editableEmail_Type,editableEmail_Value,
            editableIM_Type,editableIM_Value,
            editablePhoneNumber_Type,editablePhoneNumber_Value,
            editableSocialProfile_Type,editableSocialProfile_Value,
            editableUrl_Type,editableUrl_Value;

- (id) init {
    self = [super init];
    
    if (self) {
        
        
        phoneNumber_Type= [[NSMutableArray alloc] init];
        phoneNumber_Value= [[NSMutableArray alloc] init];
        
        email_Value= [[NSMutableArray alloc] init];
        email_Type= [[NSMutableArray alloc] init];
        
        url_Value= [[NSMutableArray alloc] init];
        url_Type= [[NSMutableArray alloc] init];
        
        
        IM_Value= [[NSMutableArray alloc] init];
        IM_Type= [[NSMutableArray alloc] init];
        
        socialProfile_Value= [[NSMutableArray alloc] init];
        socialProfile_Type= [[NSMutableArray alloc] init];
        
        address_Value= [[NSMutableArray alloc] init];
        address_Type= [[NSMutableArray alloc] init];
        
        
        date_Value= [[NSMutableArray alloc] init];
        date_Type= [[NSMutableArray alloc] init];
        
        
//        
//        editablePhoneNumber_Type= [[NSMutableArray alloc] init];
//        editablePhoneNumber_Value= [[NSMutableArray alloc] init];
//        
//        editableEmail_Type= [[NSMutableArray alloc] init];
//        editableEmail_Value= [[NSMutableArray alloc] init];
//        
//        editableUrl_Type= [[NSMutableArray alloc] init];
//        editableUrl_Value= [[NSMutableArray alloc] init];
//        
//        
//        editableIM_Type= [[NSMutableArray alloc] init];
//        editableIM_Value= [[NSMutableArray alloc] init];
//        
//        editableSocialProfile_Type= [[NSMutableArray alloc] init];
//        editableSocialProfile_Value= [[NSMutableArray alloc] init];
//        
//        editableAddress_Type= [[NSMutableArray alloc] init];
//        editableAddress_Value= [[NSMutableArray alloc] init];
//        
//        
//        editableDate_Type= [[NSMutableArray alloc] init];
//        editableDate_Value= [[NSMutableArray alloc] init];

        
        

      
    }
    
    return self;
}


@end
