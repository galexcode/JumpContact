//
//  ContactBackupService.h
//  ContactJump
//
//  Created by Dex on 19/02/14.
//  Copyright (c) 2014 iyasoft. All rights reserved.
//

#import <Foundation/Foundation.h>
@protocol ContactBackupDelegate;
@interface ContactBackupService : NSObject
{
    id <ContactBackupDelegate> delegate;
    NSMutableData * webData;
    NSString *result;
    NSString *message;
    id data1;
    NSString* time;
}

@property(nonatomic, retain)id <ContactBackupDelegate> delegate;

-(void)callWebService:(NSString *)url :(NSString *)cmd :(NSString *)payLoad;
@end

@protocol ContactBackupDelegate
-(void)getresponse:(NSString *)message :(id)data :(NSString *)result :(NSString *)time status:(BOOL)value;
@end











