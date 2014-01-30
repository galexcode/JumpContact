//
//  Person.m
//  ContactJump
//
//  Created by Dex on 27/01/14.
//  Copyright (c) 2014 iyasoft. All rights reserved.
//

#import "Person.h"

@implementation Person
@synthesize phoneNumber_home,address_home,email_iCloud,email_home,email_other,email_work;
- (id) init {
    self = [super init];
    
    if (self) {
        phoneNumber_home= [[NSMutableArray alloc] init];
        address_home=[[NSMutableArray alloc] init];
        
        email_home=[[NSMutableArray alloc] init];
        email_work=[[NSMutableArray alloc] init];
        email_iCloud=[[NSMutableArray alloc] init];
        email_other=[[NSMutableArray alloc] init];
      
    }
    
    return self;
}


@end
