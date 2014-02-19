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

@property (nonatomic, strong) NSMutableArray *date_Type;
@property (nonatomic, strong) NSMutableArray *date_Value;

@property (nonatomic, strong) NSString       *date_bday;




//*************************************For Edit Page***************************************
@property (nonatomic, strong) NSMutableArray *editablePhoneNumber_Type;
@property (nonatomic, strong) NSMutableArray *editablePhoneNumber_Value;

@property (nonatomic, strong) NSMutableArray *editableAddress_Type;
@property (nonatomic, strong) NSMutableArray *editableAddress_Value;

@property (nonatomic, strong) NSMutableArray *editableEmail_Type;
@property (nonatomic, strong) NSMutableArray *editableEmail_Value;

@property (nonatomic, strong) NSMutableArray *editableUrl_Type;
@property (nonatomic, strong) NSMutableArray *editableUrl_Value;

@property (nonatomic, strong) NSMutableArray *editableSocialProfile_Type;
@property (nonatomic, strong) NSMutableArray *editableSocialProfile_Value;

@property (nonatomic, strong) NSMutableArray *editableIM_Type;
@property (nonatomic, strong) NSMutableArray *editableIM_Value;

@property (nonatomic, strong) NSMutableArray *editableDate_Type;
@property (nonatomic, strong) NSMutableArray *editableDate_Value;


@property (nonatomic, strong) UIImage *pic;
@property (nonatomic, strong) UIImage *editablePic;

@end
