//
//  ContactBackupService.m
//  ContactJump
//
//  Created by Dex on 19/02/14.
//  Copyright (c) 2014 iyasoft. All rights reserved.
//

#import "ContactBackupService.h"

@implementation ContactBackupService
@synthesize delegate;
-(void)callWebService:(NSString *)Listtype :cmd :payLoad
{
    
    
    
    NSString *s=[NSString stringWithFormat:@"cmd=%@&pl=%@",cmd,payLoad];
    NSString* webStringURL = [s stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    NSURL *url = [NSURL URLWithString:Listtype];
    NSLog(@"%@",url);
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    
    [request addValue: @"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [request setHTTPMethod:@"POST"];
    [request setValue:[NSString stringWithFormat:@"%lu",(unsigned long)[webStringURL length]] forHTTPHeaderField:@"Content-length"] ;
    [request setHTTPBody:[webStringURL dataUsingEncoding:NSUTF8StringEncoding]];
    
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
    
    [delegate getresponse:nil :nil :nil :nil status:FALSE];
}

-(void)connectionDidFinishLoading:(NSURLConnection *)connection{
    
    NSError *jsonParsingError = nil;
    
    NSDictionary* json = [NSJSONSerialization JSONObjectWithData:webData options:kNilOptions error:&jsonParsingError];
    
    
    if (jsonParsingError) {
        NSLog(@"JSON ERROR: %@", [jsonParsingError localizedDescription]);
    } else {
        
        message=[NSString stringWithFormat:@"%@",[json objectForKey:@"message"]];
        result=[json objectForKey:@"result"];
        if ([json objectForKey:@"data"] !=NULL && [json objectForKey:@"time"] !=NULL )
        {
            data1=[json objectForKey:@"data"];
            time=[json objectForKey:@"time"];
        }
        
        [delegate getresponse:result :data1 :message :time status:TRUE];
    }
    
    
    
	webData = nil;
	
    
    
    
}
@end
