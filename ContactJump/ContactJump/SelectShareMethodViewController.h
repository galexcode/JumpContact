//
//  SelectShareMethodViewController.h
//  ContactJump
//
//  Created by Raman on 08/01/14.
//  Copyright (c) 2014 iyasoft. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SelectShareMethodViewController : UIViewController<UITextFieldDelegate,UITextViewDelegate>{
    
    UILabel *navbartitle;
    
    UILabel *selectContact_lbl;
    UILabel *noofselected;
    UILabel *noofselected1;
    UILabel *recipients_lbl;
    UITextView *addNote_txtview;
    UIScrollView* scrollview;
}

@end
