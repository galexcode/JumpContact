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
    id data1;
}

@property(nonatomic, retain)id <ContactSignUpDelegate> delegate;
-(void)callWebService:(NSString *)url;
@end

@protocol ContactSignUpDelegate
-(void)getresponse:(NSString *)message :(id)data status:(BOOL)value;
@end

