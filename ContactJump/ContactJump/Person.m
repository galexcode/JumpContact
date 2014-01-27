//
//  Person.m
//  ContactJump
//
//  Created by Dex on 27/01/14.
//  Copyright (c) 2014 iyasoft. All rights reserved.
//

#import "Person.h"

@implementation Person
@synthesize phoneNumber_home;
- (id) init {
    self = [super init];
    
    if (self) {
        phoneNumber_home= [[NSMutableArray alloc] init];
        
      
    }
    
    return self;
}


@end
