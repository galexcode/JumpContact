//
//  Person.h
//  ContactJump
//
//  Created by Dex on 27/01/14.
//  Copyright (c) 2014 iyasoft. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property (nonatomic, strong) NSString *firstName;
@property (nonatomic, strong) NSString *lastName;
@property (nonatomic, strong) NSString *fullName;
@property (nonatomic, strong) NSString *companyName;



@property (nonatomic, strong) NSMutableArray *phoneNumber_Type;
@property (nonatomic, strong) NSMutableArray *phoneNumber_Value;


@property (nonatomic, strong) NSMutableArray *address_Type;
@property (nonatomic, strong) NSMutableArray *address_Value;



@property (nonatomic, strong) NSMutableArray *email_Type;
@property (nonatomic, strong) NSMutableArray *email_Value;


@property (nonatomic, strong) NSMutableArray *url_Type;
@property (nonatomic, strong) NSMutableArray *url_Value;

@property (nonatomic, strong) NSMutableArray *socialProfile_Type;
@property (nonatomic, strong) NSMutableArray *socialProfile_Value;


@property (nonatomic, strong) NSMutableArray *IM_Type;
@property (nonatomic, strong) NSMutableArray *IM_Value;
;

@property (nonatomic, strong) NSMutableArray *date_Type;
@property (nonatomic, strong) NSMutableArray *date_Value;

@property (nonatomic, strong) NSString       *date_bday;

@property (nonatomic, strong) UIImage *pic;

@end
