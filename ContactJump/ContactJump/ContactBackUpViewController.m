//
//  ContactBackUpViewController.m
//  ContactJump
//
//  Created by Raman on 15/01/14.
//  Copyright (c) 2014 iyasoft. All rights reserved.
//

#import "ContactBackUpViewController.h"
#import "SelectContactsForBackupViewController.h"

#define IS_IPHONE_5 ( fabs( ( double )[ [ UIScreen mainScreen ] bounds ].size.height - ( double )568 ) < DBL_EPSILON )
@interface ContactBackUpViewController ()

@end

@implementation ContactBackUpViewController

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
    
    obj=[ContactGlobalDataClass getInstance];
#pragma Main BG ImageView
    UIImageView *mainbg_img = [[UIImageView alloc] init];
    mainbg_img.userInteractionEnabled=TRUE;
    mainbg_img.opaque = YES;
    [mainbg_img setImage:[UIImage imageNamed:@"Min-bg.png"]];
    [self.view addSubview:mainbg_img];
    
    
    UIImageView  *nav_img =[[UIImageView alloc] init];
    nav_img.image=[UIImage imageNamed:@"header-bg.png"];
    [mainbg_img addSubview:nav_img];
    
#pragma Navigation Bar Title
    navbartitle=[[UILabel alloc] init];
    navbartitle.text=[NSString stringWithFormat:@"Contact Backup"];
    navbartitle.textAlignment=1;
    navbartitle.textColor= [UIColor whiteColor];
    navbartitle.backgroundColor=[UIColor clearColor];
    navbartitle.font=[UIFont fontWithName:@"AmericanTypewriter" size:16];
    navbartitle.shadowColor = [UIColor whiteColor];
    navbartitle.shadowOffset = CGSizeMake(0,0);
    [nav_img addSubview:navbartitle];
    
    
    
    UIButton *back_btn =[UIButton buttonWithType:UIButtonTypeCustom];
    [back_btn setBackgroundImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"back-button" ofType:@"png"]] forState:UIControlStateNormal];
    [back_btn addTarget:self action:@selector(back_btnAction) forControlEvents:UIControlEventTouchUpInside];
    [mainbg_img addSubview:back_btn];
    
    
    
    
    
#pragma mark Backup Your Contacs Button
    UIButton *backupyourcontacts_btn =[UIButton buttonWithType:UIButtonTypeCustom];
    [backupyourcontacts_btn setBackgroundImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"button-bg1" ofType:@"png"]] forState:UIControlStateNormal];
    [backupyourcontacts_btn setTitle:@"Backup Your Contacts" forState:UIControlStateNormal];
    // [backupyourcontacts_btn setTitleEdgeInsets:UIEdgeInsetsMake(-20.0f, 10.0f, 0.0f, 0.0f)];
    [[backupyourcontacts_btn titleLabel] setFont:[UIFont fontWithName:@"AmericanTypewriter" size:16]];
    [backupyourcontacts_btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [backupyourcontacts_btn addTarget:self action:@selector(backupyourcontacts_btnAction) forControlEvents:UIControlEventTouchUpInside];
    [mainbg_img addSubview:backupyourcontacts_btn];
    
    
#pragma mark backupcontactsubtitle_lbl button sub title label.
    UILabel *backupcontactsubtitle_lbl=[[UILabel alloc] init];
    backupcontactsubtitle_lbl.frame=CGRectMake(0, 45, 279, 18);
    backupcontactsubtitle_lbl.text=@"1.25 MB";
    backupcontactsubtitle_lbl.textAlignment=NSTextAlignmentCenter;
    backupcontactsubtitle_lbl.textColor= [UIColor lightGrayColor];
    backupcontactsubtitle_lbl.backgroundColor=[UIColor clearColor];
    backupcontactsubtitle_lbl.font=[UIFont fontWithName:@"AmericanTypewriter" size:13];
  
    
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    NSString* lastbackupDate = [defaults stringForKey:@"lastBackup"];
    lastBackup_Date=[[UILabel alloc] init];
    if ( lastbackupDate !=NULL) {
        lastBackup_Date.text=[NSString stringWithFormat:@"Last backup:  %@",[defaults valueForKey:@"lastBackup"]];
    } else {
        lastBackup_Date.text=[NSString stringWithFormat:@"No Backup till date"];
    }
    lastBackup_Date.textAlignment=NSTextAlignmentLeft;
    lastBackup_Date.textColor= [UIColor whiteColor];
    lastBackup_Date.backgroundColor=[UIColor clearColor];
    lastBackup_Date.font=[UIFont fontWithName:@"AmericanTypewriter" size:12];
    lastBackup_Date.shadowColor = [UIColor whiteColor];
    lastBackup_Date.shadowOffset = CGSizeMake(0,0);
    [mainbg_img addSubview:lastBackup_Date];
    
#pragma mark Download With Image Button
    
    UIButton *downloadwithImage_btn =[UIButton buttonWithType:UIButtonTypeCustom];
    [downloadwithImage_btn setBackgroundImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"button-bg1" ofType:@"png"]] forState:UIControlStateNormal];
    [downloadwithImage_btn setTitleEdgeInsets:UIEdgeInsetsMake(-20.0f, 10.0f, 0.0f, 0.0f)];
    [downloadwithImage_btn setTitle:@"Download With Images" forState:UIControlStateNormal];
    [[downloadwithImage_btn titleLabel] setFont:[UIFont fontWithName:@"AmericanTypewriter" size:16]];
    [downloadwithImage_btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [downloadwithImage_btn addTarget:self action:@selector(downloadwithImage_btnAction) forControlEvents:UIControlEventTouchUpInside];
    [mainbg_img addSubview:downloadwithImage_btn];
    
#pragma mark downloadwithimgsubtitle_lbl button sub title label.
    downloadwithimgsubtitle_lbl=[[UILabel alloc] init];
    downloadwithimgsubtitle_lbl.frame=CGRectMake(0, 45, 279, 18);
    downloadwithimgsubtitle_lbl.textAlignment=NSTextAlignmentCenter;
    downloadwithimgsubtitle_lbl.textColor= [UIColor lightGrayColor];
    downloadwithimgsubtitle_lbl.backgroundColor=[UIColor clearColor];
    downloadwithimgsubtitle_lbl.font=[UIFont fontWithName:@"AmericanTypewriter" size:13];
    
    [downloadwithImage_btn addSubview:downloadwithimgsubtitle_lbl];
    
    
    
    
    
#pragma mark Download Without Image Button
    
    UIButton *downloadwithoutImage_btn =[UIButton buttonWithType:UIButtonTypeCustom];
    [downloadwithoutImage_btn setBackgroundImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"button-bg1" ofType:@"png"]] forState:UIControlStateNormal];
    [downloadwithoutImage_btn setTitleEdgeInsets:UIEdgeInsetsMake(-20.0f, 10.0f, 0.0f, 0.0f)];
    [downloadwithoutImage_btn setTitle:@"Download without Images" forState:UIControlStateNormal];
    [[downloadwithoutImage_btn titleLabel] setFont:[UIFont fontWithName:@"AmericanTypewriter" size:16]];
    [downloadwithoutImage_btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [downloadwithoutImage_btn addTarget:self action:@selector(downloadwithoutImage_btnAction) forControlEvents:UIControlEventTouchUpInside];
    [mainbg_img addSubview:downloadwithoutImage_btn];
    
    
#pragma mark downloadwithoutimgsubtitle_lbl button sub title label.
    downloadwithoutimgsubtitle_lbl=[[UILabel alloc] init];
    downloadwithoutimgsubtitle_lbl.frame=CGRectMake(0, 45, 279, 18);
    downloadwithoutimgsubtitle_lbl.textAlignment=NSTextAlignmentCenter;
    downloadwithoutimgsubtitle_lbl.textColor= [UIColor lightGrayColor];
    downloadwithoutimgsubtitle_lbl.backgroundColor=[UIColor clearColor];
    downloadwithoutimgsubtitle_lbl.font=[UIFont fontWithName:@"AmericanTypewriter" size:13];
    [downloadwithoutImage_btn addSubview:downloadwithoutimgsubtitle_lbl];
    
    
    if ([defaults valueForKey:@"dataSizeWithImage"] !=NULL ) {
        downloadwithimgsubtitle_lbl.text=[NSString stringWithFormat:@"%@",[defaults valueForKey:@"dataSizeWithImage"]];
        downloadwithoutimgsubtitle_lbl.text=[NSString stringWithFormat:@"%@",[defaults valueForKey:@"dataSizeWithoutImage"]];
    }
    
    
    
    if (IS_IPHONE_5) {
        
        mainbg_img.frame=CGRectMake(0,0, 320, 568);
        nav_img.frame=CGRectMake(0,0,320,90);
        back_btn.frame=CGRectMake(15, 14, 33, 54);
        navbartitle.frame=CGRectMake(0,20,320,50);
        
        backupyourcontacts_btn.frame=CGRectMake(20.5,140, 279,79);
        lastBackup_Date.frame=CGRectMake(23.5,223, 279,30);
        downloadwithImage_btn.frame=CGRectMake(20.5,310, 279,79);
        downloadwithoutImage_btn.frame=CGRectMake(20.5,439, 279,79);
        
        
        
    }else{
        
        mainbg_img.frame=CGRectMake(0,0, 320, 480);
        nav_img.frame=CGRectMake(0,0,320,80);
        back_btn.frame=CGRectMake(15, 13, 33, 54);
        navbartitle.frame=CGRectMake(0,20,320,50);
        
        lastBackup_Date.frame=CGRectMake(23.5,198, 279,30);
        backupyourcontacts_btn.frame=CGRectMake(20.5,115, 279,79);
        downloadwithImage_btn.frame=CGRectMake(20.5,257, 279,79);
        downloadwithoutImage_btn.frame=CGRectMake(20.5,361+5, 279,79);
        
    }
    
	// Do any additional setup after loading the view.
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    popUp=1;
    [self backupButtonsShow];
}

-(void)back_btnAction
{
    
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)backup_WithoutImage
{
    popUp=1;
    [self backupButtonsShow];
    backupWithImage=0;
    ContactBackupService * backupContacts_cls=[[ContactBackupService alloc] init];
    backupContacts_cls.delegate=self;
    activityIndicator = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge] ;
    activityIndicator.frame = CGRectMake(0.0, 0.0, 40.0, 40.0);
    activityIndicator.center = self.view.center;
    [self.view addSubview: activityIndicator];
    [activityIndicator startAnimating];
    
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    NSString* val = [defaults stringForKey:@"UserID"];
    NSString* url=[NSString stringWithFormat:@"%@",kBASEURL];
    NSString* payload=[NSString stringWithFormat:@"{\"user_id\":\"%@\",\"contacts\":\"%@\"}",val,jsonString_withoutImages];
    
    
    [backupContacts_cls callWebService:url :@"contactbackup" :payload];
    
    
    
}

-(void)backup_WithImage
{
    popUp=1;
    [self backupButtonsShow];
    
    backupWithImage=1;
    ContactBackupService * backupContacts_cls=[[ContactBackupService alloc] init];
    backupContacts_cls.delegate=self;
    activityIndicator = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge] ;
    activityIndicator.frame = CGRectMake(0.0, 0.0, 40.0, 40.0);
    activityIndicator.center = self.view.center;
    [self.view addSubview: activityIndicator];
    [activityIndicator startAnimating];
    
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    NSString* val = [defaults stringForKey:@"UserID"];
    NSString* url=[NSString stringWithFormat:@"%@",kBASEURL];
    NSString* payload=[NSString stringWithFormat:@"{\"user_id\":\"%@\",\"contacts\":\"%@\"}",val,jsonString];
    
    
    [backupContacts_cls callWebService:url :@"contactbackup" :payload];
}


-(void)getresponse:(NSString *)message :(id)data :(NSString *)result :(NSString *)time status:(BOOL)value
{
    [activityIndicator stopAnimating];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:result
                                                    message: message
                                                   delegate:self
                                          cancelButtonTitle:@"Ok"
                                          otherButtonTitles:Nil,Nil];
    
    [alert setTag:10];
    [alert show];
    
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    [defaults setObject:time forKey:@"lastBackup"];
    
    lastBackup_Date.text=[NSString stringWithFormat:@"Last backup:  %@",[defaults valueForKey:@"lastBackup"]];
    
    
    if (backupWithImage)
    {
        [defaults setObject:[NSString stringWithFormat:@"%.2f KB",(float)([[jsonString stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding] length]/1024.0f)] forKey:@"dataSizeWithImage"];
        [defaults setObject:[NSString stringWithFormat:@"%.2f KB",(float)([[jsonString_withoutImages stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding] length]/1024.0f)] forKey:@"dataSizeWithoutImage"];
        [defaults synchronize];
    }
    else
    {
        [defaults setObject:[NSString stringWithFormat:@"%.2f KB",(float)([[jsonString_withoutImages stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding] length]/1024.0f)] forKey:@"dataSizeWithImage"];
        [defaults setObject:[NSString stringWithFormat:@"%.2f KB",(float)([[jsonString_withoutImages stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding] length]/1024.0f)] forKey:@"dataSizeWithoutImage"];
        [defaults synchronize];
    }
    downloadwithimgsubtitle_lbl.text=[NSString stringWithFormat:@"%@",[defaults valueForKey:@"dataSizeWithImage"]];
    downloadwithoutimgsubtitle_lbl.text=[NSString stringWithFormat:@"%@",[defaults valueForKey:@"dataSizeWithoutImage"]];

    
}


-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (alertView.tag==10) {
        // [self.navigationController popToRootViewControllerAnimated:YES];
    }
}




-(void)backupyourcontacts_btnAction{
    
    
    
    bg=[[UIView alloc] init];
    [self createJson];
    if (IS_IPHONE_5) {
        bg.frame=CGRectMake(0, 90, 320, 568-90);
    } else {
        bg.frame=CGRectMake(0, 80, 320, 400);
    }
    bg.backgroundColor=[UIColor clearColor];
    
    [bg setHidden:NO];
    [self.view addSubview:bg];
    self.uiasView = [[CustomUIViewForBackUp alloc] initWithFrame:CGRectMake(10, (self.view.frame.size.height ), 300, 250)];
    
    [self.uiasView.backupWithoutImageBtn addTarget:self action:@selector(backup_WithoutImage) forControlEvents:UIControlEventTouchUpInside];
    [self.uiasView.backupWithImageBtn addTarget:self action:@selector(backup_WithImage) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.uiasView];
    [self backupButtonsShow];
    self.uiasView.celltxt_sizeWithImage.text=[NSString stringWithFormat:@"%.2f KB",(float)([[jsonString stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding] length]/1024.0f)];
    self.uiasView.celltxt_sizeWithoutImage.text=[NSString stringWithFormat:@"%.2f KB",(float)([[jsonString_withoutImages stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding] length]/1024.0f)];
    
    
}

-(void)backupButtonsShow
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
            
        }];
        
    }
}

-(void)downloadwithoutImage_btnAction{
    
    
    ContactSignUpDataService * sendContacts_cls=[[ContactSignUpDataService alloc] init];
    sendContacts_cls.delegate=self;
    activityIndicator = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge] ;
    activityIndicator.frame = CGRectMake(0.0, 0.0, 40.0, 40.0);
    activityIndicator.center = self.view.center;
    [self.view addSubview: activityIndicator];
    [activityIndicator startAnimating];
    
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    NSString* val = [defaults stringForKey:@"UserID"];
    NSString* url=[NSString stringWithFormat:@"%@",kBASEURL];
    NSString* payload=[NSString stringWithFormat:@"{\"user_id\":\"%@\",\"image\":\"0\"}",val];
    
    
    [sendContacts_cls callWebService:url :@"contactdownload" :payload];
    
}

-(void)downloadwithImage_btnAction{
    
    
    
    ContactSignUpDataService * sendContacts_cls=[[ContactSignUpDataService alloc] init];
    sendContacts_cls.delegate=self;
    activityIndicator = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge] ;
    activityIndicator.frame = CGRectMake(0.0, 0.0, 40.0, 40.0);
    activityIndicator.center = self.view.center;
    [self.view addSubview: activityIndicator];
    [activityIndicator startAnimating];
    
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    NSString* val = [defaults stringForKey:@"UserID"];
    NSString* url=[NSString stringWithFormat:@"%@",kBASEURL];
    NSString* payload=[NSString stringWithFormat:@"{\"user_id\":\"%@\",\"image\":\"1\"}",val];
    
    
    [sendContacts_cls callWebService:url :@"contactdownload" :payload];
    
    
    
}

-(void)getresponse:(NSString *)res :(id)data :(NSString *)message status:(BOOL)value
{
    [activityIndicator stopAnimating];
    
    if ([res isEqualToString:@"success"]) {
        
        
        NSLog(@"DATA:%@ ",data);
        
        person_RecordRef=[[NSMutableArray alloc] init];
        //NSDictionary *recievedData_dic=[NSDictionary dictionaryWithDictionary:[data objectAtIndex:0]];
        //NSData* totalPeople_data=[recievedData_dic objectForKey:@"send_contacts"];
        
        
        NSData* totalPeople_data = [[data stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding]  dataUsingEncoding:NSUTF8StringEncoding];
        NSError *localError = nil;
        
        if (totalPeople_data!=nil) {
            
            NSDictionary *parsedObject = [NSJSONSerialization JSONObjectWithData:totalPeople_data options:NSJSONReadingAllowFragments error:&localError];
            
            
            NSLog(@"\n\n\njsonData ContactDetailesViewController----->%@", [parsedObject objectForKey:@"Data"]);
            //            NSData* jsonData = [NSJSONSerialization dataWithJSONObject:parsedObject
            //                                                                   options:NSJSONWritingPrettyPrinted error:&localError];
            //
            //            NSString* newStr = [[NSString alloc] initWithData:jsonData
            //                                                         encoding:NSUTF8StringEncoding] ;
            NSArray *totalPerson=[parsedObject objectForKey:@"Data"];
            
            for (int k=0; k<[totalPerson count]; k++)
            {
                NSDictionary *dic=[totalPerson objectAtIndex:k];
                
                
                NSArray* a=[dic objectForKey:@"Person"];
                
                
                CFErrorRef error = NULL;
                
                ABRecordRef newPerson = ABPersonCreate();
                
                ABRecordSetValue(newPerson, kABPersonFirstNameProperty, (__bridge CFTypeRef)([[[[a objectAtIndex:0] objectForKey:@"data"] objectAtIndex:0] objectForKey:@"value"]), &error);
                
                ABRecordSetValue(newPerson, kABPersonOrganizationProperty, (__bridge CFTypeRef)([[[[a objectAtIndex:0] objectForKey:@"data"] objectAtIndex:2] objectForKey:@"value"]), &error);
                ABRecordSetValue(newPerson, kABPersonJobTitleProperty, (__bridge CFTypeRef)([[[[a objectAtIndex:0] objectForKey:@"data"] objectAtIndex:1] objectForKey:@"value"]), &error);
                
                NSString* imagestr = [[[[[a objectAtIndex:0] objectForKey:@"data"] objectAtIndex:3] objectForKey:@"value"] stringByReplacingOccurrencesOfString:@" " withString:@"+"];
                
                
                NSData *imageData;
                if (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"7.0")) {
                    imageData = [[NSData alloc ] initWithBase64EncodedString:imagestr options:NSDataBase64DecodingIgnoreUnknownCharacters];
                    
                } else {
                    
                    [Base64 initialize];
                    imageData=[Base64 decode:imagestr];
                }
                
                
                
                
                ABPersonSetImageData(newPerson, (__bridge CFDataRef)(imageData),  &error);
                
                ABMutableMultiValueRef multiPhone = ABMultiValueCreateMutable(kABMultiStringPropertyType);
                for (int phoneCount=0; phoneCount<[[[a objectAtIndex:1] objectForKey:@"data"] count]; phoneCount++)
                {
                    if ([[[[[a objectAtIndex:1] objectForKey:@"data"] objectAtIndex:phoneCount] objectForKey:@"name"] isEqualToString:@"Home"])
                    {
                        ABMultiValueAddValueAndLabel(multiPhone, (__bridge CFTypeRef)([[[[a objectAtIndex:1] objectForKey:@"data"] objectAtIndex:phoneCount] objectForKey:@"value"]), kABHomeLabel, NULL);
                    }
                    else if ([[[[[a objectAtIndex:1] objectForKey:@"data"] objectAtIndex:phoneCount] objectForKey:@"name"] isEqualToString:@"Mobile"])
                    {
                        ABMultiValueAddValueAndLabel(multiPhone, (__bridge CFTypeRef)([[[[a objectAtIndex:1] objectForKey:@"data"] objectAtIndex:phoneCount] objectForKey:@"value"]), kABPersonPhoneMobileLabel, NULL);
                    }
                    else if ([[[[[a objectAtIndex:1] objectForKey:@"data"] objectAtIndex:phoneCount] objectForKey:@"name"] isEqualToString:@"Work"])
                    {
                        ABMultiValueAddValueAndLabel(multiPhone, (__bridge CFTypeRef)([[[[a objectAtIndex:1] objectForKey:@"data"] objectAtIndex:phoneCount] objectForKey:@"value"]), kABWorkLabel, NULL);
                    }
                    else if ([[[[[a objectAtIndex:1] objectForKey:@"data"] objectAtIndex:phoneCount] objectForKey:@"name"] isEqualToString:@"IPhone"])
                    {
                        ABMultiValueAddValueAndLabel(multiPhone, (__bridge CFTypeRef)([[[[a objectAtIndex:1] objectForKey:@"data"] objectAtIndex:phoneCount] objectForKey:@"value"]), kABPersonPhoneIPhoneLabel, NULL);
                    }
                    else if ([[[[[a objectAtIndex:1] objectForKey:@"data"] objectAtIndex:phoneCount] objectForKey:@"name"] isEqualToString:@"Main"])
                    {
                        ABMultiValueAddValueAndLabel(multiPhone, (__bridge CFTypeRef)([[[[a objectAtIndex:1] objectForKey:@"data"] objectAtIndex:phoneCount] objectForKey:@"value"]), kABPersonPhoneMainLabel, NULL);
                    }
                    else if ([[[[[a objectAtIndex:1] objectForKey:@"data"] objectAtIndex:phoneCount] objectForKey:@"name"] isEqualToString:@"Home fax"])
                    {
                        ABMultiValueAddValueAndLabel(multiPhone, (__bridge CFTypeRef)([[[[a objectAtIndex:1] objectForKey:@"data"] objectAtIndex:phoneCount] objectForKey:@"value"]), kABPersonPhoneHomeFAXLabel, NULL);
                    }
                    else if ([[[[[a objectAtIndex:1] objectForKey:@"data"] objectAtIndex:phoneCount] objectForKey:@"name"] isEqualToString:@"Work fax"])
                    {
                        ABMultiValueAddValueAndLabel(multiPhone, (__bridge CFTypeRef)([[[[a objectAtIndex:1] objectForKey:@"data"] objectAtIndex:phoneCount] objectForKey:@"value"]), kABPersonPhoneWorkFAXLabel, NULL);
                    }
                    else if ([[[[[a objectAtIndex:1] objectForKey:@"data"] objectAtIndex:phoneCount] objectForKey:@"name"] isEqualToString:@"Pager"])
                    {
                        ABMultiValueAddValueAndLabel(multiPhone, (__bridge CFTypeRef)([[[[a objectAtIndex:1] objectForKey:@"data"] objectAtIndex:phoneCount] objectForKey:@"value"]), kABPersonPhonePagerLabel, NULL);
                    }
                    else
                    {
                        ABMultiValueAddValueAndLabel(multiPhone, (__bridge CFTypeRef)([[[[a objectAtIndex:1] objectForKey:@"data"] objectAtIndex:phoneCount] objectForKey:@"value"]), kABOtherLabel, NULL);
                    }
                    
                }
                
                ABRecordSetValue(newPerson, kABPersonPhoneProperty, multiPhone,nil);
                CFRelease(multiPhone);
                
                
                ABMutableMultiValueRef multiEmail = ABMultiValueCreateMutable(kABStringPropertyType);
                for (int emailCount=0; emailCount<[[[a objectAtIndex:2] objectForKey:@"data"] count]; emailCount++)
                {
                    if ([[[[[a objectAtIndex:2] objectForKey:@"data"] objectAtIndex:emailCount] objectForKey:@"name"] isEqualToString:@"Home"])
                    {
                        ABMultiValueAddValueAndLabel(multiEmail, (__bridge CFTypeRef)([[[[a objectAtIndex:2] objectForKey:@"data"] objectAtIndex:emailCount] objectForKey:@"value"]), kABHomeLabel, NULL);
                    }
                    else if ([[[[[a objectAtIndex:2] objectForKey:@"data"] objectAtIndex:emailCount] objectForKey:@"name"] isEqualToString:@"Work"])
                    {
                        ABMultiValueAddValueAndLabel(multiEmail, (__bridge CFTypeRef)([[[[a objectAtIndex:2] objectForKey:@"data"] objectAtIndex:emailCount] objectForKey:@"value"]), kABWorkLabel, NULL);
                    }
                    
                    else if ([[[[[a objectAtIndex:2] objectForKey:@"data"] objectAtIndex:emailCount] objectForKey:@"name"] isEqualToString:@"Other"] || [[[[[a objectAtIndex:2] objectForKey:@"data"] objectAtIndex:emailCount] objectForKey:@"name"] isEqualToString:@"ICloud"])
                    {
                        ABMultiValueAddValueAndLabel(multiEmail, (__bridge CFTypeRef)([[[[a objectAtIndex:2] objectForKey:@"data"] objectAtIndex:emailCount] objectForKey:@"value"]), kABOtherLabel, NULL);
                    }
                }
                
                ABRecordSetValue(newPerson, kABPersonEmailProperty, multiEmail,nil);
                CFRelease(multiEmail);
                
                
                
                
                ABMutableMultiValueRef multiAddress = ABMultiValueCreateMutable(kABMultiDictionaryPropertyType);
                for (int addressCount=0; addressCount<[[[a objectAtIndex:3] objectForKey:@"data"] count]; addressCount++)
                {
                    NSMutableDictionary *addressDictionary = [[NSMutableDictionary alloc] init];
                    if ([[[[[a objectAtIndex:3] objectForKey:@"data"] objectAtIndex:addressCount] objectForKey:@"name"] isEqualToString:@"Home"])
                    {
                        [addressDictionary setObject:(__bridge id)((__bridge CFTypeRef)([[[[a objectAtIndex:3] objectForKey:@"data"] objectAtIndex:addressCount] objectForKey:@"value"])) forKey:(NSString *) kABPersonAddressStreetKey];
                        ABMultiValueAddValueAndLabel(multiAddress, (__bridge CFTypeRef)(addressDictionary), kABHomeLabel, NULL);
                    }
                    else  if ([[[[[a objectAtIndex:3] objectForKey:@"data"] objectAtIndex:addressCount] objectForKey:@"name"] isEqualToString:@"Work"])
                    {
                        [addressDictionary setObject:(__bridge id)((__bridge CFTypeRef)([[[[a objectAtIndex:3] objectForKey:@"data"] objectAtIndex:addressCount] objectForKey:@"value"])) forKey:(NSString *) kABPersonAddressStreetKey];
                        
                        
                        ABMultiValueAddValueAndLabel(multiAddress, (__bridge CFTypeRef)(addressDictionary), kABWorkLabel, NULL);
                    }
                    else if ([[[[[a objectAtIndex:3] objectForKey:@"data"] objectAtIndex:addressCount] objectForKey:@"name"] isEqualToString:@"Other"])
                    {
                        [addressDictionary setObject:(__bridge id)((__bridge CFTypeRef)([[[[a objectAtIndex:3] objectForKey:@"data"] objectAtIndex:addressCount] objectForKey:@"value"])) forKey:(NSString *) kABPersonAddressStreetKey];
                        
                        
                        ABMultiValueAddValueAndLabel(multiAddress, (__bridge CFTypeRef)(addressDictionary), kABOtherLabel, NULL);
                    }
                    
                }
                
                ABRecordSetValue(newPerson, kABPersonAddressProperty, multiAddress,&error);
                CFRelease(multiAddress);
                
                
                
                
                
                
                
                ABMutableMultiValueRef multiSocialProfile = ABMultiValueCreateMutable(kABMultiDictionaryPropertyType);
                for (int SPCount=0; SPCount<[[[a objectAtIndex:4] objectForKey:@"data"] count]; SPCount++)
                {
                    
                    if ([[[[[a objectAtIndex:4] objectForKey:@"data"] objectAtIndex:SPCount] objectForKey:@"name"] isEqualToString:@"twitter"])
                    {
                        
                        
                        ABMultiValueAddValueAndLabel(multiSocialProfile,(__bridge CFTypeRef)([NSDictionary dictionaryWithObjectsAndKeys:
                                                                                              (NSString *)kABPersonSocialProfileServiceTwitter, kABPersonSocialProfileServiceKey,
                                                                                              (__bridge id)((__bridge CFTypeRef)([[[[a objectAtIndex:4] objectForKey:@"data"] objectAtIndex:SPCount] objectForKey:@"value"])), kABPersonSocialProfileUsernameKey,
                                                                                              nil]) , kABPersonSocialProfileServiceTwitter, NULL);
                        
                        
                    }
                    else if ([[[[[a objectAtIndex:4] objectForKey:@"data"] objectAtIndex:SPCount] objectForKey:@"name"] isEqualToString:@"facebook"])
                    {
                        
                        
                        ABMultiValueAddValueAndLabel(multiSocialProfile,(__bridge CFTypeRef)([NSDictionary dictionaryWithObjectsAndKeys:
                                                                                              (NSString *)kABPersonSocialProfileServiceFacebook, kABPersonSocialProfileServiceKey,
                                                                                              (__bridge id)((__bridge CFTypeRef)([[[[a objectAtIndex:4] objectForKey:@"data"] objectAtIndex:SPCount] objectForKey:@"value"])), kABPersonSocialProfileUsernameKey,
                                                                                              nil]), kABPersonSocialProfileServiceFacebook, NULL);
                        
                    }
                    else if ([[[[[a objectAtIndex:4] objectForKey:@"data"] objectAtIndex:SPCount] objectForKey:@"name"] isEqualToString:@"flickr"])
                    {
                        
                        ABMultiValueAddValueAndLabel(multiSocialProfile, (__bridge CFTypeRef)([NSDictionary dictionaryWithObjectsAndKeys:
                                                                                               (NSString *)kABPersonSocialProfileServiceFlickr, kABPersonSocialProfileServiceKey,
                                                                                               (__bridge id)((__bridge CFTypeRef)([[[[a objectAtIndex:4] objectForKey:@"data"] objectAtIndex:SPCount] objectForKey:@"value"])), kABPersonSocialProfileUsernameKey,
                                                                                               nil]), kABPersonSocialProfileServiceFlickr, NULL);
                    }
                    else if ([[[[[a objectAtIndex:4] objectForKey:@"data"] objectAtIndex:SPCount] objectForKey:@"name"] isEqualToString:@"linkedin"])
                    {
                        
                        ABMultiValueAddValueAndLabel(multiSocialProfile, (__bridge CFTypeRef)([NSDictionary dictionaryWithObjectsAndKeys:
                                                                                               (NSString *)kABPersonSocialProfileServiceLinkedIn, kABPersonSocialProfileServiceKey,
                                                                                               (__bridge id)((__bridge CFTypeRef)([[[[a objectAtIndex:4] objectForKey:@"data"] objectAtIndex:SPCount] objectForKey:@"value"])), kABPersonSocialProfileUsernameKey,
                                                                                               nil]), kABPersonSocialProfileServiceLinkedIn, NULL);
                    }
                    else if ([[[[[a objectAtIndex:4] objectForKey:@"data"] objectAtIndex:SPCount] objectForKey:@"name"] isEqualToString:@"myspace"])
                    {
                        
                        ABMultiValueAddValueAndLabel(multiSocialProfile, (__bridge CFTypeRef)([NSDictionary dictionaryWithObjectsAndKeys:
                                                                                               (NSString *)kABPersonSocialProfileServiceMyspace, kABPersonSocialProfileServiceKey,
                                                                                               (__bridge id)((__bridge CFTypeRef)([[[[a objectAtIndex:4] objectForKey:@"data"] objectAtIndex:SPCount] objectForKey:@"value"])), kABPersonSocialProfileUsernameKey,
                                                                                               nil]), kABPersonSocialProfileServiceMyspace, NULL);
                    }
                    else if ([[[[[a objectAtIndex:4] objectForKey:@"data"] objectAtIndex:SPCount] objectForKey:@"name"] isEqualToString:@"sinaweibo"])
                    {
                        
                        ABMultiValueAddValueAndLabel(multiSocialProfile, (__bridge CFTypeRef)([NSDictionary dictionaryWithObjectsAndKeys:
                                                                                               (NSString *)kABPersonSocialProfileServiceSinaWeibo, kABPersonSocialProfileServiceKey,
                                                                                               (__bridge id)((__bridge CFTypeRef)([[[[a objectAtIndex:4] objectForKey:@"data"] objectAtIndex:SPCount] objectForKey:@"value"])), kABPersonSocialProfileUsernameKey,
                                                                                               nil]), kABPersonSocialProfileServiceSinaWeibo, NULL);
                    }
                    
                    
                }
                
                ABRecordSetValue(newPerson, kABPersonSocialProfileProperty, multiSocialProfile,&error);
                CFRelease(multiSocialProfile);
                
                
                
                
                ABMutableMultiValueRef multiIM = ABMultiValueCreateMutable(kABStringPropertyType);
                for (int IMCount=0; IMCount<[[[a objectAtIndex:5] objectForKey:@"data"] count]; IMCount++)
                {
                    if ([[[[[a objectAtIndex:5] objectForKey:@"data"] objectAtIndex:IMCount] objectForKey:@"name"] isEqualToString:@"Skype"])
                    {
                        ABMultiValueAddValueAndLabel(multiIM, (__bridge CFTypeRef)([NSDictionary dictionaryWithObjectsAndKeys:
                                                                                    (NSString *)kABPersonInstantMessageServiceSkype, kABPersonInstantMessageServiceKey,
                                                                                    (__bridge CFTypeRef)([[[[a objectAtIndex:5] objectForKey:@"data"] objectAtIndex:IMCount] objectForKey:@"value"]), kABPersonInstantMessageUsernameKey,
                                                                                    nil]), kABPersonInstantMessageServiceSkype, NULL);
                        
                    }
                    else if ([[[[[a objectAtIndex:5] objectForKey:@"data"] objectAtIndex:IMCount] objectForKey:@"name"] isEqualToString:@"MSN"])
                    {
                        ABMultiValueAddValueAndLabel(multiIM, (__bridge CFTypeRef)([NSDictionary dictionaryWithObjectsAndKeys:
                                                                                    (NSString *)kABPersonInstantMessageServiceMSN, kABPersonInstantMessageServiceKey,
                                                                                    (__bridge CFTypeRef)([[[[a objectAtIndex:5] objectForKey:@"data"] objectAtIndex:IMCount] objectForKey:@"value"]), kABPersonInstantMessageUsernameKey,
                                                                                    nil]), kABPersonInstantMessageServiceMSN, NULL);
                        
                    }
                    else if ([[[[[a objectAtIndex:5] objectForKey:@"data"] objectAtIndex:IMCount] objectForKey:@"name"] isEqualToString:@"GoogleTalk"])
                    {
                        ABMultiValueAddValueAndLabel(multiIM, (__bridge CFTypeRef)([NSDictionary dictionaryWithObjectsAndKeys:
                                                                                    (NSString *)kABPersonInstantMessageServiceGoogleTalk, kABPersonInstantMessageServiceKey,
                                                                                    (__bridge CFTypeRef)([[[[a objectAtIndex:5] objectForKey:@"data"] objectAtIndex:IMCount] objectForKey:@"value"]), kABPersonInstantMessageUsernameKey,
                                                                                    nil]), kABPersonInstantMessageServiceGoogleTalk, NULL);
                        
                    }
                    else if ([[[[[a objectAtIndex:5] objectForKey:@"data"] objectAtIndex:IMCount] objectForKey:@"name"] isEqualToString:@"Facebook"])
                    {
                        ABMultiValueAddValueAndLabel(multiIM, (__bridge CFTypeRef)([NSDictionary dictionaryWithObjectsAndKeys:
                                                                                    (NSString *)kABPersonInstantMessageServiceFacebook, kABPersonInstantMessageServiceKey,
                                                                                    (__bridge CFTypeRef)([[[[a objectAtIndex:5] objectForKey:@"data"] objectAtIndex:IMCount] objectForKey:@"value"]), kABPersonInstantMessageUsernameKey,
                                                                                    nil]), kABPersonInstantMessageServiceFacebook, NULL);
                        
                    }
                    else if ([[[[[a objectAtIndex:5] objectForKey:@"data"] objectAtIndex:IMCount] objectForKey:@"name"] isEqualToString:@"AIM"])
                    {
                        ABMultiValueAddValueAndLabel(multiIM, (__bridge CFTypeRef)([NSDictionary dictionaryWithObjectsAndKeys:
                                                                                    (NSString *)kABPersonInstantMessageServiceAIM, kABPersonInstantMessageServiceKey,
                                                                                    (__bridge CFTypeRef)([[[[a objectAtIndex:5] objectForKey:@"data"] objectAtIndex:IMCount] objectForKey:@"value"]), kABPersonInstantMessageUsernameKey,
                                                                                    nil]), kABPersonInstantMessageServiceAIM, NULL);
                        
                    }
                    else if ([[[[[a objectAtIndex:5] objectForKey:@"data"] objectAtIndex:IMCount] objectForKey:@"name"] isEqualToString:@"Yahoo"])
                    {
                        ABMultiValueAddValueAndLabel(multiIM, (__bridge CFTypeRef)([NSDictionary dictionaryWithObjectsAndKeys:
                                                                                    (NSString *)kABPersonInstantMessageServiceYahoo, kABPersonInstantMessageServiceKey,
                                                                                    (__bridge CFTypeRef)([[[[a objectAtIndex:5] objectForKey:@"data"] objectAtIndex:IMCount] objectForKey:@"value"]), kABPersonInstantMessageUsernameKey,
                                                                                    nil]), kABPersonInstantMessageServiceYahoo, NULL);
                        
                    }
                    else if ([[[[[a objectAtIndex:5] objectForKey:@"data"] objectAtIndex:IMCount] objectForKey:@"name"] isEqualToString:@"ICQ"])
                    {
                        ABMultiValueAddValueAndLabel(multiIM,(__bridge CFTypeRef)([NSDictionary dictionaryWithObjectsAndKeys:
                                                                                   (NSString *)kABPersonInstantMessageServiceICQ, kABPersonInstantMessageServiceKey,
                                                                                   (__bridge CFTypeRef)([[[[a objectAtIndex:5] objectForKey:@"data"] objectAtIndex:IMCount] objectForKey:@"value"]), kABPersonInstantMessageUsernameKey,
                                                                                   nil]), kABPersonInstantMessageServiceICQ, NULL);
                        NSLog(@"%@",kABPersonInstantMessageServiceICQ);
                    }
                    else if ([[[[[a objectAtIndex:5] objectForKey:@"data"] objectAtIndex:IMCount] objectForKey:@"name"] isEqualToString:@"Jabber"])
                    {
                        ABMultiValueAddValueAndLabel(multiIM, (__bridge CFTypeRef)([NSDictionary dictionaryWithObjectsAndKeys:
                                                                                    (NSString *)kABPersonInstantMessageServiceJabber, kABPersonInstantMessageServiceKey,
                                                                                    (__bridge CFTypeRef)([[[[a objectAtIndex:5] objectForKey:@"data"] objectAtIndex:IMCount] objectForKey:@"value"]), kABPersonInstantMessageUsernameKey,
                                                                                    nil]), kABPersonInstantMessageServiceJabber, NULL);
                        
                    }
                    else if ([[[[[a objectAtIndex:5] objectForKey:@"data"] objectAtIndex:IMCount] objectForKey:@"name"] isEqualToString:@"QQ"])
                    {
                        ABMultiValueAddValueAndLabel(multiIM, (__bridge CFTypeRef)([NSDictionary dictionaryWithObjectsAndKeys:
                                                                                    (NSString *)kABPersonInstantMessageServiceQQ, kABPersonInstantMessageServiceKey,
                                                                                    (__bridge CFTypeRef)([[[[a objectAtIndex:5] objectForKey:@"data"] objectAtIndex:IMCount] objectForKey:@"value"]), kABPersonInstantMessageUsernameKey,
                                                                                    nil]), kABPersonInstantMessageServiceQQ, NULL);
                        
                    }
                    else if ([[[[[a objectAtIndex:5] objectForKey:@"data"] objectAtIndex:IMCount] objectForKey:@"name"] isEqualToString:@"GaduGadu"])
                    {
                        ABMultiValueAddValueAndLabel(multiIM, (__bridge CFTypeRef)([NSDictionary dictionaryWithObjectsAndKeys:
                                                                                    (NSString *)kABPersonInstantMessageServiceGaduGadu, kABPersonInstantMessageServiceKey,
                                                                                    (__bridge CFTypeRef)([[[[a objectAtIndex:5] objectForKey:@"data"] objectAtIndex:IMCount] objectForKey:@"value"]), kABPersonInstantMessageUsernameKey,
                                                                                    nil]), kABPersonInstantMessageServiceGaduGadu, NULL);
                        
                    }
                }
                
                ABRecordSetValue(newPerson, kABPersonInstantMessageProperty, multiIM,&error);
                CFRelease(multiIM);
                
                
                ABMutableMultiValueRef multiURL = ABMultiValueCreateMutable(kABStringPropertyType);
                for (int URLCount=0; URLCount<[[[a objectAtIndex:6] objectForKey:@"data"] count]; URLCount++)
                {
                    
                    if ([[[[[a objectAtIndex:6] objectForKey:@"data"] objectAtIndex:URLCount] objectForKey:@"name"] isEqualToString:@"Home"])
                    {
                        ABMultiValueAddValueAndLabel(multiURL, (__bridge CFTypeRef)([[[[a objectAtIndex:6] objectForKey:@"data"] objectAtIndex:URLCount] objectForKey:@"value"]), kABHomeLabel, NULL);
                    }
                    else if ([[[[[a objectAtIndex:6] objectForKey:@"data"] objectAtIndex:URLCount] objectForKey:@"name"] isEqualToString:@"Work"])
                    {
                        ABMultiValueAddValueAndLabel(multiURL, (__bridge CFTypeRef)([[[[a objectAtIndex:6] objectForKey:@"data"] objectAtIndex:URLCount] objectForKey:@"value"]), kABWorkLabel, NULL);
                    }
                    else if ([[[[[a objectAtIndex:6] objectForKey:@"data"] objectAtIndex:URLCount] objectForKey:@"name"] isEqualToString:@"Other"])
                    {
                        ABMultiValueAddValueAndLabel(multiURL, (__bridge CFTypeRef)([[[[a objectAtIndex:6] objectForKey:@"data"] objectAtIndex:URLCount] objectForKey:@"value"]), kABOtherLabel, NULL);
                    }
                    else
                    {
                        ABMultiValueAddValueAndLabel(multiURL, (__bridge CFTypeRef)([[[[a objectAtIndex:6] objectForKey:@"data"] objectAtIndex:URLCount] objectForKey:@"value"]), kABPersonHomePageLabel, NULL);
                    }
                    
                    
                }
                
                ABRecordSetValue(newPerson, kABPersonURLProperty, multiURL,nil);
                CFRelease(multiURL);
                
                
                
                ABMutableMultiValueRef multiDate = ABMultiValueCreateMutable(kABMultiDateTimePropertyType);
                for (int URLCount=0; URLCount<[[[a objectAtIndex:7] objectForKey:@"data"] count]; URLCount++)
                {
                    
                    if ([[[[[a objectAtIndex:7] objectForKey:@"data"] objectAtIndex:URLCount] objectForKey:@"name"] isEqualToString:@"Anniversary"])
                    {
                        
                        
                        
                        NSString *s=[[[[a objectAtIndex:7] objectForKey:@"data"] objectAtIndex:URLCount] objectForKey:@"value"];
                        NSDateFormatter *dformat = [[NSDateFormatter alloc]init];
                        
                        [dformat setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssz"];
                        NSDate *date=[[NSDate alloc] init];
                        date = [dformat dateFromString:s];
                        
                        ABMultiValueAddValueAndLabel(multiDate, (__bridge CFDateRef)date, kABPersonAnniversaryLabel, NULL);
                        
                        
                    }
                    else if ([[[[[a objectAtIndex:7] objectForKey:@"data"] objectAtIndex:URLCount] objectForKey:@"name"] isEqualToString:@"Other"])
                    {
                        NSString *s=[[[[a objectAtIndex:7] objectForKey:@"data"] objectAtIndex:URLCount] objectForKey:@"value"];
                        
                        ABMultiValueAddValueAndLabel(multiDate, (__bridge CFDateRef)s, kABOtherLabel, NULL);
                        
                    }
                    else if ([[[[[a objectAtIndex:7] objectForKey:@"data"] objectAtIndex:URLCount] objectForKey:@"name"] isEqualToString:@"Birthday"])
                    {
                        NSString *s=[[[[a objectAtIndex:7] objectForKey:@"data"] objectAtIndex:URLCount] objectForKey:@"value"];
                        
                        ABRecordSetValue(newPerson, kABPersonBirthdayProperty, (__bridge CFDateRef)s, &error);
                        
                    }
                    
                    
                }
                
                ABRecordSetValue(newPerson, kABPersonDateProperty, multiDate,nil);
                CFRelease(multiDate);
                
                
                
                [person_RecordRef addObject:(__bridge id)(newPerson)];
                
                
                if (error != NULL)
                {
                    
                    NSLog(@"Errorrrrrrrrrr!");
                    
                }
            }
            
            
            
            
            
        }
        
        
        SendContactsViewController *addContact_Cls=[[SendContactsViewController alloc]init];
        [addContact_Cls getNewContacts:person_RecordRef];
        [self.navigationController pushViewController:addContact_Cls animated:YES];
        
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





-(void) createJson
{
    
    NSMutableArray *allPersonArr=[[NSMutableArray alloc] init];
    NSMutableArray *allPersonArr_withoutImg=[[NSMutableArray alloc] init];
    
    
    NSLog(@"%lu",(unsigned long)[obj.contactDetails count]);
    for (int k=0; k<[obj.contactDetails count]; k++)
    {
        NSMutableDictionary *person=[[NSMutableDictionary alloc] init];
        NSMutableArray *personArr=[[NSMutableArray alloc] init];
        
        NSMutableDictionary *person_withoutImg=[[NSMutableDictionary alloc] init];
        NSMutableArray *personArr_withoutImg=[[NSMutableArray alloc] init];
        
        NSMutableDictionary *dic_PersonName=[[NSMutableDictionary alloc] init];
        NSMutableDictionary *dic_PersonName_withoutImg=[[NSMutableDictionary alloc] init];
        NSMutableArray *personName_DataArr=[[NSMutableArray alloc] init];
        NSMutableArray *personName_DataArr_withoutImg=[[NSMutableArray alloc] init];
        
        NSMutableDictionary *dic_NameData=[[NSMutableDictionary alloc] init];
        [dic_NameData setObject:@"Name"  forKey:@"name"];
        [dic_NameData setObject:[[obj.contactDetails objectAtIndex:k] fullName]  forKey:@"value"];
        
        [personName_DataArr addObject:dic_NameData];
        [personName_DataArr_withoutImg addObject:dic_NameData];
        
        NSMutableDictionary *dic_JobTitleData=[[NSMutableDictionary alloc] init];
        [dic_JobTitleData setObject:@"JobTitle"  forKey:@"name"];
        [dic_JobTitleData setObject:[[obj.contactDetails objectAtIndex:k] lastName]  forKey:@"value"];
        [personName_DataArr addObject:dic_JobTitleData];
        [personName_DataArr_withoutImg addObject:dic_JobTitleData];
        
        NSMutableDictionary *dic_OrganizationData=[[NSMutableDictionary alloc] init];
        [dic_OrganizationData setObject:@"Organization"  forKey:@"name"];
        [dic_OrganizationData setObject:[[obj.contactDetails objectAtIndex:k] companyName]  forKey:@"value"];
        [personName_DataArr addObject:dic_OrganizationData];
        [personName_DataArr_withoutImg addObject:dic_OrganizationData];
        
        NSData *imageData = UIImagePNGRepresentation([[obj.contactDetails objectAtIndex:k] editablePic]);
        NSString *encodedString =[Base64 encode:imageData];
        
        //NSLog(@"\n\n\n\nencodedString \n\n\n%@", encodedString);
        
        NSMutableDictionary *dic_ImageData_withoutImg=[[NSMutableDictionary alloc] init];
        [dic_ImageData_withoutImg setObject:@"Image"  forKey:@"name"];
        [dic_ImageData_withoutImg setObject:@""  forKey:@"value"];
        
        NSMutableDictionary *dic_ImageData=[[NSMutableDictionary alloc] init];
        [dic_ImageData setObject:@"Image"  forKey:@"name"];
        [dic_ImageData setObject:encodedString  forKey:@"value"];
        
        [personName_DataArr addObject:dic_ImageData];
        NSLog(@"\n\n\n\nSize of Image \n\n\n%lu", (unsigned long)[encodedString length]);
        [personName_DataArr_withoutImg addObject:dic_ImageData_withoutImg];
        
        [dic_PersonName setObject:@"General" forKey:@"category"];
        [dic_PersonName setObject:personName_DataArr forKey:@"data"];
        [personArr addObject:dic_PersonName];
        [dic_PersonName_withoutImg setObject:@"General" forKey:@"category"];
        [dic_PersonName_withoutImg setObject:personName_DataArr_withoutImg forKey:@"data"];
        [personArr_withoutImg addObject:dic_PersonName_withoutImg];
        
        
        
        NSMutableDictionary *dic_PersonPhone=[[NSMutableDictionary alloc] init];
        NSMutableArray *personPhone_DataArr=[[NSMutableArray alloc] init];
        for (int i=0; i<[[[obj.contactDetails objectAtIndex:k] editablePhoneNumber_Value] count]; i++)
        {
            NSMutableDictionary *dic_PhoneData=[[NSMutableDictionary alloc] init];
            [dic_PhoneData setObject:[[[obj.contactDetails objectAtIndex:k] editablePhoneNumber_Type] objectAtIndex:i] forKey:@"name"];
            [dic_PhoneData setObject:[[[obj.contactDetails objectAtIndex:k] editablePhoneNumber_Value] objectAtIndex:i] forKey:@"value"];
            [personPhone_DataArr addObject:dic_PhoneData];
        }
        [dic_PersonPhone setObject:@"Phone" forKey:@"category"];
        [dic_PersonPhone setObject:personPhone_DataArr forKey:@"data"];
        [personArr addObject:dic_PersonPhone];
        [personArr_withoutImg addObject:dic_PersonPhone];
        
        NSMutableDictionary *dic_PersonEmail=[[NSMutableDictionary alloc] init];
        NSMutableArray *personEmail_DataArr=[[NSMutableArray alloc] init];
        
        for (int i=0; i<[[[obj.contactDetails objectAtIndex:k] editableEmail_Value] count]; i++)
        {
            NSMutableDictionary *dic_EmailData=[[NSMutableDictionary alloc] init];
            [dic_EmailData setObject:[[[obj.contactDetails objectAtIndex:k] editableEmail_Type] objectAtIndex:i] forKey:@"name"];
            [dic_EmailData setObject:[[[obj.contactDetails objectAtIndex:k] editableEmail_Value] objectAtIndex:i] forKey:@"value"];
            [personEmail_DataArr addObject:dic_EmailData];
        }
        [dic_PersonEmail setObject:@"Email_ID" forKey:@"category"];
        [dic_PersonEmail setObject:personEmail_DataArr forKey:@"data"];
        [personArr addObject:dic_PersonEmail];
        [personArr_withoutImg addObject:dic_PersonEmail];
        
        
        NSMutableDictionary *dic_PersonAddress=[[NSMutableDictionary alloc] init];
        NSMutableArray *personAddress_DataArr=[[NSMutableArray alloc] init];
        for (int i=0; i<[[[obj.contactDetails objectAtIndex:k] editableAddress_Value] count]; i++)
        {
            NSMutableDictionary *dic_addressData=[[NSMutableDictionary alloc] init];
            [dic_addressData setObject:[[[obj.contactDetails objectAtIndex:k] editableAddress_Type] objectAtIndex:i] forKey:@"name"];
            [dic_addressData setObject:[[[obj.contactDetails objectAtIndex:k] editableAddress_Value] objectAtIndex:i] forKey:@"value"];
            [personAddress_DataArr addObject:dic_addressData];
        }
        [dic_PersonAddress setObject:@"Address" forKey:@"category"];
        [dic_PersonAddress setObject:personAddress_DataArr forKey:@"data"];
        [personArr addObject:dic_PersonAddress];
        [personArr_withoutImg addObject:dic_PersonAddress];
        
        NSMutableDictionary *dic_PersonSocialProfile=[[NSMutableDictionary alloc] init];
        NSMutableArray *personSocialProfile_DataArr=[[NSMutableArray alloc] init];
        for (int i=0; i<[[[obj.contactDetails objectAtIndex:k] editableSocialProfile_Value] count]; i++)
        {
            NSMutableDictionary *dic_socialProfileData=[[NSMutableDictionary alloc] init];
            [dic_socialProfileData setObject:[[[obj.contactDetails objectAtIndex:k] editableSocialProfile_Type] objectAtIndex:i] forKey:@"name"];
            [dic_socialProfileData setObject:[[[obj.contactDetails objectAtIndex:k] editableSocialProfile_Value] objectAtIndex:i] forKey:@"value"];
            [personSocialProfile_DataArr addObject:dic_socialProfileData];
        }
        [dic_PersonSocialProfile setObject:@"Social Profile" forKey:@"category"];
        [dic_PersonSocialProfile setObject:personSocialProfile_DataArr forKey:@"data"];
        [personArr addObject:dic_PersonSocialProfile];
        [personArr_withoutImg addObject:dic_PersonSocialProfile];
        
        
        NSMutableDictionary *dic_PersonIM=[[NSMutableDictionary alloc] init];
        NSMutableArray *personIM_DataArr=[[NSMutableArray alloc] init];
        for (int i=0; i<[[[obj.contactDetails objectAtIndex:k] editableIM_Value] count]; i++)
        {
            
            NSMutableDictionary *dic_IMData=[[NSMutableDictionary alloc] init];
            [dic_IMData setObject:[[[obj.contactDetails objectAtIndex:k] editableIM_Type] objectAtIndex:i] forKey:@"name"];
            [dic_IMData setObject:[[[obj.contactDetails objectAtIndex:k] editableIM_Value] objectAtIndex:i] forKey:@"value"];
            [personIM_DataArr addObject:dic_IMData];
        }
        [dic_PersonIM setObject:@"Instant Message ID" forKey:@"category"];
        [dic_PersonIM setObject:personIM_DataArr forKey:@"data"];
        [personArr addObject:dic_PersonIM];
        [personArr_withoutImg addObject:dic_PersonIM];
        
        NSMutableDictionary *dic_PersonURL=[[NSMutableDictionary alloc] init];
        NSMutableArray *personURL_DataArr=[[NSMutableArray alloc] init];
        for (int i=0; i<[[[obj.contactDetails objectAtIndex:k] editableUrl_Value] count]; i++)
        {
            NSMutableDictionary *dic_urlData=[[NSMutableDictionary alloc] init];
            [dic_urlData setObject:[[[obj.contactDetails objectAtIndex:k] editableUrl_Type] objectAtIndex:i] forKey:@"name"];
            [dic_urlData setObject:[[[obj.contactDetails objectAtIndex:k] editableUrl_Value] objectAtIndex:i] forKey:@"value"];
            [personURL_DataArr addObject:dic_urlData];
        }
        [dic_PersonURL setObject:@"URL" forKey:@"category"];
        [dic_PersonURL setObject:personURL_DataArr forKey:@"data"];
        [personArr addObject:dic_PersonURL];
        [personArr_withoutImg addObject:dic_PersonURL];
        
        
        NSMutableDictionary *dic_PersonDate=[[NSMutableDictionary alloc] init];
        NSMutableArray *personDate_DataArr=[[NSMutableArray alloc] init];
        for (int i=0; i<[[[obj.contactDetails objectAtIndex:k] editableDate_Value] count]; i++)
        {
            NSMutableDictionary *dic_datesData=[[NSMutableDictionary alloc] init];
            [dic_datesData setObject:[[[obj.contactDetails objectAtIndex:k] editableDate_Type] objectAtIndex:i] forKey:@"name"];
            [dic_datesData setObject:[[[obj.contactDetails objectAtIndex:k] editableDate_Value] objectAtIndex:i] forKey:@"value"];
            [personDate_DataArr addObject:dic_datesData];
        }
        [dic_PersonDate setObject:@"Date" forKey:@"category"];
        [dic_PersonDate setObject:personDate_DataArr forKey:@"data"];
        [personArr addObject:dic_PersonDate];
        [personArr_withoutImg addObject:dic_PersonDate];
        
        
        
        
        
        
        
        [person setObject:personArr forKey:@"Person"];
        [person_withoutImg setObject:personArr_withoutImg forKey:@"Person"];
        [allPersonArr addObject:person];
        [allPersonArr_withoutImg addObject:person_withoutImg];
    }
    
    NSDictionary *allPersonDic=[NSDictionary dictionaryWithObject:allPersonArr forKey:@"Data"];
    NSDictionary *allPersonDic_withoutImg=[NSDictionary dictionaryWithObject:allPersonArr_withoutImg forKey:@"Data"];
    
    NSLog(@"allPersonDic \n %@",allPersonDic_withoutImg);
    
    NSError* error;
    NSData* jsonData = [NSJSONSerialization dataWithJSONObject:allPersonDic
                                                       options:kNilOptions error:&error];
    
    NSData* jsonData_withoutImg = [NSJSONSerialization dataWithJSONObject:allPersonDic_withoutImg
                                                                  options:kNilOptions error:&error];
    
    NSString* strWithImg = [[NSString alloc] initWithData:jsonData
                                                 encoding:NSUTF8StringEncoding] ;
    NSString* strWithoutImg = [[NSString alloc] initWithData:jsonData_withoutImg
                                                    encoding:NSUTF8StringEncoding] ;
    
    
    
    
    NSLog(@"JSON %lu",(unsigned long)[strWithoutImg length]);
    NSLog(@"JSON-- %@",strWithImg );
    
    jsonString=  [strWithImg stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    jsonString_withoutImages=  [strWithoutImg stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    
    //    self.uiasView.celltxt_sizeWithImage.text=[NSString stringWithFormat:@"%.2f KB",(float)([strWithImg length]/1024.0f)];
    //    self.uiasView.celltxt_sizeWithImage.text=[NSString stringWithFormat:@"%.2f KB",(float)([strWithoutImg length]/1024.0f)];
    
    
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
