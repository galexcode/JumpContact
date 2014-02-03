//
//  Person.m
//  ContactJump
//
//  Created by Dex on 27/01/14.
//  Copyright (c) 2014 iyasoft. All rights reserved.
//

#import "Person.h"

@implementation Person
@synthesize address_home,address_other,address_work,email_iCloud,email_home,email_other,email_work,phone;
@synthesize socialProfile_Facebook,socialProfile_Flickr,socialProfile_LinkedIn,
            socialProfile_Twitter,socialProfile_SinaWeibo,socialProfile_MySpace;

@synthesize IM_AIM,IM_FBMsg,IM_GTalk,IM_ICQ,IM_MSNMsg,IM_QQ,IM_Skype,IM_YahooMsg,IM_GaduGadu,IM_Jabber,
            phoneNumber_WorkFax,phoneNumber_Work,phoneNumber_Pager,phoneNumber_other,phoneNumber_mobile,
            phoneNumber_main,phoneNumber_iPhone,phoneNumber_HomeFax,phoneNumber_home,
            url_home,url_homePage,url_work,url_other,
            date_Anniversary,date_other,date_bday;

- (id) init {
    self = [super init];
    
    if (self) {
        
        
        phone=[[NSMutableDictionary alloc] init];
        phoneNumber_home= [[NSMutableArray alloc] init];
        phoneNumber_Work= [[NSMutableArray alloc] init];
        phoneNumber_iPhone= [[NSMutableArray alloc] init];
        phoneNumber_mobile= [[NSMutableArray alloc] init];
        phoneNumber_main= [[NSMutableArray alloc] init];
        phoneNumber_HomeFax= [[NSMutableArray alloc] init];
        phoneNumber_WorkFax= [[NSMutableArray alloc] init];
        phoneNumber_Pager= [[NSMutableArray alloc] init];
        phoneNumber_other= [[NSMutableArray alloc] init];
        
        
        
        address_home=[[NSMutableArray alloc] init];
        address_work=[[NSMutableArray alloc] init];
        address_other=[[NSMutableArray alloc] init];
        
        email_home=[[NSMutableArray alloc] init];
        email_work=[[NSMutableArray alloc] init];
        email_iCloud=[[NSMutableArray alloc] init];
        email_other=[[NSMutableArray alloc] init];
        
        url_home=[[NSMutableArray alloc] init];
        url_homePage=[[NSMutableArray alloc] init];
        url_other=[[NSMutableArray alloc] init];
        url_work=[[NSMutableArray alloc] init];
        
        socialProfile_Twitter=[[NSMutableArray alloc] init];
        socialProfile_Facebook=[[NSMutableArray alloc] init];
        socialProfile_Flickr=[[NSMutableArray alloc] init];
        socialProfile_LinkedIn=[[NSMutableArray alloc] init];
        socialProfile_MySpace=[[NSMutableArray alloc] init];
        socialProfile_SinaWeibo=[[NSMutableArray alloc] init];
        
        
        IM_Skype=[[NSMutableArray alloc] init];
        IM_MSNMsg=[[NSMutableArray alloc] init];
        IM_GTalk=[[NSMutableArray alloc] init];
        IM_FBMsg=[[NSMutableArray alloc] init];
        IM_AIM=[[NSMutableArray alloc] init];
        IM_YahooMsg=[[NSMutableArray alloc] init];
        IM_ICQ=[[NSMutableArray alloc] init];
        IM_QQ=[[NSMutableArray alloc] init];
        IM_Jabber=[[NSMutableArray alloc] init];
        IM_GaduGadu=[[NSMutableArray alloc] init];
        
        date_other=[[NSMutableArray alloc] init];
        date_Anniversary=[[NSMutableArray alloc] init];
      
    }
    
    return self;
}


@end
