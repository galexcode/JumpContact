//
//  ContactSendContactDetailDelegate.m
//  ContactJump
//
//  Created by Dex on 04/02/14.
//  Copyright (c) 2014 iyasoft. All rights reserved.
//

#import "ContactSendContactDetailDelegate.h"

@implementation ContactSendContactDetailDelegate
@synthesize delegate;
-(void)callWebService:(NSString *)Listtype{
    
    
    NSURL *url = [NSURL URLWithString:[Listtype stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    
    NSLog(@"URL %@",url);
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    
    [request addValue: @"application/json" forHTTPHeaderField:@"Content-Type"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [request setHTTPMethod:@"POST"];
    
    NSURLConnection *connection =[[NSURLConnection alloc] initWithRequest:request delegate:self];
    [connection start];
    webData = [NSMutableData data] ;
}

-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
	[webData setLength: 0];
}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
	[webData appendData:data];
}

-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
	
	webData = nil;
    
    [delegate getcontentLists:nil status:FALSE];
}

-(void)connectionDidFinishLoading:(NSURLConnection *)connection{
    
 
    
    [delegate getcontentLists:webData status:YES];
	
	NSLog(@"webData %@",webData);
    
    
    
    
}
@end
