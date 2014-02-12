//
//  ContactMainViewController.m
//  ContactJump
//
//  Created by Raman on 02/01/14.
//  Copyright (c) 2014 iyasoft. All rights reserved.
//

#import "ContactMainViewController.h"
#import "SelectContact toShareViewController.h"
#import "ContactShareViaIDViewController.h"
#import "KxMenu.h"
#import "SendContactsViewController.h"
#import "ContactGetSelectMethodViewController.h"
#import "ContactReceivedViewController.h"
#import "ContactBackUpViewController.h"
#import "ContactsSentViewController.h"
#define IS_IPHONE_5 ( fabs( ( double )[ [ UIScreen mainScreen ] bounds ].size.height - ( double )568 ) < DBL_EPSILON )

@interface ContactMainViewController ()

@end

@implementation ContactMainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    
    [super viewDidLoad];
   
    [self.navigationController setNavigationBarHidden:YES animated:NO];
    
  #pragma Main BG ImageView
    UIImageView *mainbg_img = [[UIImageView alloc] init];
    mainbg_img.userInteractionEnabled=TRUE;
    mainbg_img.opaque = YES;
    [mainbg_img setImage:[UIImage imageNamed:@"Min-bg.png"]];
    [self.view addSubview:mainbg_img];
    
#pragma mark topblackimage image.
    UIImageView  *topblack_image =[[UIImageView alloc] init];
    topblack_image.image=[UIImage imageNamed:@"header-bg.png"];
    [mainbg_img addSubview:topblack_image];
    
#pragma mark navigation image.
    UIImageView  *nav_img =[[UIImageView alloc] init];
    nav_img.image=[UIImage imageNamed:@"Header-logo.png"];
    [mainbg_img addSubview:nav_img];
    
#pragma mark settings button.
    UIButton *setting_btn =[UIButton buttonWithType:UIButtonTypeCustom];
    [setting_btn setBackgroundImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"setting-icon" ofType:@"png"]] forState:UIControlStateNormal];
    [setting_btn addTarget:self action:@selector(Setting_btnAction22:) forControlEvents:UIControlEventTouchUpInside];
    [mainbg_img addSubview:setting_btn];
    
    
    
    
#pragma mark separator image.
    UIImageView  *seprator_image =[[UIImageView alloc] init];
    seprator_image.image=[UIImage imageNamed:@"seprator.png"];
    [mainbg_img addSubview:seprator_image];
    
#pragma mark sendContacts button.
    UIButton *sendC_btn =[UIButton buttonWithType:UIButtonTypeCustom];
    [sendC_btn setTitle:@"Send Contacts" forState:UIControlStateNormal];
    [[sendC_btn titleLabel] setFont:[UIFont fontWithName:@"AmericanTypewriter" size:16]];
    [sendC_btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    sendC_btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    CGFloat spacing = 70; // the amount of spacing to appear between image and title
    sendC_btn.titleEdgeInsets = UIEdgeInsetsMake(0, spacing, 0, 0);
    [sendC_btn addTarget:self action:@selector(ContactsSend_btnAction) forControlEvents:UIControlEventTouchUpInside];
    [mainbg_img addSubview:sendC_btn];
    
#pragma mark send contact right image.
    UIImageView  *sendC_image =[[UIImageView alloc] init];
    sendC_image.image=[UIImage imageNamed:@"send-contacts-icon.png"];
    [sendC_btn addSubview:sendC_image];
   
#pragma mark separator image.
    UIImageView  *seprator_image1 =[[UIImageView alloc] init];
    seprator_image1.image=[UIImage imageNamed:@"seprator.png"];
    [mainbg_img addSubview:seprator_image1];
    
#pragma mark send button.
    UIButton *sent_btn =[UIButton buttonWithType:UIButtonTypeCustom];
    [sent_btn setTitle:@"Sent" forState:UIControlStateNormal];
    [[sent_btn titleLabel] setFont:[UIFont fontWithName:@"AmericanTypewriter" size:18]];
    [sent_btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
     sent_btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    CGFloat spacing1 = 70; // the amount of spacing to appear between image and title
    sent_btn.titleEdgeInsets = UIEdgeInsetsMake(0, spacing1, 0, 0);
    [sent_btn addTarget:self action:@selector(Sent_btnAction) forControlEvents:UIControlEventTouchUpInside];
    [mainbg_img  addSubview:sent_btn];
    
#pragma mark send button right image
    UIImageView  *sent_image =[[UIImageView alloc] init];
    sent_image.image=[UIImage imageNamed:@"sent-icon.png"];
    [sent_btn addSubview:sent_image];
    
#pragma mark separator image.
    UIImageView  *seprator_image2 =[[UIImageView alloc] init];
    seprator_image2.image=[UIImage imageNamed:@"seprator.png"];
    [mainbg_img addSubview:seprator_image2];
    
#pragma mark received button.
    UIButton *received_btn =[UIButton buttonWithType:UIButtonTypeCustom];
    [received_btn addTarget:self action:@selector(received_btnAction) forControlEvents:UIControlEventTouchUpInside];
    [received_btn setTitle:@"Received" forState:UIControlStateNormal];
    [[received_btn titleLabel] setFont:[UIFont fontWithName:@"AmericanTypewriter" size:18]];
    [received_btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    received_btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    CGFloat spacing2 = 70; // the amount of spacing to appear between image and title
    received_btn.titleEdgeInsets = UIEdgeInsetsMake(0, spacing2, 0, 0);
    [mainbg_img  addSubview:received_btn];
    
#pragma mark received right image.
    UIImageView  *received_image =[[UIImageView alloc] init];
    received_image.image=[UIImage imageNamed:@"recieved-icon.png"];
    [received_btn addSubview:received_image];
    
#pragma mark separator image.
    UIImageView  *seprator_image3 =[[UIImageView alloc] init];
    seprator_image3.image=[UIImage imageNamed:@"seprator.png"];
    [mainbg_img addSubview:seprator_image3];
    
#pragma mark separator image.
    UIImageView  *seprator_image4 =[[UIImageView alloc] init];
    seprator_image4.image=[UIImage imageNamed:@"seprator.png"];
    [mainbg_img addSubview:seprator_image4];
    
#pragma mark bulk button.
    UIButton *bulkContact_btn =[UIButton buttonWithType:UIButtonTypeCustom];
    [bulkContact_btn addTarget:self action:@selector(bulkcontact_btnAction) forControlEvents:UIControlEventTouchUpInside];
    [bulkContact_btn setTitle:@"Bulk Contacts Share via ID" forState:UIControlStateNormal];
    [[bulkContact_btn titleLabel] setFont:[UIFont fontWithName:@"AmericanTypewriter" size:16]];
    [bulkContact_btn setBackgroundImage:[UIImage imageNamed:@"header-bg.png"] forState:UIControlStateNormal];
    [bulkContact_btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    bulkContact_btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    CGFloat spacing3 = 70; // the amount of spacing to appear between image and title
    bulkContact_btn.titleEdgeInsets = UIEdgeInsetsMake(0, spacing3, 0, 0);
    [mainbg_img  addSubview:bulkContact_btn];

#pragma mark bulk button right image.
    UIImageView  *bulkc_image =[[UIImageView alloc] init];
    bulkc_image.image=[UIImage imageNamed:@"bulk-contacts-icon.png"];
    [bulkContact_btn addSubview:bulkc_image];
    
#pragma mark separator image.
    UIImageView  *seprator_image5 =[[UIImageView alloc] init];
    seprator_image5.image=[UIImage imageNamed:@"seprator.png"];
    [mainbg_img addSubview:seprator_image5];
    
#pragma mark getcontact button.
    UIButton *getContact_btn =[UIButton buttonWithType:UIButtonTypeCustom];
    [getContact_btn addTarget:self action:@selector(GetConttact_nAction) forControlEvents:UIControlEventTouchUpInside];
    [getContact_btn setTitle:@"Get Contacts via ID" forState:UIControlStateNormal];
    [[getContact_btn titleLabel] setFont:[UIFont fontWithName:@"AmericanTypewriter" size:16]];
    [getContact_btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    getContact_btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [getContact_btn setBackgroundImage:[UIImage imageNamed:@"header-bg.png"] forState:UIControlStateNormal];
    CGFloat spacing4 = 70; // the amount of spacing to appear between image and title
    getContact_btn.titleEdgeInsets = UIEdgeInsetsMake(0, spacing4, 0, 0);
    [mainbg_img  addSubview:getContact_btn];
    
#pragma mark getcontact right image.
    UIImageView  *getc_image =[[UIImageView alloc] init];
    getc_image.image=[UIImage imageNamed:@"get-contacts.png"];
    [getContact_btn addSubview:getc_image];
    
#pragma mark separator image.
    UIImageView  *seprator_image6 =[[UIImageView alloc] init];
    seprator_image6.image=[UIImage imageNamed:@"seprator.png"];
    [mainbg_img addSubview:seprator_image6];
    
    
#pragma mark Contact Backup Button
    UIButton *ContactBackup_btn =[UIButton buttonWithType:UIButtonTypeCustom];
    [ContactBackup_btn setBackgroundImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"button-bg" ofType:@"png"]] forState:UIControlStateNormal];
    [ContactBackup_btn setTitle:@"Contact Backup" forState:UIControlStateNormal];
    [[ContactBackup_btn titleLabel] setFont:[UIFont fontWithName:@"AmericanTypewriter" size:18]];
    [ContactBackup_btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [ContactBackup_btn addTarget:self action:@selector(ContactBackUp_btnAction) forControlEvents:UIControlEventTouchUpInside];
    [mainbg_img addSubview:ContactBackup_btn];
    
    
    if (IS_IPHONE_5) {
        mainbg_img.frame=CGRectMake(0,0, 320, 568);
        topblack_image.frame=CGRectMake(0, 0, 320, 90);
        nav_img.frame=CGRectMake(112, 20, 96.5, 55.5);
        setting_btn.frame=CGRectMake(270,45.5, 19,19);
        seprator_image.frame=CGRectMake(0, 90, 320, 2);
        sendC_btn.frame=CGRectMake(0,92, 320,60);
        sendC_image.frame=CGRectMake(25, 19, 22, 22);
        seprator_image1.frame=CGRectMake(0, 152, 320, 2);
        sent_btn.frame=CGRectMake(0,154, 320,60);
        sent_image.frame=CGRectMake(25, 22, 16, 16);
        seprator_image2.frame=CGRectMake(0, 214, 320, 2);
        received_btn.frame=CGRectMake(0,216, 320,60);
        received_image.frame=CGRectMake(25, 20.75, 25.5, 18.5);
        seprator_image3.frame=CGRectMake(0, 276, 320, 2);
        seprator_image4.frame=CGRectMake(0, 338, 320, 2);
        bulkContact_btn.frame=CGRectMake(0,340, 320,60);
        bulkc_image.frame=CGRectMake(25, 20.25, 19.5, 19.5);
        seprator_image5.frame=CGRectMake(0, 400, 320, 2);
        getContact_btn.frame=CGRectMake(0,402, 320,60);
        getc_image.frame=CGRectMake(25, 21.5, 17, 17);
        seprator_image6.frame=CGRectMake(0, 462, 320, 2);
        ContactBackup_btn.frame=CGRectMake(46.75,496.25, 226.5,39.5);
    }else{
        mainbg_img.frame=CGRectMake(0,0, 320, 480);
        topblack_image.frame=CGRectMake(0, 0, 320, 80);
        nav_img.frame=CGRectMake(112, 20, 96.5, 45.5);
        setting_btn.frame=CGRectMake(270,40.5, 19,19);
        seprator_image.frame=CGRectMake(0, 80, 320, 2);
        sendC_btn.frame=CGRectMake(0,82, 320,50);
        sendC_image.frame=CGRectMake(25, 14, 22, 22);
        seprator_image1.frame=CGRectMake(0, 132, 320, 2);
        sent_btn.frame=CGRectMake(0,134, 320,50);
        sent_image.frame=CGRectMake(25, 17, 16, 16);
        seprator_image2.frame=CGRectMake(0, 184, 320, 2);
        received_btn.frame=CGRectMake(0,186, 320,50);
        received_image.frame=CGRectMake(25, 15.75, 25.5, 18.5);
        seprator_image3.frame=CGRectMake(0, 236, 320, 2);
        seprator_image4.frame=CGRectMake(0, 288, 320, 2);
        bulkContact_btn.frame=CGRectMake(0,290, 320,50);
        bulkc_image.frame=CGRectMake(25, 15.25, 19.5, 19.5);
        seprator_image5.frame=CGRectMake(0, 340, 320, 2);
        getContact_btn.frame=CGRectMake(0,342, 320,50);
        getc_image.frame=CGRectMake(25, 16.5, 17, 17);
        seprator_image6.frame=CGRectMake(0, 392, 320, 2);
        ContactBackup_btn.frame=CGRectMake(46.75,417.25, 226.5,39.5);
    }
    
    
    

}
-(void)viewWillAppear:(BOOL)animated
{
    obj=[ContactGlobalDataClass getInstance];
    [obj setBackBtnActivate:@"0"];
    [self getPersonOutOfAddressBook];
}

-(void)viewDidAppear:(BOOL)animated
{
    NSLog(@"xxxxxx");
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
  
    popUp=0;
    NSString* val = [defaults stringForKey:@"UserID"];
    NSLog(@"val  %@",val);
     if (val==NULL)
     {
         
         bg=[[UIView alloc] init];
         
         if (IS_IPHONE_5) {
             bg.frame=CGRectMake(0, 90, 320, 568-90);
         } else {
             bg.frame=CGRectMake(0, 80, 320, 400);
         }
         bg.backgroundColor=[UIColor clearColor];
         
         [bg setHidden:NO];
         [self.view addSubview:bg];
         self.uiasView = [[CustomUIASView alloc] initWithFrame:CGRectMake(10, (self.view.frame.size.height ), 300, 250)];
         
         [self.uiasView.doneBtn addTarget:self action:@selector(signUp) forControlEvents:UIControlEventTouchUpInside];
         [self.uiasView.phntxtfld setDelegate:self];
         [self.uiasView.nametxtfld setDelegate:self];
         [self.view addSubview:self.uiasView];
         [self signupScreenShow];
         
     }
    
    
}
-(void)signUp
{
    
    ContactSendContactDetailDelegate * sendContacts_cls=[[ContactSendContactDetailDelegate alloc]init];
    sendContacts_cls.delegate=self;
    activityIndicator = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge] ;
    activityIndicator.frame = CGRectMake(0.0, 0.0, 40.0, 40.0);
    activityIndicator.center = self.view.center;
    [self.view addSubview: activityIndicator];
    [activityIndicator startAnimating];
    NSUUID* uuid = [[UIDevice currentDevice] identifierForVendor];
    
    [sendContacts_cls callWebService:[NSString stringWithFormat:@"http://204.197.244.110/~crmdalto/jump_contact/index.php?cmd=signup&pl={\"deviceid\":\"%@\",\"phone\":\"%@\",\"name\":\"%@\"}", [uuid UUIDString], self.uiasView.phntxtfld.text,self.uiasView.nametxtfld.text]];
    
}

-(void)getcontentLists:(NSData *)sendContactStatus status:(BOOL)value
{
    [activityIndicator stopAnimating];
    
    NSError *jsonParsingError = nil;
    if (sendContactStatus !=nil)
    {
        NSDictionary* json = [NSJSONSerialization JSONObjectWithData:sendContactStatus options:kNilOptions error:&jsonParsingError];
        
        NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
        if (jsonParsingError) {
            NSLog(@"JSON ERROR: %@", [jsonParsingError localizedDescription]);
        }
        else
        {
            if ([[json objectForKey:@"cmd"] isEqualToString:@"signup"]) {
                response=[json objectForKey:@"result"];
                result=[json objectForKey:@"message"];
                verficationCode=[json objectForKey:@"verification_code"];
                userID=[json objectForKey:@"user_id"];
                NSLog(@"userID  %@",userID);
                
                [defaults setObject:userID forKey:@"UserID"];
                [defaults synchronize];
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:response
                                                               message: result
                                                              delegate:self
                                                     cancelButtonTitle:@"Ok"
                                                     otherButtonTitles:Nil,Nil];
                
                [alert setTag:1];
                [alert show];

            }
            else if([[json objectForKey:@"cmd"] isEqualToString:@"verify"])
            {
                response=[json objectForKey:@"result"];
                result=[json objectForKey:@"message"];
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:response
                                                               message: result
                                                              delegate:self
                                                     cancelButtonTitle:@"Ok"
                                                     otherButtonTitles:Nil,Nil];
                
                [alert setTag:2];
                [alert show];
                
                
                
                [defaults setObject:userID forKey:@"UserID"];
                [defaults synchronize];
                [self signupScreenShow ];
            }
            
        
        
            }
    }
    else
    {
        NSLog(@"Network error");
    }
    
    
}
-(void)verify
{
    ContactSendContactDetailDelegate * sendContacts_cls=[[ContactSendContactDetailDelegate alloc]init];
    sendContacts_cls.delegate=self;
    activityIndicator = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge] ;
    activityIndicator.frame = CGRectMake(0.0, 0.0, 40.0, 40.0);
    activityIndicator.center = self.view.center;
    [self.view addSubview: activityIndicator];
    [activityIndicator startAnimating];
    
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    
    [sendContacts_cls callWebService:[NSString stringWithFormat:@"http://204.197.244.110/~crmdalto/jump_contact/index.php?cmd=verify&pl={\"code\":\"%@\",\"userid\":\"%@\"}", verficationCode, [defaults valueForKey:@"UserID"]]];
    
}
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex==0 && [response isEqualToString:@"success"] && alertView.tag==1) {
        
//        if ([result isEqualToString:@"Phone Number updated with device id"] || [result isEqualToString:@"device id updated with already existed number "])
//        {
//            NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
//            
//            [defaults setValue:@"123" forKey:@"UserID"];
//            [defaults synchronize];
//
//            [self signupScreenShow];
//        }
//        else {
             self.uiasView.celltxt_lbl3.text=@"Enter Verification code";
             [self.uiasView.nametxtfld setHidden:YES];
             self.uiasView.phntxtfld.frame=CGRectMake(25+10,94,240,30);
            self.uiasView.phntxtfld.text=verficationCode;
            self.uiasView.doneBtn.frame=CGRectMake(123,158,54,25);
            [self.uiasView.doneBtn removeTarget:self action:@selector(signUp) forControlEvents:UIControlEventTouchUpInside];
            [self.uiasView.doneBtn addTarget:self action:@selector(verify) forControlEvents:UIControlEventTouchUpInside];
      //  }
        
    }
    else if (buttonIndex==0 && [response isEqualToString:@"Fail"] && alertView.tag==1)
    {
        if ([result isEqualToString:@"Already registered with Deviceid and Phone"]) {
            
           [self signupScreenShow ];
        }
        else
        {
            
            self.uiasView.celltxt_lbl3.text=@"Enter Verification code";
            [self.uiasView.nametxtfld setHidden:YES];
            self.uiasView.phntxtfld.frame=CGRectMake(25+10,94,240,30);
            self.uiasView.phntxtfld.text=verficationCode;
            self.uiasView.doneBtn.frame=CGRectMake(123,158,54,25);
            [self.uiasView.doneBtn removeTarget:self action:@selector(signUp) forControlEvents:UIControlEventTouchUpInside];
            [self.uiasView.doneBtn addTarget:self action:@selector(verify) forControlEvents:UIControlEventTouchUpInside];
        }
        
    }
}
-(void)signupScreenShow
{
    if (popUp==0) {
        popUp=1;
        [UIView animateWithDuration:0.60f animations:^{
            
            
            CGRect uiasViewFrame   = self.uiasView.frame;
            if (IS_IPHONE_5) {
                 uiasViewFrame.origin.y = (self.view.frame.size.height - 409);
            } else {
                 uiasViewFrame.origin.y = (self.view.frame.size.height - 365);
            }
           
            
            self.uiasView.frame = uiasViewFrame;
        }];
    } else {
        popUp=0;
        [UIView animateWithDuration:0.75f animations:^{
            
            CGRect uiasViewFrame   = self.uiasView.frame;
            uiasViewFrame.origin.y = (self.view.frame.size.height + 230);
            
            self.uiasView.frame = uiasViewFrame;
            [bg setHidden:YES];
            [self.uiasView.phntxtfld resignFirstResponder];
        }];
        
    }
}
- (void)getPersonOutOfAddressBook
{
    
    
    
    
    ABAddressBookRef addressBook = ABAddressBookCreateWithOptions(NULL, NULL);
    __block BOOL accessGranted = NO;
    
    if (ABAddressBookGetAuthorizationStatus() == kABAuthorizationStatusNotDetermined)
    {
        NSLog(@"kABAuthorizationStatusNotDetermined");
        dispatch_semaphore_t sema = dispatch_semaphore_create(0);
        ABAddressBookRequestAccessWithCompletion(addressBook, ^(bool granted, CFErrorRef error) {
            accessGranted = granted;
            dispatch_semaphore_signal(sema);
        });
        dispatch_semaphore_wait(sema, DISPATCH_TIME_FOREVER);
        dispatch_release(sema);
    }
    else  if (ABAddressBookGetAuthorizationStatus() == kABAuthorizationStatusAuthorized)
    {
        NSLog(@"kABAuthorizationStatusAuthorized");
        accessGranted = YES;
    }
    
    if (accessGranted) {
        CFArrayRef allPeople = ABAddressBookCopyArrayOfAllPeople(addressBook);
        CFIndex nPeople = ABAddressBookGetPersonCount(addressBook);
        
        
        NSMutableArray *contacts = [[NSMutableArray alloc] init];
        
        UIImage* image;
         UIImage* image1;
        for (int i = 0; i < nPeople; i++)
        {
            Person *person = [[Person alloc] init];
            ABRecordRef ref = CFArrayGetValueAtIndex(allPeople, i);
            
            
            NSString *firstName = (__bridge NSString *)ABRecordCopyValue(ref, kABPersonFirstNameProperty);
            NSString *lastName = (__bridge_transfer NSString *)ABRecordCopyValue(ref, kABPersonLastNameProperty);
            NSString *prefix = (__bridge_transfer NSString *)ABRecordCopyValue(ref, kABPersonPrefixProperty);
            NSString *suffix = (__bridge_transfer NSString *)ABRecordCopyValue(ref, kABPersonSuffixProperty);
            NSString *middleName = (__bridge_transfer NSString *)ABRecordCopyValue(ref, kABPersonMiddleNameProperty);
            NSString *organization = (__bridge_transfer NSString *)ABRecordCopyValue(ref, kABPersonOrganizationProperty);
            NSString *jobTtitle = (__bridge_transfer NSString *)ABRecordCopyValue(ref, kABPersonJobTitleProperty);
            NSString *department = (__bridge_transfer NSString *)ABRecordCopyValue(ref, kABPersonDepartmentProperty);

           // *****************************************Image*****************************************************
            
            if (ABPersonHasImageData(ref))
            {
                
                CGFloat compression = 0.9f;
                CGFloat maxCompression = 0.1f;
                int maxFileSize = 20*1024;
                
                
                
                
                image = [UIImage imageWithData:(__bridge NSData *)(ABPersonCopyImageDataWithFormat(ref, kABPersonImageFormatThumbnail))];
                 NSData *imageData = UIImageJPEGRepresentation(image, compression);
                while ([imageData length] > maxFileSize && compression > maxCompression)
                {
                    compression -= 0.1;
                    imageData = UIImageJPEGRepresentation(image, compression);
                }
                
                image1=[UIImage imageWithData:imageData];
                person.editablePic=image1;
            }
            else
            {
                image1 = nil;
                person.editablePic=nil;
            }
            
            person.pic=image1;
            NSLog(@"pic %@",[person.pic description]);
            
            //*************************************BAsic data**************************************************
            person.firstName =[NSString stringWithFormat:@"%@ %@",(firstName==NULL)?@"":firstName,(lastName==NULL)?@"":lastName];

           
            
            person.fullName =[NSString stringWithFormat:
                              @"%@%@%@%@%@",
                              (prefix==NULL)? @"":[NSString stringWithFormat:@"%@ ",prefix],
                              (firstName==NULL)? @"":[NSString stringWithFormat:@"%@ ",firstName],
                              (middleName==NULL)? @"":[NSString stringWithFormat:@"%@ ",middleName],
                              (lastName==NULL)? @"":[NSString stringWithFormat:@"%@ ",lastName],
                              (suffix==NULL)? @"":[NSString stringWithFormat:@"%@",suffix]] ;
            if ( [person.fullName length]==0 ) {
                person.fullName =@"#";
            }
            else
            {
                person.fullName =[NSString stringWithFormat:
                                  @"%@%@%@%@%@",
                                  (prefix==NULL)? @"":[NSString stringWithFormat:@"%@ ",prefix],
                                  (firstName==NULL)? @"":[NSString stringWithFormat:@"%@ ",firstName],
                                  (middleName==NULL)? @"":[NSString stringWithFormat:@"%@ ",middleName],
                                  (lastName==NULL)? @"":[NSString stringWithFormat:@"%@ ",lastName],
                                  (suffix==NULL)? @"":[NSString stringWithFormat:@"%@",suffix]] ;
            }
            person.lastName = [NSString stringWithFormat:@"%@%@",(jobTtitle==NULL)?@"":jobTtitle,(department==NULL)?@"":[NSString stringWithFormat:@"- %@",department]];
            person.companyName=[NSString stringWithFormat:@"%@",(organization==NULL)?@"":organization];
            
            ABMultiValueRef phones = ABRecordCopyValue(ref, kABPersonPhoneProperty);
            ABMultiValueRef emails = ABRecordCopyValue(ref, kABPersonEmailProperty);
            ABMultiValueRef address = ABRecordCopyValue(ref, kABPersonAddressProperty);
            ABMultiValueRef socialProfile = ABRecordCopyValue(ref, kABPersonSocialProfileProperty);
            ABMultiValueRef instantMessageProfile = ABRecordCopyValue(ref, kABPersonInstantMessageProperty);
            ABMultiValueRef url = ABRecordCopyValue(ref, kABPersonURLProperty);
            ABMultiValueRef date = ABRecordCopyValue(ref, kABPersonDateProperty);
            
            
            
            NSUInteger j = 0;
            
            
            //********************************* IM PROFILES *********************************
            if(instantMessageProfile)
            {
                NSArray *IMProfiles = (__bridge NSArray *)ABMultiValueCopyArrayOfAllValues(instantMessageProfile);
                
                for (int i = 0; i < [IMProfiles count]; i++)
                {
                    
                    
                    CFDictionaryRef IMValue = ABMultiValueCopyValueAtIndex(instantMessageProfile, i);
                  
                    if(CFStringCompare( CFDictionaryGetValue(IMValue, kABPersonInstantMessageServiceKey), kABPersonInstantMessageServiceFacebook, 0)==kCFCompareEqualTo) {
                        
                        [person.IM_Type addObject:(NSString*)kABPersonInstantMessageServiceFacebook];
                        [person.IM_Value addObject:(NSString*) CFDictionaryGetValue(IMValue, kABPersonInstantMessageUsernameKey)];
                    }
                    if(CFStringCompare( CFDictionaryGetValue(IMValue, kABPersonInstantMessageServiceKey), kABPersonInstantMessageServiceMSN, 0)==kCFCompareEqualTo) {
                        
                        [person.IM_Type addObject:(NSString*)kABPersonInstantMessageServiceMSN];
                        [person.IM_Value addObject:(NSString*) CFDictionaryGetValue(IMValue, kABPersonInstantMessageUsernameKey)];                    }
                    
                    if(CFStringCompare( CFDictionaryGetValue(IMValue, kABPersonInstantMessageServiceKey), kABPersonInstantMessageServiceQQ, 0)==kCFCompareEqualTo) {
                        
                        [person.IM_Type addObject:(NSString*)kABPersonInstantMessageServiceQQ];
                        [person.IM_Value addObject:(NSString*) CFDictionaryGetValue(IMValue, kABPersonInstantMessageUsernameKey)];
                    }
                    
                    if(CFStringCompare( CFDictionaryGetValue(IMValue, kABPersonInstantMessageServiceKey), kABPersonInstantMessageServiceSkype, 0)==kCFCompareEqualTo) {
                        
                        [person.IM_Type addObject:(NSString*)kABPersonInstantMessageServiceSkype];
                        [person.IM_Value addObject:(NSString*) CFDictionaryGetValue(IMValue, kABPersonInstantMessageUsernameKey)];
                    }
                    
                    if(CFStringCompare( CFDictionaryGetValue(IMValue, kABPersonInstantMessageServiceKey), kABPersonInstantMessageServiceYahoo, 0)==kCFCompareEqualTo) {
                        
                        [person.IM_Type addObject:(NSString*)kABPersonInstantMessageServiceYahoo];
                        [person.IM_Value addObject:(NSString*) CFDictionaryGetValue(IMValue, kABPersonInstantMessageUsernameKey)];
                    }
                    
                    if(CFStringCompare( CFDictionaryGetValue(IMValue, kABPersonInstantMessageServiceKey), kABPersonInstantMessageServiceJabber, 0)==kCFCompareEqualTo) {
                        
                        [person.IM_Type addObject:(NSString*)kABPersonInstantMessageServiceJabber];
                        [person.IM_Value addObject:(NSString*) CFDictionaryGetValue(IMValue, kABPersonInstantMessageUsernameKey)];
                    }
                    if(CFStringCompare( CFDictionaryGetValue(IMValue, kABPersonInstantMessageServiceKey), kABPersonInstantMessageServiceAIM, 0)==kCFCompareEqualTo) {
                        
                        [person.IM_Type addObject:(NSString*)kABPersonInstantMessageServiceAIM];
                        [person.IM_Value addObject:(NSString*) CFDictionaryGetValue(IMValue, kABPersonInstantMessageUsernameKey)];
                    }
                    if(CFStringCompare( CFDictionaryGetValue(IMValue, kABPersonInstantMessageServiceKey), kABPersonInstantMessageServiceGaduGadu, 0)==kCFCompareEqualTo) {
                        
                        [person.IM_Type addObject:(NSString*)kABPersonInstantMessageServiceGaduGadu];
                        [person.IM_Value addObject:(NSString*) CFDictionaryGetValue(IMValue, kABPersonInstantMessageUsernameKey)];
                    }
                    if(CFStringCompare( CFDictionaryGetValue(IMValue, kABPersonInstantMessageServiceKey), kABPersonInstantMessageServiceGoogleTalk, 0)==kCFCompareEqualTo) {
                        
                        [person.IM_Type addObject:(NSString*)kABPersonInstantMessageServiceGoogleTalk];
                        [person.IM_Value addObject:(NSString*) CFDictionaryGetValue(IMValue, kABPersonInstantMessageUsernameKey)];
                    }
                    if(CFStringCompare( CFDictionaryGetValue(IMValue, kABPersonInstantMessageServiceKey), kABPersonInstantMessageServiceICQ, 0)==kCFCompareEqualTo) {
                        
                        [person.IM_Type addObject:(NSString*)kABPersonInstantMessageServiceICQ];
                        [person.IM_Value addObject:(NSString*) CFDictionaryGetValue(IMValue, kABPersonInstantMessageUsernameKey)];
                    }
                    
                    CFRelease(IMValue);
                }

            }
            
            //********************************* SOCIAL PROFILES *********************************
            if(socialProfile)
            {
                NSArray *socialProfiles = (__bridge NSArray *)ABMultiValueCopyArrayOfAllValues(socialProfile);
                
                for (int i = 0; i < [socialProfiles count]; i++)
                {
                    
                    
                    CFDictionaryRef socialValue = ABMultiValueCopyValueAtIndex(socialProfile, i);
                    if(CFStringCompare( CFDictionaryGetValue(socialValue, kABPersonSocialProfileServiceKey), kABPersonSocialProfileServiceFacebook, 0)==kCFCompareEqualTo) {
                        
                        [person.socialProfile_Type addObject:(NSString*) kABPersonSocialProfileServiceFacebook];
                        [person.socialProfile_Value addObject:(NSString*) CFDictionaryGetValue(socialValue, kABPersonSocialProfileUsernameKey)];
                    }
                    if(CFStringCompare( CFDictionaryGetValue(socialValue, kABPersonSocialProfileServiceKey), kABPersonSocialProfileServiceFlickr, 0)==kCFCompareEqualTo) {
                        
                        [person.socialProfile_Type addObject:(NSString*) kABPersonSocialProfileServiceFlickr];
                        [person.socialProfile_Value addObject:(NSString*) CFDictionaryGetValue(socialValue, kABPersonSocialProfileUsernameKey)];
                    }
                    
                    if(CFStringCompare( CFDictionaryGetValue(socialValue, kABPersonSocialProfileServiceKey), kABPersonSocialProfileServiceLinkedIn, 0)==kCFCompareEqualTo) {
                        
                        [person.socialProfile_Type addObject:(NSString*) kABPersonSocialProfileServiceLinkedIn];
                        [person.socialProfile_Value addObject:(NSString*) CFDictionaryGetValue(socialValue, kABPersonSocialProfileUsernameKey)];
                    }
                    
                    if(CFStringCompare( CFDictionaryGetValue(socialValue, kABPersonSocialProfileServiceKey), kABPersonSocialProfileServiceMyspace, 0)==kCFCompareEqualTo) {
                        
                        [person.socialProfile_Type addObject:(NSString*) kABPersonSocialProfileServiceMyspace];
                        [person.socialProfile_Value addObject:(NSString*) CFDictionaryGetValue(socialValue, kABPersonSocialProfileUsernameKey)];
                    }
                    
                    if(CFStringCompare( CFDictionaryGetValue(socialValue, kABPersonSocialProfileServiceKey), kABPersonSocialProfileServiceSinaWeibo, 0)==kCFCompareEqualTo) {
                        
                        [person.socialProfile_Type addObject:(NSString*) kABPersonSocialProfileServiceSinaWeibo];
                        [person.socialProfile_Value addObject:(NSString*) CFDictionaryGetValue(socialValue, kABPersonSocialProfileUsernameKey)];
                    }
                    
                    if(CFStringCompare( CFDictionaryGetValue(socialValue, kABPersonSocialProfileServiceKey), kABPersonSocialProfileServiceTwitter, 0)==kCFCompareEqualTo) {
                        
                        [person.socialProfile_Type addObject:(NSString*) kABPersonSocialProfileServiceTwitter];
                        [person.socialProfile_Value addObject:(NSString*) CFDictionaryGetValue(socialValue, kABPersonSocialProfileUsernameKey)];
                    }
                    
                    CFRelease(socialValue);
                    
                }
                
                NSLog(@"%@ ---- %@\n %@",person.socialProfile_Type,person.socialProfile_Value,person.IM_Type);
            }
            
            //********************************* EMAIL IDs *********************************
            for(j = 0; j < ABMultiValueGetCount(emails); j++)
            {
                
                
                CFStringRef typeTmp = ABMultiValueCopyLabelAtIndex(emails, j);
                NSString* emailType = (__bridge NSString*)ABAddressBookCopyLocalizedLabel(typeTmp);
                NSString *email = (__bridge_transfer NSString *)ABMultiValueCopyValueAtIndex(emails, j);
                [person.email_Type addObject:[emailType stringByReplacingCharactersInRange:NSMakeRange(0,1)
                                                                                      withString:[[emailType substringToIndex:1] capitalizedString]]];
                [person.email_Value addObject:email];
                
                CFRelease(typeTmp);
            }
            
            NSLog(@"%@ \n %@",person.email_Type,person.email_Value);
            
            
            //*********************************PHONE NUMBERS *********************************
            
            
            for(j = 0; j < ABMultiValueGetCount(phones); j++)
            {
                
                
                CFStringRef typeTmp = ABMultiValueCopyLabelAtIndex(phones, j);
                NSString* phone_labeltype = (__bridge NSString*)ABAddressBookCopyLocalizedLabel(typeTmp);
                NSString *phone = (__bridge_transfer NSString *)ABMultiValueCopyValueAtIndex(phones, j);
                [person.phoneNumber_Type addObject:[phone_labeltype stringByReplacingCharactersInRange:NSMakeRange(0,1)
                                                                                            withString:[[phone_labeltype substringToIndex:1] capitalizedString]]];
                
                [person.phoneNumber_Value addObject: phone];
                
                CFRelease(typeTmp);
                
            }
            //********************************* ADDRESS *********************************
            if(address)
            {
                NSArray *addresses = (__bridge NSArray *)ABMultiValueCopyArrayOfAllValues(address);
                
                for (int i = 0; i < [addresses count]; i++)
                {
                    
                    
                    CFStringRef typeTmp = ABMultiValueCopyLabelAtIndex(address, i);
                    NSString* labeltype = (__bridge NSString*)ABAddressBookCopyLocalizedLabel(typeTmp);
                    NSDictionary *addressDict=[addresses objectAtIndex:i];
                    NSString *country =[NSString stringWithFormat:
                                        @"%@\n%@ \n%@\n%@ \n",
                                        ([addressDict objectForKey:(NSString *)kABPersonAddressStreetKey]==NULL)? @"":[[addressDict objectForKey:(NSString *)kABPersonAddressStreetKey] stringByReplacingOccurrencesOfString:@"\n" withString:@" "],
                                        ([addressDict objectForKey:(NSString *)kABPersonAddressCityKey]==NULL)? @"":[addressDict objectForKey:(NSString *)kABPersonAddressCityKey],
                                        ([addressDict objectForKey:(NSString *)kABPersonAddressZIPKey]==NULL)? @"":[addressDict objectForKey:(NSString *)kABPersonAddressZIPKey],
                                        ([addressDict objectForKey:(NSString *)kABPersonAddressCountryKey]==NULL)? @"":[addressDict objectForKey:(NSString *)kABPersonAddressCountryKey]];
                    
                   
                   
                    [person.address_Type addObject:[labeltype stringByReplacingCharactersInRange:NSMakeRange(0,1)
                                                                                      withString:[[labeltype substringToIndex:1] capitalizedString]]];
                    [person.address_Value addObject:country];
                  
                    CFRelease(typeTmp);
                    
                }
                
                NSLog(@"%@ \n %@",person.address_Type,person.address_Value);
            }
                //********************************* URLs *********************************
                if(url)
                {
                    for(j = 0; j < ABMultiValueGetCount(url); j++)
                    {
                        
                        
                        CFStringRef typeTmp = ABMultiValueCopyLabelAtIndex(url, j);
                        NSString* urlType = (__bridge NSString*)ABAddressBookCopyLocalizedLabel(typeTmp);
                        NSString *urlValue = (__bridge_transfer NSString *)ABMultiValueCopyValueAtIndex(url, j);
                       
                        [person.url_Type addObject:[urlType stringByReplacingCharactersInRange:NSMakeRange(0,1)
                                                                                      withString:[[urlType substringToIndex:1] capitalizedString]]];
                        [person.url_Value addObject:urlValue];
                        
                        
                        CFRelease(typeTmp);
                    }
                    
                    NSLog(@"%@ ----",person.url_Type);
                }
                
                //********************************* Dates *********************************
                
                
                NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
                [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
                
                if(date)
                {
                    for(j = 0; j < ABMultiValueGetCount(date); j++)
                    {
                        
                        
                        CFStringRef typeTmp = ABMultiValueCopyLabelAtIndex(date, j);
                        NSString* dateType = (__bridge NSString*)ABAddressBookCopyLocalizedLabel(typeTmp);

                        NSString *dateValue = [dateFormatter stringFromDate:(__bridge NSDate *)ABMultiValueCopyValueAtIndex(date, j)];
                        
                        NSLog(@"urlValuetype %@",dateType);
                        [person.date_Value addObject:dateValue];
                        
                        [person.date_Type addObject:[dateType stringByReplacingCharactersInRange:NSMakeRange(0,1)
                                                                                     withString:[[dateType substringToIndex:1] capitalizedString]]];
                        
                        
                        CFRelease(typeTmp);
                    }
                    
                    
                }
                
                
                NSString *date_BirthdayValue = [dateFormatter stringFromDate:(__bridge NSDate*)ABRecordCopyValue(ref, kABPersonBirthdayProperty) ];
                
            
            if (date_BirthdayValue !=NULL) {
                [person setDate_bday:date_BirthdayValue];
                [person.date_Value addObject:person.date_bday];
                [person.date_Type addObject:@"Birthday"];
            }
            
            NSLog(@"%@ \n %@",person.date_Type,person.date_Value);
            
            
            
            person.editableAddress_Type =[[NSMutableArray alloc] initWithArray:person.address_Type copyItems:YES];
            person.editableAddress_Value =[[NSMutableArray alloc] initWithArray:person.address_Value copyItems:YES];
            
            person.editableEmail_Type =[[NSMutableArray alloc] initWithArray:person.email_Type copyItems:YES];
            person.editableEmail_Value =[[NSMutableArray alloc] initWithArray:person.email_Value copyItems:YES];
            
            person.editableIM_Type =[[NSMutableArray alloc] initWithArray:person.IM_Type copyItems:YES];
            person.editableIM_Value =[[NSMutableArray alloc] initWithArray:person.IM_Value copyItems:YES];
            
            person.editablePhoneNumber_Type =[[NSMutableArray alloc] initWithArray:person.phoneNumber_Type copyItems:YES];
            person.editablePhoneNumber_Value =[[NSMutableArray alloc] initWithArray:person.phoneNumber_Value copyItems:YES];
            
            person.editableSocialProfile_Type =[[NSMutableArray alloc] initWithArray:person.socialProfile_Type copyItems:YES];
            person.editableSocialProfile_Value =[[NSMutableArray alloc] initWithArray:person.socialProfile_Value copyItems:YES];
            
            person.editableUrl_Type =[[NSMutableArray alloc] initWithArray:person.url_Type copyItems:YES];
            person.editableUrl_Value =[[NSMutableArray alloc] initWithArray:person.url_Value copyItems:YES];
            
            person.editableDate_Type =[[NSMutableArray alloc] initWithArray:person.date_Type copyItems:YES];
            person.editableDate_Value =[[NSMutableArray alloc] initWithArray:person.date_Value copyItems:YES];
            
            [contacts addObject:person];
            
            
            
            
            CFRelease(phones);
            CFRelease(emails);
            CFRelease(address);
            CFRelease(socialProfile);
            CFRelease(instantMessageProfile);
            CFRelease(url);
            CFRelease(date);
            
        }
        CFRelease(addressBook);
        CFRelease(allPeople);
        obj.contactDetails=[[NSMutableArray alloc] init];
        
        [obj setContactDetails:contacts];
        NSLog(@"%@",obj.contactDetails);
        
        
        

    }

   
    
 
}
- (void)ContactBackUp_btnAction{

    
    ContactBackUpViewController *contactBackup_Cls=[[ContactBackUpViewController alloc]init];
    [self.navigationController pushViewController:contactBackup_Cls animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)ContactsSend_btnAction{
    SelectContact_toShareViewController *sharecontacts=[[SelectContact_toShareViewController alloc]init];
    sharecontacts.string1=@"SHARE";
    [self.navigationController pushViewController:sharecontacts animated:YES];
}
-(void)bulkcontact_btnAction{
    
    SelectContact_toShareViewController *sharecontacts=[[SelectContact_toShareViewController alloc]init];
     sharecontacts.string1=@"BULK";
    [self.navigationController pushViewController:sharecontacts animated:YES];

}

-(void)Setting_btnAction{
    
    //ContactBackUpViewController
   
}
-(void)Sent_btnAction{
    
    ContactsSentViewController *send_Cls=[[ContactsSentViewController alloc]init];
   [self.navigationController pushViewController:send_Cls animated:YES];
//
}
-(void)GetConttact_nAction{
    ContactGetSelectMethodViewController *getContact=[[ContactGetSelectMethodViewController alloc]init];
    [self.navigationController pushViewController:getContact animated:YES];
    
}
-(void)received_btnAction{
    
    ContactSignUpDataService * sendContacts_cls=[[ContactSignUpDataService alloc] init];
    sendContacts_cls.delegate=self;
    activityIndicator = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge] ;
    activityIndicator.frame = CGRectMake(0.0, 0.0, 40.0, 40.0);
    activityIndicator.center = self.view.center;
    [self.view addSubview: activityIndicator];
    [activityIndicator startAnimating];
    
    
    
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
   

    NSString* url=[NSString stringWithFormat:@"%@",kBASEURL];
    NSString* payload=[NSString stringWithFormat:@"{\"userid\":\"%@\"}",[defaults valueForKey:@"UserID"]];
    
    [sendContacts_cls callWebService:url :@"receive" :payload];
    
    
    
}
-(void)getresponse:(NSString *)res :(id)data :message status:(BOOL)value
{
    [activityIndicator stopAnimating];
    
    if ([res isEqualToString:@"success"]) {
        NSArray* senderData=[NSArray arrayWithArray:data] ;
        ContactReceivedViewController *received_Cls=[[ContactReceivedViewController alloc]init];
        [received_Cls senderDetails:senderData];
        [self.navigationController pushViewController:received_Cls animated:YES];

    }
    else
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:res
                                                        message:message
                                                       delegate:nil
                                              cancelButtonTitle:@"Ok"
                                              otherButtonTitles:Nil,Nil];
        
        
        [alert show];
    }
   

    
    
}

-(void)Setting_btnAction22:(UIButton *)sender{
    NSInteger tagVal=((UIButton *)sender).tag;
    NSLog(@"List button Action==%ld",(long)tagVal);
  
    //Email Facebook Share Tweet
    NSArray *menuItems =
    @[
      [KxMenuItem menuItem:@""
                     image:[UIImage imageNamed:@"popbtn.png"]
                    target:self
                    action:@selector(pushMenuItem1:)],
      
      [KxMenuItem menuItem:@""
                     image:[UIImage imageNamed:@"popbtn.png"]
                    target:self
                    action:@selector(pushMenuItem2:)],
      
      [KxMenuItem menuItem:@""
                     image:[UIImage imageNamed:@"popbtn.png"]
                    target:self
                    action:@selector(pushMenuItem3:)],
      
      [KxMenuItem menuItem:@""
                     image:[UIImage imageNamed:@"popbtn.png"]
                    target:self
                    action:@selector(pushMenuItem4:)],
      
      ];
    
    KxMenuItem *first = menuItems[0];
    first.foreColor = [UIColor colorWithRed:47/255.0f green:112/255.0f blue:225/255.0f alpha:1.0];
    first.alignment = NSTextAlignmentCenter;
    
    [KxMenu showMenuInView:self.navigationController.view fromRect:sender.frame menuItems:menuItems];
    

    
}

-(void)pushMenuItem1:(id)sender{
    
    NSLog(@"FIRST Item Clicked");
}
-(void)pushMenuItem2:(id)sender{
    
    NSLog(@"SECOND Item Clicked");
}
-(void)pushMenuItem3:(id)sender{
    
    NSLog(@"THIRD Item Clicked");
}
-(void)pushMenuItem4:(id)sender{
    
    NSLog(@"FOURTH Item Clicked");
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.uiasView.phntxtfld resignFirstResponder];
     [self.uiasView.nametxtfld resignFirstResponder];
}
@end
