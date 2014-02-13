//
//  ContactDetailesViewController.m
//  ContactJump
//
//  Created by Raman on 12/01/14.
//  Copyright (c) 2014 iyasoft. All rights reserved.
//

#import "ContactDetailesViewController.h"
#import "SendContactsViewController.h"
#import "SelectRecipientsViewController.h"
#import "KxMenu.h"
#import "Base64.h"
#define IS_IPHONE_5 ( fabs( ( double )[ [ UIScreen mainScreen ] bounds ].size.height - ( double )568 ) < DBL_EPSILON )
@interface ContactDetailesViewController ()

@end

@implementation ContactDetailesViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(void)senderNoteText:(NSString *)note :(NSString *)recordId :(NSString *)name :(NSString *)time :(NSString *)totalContactsShared :(NSString *)sizewithimage :(NSString *)sizeWithoutimage
{
    NSLog(@"%@, %@ ",note,recordId);
    self.recordID=recordId;
    noteText=note;
    time_shared=time;
    name_sender=name;
    size_withImage=sizewithimage;
    size_withoutImage=sizeWithoutimage;
    numberOfContact_shared=totalContactsShared;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    
   
#pragma Main BG ImageView
    UIImageView *mainbg_img = [[UIImageView alloc] init];
    mainbg_img.userInteractionEnabled=TRUE;
    //mainbg_img.opaque = YES;
    [mainbg_img setImage:[UIImage imageNamed:@"text=area.png"]];
    [self.view addSubview:mainbg_img];
    
#pragma mark navigation image.
    UIImageView  *nav_img =[[UIImageView alloc] init];
    nav_img.image=[UIImage imageNamed:@"header-bg.png"];
    [mainbg_img addSubview:nav_img];
    
#pragma mark back button.
    UIButton *back_btn =[UIButton buttonWithType:UIButtonTypeCustom];
    [back_btn setBackgroundImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"back-button" ofType:@"png"]] forState:UIControlStateNormal];
    [back_btn addTarget:self action:@selector(back_btnAction) forControlEvents:UIControlEventTouchUpInside];
    [mainbg_img addSubview:back_btn];
    
#pragma mark logout button.
    UIButton *logout_btn =[UIButton buttonWithType:UIButtonTypeCustom];
    [logout_btn setBackgroundImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"logount-icon" ofType:@"png"]] forState:UIControlStateNormal];
    [logout_btn addTarget:self action:@selector(Setting_btnAction) forControlEvents:UIControlEventTouchUpInside];
    [mainbg_img addSubview:logout_btn];
    
#pragma Navigation Bar Title
    UILabel *navbartitle=[[UILabel alloc] init];
    navbartitle.text=[NSString stringWithFormat:@"%@",name_sender];
    navbartitle.textAlignment=1;
    navbartitle.textColor= [UIColor whiteColor];
    navbartitle.backgroundColor=[UIColor clearColor];
    navbartitle.font=[UIFont fontWithName:@"AmericanTypewriter" size:18];
    navbartitle.shadowColor = [UIColor whiteColor];
    navbartitle.shadowOffset = CGSizeMake(0,0);
    [mainbg_img addSubview:navbartitle];
    
#pragma mark number of selected contacts.
    UILabel *noofselectedcontacts=[[UILabel alloc] init];
    noofselectedcontacts.frame=CGRectMake(15, 100, 150, 40);
    noofselectedcontacts.text=[NSString stringWithFormat:@"%@ Contacts Recieved",numberOfContact_shared];
    noofselectedcontacts.textAlignment=UITextAlignmentLeft;
    noofselectedcontacts.textColor= [UIColor blackColor];
    noofselectedcontacts.backgroundColor=[UIColor clearColor];
    noofselectedcontacts.font=[UIFont fontWithName:@"AmericanTypewriter" size:14];
    noofselectedcontacts.shadowColor = [UIColor whiteColor];
    noofselectedcontacts.shadowOffset = CGSizeMake(0,0);
    [mainbg_img addSubview:noofselectedcontacts];
    
    
    
    
    
   
#pragma Navigation Bar Title
    UILabel *time_lbl=[[UILabel alloc] init];
    time_lbl.text=[NSString stringWithFormat:@"%@",time_shared];
    time_lbl.frame=CGRectMake(235, 100, 80, 40);
    time_lbl.textAlignment=1;
    time_lbl.numberOfLines=2;
    time_lbl.textColor= [UIColor blackColor];
    time_lbl.backgroundColor=[UIColor clearColor];
    time_lbl.font=[UIFont fontWithName:@"AmericanTypewriter" size:12];
    time_lbl.shadowColor = [UIColor whiteColor];
    time_lbl.shadowOffset = CGSizeMake(0,0);
    [mainbg_img addSubview:time_lbl];
    
    
#pragma mark Text Area  image.
    UIImageView  *textarea_img =[[UIImageView alloc] init];
    textarea_img.image=[UIImage imageNamed:@"text=area.png"];
    textarea_img.frame=CGRectMake(15, 150, 290, 142.5);
    [mainbg_img addSubview:textarea_img];
    
#pragma mark Text View.
    UITextView *textview=[[UITextView alloc]init];
    textview.text=[NSString stringWithFormat:@"%@",noteText];
    textview.scrollEnabled=YES;
    textview.frame=CGRectMake(5, 5, 280, 132.5);
    textview.backgroundColor=[UIColor clearColor];
    textview.textColor=[UIColor darkGrayColor];
    [textarea_img addSubview:textview];
    
#pragma mark Canecl Button
    UIButton *sendwithImage_btn =[UIButton buttonWithType:UIButtonTypeCustom];
    [sendwithImage_btn setBackgroundImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"button-bg1" ofType:@"png"]] forState:UIControlStateNormal];
    [sendwithImage_btn setTitle:@"Receive with Images" forState:UIControlStateNormal];
    [[sendwithImage_btn titleLabel] setFont:[UIFont fontWithName:@"AmericanTypewriter" size:12]];
    [sendwithImage_btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [sendwithImage_btn addTarget:self action:@selector(recieveWithImage_btnAction) forControlEvents:UIControlEventTouchUpInside];
    [mainbg_img addSubview:sendwithImage_btn];
    
#pragma mark send button sub title label.
    UILabel *sendbtnsubtitle_lbl=[[UILabel alloc] init];
    sendbtnsubtitle_lbl.frame=CGRectMake(40, 22, 50, 18);
    sendbtnsubtitle_lbl.text=[NSString stringWithFormat:@"%.2f KB",(float)([size_withImage floatValue]/1024.0f)];
    sendbtnsubtitle_lbl.textAlignment=1;
    sendbtnsubtitle_lbl.textColor= [UIColor whiteColor];
    sendbtnsubtitle_lbl.backgroundColor=[UIColor clearColor];
    sendbtnsubtitle_lbl.font=[UIFont fontWithName:@"AmericanTypewriter" size:8];
    sendbtnsubtitle_lbl.shadowColor = [UIColor whiteColor];
    sendbtnsubtitle_lbl.shadowOffset = CGSizeMake(0,0);
    [sendwithImage_btn addSubview:sendbtnsubtitle_lbl];
    
    
#pragma mark Done Button
    UIButton *sendwithoutImage_btn =[UIButton buttonWithType:UIButtonTypeCustom];
    [sendwithoutImage_btn setBackgroundImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"button-bg1" ofType:@"png"]] forState:UIControlStateNormal];
    [sendwithoutImage_btn setTitle:@"Receive without Images" forState:UIControlStateNormal];
    [[sendwithoutImage_btn titleLabel] setFont:[UIFont fontWithName:@"AmericanTypewriter" size:10]];
    [sendwithoutImage_btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [sendwithoutImage_btn addTarget:self action:@selector(recieveWithoutImage_btnAction) forControlEvents:UIControlEventTouchUpInside];
    [mainbg_img addSubview:sendwithoutImage_btn];
 
#pragma mark send button sub title label.
    UILabel *sendwithoutbtnsubtitle_lbl=[[UILabel alloc] init];
    sendwithoutbtnsubtitle_lbl.frame=CGRectMake(40, 22, 50, 18);
    sendwithoutbtnsubtitle_lbl.text=[NSString stringWithFormat:@"%.2f KB",(float)([size_withoutImage floatValue]/1024.0f)];
    sendwithoutbtnsubtitle_lbl.textAlignment=1;
    sendwithoutbtnsubtitle_lbl.textColor= [UIColor whiteColor];
    sendwithoutbtnsubtitle_lbl.backgroundColor=[UIColor clearColor];
    sendwithoutbtnsubtitle_lbl.font=[UIFont fontWithName:@"AmericanTypewriter" size:8];
    sendwithoutbtnsubtitle_lbl.shadowColor = [UIColor whiteColor];
    sendwithoutbtnsubtitle_lbl.shadowOffset = CGSizeMake(0,0);
    [sendwithoutImage_btn addSubview:sendwithoutbtnsubtitle_lbl];

    
    if (IS_IPHONE_5) {
        
        mainbg_img.frame=CGRectMake(0,0, 320, 568);
        nav_img.frame=CGRectMake(0,0,320,90);
        logout_btn.frame=CGRectMake(240,0, 90,90);
        back_btn.frame=CGRectMake(15, 14, 33, 54);
        navbartitle.frame=CGRectMake(0,20,320,50);
        sendwithImage_btn.frame=CGRectMake(16.66,508, 135,39.5);
        sendwithoutImage_btn.frame=CGRectMake(168.66,508, 135,39.5);
        
    }else{
        mainbg_img.frame=CGRectMake(0,0, 320, 480);
        nav_img.frame=CGRectMake(0,0,320,80);
        logout_btn.frame=CGRectMake(240,0, 90,90);
        back_btn.frame=CGRectMake(15, 13, 33, 54);
        navbartitle.frame=CGRectMake(0,20,320,50);
        sendwithImage_btn.frame=CGRectMake(16.66,410, 135,39.5);
        sendwithoutImage_btn.frame=CGRectMake(168.66,410, 135,39.5);
   
    }
    
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)Setting_btnAction
{
    SelectRecipientsViewController *selectRecipient=[[SelectRecipientsViewController alloc]init];
    [self.navigationController pushViewController:selectRecipient animated:YES];
}
-(void)back_btnAction
{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)recieveWithImage_btnAction{
    
    
    ContactSignUpDataService * sendContacts_cls=[[ContactSignUpDataService alloc] init];
    sendContacts_cls.delegate=self;
    activityIndicator = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge] ;
    activityIndicator.frame = CGRectMake(0.0, 0.0, 40.0, 40.0);
    activityIndicator.center = self.view.center;
    [self.view addSubview: activityIndicator];
    [activityIndicator startAnimating];
    

    NSString* url=[NSString stringWithFormat:@"%@",kBASEURL];
    NSString* payload=[NSString stringWithFormat:@"{\"recordid\":\"%@\",\"getimagewith\":\"1\"}",self.recordID];
    
    
    [sendContacts_cls callWebService:url :@"receivedetails" :payload];

    
}
-(void)recieveWithoutImage_btnAction{
    
    ContactSignUpDataService * sendContacts_cls=[[ContactSignUpDataService alloc] init];
    sendContacts_cls.delegate=self;
    activityIndicator = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge] ;
    activityIndicator.frame = CGRectMake(0.0, 0.0, 40.0, 40.0);
    activityIndicator.center = self.view.center;
    [self.view addSubview: activityIndicator];
    [activityIndicator startAnimating];
    
    
    NSString* url=[NSString stringWithFormat:@"%@",kBASEURL];
    NSString* payload=[NSString stringWithFormat:@"{\"recordid\":\"%@\",\"getimagewith\":\"0\"}",self.recordID];
    
    
    [sendContacts_cls callWebService:url :@"receivedetails" :payload];

    

}

-(void)getresponse:(NSString *)res :(id)data :(NSString *)message status:(BOOL)value
{
    [activityIndicator stopAnimating];
    
    if ([res isEqualToString:@"success"]) {
        
       
        NSLog(@"DATA:%@ ",data);
        
        person_RecordRef=[[NSMutableArray alloc] init];
        NSDictionary *recievedData_dic=[NSDictionary dictionaryWithDictionary:[data objectAtIndex:0]];
        //NSData* totalPeople_data=[recievedData_dic objectForKey:@"send_contacts"];
        
        
        NSData* totalPeople_data = [[[recievedData_dic objectForKey:@"send_contacts"] stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding]  dataUsingEncoding:NSUTF8StringEncoding];
        NSError *localError = nil;
        
        if (totalPeople_data!=nil) {
            
            NSDictionary *parsedObject = [NSJSONSerialization JSONObjectWithData:totalPeople_data options:0 error:&localError];
        
            
            NSLog(@"\n\n\njsonData %@", [parsedObject objectForKey:@"Data"]);
            
            NSArray *totalPerson=[parsedObject objectForKey:@"Data"];
            
            for (int k=0; k<[totalPerson count]; k++)
            {
                NSDictionary *dic=[totalPerson objectAtIndex:k];
                
                
                NSArray* a=[dic objectForKey:@"Person"];
                
                
                
                
                CFErrorRef error = NULL;
                ABAddressBookRef iPhoneAddressBook = ABAddressBookCreate();
                ABRecordRef newPerson = ABPersonCreate();
                
                ABRecordSetValue(newPerson, kABPersonFirstNameProperty, (__bridge CFTypeRef)([[[[a objectAtIndex:0] objectForKey:@"data"] objectAtIndex:0] objectForKey:@"value"]), &error);
                
                ABRecordSetValue(newPerson, kABPersonOrganizationProperty, (__bridge CFTypeRef)([[[[a objectAtIndex:0] objectForKey:@"data"] objectAtIndex:2] objectForKey:@"value"]), &error);
                ABRecordSetValue(newPerson, kABPersonJobTitleProperty, (__bridge CFTypeRef)([[[[a objectAtIndex:0] objectForKey:@"data"] objectAtIndex:1] objectForKey:@"value"]), &error);
                
                NSData *imageData = [Base64 decode:[[[[[a objectAtIndex:0] objectForKey:@"data"] objectAtIndex:0] objectForKey:@"value"] stringByReplacingOccurrencesOfString:@" " withString:@"+"]];
                
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
                        ABMultiValueAddValueAndLabel(multiEmail, (__bridge CFTypeRef)([[[[a objectAtIndex:2] objectForKey:@"data"] objectAtIndex:emailCount] objectForKey:@"value"]), kABPersonPhoneMobileLabel, NULL);
                    }
                    else if ([[[[[a objectAtIndex:2] objectForKey:@"data"] objectAtIndex:emailCount] objectForKey:@"name"] isEqualToString:@"ICloud"])
                    {
                        ABMultiValueAddValueAndLabel(multiEmail, (__bridge CFTypeRef)([[[[a objectAtIndex:2] objectForKey:@"data"] objectAtIndex:emailCount] objectForKey:@"value"]), kABPersonPhoneMobileLabel, NULL);
                    }
                    else if ([[[[[a objectAtIndex:2] objectForKey:@"data"] objectAtIndex:emailCount] objectForKey:@"name"] isEqualToString:@"Other"])
                    {
                        ABMultiValueAddValueAndLabel(multiEmail, (__bridge CFTypeRef)([[[[a objectAtIndex:2] objectForKey:@"data"] objectAtIndex:emailCount] objectForKey:@"value"]), kABPersonPhoneMobileLabel, NULL);
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
                        ABMultiValueAddValueAndLabel(multiAddress, (__bridge CFTypeRef)(addressDictionary), kABHomeLabel, NULL);
                        
                        ABMultiValueAddValueAndLabel(multiAddress, (__bridge CFTypeRef)(addressDictionary), kABWorkLabel, NULL);
                    }
                    else if ([[[[[a objectAtIndex:3] objectForKey:@"data"] objectAtIndex:addressCount] objectForKey:@"name"] isEqualToString:@"Other"])
                    {
                        [addressDictionary setObject:(__bridge id)((__bridge CFTypeRef)([[[[a objectAtIndex:3] objectForKey:@"data"] objectAtIndex:addressCount] objectForKey:@"value"])) forKey:(NSString *) kABPersonAddressStreetKey];
                        ABMultiValueAddValueAndLabel(multiAddress, (__bridge CFTypeRef)(addressDictionary), kABHomeLabel, NULL);
                        
                        ABMultiValueAddValueAndLabel(multiAddress, (__bridge CFTypeRef)(addressDictionary), kABOtherLabel, NULL);
                    }
                    
                }
                
                ABRecordSetValue(newPerson, kABPersonAddressProperty, multiAddress,&error);
                CFRelease(multiAddress);
                
                
                
                
                ABMutableMultiValueRef multiSocialProfile = ABMultiValueCreateMutable(kABStringPropertyType);
                for (int SPCount=0; SPCount<[[[a objectAtIndex:4] objectForKey:@"data"] count]; SPCount++)
                {
                    if ([[[[[a objectAtIndex:4] objectForKey:@"data"] objectAtIndex:SPCount] objectForKey:@"name"] isEqualToString:@"twitter"])
                    {
                        ABMultiValueAddValueAndLabel(multiSocialProfile, (__bridge CFTypeRef)([[[[a objectAtIndex:4] objectForKey:@"data"] objectAtIndex:SPCount] objectForKey:@"value"]), kABPersonSocialProfileServiceTwitter, NULL);
                    }
                    else if ([[[[[a objectAtIndex:4] objectForKey:@"data"] objectAtIndex:SPCount] objectForKey:@"name"] isEqualToString:@"facebook"])
                    {
                        ABMultiValueAddValueAndLabel(multiSocialProfile, (__bridge CFTypeRef)([[[[a objectAtIndex:4] objectForKey:@"data"] objectAtIndex:SPCount] objectForKey:@"value"]), kABPersonSocialProfileServiceFacebook, NULL);
                    }
                    else if ([[[[[a objectAtIndex:4] objectForKey:@"data"] objectAtIndex:SPCount] objectForKey:@"name"] isEqualToString:@"flickr"])
                    {
                        ABMultiValueAddValueAndLabel(multiSocialProfile, (__bridge CFTypeRef)([[[[a objectAtIndex:4] objectForKey:@"data"] objectAtIndex:SPCount] objectForKey:@"value"]), kABPersonSocialProfileServiceFlickr, NULL);
                    }
                    else if ([[[[[a objectAtIndex:4] objectForKey:@"data"] objectAtIndex:SPCount] objectForKey:@"name"] isEqualToString:@"linkedin"])
                    {
                        ABMultiValueAddValueAndLabel(multiSocialProfile, (__bridge CFTypeRef)([[[[a objectAtIndex:4] objectForKey:@"data"] objectAtIndex:SPCount] objectForKey:@"value"]), kABPersonSocialProfileServiceLinkedIn, NULL);
                    }
                    else if ([[[[[a objectAtIndex:4] objectForKey:@"data"] objectAtIndex:SPCount] objectForKey:@"name"] isEqualToString:@"myspace"])
                    {
                        ABMultiValueAddValueAndLabel(multiSocialProfile, (__bridge CFTypeRef)([[[[a objectAtIndex:4] objectForKey:@"data"] objectAtIndex:SPCount] objectForKey:@"value"]), kABPersonSocialProfileServiceMyspace, NULL);
                    }
                    else if ([[[[[a objectAtIndex:4] objectForKey:@"data"] objectAtIndex:SPCount] objectForKey:@"name"] isEqualToString:@"sinaweibo"])
                    {
                        ABMultiValueAddValueAndLabel(multiSocialProfile, (__bridge CFTypeRef)([[[[a objectAtIndex:4] objectForKey:@"data"] objectAtIndex:SPCount] objectForKey:@"value"]), kABPersonSocialProfileServiceSinaWeibo, NULL);
                    }
                }
                
                ABRecordSetValue(newPerson, kABPersonSocialProfileProperty, multiSocialProfile,nil);
                CFRelease(multiSocialProfile);
                
                
                
                
                ABMutableMultiValueRef multiIM = ABMultiValueCreateMutable(kABStringPropertyType);
                for (int IMCount=0; IMCount<[[[a objectAtIndex:5] objectForKey:@"data"] count]; IMCount++)
                {
                    if ([[[[[a objectAtIndex:5] objectForKey:@"data"] objectAtIndex:IMCount] objectForKey:@"name"] isEqualToString:@"Skype"])
                    {
                        ABMultiValueAddValueAndLabel(multiIM, (__bridge CFTypeRef)([[[[a objectAtIndex:5] objectForKey:@"data"] objectAtIndex:IMCount] objectForKey:@"value"]), kABPersonInstantMessageServiceSkype, NULL);
                    }
                    else if ([[[[[a objectAtIndex:5] objectForKey:@"data"] objectAtIndex:IMCount] objectForKey:@"name"] isEqualToString:@"MSN"])
                    {
                        ABMultiValueAddValueAndLabel(multiIM, (__bridge CFTypeRef)([[[[a objectAtIndex:5] objectForKey:@"data"] objectAtIndex:IMCount] objectForKey:@"value"]), kABPersonSocialProfileServiceFacebook, NULL);
                    }
                    else if ([[[[[a objectAtIndex:5] objectForKey:@"data"] objectAtIndex:IMCount] objectForKey:@"name"] isEqualToString:@"GoogleTalk"])
                    {
                        ABMultiValueAddValueAndLabel(multiIM, (__bridge CFTypeRef)([[[[a objectAtIndex:5] objectForKey:@"data"] objectAtIndex:IMCount] objectForKey:@"value"]), kABPersonSocialProfileServiceFlickr, NULL);
                    }
                    else if ([[[[[a objectAtIndex:5] objectForKey:@"data"] objectAtIndex:IMCount] objectForKey:@"name"] isEqualToString:@"Facebook"])
                    {
                        ABMultiValueAddValueAndLabel(multiIM, (__bridge CFTypeRef)([[[[a objectAtIndex:5] objectForKey:@"data"] objectAtIndex:IMCount] objectForKey:@"value"]), kABPersonSocialProfileServiceLinkedIn, NULL);
                    }
                    else if ([[[[[a objectAtIndex:5] objectForKey:@"data"] objectAtIndex:IMCount] objectForKey:@"name"] isEqualToString:@"AIM"])
                    {
                        ABMultiValueAddValueAndLabel(multiIM, (__bridge CFTypeRef)([[[[a objectAtIndex:5] objectForKey:@"data"] objectAtIndex:IMCount] objectForKey:@"value"]), kABPersonSocialProfileServiceMyspace, NULL);
                    }
                    else if ([[[[[a objectAtIndex:5] objectForKey:@"data"] objectAtIndex:IMCount] objectForKey:@"name"] isEqualToString:@"Yahoo"])
                    {
                        ABMultiValueAddValueAndLabel(multiIM, (__bridge CFTypeRef)([[[[a objectAtIndex:5] objectForKey:@"data"] objectAtIndex:IMCount] objectForKey:@"value"]), kABPersonSocialProfileServiceSinaWeibo, NULL);
                    }
                    else if ([[[[[a objectAtIndex:5] objectForKey:@"data"] objectAtIndex:IMCount] objectForKey:@"name"] isEqualToString:@"ICQ"])
                    {
                        ABMultiValueAddValueAndLabel(multiIM, (__bridge CFTypeRef)([[[[a objectAtIndex:5] objectForKey:@"data"] objectAtIndex:IMCount] objectForKey:@"value"]), kABPersonSocialProfileServiceSinaWeibo, NULL);
                    }
                    else if ([[[[[a objectAtIndex:5] objectForKey:@"data"] objectAtIndex:IMCount] objectForKey:@"name"] isEqualToString:@"Jabber"])
                    {
                        ABMultiValueAddValueAndLabel(multiIM, (__bridge CFTypeRef)([[[[a objectAtIndex:5] objectForKey:@"data"] objectAtIndex:IMCount] objectForKey:@"value"]), kABPersonSocialProfileServiceSinaWeibo, NULL);
                    }
                    else if ([[[[[a objectAtIndex:5] objectForKey:@"data"] objectAtIndex:IMCount] objectForKey:@"name"] isEqualToString:@"QQ"])
                    {
                        ABMultiValueAddValueAndLabel(multiIM, (__bridge CFTypeRef)([[[[a objectAtIndex:5] objectForKey:@"data"] objectAtIndex:IMCount] objectForKey:@"value"]), kABPersonSocialProfileServiceSinaWeibo, NULL);
                    }
                    else if ([[[[[a objectAtIndex:5] objectForKey:@"data"] objectAtIndex:IMCount] objectForKey:@"name"] isEqualToString:@"GaduGadu"])
                    {
                        ABMultiValueAddValueAndLabel(multiIM, (__bridge CFTypeRef)([[[[a objectAtIndex:5] objectForKey:@"data"] objectAtIndex:IMCount] objectForKey:@"value"]), kABPersonSocialProfileServiceSinaWeibo, NULL);
                    }
                }
                
                ABRecordSetValue(newPerson, kABPersonInstantMessageProperty, multiIM,nil);
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
                
                
                
                ABMutableMultiValueRef multiDate = ABMultiValueCreateMutable(kABStringPropertyType);
                for (int URLCount=0; URLCount<[[[a objectAtIndex:7] objectForKey:@"data"] count]; URLCount++)
                {
                    
                    if ([[[[[a objectAtIndex:7] objectForKey:@"data"] objectAtIndex:URLCount] objectForKey:@"name"] isEqualToString:@"Anniversary"])
                    {
                        ABMultiValueAddValueAndLabel(multiDate, (__bridge CFTypeRef)([[[[a objectAtIndex:7] objectForKey:@"data"] objectAtIndex:URLCount] objectForKey:@"value"]), kABPersonAnniversaryLabel, NULL);
                    }
                    else if ([[[[[a objectAtIndex:7] objectForKey:@"data"] objectAtIndex:URLCount] objectForKey:@"name"] isEqualToString:@"Other"])
                    {
                        ABMultiValueAddValueAndLabel(multiDate, (__bridge CFTypeRef)([[[[a objectAtIndex:7] objectForKey:@"data"] objectAtIndex:URLCount] objectForKey:@"value"]), kABOtherLabel, NULL);
                    }
                    else if ([[[[[a objectAtIndex:7] objectForKey:@"data"] objectAtIndex:URLCount] objectForKey:@"name"] isEqualToString:@"Birthday"])
                    {
                        
                        ABRecordSetValue(newPerson, kABPersonBirthdayProperty, (__bridge CFTypeRef)([[[[a objectAtIndex:7] objectForKey:@"data"] objectAtIndex:URLCount] objectForKey:@"value"]), &error);
                    }
                    
                    
                }
                
                ABRecordSetValue(newPerson, kABPersonDateProperty, multiDate,nil);
                CFRelease(multiDate);
                
                
                [person_RecordRef addObject:(__bridge id)(newPerson)];
//                ABAddressBookAddRecord(iPhoneAddressBook, newPerson, &error);
//                ABAddressBookSave(iPhoneAddressBook, &error);
                
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

@end
