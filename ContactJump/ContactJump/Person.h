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


@property (nonatomic, strong) NSMutableArray *socialProfile_Twitter;
@property (nonatomic, strong) NSMutableArray *socialProfile_Facebook;
@property (nonatomic, strong) NSMutableArray *socialProfile_Flickr;
@property (nonatomic, strong) NSMutableArray *socialProfile_LinkedIn;
@property (nonatomic, strong) NSMutableArray *socialProfile_MySpace;
@property (nonatomic, strong) NSMutableArray *socialProfile_SinaWeibo;


@property (nonatomic, strong) NSMutableArray *IM_Skype;
@property (nonatomic, strong) NSMutableArray *IM_MSNMsg;
@property (nonatomic, strong) NSMutableArray *IM_GTalk;
@property (nonatomic, strong) NSMutableArray *IM_FBMsg;
@property (nonatomic, strong) NSMutableArray *IM_AIM;
@property (nonatomic, strong) NSMutableArray *IM_YahooMsg;
@property (nonatomic, strong) NSMutableArray *IM_ICQ;
@property (nonatomic, strong) NSMutableArray *IM_QQ;
@property (nonatomic, strong) NSMutableArray *IM_Jabber;
@property (nonatomic, strong) NSMutableArray *IM_GaduGadu;



@end
