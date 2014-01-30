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


@property (nonatomic, strong) NSMutableArray *phoneNumber_home;
@property (nonatomic, strong) NSString *phoneNumber_Work;
@property (nonatomic, strong) NSString *phoneNumber_iPhone;
@property (nonatomic, strong) NSString *phoneNumber_mobile;
@property (nonatomic, strong) NSString *phoneNumber_main;
@property (nonatomic, strong) NSString *phoneNumber_HomeFax;
@property (nonatomic, strong) NSString *phoneNumber_WorkFax;
@property (nonatomic, strong) NSString *phoneNumber_Pager;
@property (nonatomic, strong) NSString *phoneNumber_other;


@property (nonatomic, strong) NSMutableArray *address_home;
@property (nonatomic, strong) NSString *address_work;
@property (nonatomic, strong) NSString *address_other;

@property (nonatomic, strong) NSMutableArray *email_home;
@property (nonatomic, strong) NSMutableArray *email_work;
@property (nonatomic, strong) NSMutableArray *email_iCloud;
@property (nonatomic, strong) NSMutableArray *email_other;

@end
