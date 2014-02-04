//
//  ContactSendContactDetailDelegate.h
//  ContactJump
//
//  Created by Dex on 04/02/14.
//  Copyright (c) 2014 iyasoft. All rights reserved.
//

#import <Foundation/Foundation.h>
@protocol SendContactDetailDelegate;
@interface ContactSendContactDetailDelegate : NSObject
{
    id <SendContactDetailDelegate> delegate;
    NSMutableData * webData;
    NSString *result;
}

@property(nonatomic, retain)id <SendContactDetailDelegate> delegate;
-(void)callWebService:(NSString *)url;
@end

@protocol SendContactDetailDelegate
-(void)getcontentLists:(NSString *)sendContactStatus status:(BOOL)value;
@end
