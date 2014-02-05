//
//  ContactSignUpDataService.m
//  ContactJump
//
//  Created by Dex on 05/02/14.
//  Copyright (c) 2014 iyasoft. All rights reserved.
//

#import "ContactSignUpDataService.h"

@implementation ContactSignUpDataService
@synthesize delegate;
-(void)callWebService:(NSString *)Listtype{
    
     
    ContactGlobalDataClass *obj=[ContactGlobalDataClass getInstance];
    NSString* webStringURL = [Listtype stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    NSURL *url = [NSURL URLWithString:webStringURL];
    NSLog(@"%@",url);
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    
    [request addValue: @"application/json" forHTTPHeaderField:@"Content-Type"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [request setHTTPMethod:@"POST"];
    //[request setHTTPBody:obj.jsonString];
    
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
    
    [delegate getresponse:nil :nil status:FALSE];
}

-(void)connectionDidFinishLoading:(NSURLConnection *)connection{
    
    NSError *jsonParsingError = nil;
    
    NSDictionary* json = [NSJSONSerialization JSONObjectWithData:webData options:kNilOptions error:&jsonParsingError];
    
    
    if (jsonParsingError) {
        NSLog(@"JSON ERROR: %@", [jsonParsingError localizedDescription]);
    } else {
        
        result=[json objectForKey:@"message"];
        data1=[json objectForKey:@"data"];
    }
    
    
    
	webData = nil;
	
    
    
    [delegate getresponse:result :data1 status:TRUE];
}
@end
