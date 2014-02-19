//
//  ContactsSentViewController.h
//  ContactJump
//
//  Created by Dex on 21/01/14.
//  Copyright (c) 2014 iyasoft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ContacsSentDetailsViewController.h"
@interface ContactsSentViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *tableview;
}

-(void)sentDetails:(NSArray*)detailsArray;

@property (nonatomic,strong) NSArray* senderArray;
@end
