

//  ContactGetSelectMethodViewController.m
//  ContactJump
//
//  Created by Raman on 11/01/14.
//  Copyright (c) 2014 iyasoft. All rights reserved.
//

#import "ContactGetSelectMethodViewController.h"
#import "KxMenu.h"

#define IS_IPHONE_5 ( fabs( ( double )[ [ UIScreen mainScreen ] bounds ].size.height - ( double )568 ) < DBL_EPSILON )
@interface ContactGetSelectMethodViewController ()

@end

@implementation ContactGetSelectMethodViewController

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
    
    
//    if ([self respondsToSelector:@selector(setNeedsStatusBarAppearanceUpdate)]) {
//        // iOS 7
//        [self performSelector:@selector(setNeedsStatusBarAppearanceUpdate)];
//    } else {
//        // iOS 6
//        [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationSlide];
//    }
//    
//    [self.navigationController setNavigationBarHidden:YES animated:NO];
    
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
    navbartitle.text=[NSString stringWithFormat:@"Select Method"];
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
    
    
   
    
    scrollview = [[UIScrollView alloc] init];
    scrollview.backgroundColor = [UIColor clearColor];
    if (IS_IPHONE_5) {
        scrollview.frame=CGRectMake(0,91, 320, [UIScreen mainScreen].bounds.size.height-90);
        
    }
    else
    {
        scrollview.frame=CGRectMake(0,81, 320, [UIScreen mainScreen].bounds.size.height-80);
        
    }
    [scrollview setTag:111];
    scrollview.contentSize = CGSizeMake(320, 300);
    [scrollview setCanCancelContentTouches:NO];
    scrollview.clipsToBounds = YES;
    scrollview.scrollEnabled = YES;
    [mainbg_img addSubview:scrollview];

    
    
    
    UIButton *getuseingid_btn =[UIButton buttonWithType:UIButtonTypeCustom];
    if (IS_IPHONE_5) {
         getuseingid_btn.frame=CGRectMake(0, 0, 320, 70);
    } else {
         getuseingid_btn.frame=CGRectMake(0, 0, 320, 50);
    }
   
    
    
    [getuseingid_btn setTitle:@"GetUsing ID/Password" forState:UIControlStateNormal];
    [[getuseingid_btn titleLabel] setFont:[UIFont fontWithName:@"AmericanTypewriter" size:18]];
    [getuseingid_btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    getuseingid_btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    CGFloat spacing = 50; // the amount of spacing to appear between image and title
    getuseingid_btn.titleEdgeInsets = UIEdgeInsetsMake(0, spacing, 0, 0);
    [getuseingid_btn addTarget:self action:@selector(Setting_btnAction) forControlEvents:UIControlEventTouchUpInside];
    [scrollview addSubview:getuseingid_btn];

    
    UIImageView  *get_img =[[UIImageView alloc] init];
    if (IS_IPHONE_5) {
         get_img.frame=CGRectMake(15, 24, 20, 18);
    } else {
         get_img.frame=CGRectMake(15, 16, 20, 18);
    }
   
    get_img.image=[UIImage imageNamed:@"shareimg.png"];
    [getuseingid_btn addSubview:get_img];
    
    
    
    UIImageView  *seprator_image =[[UIImageView alloc] init];
    if (IS_IPHONE_5) {
         seprator_image.frame=CGRectMake(0, 70, 320, 2);
    } else {
         seprator_image.frame=CGRectMake(0, 50, 320, 2);
    }
   
    seprator_image.image=[UIImage imageNamed:@"seprator.png"];
    [scrollview addSubview:seprator_image];
    
    
    UITextView *textview=[[UITextView alloc]init];
    textview.text=[NSString stringWithFormat:@"2011 PayPal, Inc. All rights reserved. PayPal is a registered trademark of PayPal, Inc. The PayPal logo is a trademark of PayPal, Inc. Other trademarks and brands are the property of their respective owners.  The information in this document belongs to PayPal, Inc. "];
    textview.scrollEnabled=YES;
    textview.editable=FALSE;
    textview.textAlignment=NSTextAlignmentJustified;
     if (IS_IPHONE_5)
     {
         textview.frame=CGRectMake(10, 82, 300, 100);
     }
    else
    {
        textview.frame=CGRectMake(10, 62, 300, 80);
    }
    
    textview.backgroundColor=[UIColor clearColor];
    textview.textColor=[UIColor whiteColor];
    [textview setFont:[UIFont fontWithName:@"AmericanTypewriter" size:14]];
    [scrollview addSubview:textview];
    
        
    
    UIImageView  *seprator_image1 =[[UIImageView alloc] init];
    if (IS_IPHONE_5) {
        seprator_image1.frame=CGRectMake(0, 192+20, 320, 2);
    } else {
        seprator_image1.frame=CGRectMake(0, 172, 320, 2);
    }
    
    seprator_image1.image=[UIImage imageNamed:@"seprator.png"];
    [scrollview addSubview:seprator_image1];
    
    
    
#pragma Navigation Bar Title
    UILabel  *id_lbl=[[UILabel alloc] init];
    id_lbl.text=[NSString stringWithFormat:@"ID"];
    id_lbl.textAlignment=NSTextAlignmentRight;
    if (IS_IPHONE_5) {
         id_lbl.frame=CGRectMake(15, 230, 75, 25);
    } else {
         id_lbl.frame=CGRectMake(15, 200-10, 75, 25);
    }
   
    id_lbl.textColor= [UIColor whiteColor];
    id_lbl.backgroundColor=[UIColor clearColor];
    id_lbl.font=[UIFont fontWithName:@"AmericanTypewriter" size:16];
    id_lbl.shadowColor = [UIColor whiteColor];
    id_lbl.shadowOffset = CGSizeMake(0,0);
    [scrollview addSubview:id_lbl];
    
    
    
   
    
#pragma Restaurent TextField
    id_Txt = [[UITextField  alloc] init];
    id_Txt.borderStyle = UITextBorderStyleNone;
    if (IS_IPHONE_5) {
        id_Txt.frame=CGRectMake(95, 230, 211, 24);
    } else {
        id_Txt.frame=CGRectMake(95, 200-10, 211, 24);
    }
    
    id_Txt.layer.borderColor=[[UIColor grayColor] CGColor];
    id_Txt.layer.borderWidth= 1.0f;
    id_Txt.font = [UIFont fontWithName:@"ArialMT" size:(13.0)];
    id_Txt.textColor=[UIColor grayColor];
    id_Txt.placeholder=@"Id";
    id_Txt.backgroundColor=[UIColor whiteColor];
    id_Txt.delegate = self;
    id_Txt.returnKeyType = UIReturnKeyDefault;
    id_Txt.textAlignment=0;
    id_Txt.secureTextEntry=YES;
    id_Txt.tag=100;
    id_Txt.autocapitalizationType = UITextAutocapitalizationTypeNone;
    [scrollview addSubview:id_Txt];
    UIView *paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 20)] ;
    id_Txt.leftView = paddingView;
    id_Txt.leftViewMode = UITextFieldViewModeAlways;
    
    
    
   

    
#pragma Navigation Bar Title
    UILabel  *psw_lbl=[[UILabel alloc] init];
    psw_lbl.text=[NSString stringWithFormat:@"Password"];
    psw_lbl.textAlignment=NSTextAlignmentLeft;
    if (IS_IPHONE_5) {
        psw_lbl.frame=CGRectMake(15, 266, 75, 25);
    } else {
        psw_lbl.frame=CGRectMake(15, 236-10, 75, 25);
    }
    
    psw_lbl.textColor= [UIColor whiteColor];
    psw_lbl.backgroundColor=[UIColor clearColor];
    psw_lbl.font=[UIFont fontWithName:@"AmericanTypewriter" size:16];
    psw_lbl.shadowColor = [UIColor whiteColor];
    psw_lbl.shadowOffset = CGSizeMake(0,0);
    [scrollview addSubview:psw_lbl];
    
    
#pragma Restaurent TextField
    psw_Txt = [[UITextField  alloc] init];
    if (IS_IPHONE_5) {
         psw_Txt.frame=CGRectMake(95, 266, 211, 24);
    } else {
         psw_Txt.frame=CGRectMake(95, 236-10, 211, 24);
    }
   
    psw_Txt.layer.borderColor=[[UIColor grayColor] CGColor];
    psw_Txt.layer.borderWidth= 1.0f;
    psw_Txt.borderStyle = UITextBorderStyleNone;
    psw_Txt.font = [UIFont fontWithName:@"ArialMT" size:(13.0)];
    psw_Txt.textColor=[UIColor grayColor];
    psw_Txt.placeholder=@"Password";
    psw_Txt.backgroundColor=[UIColor whiteColor];
    psw_Txt.delegate = self;
    psw_Txt.returnKeyType = UIReturnKeyDefault;
    psw_Txt.textAlignment=0;
    psw_Txt.tag=100;
    psw_Txt.autocapitalizationType = UITextAutocapitalizationTypeNone;
    [scrollview addSubview:psw_Txt];
    UIView *paddingView1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 20)] ;
    psw_Txt.leftView = paddingView1;
    psw_Txt.leftViewMode = UITextFieldViewModeAlways;

   
    
    
    
    
    UIImageView  *seprator_image2 =[[UIImageView alloc] init];
    if (IS_IPHONE_5) {
        seprator_image2.frame=CGRectMake(0, 310, 320, 2);
    } else {
        seprator_image2.frame=CGRectMake(0, 266, 320, 2);
    }
    
    seprator_image2.image=[UIImage imageNamed:@"seprator.png"];
    [scrollview addSubview:seprator_image2];
    

    
#pragma mark Canecl Button
    UIButton *sendwithImage_btn =[UIButton buttonWithType:UIButtonTypeCustom];
    [sendwithImage_btn setBackgroundImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"button-bg1" ofType:@"png"]] forState:UIControlStateNormal];
    [sendwithImage_btn setTitle:@"Get with Images" forState:UIControlStateNormal];
    [[sendwithImage_btn titleLabel] setFont:[UIFont fontWithName:@"AmericanTypewriter" size:12]];
    [sendwithImage_btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [sendwithImage_btn addTarget:self action:@selector(SendwithImage_btnAction) forControlEvents:UIControlEventTouchUpInside];
    [scrollview addSubview:sendwithImage_btn];
       
    
#pragma mark send button sub title label.
    UILabel *sendbtnsubtitle_lbl=[[UILabel alloc] init];
    sendbtnsubtitle_lbl.frame=CGRectMake(40, 22, 50, 18);
    sendbtnsubtitle_lbl.text=@"1.25 MB";
    sendbtnsubtitle_lbl.textAlignment=1;
    sendbtnsubtitle_lbl.textColor= [UIColor whiteColor];
    sendbtnsubtitle_lbl.backgroundColor=[UIColor clearColor];
    sendbtnsubtitle_lbl.font=[UIFont fontWithName:@"AmericanTypewriter" size:8];
    sendbtnsubtitle_lbl.shadowColor = [UIColor whiteColor];
    sendbtnsubtitle_lbl.shadowOffset = CGSizeMake(0,0);
    //[sendwithImage_btn addSubview:sendbtnsubtitle_lbl];

#pragma mark Done Button
    UIButton *sendwithoutImage_btn =[UIButton buttonWithType:UIButtonTypeCustom];
    [sendwithoutImage_btn setBackgroundImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"button-bg1" ofType:@"png"]] forState:UIControlStateNormal];
    [sendwithoutImage_btn setTitle:@"Get without Images" forState:UIControlStateNormal];
    [[sendwithoutImage_btn titleLabel] setFont:[UIFont fontWithName:@"AmericanTypewriter" size:12]];
    [sendwithoutImage_btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [sendwithoutImage_btn addTarget:self action:@selector(sendwithoutImage_btnAction) forControlEvents:UIControlEventTouchUpInside];
    [scrollview addSubview:sendwithoutImage_btn];
    
#pragma mark send button sub title label.
    UILabel *sendwithoutbtnsubtitle_lbl=[[UILabel alloc] init];
    sendwithoutbtnsubtitle_lbl.frame=CGRectMake(40, 22, 50, 18);
    sendwithoutbtnsubtitle_lbl.text=@"1.25 MB";
    sendwithoutbtnsubtitle_lbl.textAlignment=1;
    sendwithoutbtnsubtitle_lbl.textColor= [UIColor whiteColor];
    sendwithoutbtnsubtitle_lbl.backgroundColor=[UIColor clearColor];
    sendwithoutbtnsubtitle_lbl.font=[UIFont fontWithName:@"AmericanTypewriter" size:8];
    sendwithoutbtnsubtitle_lbl.shadowColor = [UIColor whiteColor];
    sendwithoutbtnsubtitle_lbl.shadowOffset = CGSizeMake(0,0);
    //[sendwithoutImage_btn addSubview:sendwithoutbtnsubtitle_lbl];
    
    
    if (IS_IPHONE_5) {
        
        mainbg_img.frame=CGRectMake(0,0, 320, 568);
        navbartitle.frame=CGRectMake(0,5,320,50);
        nav_img.frame=CGRectMake(0,0,320,90);
        
        back_btn.frame=CGRectMake(15, 14, 33, 54);
        navbartitle.frame=CGRectMake(0,20,320,50);
         sendwithImage_btn.frame=CGRectMake(16.66,scrollview.frame.size.height-60, 135,39.5);
        sendwithoutImage_btn.frame=CGRectMake(168.66,scrollview.frame.size.height-60, 135,39.5);
        
    }else{
        
        mainbg_img.frame=CGRectMake(0,0, 320, 480);
        nav_img.frame=CGRectMake(0,0,320,80);
        back_btn.frame=CGRectMake(15, 13, 33, 54);
        navbartitle.frame=CGRectMake(0,20,320,50);
         sendwithImage_btn.frame=CGRectMake(16.66,scrollview.frame.size.height-60, 135,39.5);
         sendwithoutImage_btn.frame=CGRectMake(168.66,scrollview.frame.size.height-60, 135,39.5);
    }
    
	// Do any additional setup after loading the view.
}


-(void)Setting_btnAction
{
    NSLog(@"BtnAction");
}

-(void)back_btnAction
{
    
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)SendwithImage_btnAction{
    
    if ([id_Txt.text length] ==0) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Alert"
                                                        message:@"Please enter the ID first"
                                                       delegate:nil
                                              cancelButtonTitle:@"Ok"
                                              otherButtonTitles:Nil,Nil];
        
        
        [alert show];
    }
    else
    {
    ContactSignUpDataService * sendContacts_cls=[[ContactSignUpDataService alloc] init];
    sendContacts_cls.delegate=self;
    activityIndicator = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge] ;
    activityIndicator.frame = CGRectMake(0.0, 0.0, 40.0, 40.0);
    activityIndicator.center = self.view.center;
    [self.view addSubview: activityIndicator];
    [activityIndicator startAnimating];
    
    
    NSString* url=[NSString stringWithFormat:@"%@",kBASEURL];
    NSString* payload=[NSString stringWithFormat:@"{\"uniqueid\":\"%@\",\"password\":\"%@\",\"image\":\"1\"}",id_Txt.text,psw_Txt.text];
    
    
    [sendContacts_cls callWebService:url :@"getbulkcontact" :payload];
    }
}

-(void)sendwithoutImage_btnAction{
    
    if ([id_Txt.text length] ==0) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Alert"
                                                        message:@"Please enter the ID first"
                                                       delegate:nil
                                              cancelButtonTitle:@"Ok"
                                              otherButtonTitles:Nil,Nil];
        
        
        [alert show];
    }
    else
    {
    ContactSignUpDataService * sendContacts_cls=[[ContactSignUpDataService alloc] init];
    sendContacts_cls.delegate=self;
    activityIndicator = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge] ;
    activityIndicator.frame = CGRectMake(0.0, 0.0, 40.0, 40.0);
    activityIndicator.center = self.view.center;
    [self.view addSubview: activityIndicator];
    [activityIndicator startAnimating];
    
    
    NSString* url=[NSString stringWithFormat:@"%@",kBASEURL];
    NSString* payload=[NSString stringWithFormat:@"{\"uniqueid\":\"%@\",\"password\":\"%@\",\"image\":\"0\"}",id_Txt.text,psw_Txt.text];
    
    
    [sendContacts_cls callWebService:url :@"getbulkcontact" :payload];
    }
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

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    [id_Txt resignFirstResponder];
    [psw_Txt resignFirstResponder];
    UIScrollView *scrollview3=(UIScrollView *)[self.view viewWithTag:111];
    scrollview3.scrollEnabled=YES;
    
    
    [scrollview3 setContentOffset:CGPointMake(0, 0) animated:YES];

}
-(void)textFieldDidBeginEditing:(UITextField *)textField{
    
    
    
    
    
    UIScrollView *scrollview3=(UIScrollView *)[self.view viewWithTag:111];
    scrollview3.scrollEnabled=YES;
    
    
    [scrollview3 setContentOffset:CGPointMake(0, 100) animated:YES];
    
    
}

#pragma TextField Delegate Method
- (void)textFieldDidEndEditing:(UITextField *)textField{
    
    
    
    UIScrollView *scrollview2=(UIScrollView *)[self.view viewWithTag:111];
    scrollview2.scrollEnabled=YES;
    [scrollview2 setContentOffset:CGPointMake(0, 0) animated:YES];
    
    
}
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    textField.textColor = [UIColor blackColor];
    return YES;
    
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    [textField resignFirstResponder];
    UIScrollView *scrollview1=(UIScrollView *)[self.view viewWithTag:111];
    scrollview1.scrollEnabled=YES;
    
    [scrollview1 setContentOffset:CGPointMake(0, 0) animated:YES];
    
    return YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
