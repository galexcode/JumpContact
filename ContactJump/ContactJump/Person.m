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
            phoneNumber_Type,
            phoneNumber_Value,
            date_Type,date_Value,date_bday;

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
        
        

      
    }
    
    return self;
}


@end
