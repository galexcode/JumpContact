//
//  ContactReceivedViewController.h
//  ContactJump
//
//  Created by Raman on 12/01/14.
//  Copyright (c) 2014 iyasoft. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ContactReceivedViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *tableview;
}
-(void)senderDetails:(NSArray*)detailsArray;

@property (nonatomic,strong) NSArray* senderArray;
@end
