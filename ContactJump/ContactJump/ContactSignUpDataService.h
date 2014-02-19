//
//  ContactSignUpDataService.h
//  ContactJump
//
//  Created by Dex on 05/02/14.
//  Copyright (c) 2014 iyasoft. All rights reserved.
//

#import <Foundation/Foundation.h>
@protocol ContactSignUpDelegate;
@interface ContactSignUpDataService : NSObject

{
    id <ContactSignUpDelegate> delegate;
    NSMutableData * webData;
    NSString *result;
    NSString *message;
    id data1;
}

@property(nonatomic, retain)id <ContactSignUpDelegate> delegate;
-(void)callWebService:(NSString *)url :(NSString *)cmd :(NSString *)payLoad;
@end

@protocol ContactSignUpDelegate
-(void)getresponse:(NSString *)message :(id)data :(NSString *)result status:(BOOL)value;
@end

