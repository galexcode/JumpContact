//
//  RecievedContactDetailsViewController.m
//  ContactJump
//
//  Created by Dex on 14/02/14.
//  Copyright (c) 2014 iyasoft. All rights reserved.
//

#import "RecievedContactDetailsViewController.h"

@interface RecievedContactDetailsViewController ()

@end

@implementation RecievedContactDetailsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (id)initWithPerson:(ABRecordRef )personRef
{
    
    phoneNumber_Type= [[NSMutableArray alloc] init];
    phoneNumber_Value= [[NSMutableArray alloc] init];
    
    email_Value= [[NSMutableArray alloc] init];
    email_Type= [[NSMutableArray alloc] init];
    
    url_Value= [[NSMutableArray alloc] init];
    url_Type= [[NSMutableArray alloc] init];
    
    
    IM_Value= [[NSMutableArray alloc] init];
    IM_Type= [[NSMutableArray alloc] init];
    
    socialProfile_Value= [[NSMutableArray alloc] init];
    socialProfile_Type= [[NSMutableArray alloc] init];
    
    address_Value= [[NSMutableArray alloc] init];
    address_Type= [[NSMutableArray alloc] init];
    
    
    date_Value= [[NSMutableArray alloc] init];
    date_Type= [[NSMutableArray alloc] init];

    section_Names=[[NSMutableDictionary alloc] init];
    [section_Names removeAllObjects];
    section_LabelType=[[NSMutableDictionary alloc] init];
    [section_LabelType removeAllObjects];
    
    if (self)
    {
        fname = (__bridge NSString *)ABRecordCopyValue(personRef, kABPersonFirstNameProperty);
        lname = (__bridge NSString *)ABRecordCopyValue(personRef, kABPersonJobTitleProperty);
        cname=(__bridge NSString *)ABRecordCopyValue(personRef, kABPersonOrganizationProperty);
        
        
        
        
        
       UIImage* image = [UIImage imageWithData:(__bridge NSData *)(ABPersonCopyImageDataWithFormat(personRef, kABPersonImageFormatThumbnail))];
        NSData *imageData = UIImageJPEGRepresentation(image, 0);
    
        
        
        image1=[UIImage imageWithData:imageData];
        
    
   

    
    
        ABMultiValueRef phones = ABRecordCopyValue(personRef, kABPersonPhoneProperty);
        ABMultiValueRef emails = ABRecordCopyValue(personRef, kABPersonEmailProperty);
        ABMultiValueRef address = ABRecordCopyValue(personRef, kABPersonAddressProperty);
        ABMultiValueRef socialProfile = ABRecordCopyValue(personRef, kABPersonSocialProfileProperty);
        ABMultiValueRef instantMessageProfile = ABRecordCopyValue(personRef, kABPersonInstantMessageProperty);
        ABMultiValueRef url = ABRecordCopyValue(personRef, kABPersonURLProperty);
        ABMultiValueRef date = ABRecordCopyValue(personRef, kABPersonDateProperty);
        

        if(instantMessageProfile)
        {
            NSArray *IMProfiles = (__bridge NSArray *)ABMultiValueCopyArrayOfAllValues(instantMessageProfile);
            
            for (int i = 0; i < [IMProfiles count]; i++)
            {
                
                
                CFDictionaryRef IMValue = ABMultiValueCopyValueAtIndex(instantMessageProfile, i);
                
                if(CFStringCompare( CFDictionaryGetValue(IMValue, kABPersonInstantMessageServiceKey), kABPersonInstantMessageServiceFacebook, 0)==kCFCompareEqualTo) {
                    
                    [IM_Type addObject:(NSString*)kABPersonInstantMessageServiceFacebook];
                    [IM_Value addObject:(NSString*) CFDictionaryGetValue(IMValue, kABPersonInstantMessageUsernameKey)];
                    
                }
                if(CFStringCompare( CFDictionaryGetValue(IMValue, kABPersonInstantMessageServiceKey), kABPersonInstantMessageServiceMSN, 0)==kCFCompareEqualTo) {
                    
                    [IM_Type addObject:(NSString*)kABPersonInstantMessageServiceMSN];
                    [IM_Value addObject:(NSString*) CFDictionaryGetValue(IMValue, kABPersonInstantMessageUsernameKey)];                    }
                
                if(CFStringCompare( CFDictionaryGetValue(IMValue, kABPersonInstantMessageServiceKey), kABPersonInstantMessageServiceQQ, 0)==kCFCompareEqualTo) {
                    
                    [IM_Type addObject:(NSString*)kABPersonInstantMessageServiceQQ];
                    [IM_Value addObject:(NSString*) CFDictionaryGetValue(IMValue, kABPersonInstantMessageUsernameKey)];
                }
                
                if(CFStringCompare( CFDictionaryGetValue(IMValue, kABPersonInstantMessageServiceKey), kABPersonInstantMessageServiceSkype, 0)==kCFCompareEqualTo) {
                    
                    [IM_Type addObject:(NSString*)kABPersonInstantMessageServiceSkype];
                    [IM_Value addObject:(NSString*) CFDictionaryGetValue(IMValue, kABPersonInstantMessageUsernameKey)];
                }
                
                if(CFStringCompare( CFDictionaryGetValue(IMValue, kABPersonInstantMessageServiceKey), kABPersonInstantMessageServiceYahoo, 0)==kCFCompareEqualTo) {
                    
                    [IM_Type addObject:(NSString*)kABPersonInstantMessageServiceYahoo];
                    [IM_Value addObject:(NSString*) CFDictionaryGetValue(IMValue, kABPersonInstantMessageUsernameKey)];
                }
                
                if(CFStringCompare( CFDictionaryGetValue(IMValue, kABPersonInstantMessageServiceKey), kABPersonInstantMessageServiceJabber, 0)==kCFCompareEqualTo) {
                    
                    [IM_Type addObject:(NSString*)kABPersonInstantMessageServiceJabber];
                    [IM_Value addObject:(NSString*) CFDictionaryGetValue(IMValue, kABPersonInstantMessageUsernameKey)];
                }
                if(CFStringCompare( CFDictionaryGetValue(IMValue, kABPersonInstantMessageServiceKey), kABPersonInstantMessageServiceAIM, 0)==kCFCompareEqualTo) {
                    
                    [IM_Type addObject:(NSString*)kABPersonInstantMessageServiceAIM];
                    [IM_Value addObject:(NSString*) CFDictionaryGetValue(IMValue, kABPersonInstantMessageUsernameKey)];
                }
                if(CFStringCompare( CFDictionaryGetValue(IMValue, kABPersonInstantMessageServiceKey), kABPersonInstantMessageServiceGaduGadu, 0)==kCFCompareEqualTo) {
                    
                    [IM_Type addObject:(NSString*)kABPersonInstantMessageServiceGaduGadu];
                    [IM_Value addObject:(NSString*) CFDictionaryGetValue(IMValue, kABPersonInstantMessageUsernameKey)];
                }
                if(CFStringCompare( CFDictionaryGetValue(IMValue, kABPersonInstantMessageServiceKey), kABPersonInstantMessageServiceGoogleTalk, 0)==kCFCompareEqualTo) {
                    
                    [IM_Type addObject:(NSString*)kABPersonInstantMessageServiceGoogleTalk];
                    [IM_Value addObject:(NSString*) CFDictionaryGetValue(IMValue, kABPersonInstantMessageUsernameKey)];
                }
                if(CFStringCompare( CFDictionaryGetValue(IMValue, kABPersonInstantMessageServiceKey), kABPersonInstantMessageServiceICQ, 0)==kCFCompareEqualTo) {
                    
                    [IM_Type addObject:(NSString*)kABPersonInstantMessageServiceICQ];
                    [IM_Value addObject:(NSString*) CFDictionaryGetValue(IMValue, kABPersonInstantMessageUsernameKey)];
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
                NSLog(@"%@",CFDictionaryGetValue(socialValue, kABPersonSocialProfileServiceKey));
                if(CFStringCompare( CFDictionaryGetValue(socialValue, kABPersonSocialProfileServiceKey), kABPersonSocialProfileServiceFacebook, 0)==kCFCompareEqualTo) {
                    
                    [socialProfile_Type addObject:(NSString*) kABPersonSocialProfileServiceFacebook];
                    [socialProfile_Value addObject:(NSString*) CFDictionaryGetValue(socialValue, kABPersonSocialProfileUsernameKey)];
                    
                }
                else if(CFStringCompare( CFDictionaryGetValue(socialValue, kABPersonSocialProfileServiceKey), kABPersonSocialProfileServiceFlickr, 0)==kCFCompareEqualTo) {
                    
                    [socialProfile_Type addObject:(NSString*) kABPersonSocialProfileServiceFlickr];
                    [socialProfile_Value addObject:(NSString*) CFDictionaryGetValue(socialValue, kABPersonSocialProfileUsernameKey)];
                }
                
               else if(CFStringCompare( CFDictionaryGetValue(socialValue, kABPersonSocialProfileServiceKey), kABPersonSocialProfileServiceLinkedIn, 0)==kCFCompareEqualTo) {
                    
                    [socialProfile_Type addObject:(NSString*) kABPersonSocialProfileServiceLinkedIn];
                    [socialProfile_Value addObject:(NSString*) CFDictionaryGetValue(socialValue, kABPersonSocialProfileUsernameKey)];
                }
                
               else if(CFStringCompare( CFDictionaryGetValue(socialValue, kABPersonSocialProfileServiceKey), kABPersonSocialProfileServiceMyspace, 0)==kCFCompareEqualTo) {
                    
                    [socialProfile_Type addObject:(NSString*) kABPersonSocialProfileServiceMyspace];
                    [socialProfile_Value addObject:(NSString*) CFDictionaryGetValue(socialValue, kABPersonSocialProfileUsernameKey)];
                }
                
                else if(CFStringCompare( CFDictionaryGetValue(socialValue, kABPersonSocialProfileServiceKey), kABPersonSocialProfileServiceSinaWeibo, 0)==kCFCompareEqualTo) {
                    
                    [socialProfile_Type addObject:(NSString*) kABPersonSocialProfileServiceSinaWeibo];
                    [socialProfile_Value addObject:(NSString*) CFDictionaryGetValue(socialValue, kABPersonSocialProfileUsernameKey)];
                }
                
               else if(CFStringCompare( CFDictionaryGetValue(socialValue, kABPersonSocialProfileServiceKey), kABPersonSocialProfileServiceTwitter, 0)==kCFCompareEqualTo) {
                    
                    [socialProfile_Type addObject:(NSString*) kABPersonSocialProfileServiceTwitter];
                    [socialProfile_Value addObject:(NSString*) CFDictionaryGetValue(socialValue, kABPersonSocialProfileUsernameKey)];
                }
                
                CFRelease(socialValue);
                
            }
            
            NSLog(@"%@ ---- %@\n %@",socialProfile_Type,socialProfile_Value,IM_Type);
        }
        
        //********************************* EMAIL IDs *********************************
        for(int j = 0; j < ABMultiValueGetCount(emails); j++)
        {
            
            
            CFStringRef typeTmp = ABMultiValueCopyLabelAtIndex(emails, j);
            NSString* emailType = (__bridge NSString*)ABAddressBookCopyLocalizedLabel(typeTmp);
            NSString *email = (__bridge_transfer NSString *)ABMultiValueCopyValueAtIndex(emails, j);
            [email_Type addObject:[emailType stringByReplacingCharactersInRange:NSMakeRange(0,1)
                                                                            withString:[[emailType substringToIndex:1] capitalizedString]]];
            [email_Value addObject:email];
            
            CFRelease(typeTmp);
        }
        
        NSLog(@"%@ \n %@",email_Type,email_Value);
        
        
        //*********************************PHONE NUMBERS *********************************
        
        
        for( int j = 0; j < ABMultiValueGetCount(phones); j++)
        {
            
            
            CFStringRef typeTmp = ABMultiValueCopyLabelAtIndex(phones, j);
            NSString* phone_labeltype = (__bridge NSString*)ABAddressBookCopyLocalizedLabel(typeTmp);
            NSString *phone = (__bridge_transfer NSString *)ABMultiValueCopyValueAtIndex(phones, j);
            [phoneNumber_Type addObject:[phone_labeltype stringByReplacingCharactersInRange:NSMakeRange(0,1)
                                                                                        withString:[[phone_labeltype substringToIndex:1] capitalizedString]]];
            
            [phoneNumber_Value addObject: phone];
            
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
                
                
                
                [address_Type addObject:[labeltype stringByReplacingCharactersInRange:NSMakeRange(0,1)
                                                                                  withString:[[labeltype substringToIndex:1] capitalizedString]]];
                [address_Value addObject:country];
                
                CFRelease(typeTmp);
                
            }
            
            NSLog(@"%@ \n %@",address_Type,address_Value);
        }
        //********************************* URLs *********************************
        if(url)
        {
            for(int j = 0; j < ABMultiValueGetCount(url); j++)
            {
                
                
                CFStringRef typeTmp = ABMultiValueCopyLabelAtIndex(url, j);
                NSString* urlType = (__bridge NSString*)ABAddressBookCopyLocalizedLabel(typeTmp);
                NSString *urlValue = (__bridge_transfer NSString *)ABMultiValueCopyValueAtIndex(url, j);
                
                [url_Type addObject:[urlType stringByReplacingCharactersInRange:NSMakeRange(0,1)
                                                                            withString:[[urlType substringToIndex:1] capitalizedString]]];
                [url_Value addObject:urlValue];
                
                
                CFRelease(typeTmp);
            }
            
            NSLog(@"%@ ----",url_Type);
        }
        
        //********************************* Dates *********************************
        
        
       
        
        if(date)
        {
            
            
            for(int j = 0; j < ABMultiValueGetCount(date); j++)
            {
                
                
                CFStringRef typeTmp = ABMultiValueCopyLabelAtIndex(date, j);
                NSString* dateType = (__bridge NSString*)ABAddressBookCopyLocalizedLabel(typeTmp);
                
                NSString *dateValue = (__bridge NSString *)ABMultiValueCopyValueAtIndex(date, j);
                
                NSLog(@"urlValuetype %@",(__bridge NSString *)ABMultiValueCopyValueAtIndex(date, j));
                [date_Value addObject:dateValue];
                
                [date_Type addObject:[dateType stringByReplacingCharactersInRange:NSMakeRange(0,1)
                                                                              withString:[[dateType substringToIndex:1] capitalizedString]]];
                
                
                CFRelease(typeTmp);
            }
            
            
        }
        
        
        NSString *date_BirthdayValue = (__bridge NSString*)ABRecordCopyValue(personRef, kABPersonBirthdayProperty) ;
        
        
        if (date_BirthdayValue !=NULL) {
            date_bday =date_BirthdayValue;
            [date_Value addObject:date_bday];
            [date_Type addObject:@"Birthday"];
        }
        
        NSLog(@"%@ \n %@",date_Type,date_Value);
        
        
        
        
        
        CFRelease(phones);
        CFRelease(emails);
        CFRelease(address);
        CFRelease(socialProfile);
        CFRelease(instantMessageProfile);
        CFRelease(url);
        CFRelease(date);
        
        
        if (ABMultiValueGetCount(phones) !=0)
        {
           
            
            [section_LabelType setObject:phoneNumber_Type forKey:@"1"];
            [section_Names setObject:phoneNumber_Value forKey:@"1"];
           
        }
        if ([address_Value count] !=0)
        {
            [section_LabelType setObject:address_Type forKey:@"2"];
            [section_Names setObject:address_Value forKey:@"2"];
           
            
        }
        if ([email_Value count] !=0) {
            
            [section_LabelType setObject:email_Type forKey:@"3"];
            [section_Names setObject:email_Value forKey:@"3"];
           
            
        }
        if ([socialProfile_Value count] !=0)
        {
            [section_LabelType setObject:socialProfile_Type forKey:@"4"];
            [section_Names setObject:socialProfile_Value forKey:@"4"];
            
            
        }
        if ([IM_Value count] !=0)
        {
            [section_LabelType setObject:IM_Type forKey:@"5"];
            [section_Names setObject:IM_Value forKey:@"5"];
            
            
        }
        if ([url_Value count] !=0)
        {
            [section_LabelType setObject:url_Type forKey:@"6"];
            [section_Names setObject:url_Value forKey:@"6"];
           
            
        }
        if ([date_Value count] !=0)
        {
            [section_LabelType setObject:date_Type forKey:@"7"];
            [section_Names setObject:date_Value forKey:@"7"];
            
            
        }
        
       

        
        
    }
    return self;
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
#pragma Main BG ImageView
    UIImageView *mainbg_img = [[UIImageView alloc] init];
    mainbg_img.userInteractionEnabled=TRUE;
    mainbg_img.opaque = YES;
    [mainbg_img setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:mainbg_img];
    
#pragma mark navigation bar image.
    UIImageView  *nav_img =[[UIImageView alloc] init];
    nav_img.image=[UIImage imageNamed:@"header-bg.png"];
    [mainbg_img addSubview:nav_img];
    
#pragma mark back button.
    UIButton *back_btn =[UIButton buttonWithType:UIButtonTypeCustom];
    [back_btn setBackgroundImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"back-button" ofType:@"png"]] forState:UIControlStateNormal];
    [back_btn addTarget:self action:@selector(back_btnAction) forControlEvents:UIControlEventTouchUpInside];
    [mainbg_img addSubview:back_btn];
    
    
    
    UIImageView *imgvw=[[UIImageView alloc] init];
     UIImage *image;
    
    
   
    if (image1 ==nil) {
        
       image=[UIImage imageNamed:@"user.png"];
       imgvw.image=image;
        
    }
    else{
        
        imgvw.image=image1;
    }
   
    [mainbg_img addSubview:imgvw];
    
    
    
    
    navbartitle=[[UILabel alloc] init];
    navbartitle.text=[NSString stringWithFormat:@"Details"];
    navbartitle.textAlignment=1;
    navbartitle.textColor= [UIColor whiteColor];
    navbartitle.backgroundColor=[UIColor clearColor];
    navbartitle.font=[UIFont fontWithName:@"AmericanTypewriter" size:18];
    navbartitle.shadowColor = [UIColor whiteColor];
    navbartitle.shadowOffset = CGSizeMake(0,0);
    [mainbg_img addSubview:navbartitle];
    
    
    first_Name=[[UITextField alloc] init];
    [first_Name setBackgroundColor:[UIColor clearColor]];
    first_Name.textColor=[UIColor blackColor];
    first_Name.placeholder=@"First name";
    first_Name.text=fname;
    first_Name.delegate = self;
    [mainbg_img addSubview:first_Name];
    
    last_Name=[[UITextField alloc] init];
    [last_Name setBackgroundColor:[UIColor clearColor]];
    last_Name.placeholder=@"Job Title - Department";
    last_Name.textColor=[UIColor blackColor];
    last_Name.text=lname;
    last_Name.delegate = self;
    [mainbg_img addSubview:last_Name];
    
    
    company_Name=[[UITextField alloc] init];
    [company_Name setBackgroundColor:[UIColor clearColor]];
    company_Name.placeholder=@"Company name";
    company_Name.textColor=[UIColor blackColor];
    company_Name.text=cname;
    company_Name.delegate = self;
    [mainbg_img addSubview:company_Name];
    
    
    tblVw=[[UITableView alloc]init];
    tblVw.backgroundColor=[UIColor whiteColor];
    tblVw.delegate=self;
    tblVw.dataSource=self;
    [tblVw setSeparatorColor:[UIColor clearColor]];
    [mainbg_img addSubview:tblVw];
    
    
    if (IS_IPHONE_5) {
        nav_img.frame=CGRectMake(0, 0, 320, 90);
        mainbg_img.frame=CGRectMake(0,0, 320, 568);
        back_btn.frame=CGRectMake(15, 14, 33, 54);
        navbartitle.frame=CGRectMake(0,20,320,50);
        first_Name.frame=CGRectMake(130,100,180,30);
        last_Name.frame=CGRectMake(130,135,180,30);
        company_Name.frame=CGRectMake(130,170,180,30);
        tblVw.frame=CGRectMake(0,210,320,358);
        imgvw.frame=CGRectMake(10, 100, 100, 100);
        
    }
    else
    {
        
        nav_img.frame=CGRectMake(0, 0, 320, 80);
        mainbg_img.frame=CGRectMake(0,0, 320, 480);
        navbartitle.frame=CGRectMake(0,20,320,50);
        back_btn.frame=CGRectMake(15, 13, 33, 54);
        first_Name.frame=CGRectMake(130,90,180,30);
        last_Name.frame=CGRectMake(130,125,180,30);
        company_Name.frame=CGRectMake(130,160,180,30);
        tblVw.frame=CGRectMake(0,200,320,280);
        imgvw.frame=CGRectMake(10, 90, 100, 100);
    }

}

-(void)back_btnAction
{
   
    
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [section_Names count];
}
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    
    NSString *header_Name=nil;
    if ([[[[section_Names allKeys] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)] objectAtIndex:section]isEqualToString:@"1"]) {
        header_Name=@"Phone Number";
    }
    else if ([[[[section_Names allKeys] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)] objectAtIndex:section] isEqualToString:@"2"]){
        header_Name=@"Address";
    }
    else if ([[[[section_Names allKeys] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)] objectAtIndex:section] isEqualToString:@"3"]){
        header_Name=@"Email-ID";
    }
    
    else if ([[[[section_Names allKeys] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)] objectAtIndex:section] isEqualToString:@"4"]){
        header_Name=@"Social Profile";
    }
    
    else if ([[[[section_Names allKeys] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)] objectAtIndex:section]isEqualToString:@"5"]){
        header_Name=@"Instant Message Profile";
    }
    
    else if ([[[[section_Names allKeys] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)] objectAtIndex:section] isEqualToString:@"6"]){
        header_Name=@"URL";
    }
    
    else if ([[[[section_Names allKeys] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)] objectAtIndex:section] isEqualToString:@"7"]){
        header_Name=@"Dates";
    }
    
    return header_Name;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
   
    return [[section_Names valueForKey:[[[section_Names allKeys] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)] objectAtIndex:section]] count];
    
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.selectionStyle=UITableViewCellSelectionStyleGray;
        cell.textLabel.textColor=[UIColor blackColor];
        
      
        
        
        UILabel *lblType = [[UILabel alloc]init];
        
        lblType.numberOfLines=2;
        lblType.frame=CGRectMake(40, 0, 100, 25);
        lblType.tag = 41;
        lblType.font = [UIFont systemFontOfSize:12];
        lblType.backgroundColor = [UIColor clearColor];
        lblType.textColor = [UIColor blueColor];
        [cell.contentView addSubview:lblType];
        
        UILabel *line = [[UILabel alloc]init];
        line.frame=CGRectMake(130, 3, 1, 19);
        line.tag = 43;
        line.backgroundColor = [UIColor lightGrayColor];
        [cell.contentView addSubview:line];
        
        
        UILabel *lblMainLabel = [[UILabel alloc]init];
        lblMainLabel.tag = 42;
        lblMainLabel.numberOfLines=2;
        lblMainLabel.frame=CGRectMake(145, 0, 170, 25);
        lblMainLabel.font = [UIFont systemFontOfSize:12];
        lblMainLabel.backgroundColor = [UIColor clearColor];
        lblMainLabel.textColor = [UIColor blackColor];
        [cell.contentView addSubview:lblMainLabel];
    }
    
    
    
    
    if ([[[[section_Names allKeys] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)] objectAtIndex:indexPath.section] isEqualToString:@"2"])
    {
        UITableViewCell *first_Cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil] ;
        
    
        UILabel *lblType = [[UILabel alloc]init];
        lblType.frame=CGRectMake(40, 0, 100, 100);
        lblType.numberOfLines=1;
        lblType.tag = 41;
        lblType.font = [UIFont systemFontOfSize:12];
        lblType.backgroundColor = [UIColor clearColor];
        lblType.textColor = [UIColor blueColor];
        
        UILabel *line = [[UILabel alloc]init];
        line.frame=CGRectMake(130, 3, 1, 93);
        line.tag = 43;
        line.backgroundColor = [UIColor lightGrayColor];
        
        
        UILabel *lblMainLabel = [[UILabel alloc]init];
        lblMainLabel.tag = 42;
        lblMainLabel.textAlignment=NSTextAlignmentLeft;
        lblMainLabel.frame=CGRectMake(145, 0, 170, 100);
        lblMainLabel.numberOfLines=8;
        lblMainLabel.font = [UIFont systemFontOfSize:12];
        lblMainLabel.backgroundColor = [UIColor clearColor];
        lblMainLabel.textColor = [UIColor blackColor];
        
        
        
        
        
               
        lblType.text=[[section_LabelType objectForKey:[[[section_LabelType allKeys] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)] objectAtIndex:indexPath.section]] objectAtIndex:indexPath.row];
        
        
        lblMainLabel.text=[[section_Names objectForKey:[[[section_Names allKeys] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)] objectAtIndex:indexPath.section]] objectAtIndex:indexPath.row];
        
        
        [first_Cell.contentView addSubview:lblMainLabel];
        [first_Cell.contentView addSubview:lblType];
        [first_Cell.contentView addSubview:line];
        
        
        
        
        return first_Cell;
        
    }
    else
    {
        
        UILabel *lblType =(UILabel*) [cell viewWithTag:41];
        
        
        lblType.text=[[section_LabelType objectForKey:[[[section_LabelType allKeys] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)] objectAtIndex:indexPath.section]] objectAtIndex:indexPath.row];
        
        UILabel *lblMainLabel =(UILabel*) [cell viewWithTag:42];
        
        
        lblMainLabel.text=[[section_Names objectForKey:[[[section_Names allKeys] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)] objectAtIndex:indexPath.section]] objectAtIndex:indexPath.row];
        
        
        
      
        return cell;
    }
   // return cell;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    int height;
    if ([[[[section_Names allKeys] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)] objectAtIndex:indexPath.section] isEqualToString:@"2"])
    {
        height=100.0f;
    }
    else {
        height=25.0f;
    }
    return height;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=(UITableViewCell*)[tableView cellForRowAtIndexPath:indexPath];
    NSLog(@"%@", cell.contentView.subviews);
    UIButton *tappedButton = (UIButton*)[cell.contentView.subviews objectAtIndex:0];
    
    if ([tappedButton isSelected])
    {
        [tappedButton setSelected:NO];
        
 
    }
    else
    {
        
        [tappedButton setSelected:YES];
        
        NSLog(@"SELECTED---%@",[[[section_Names allKeys] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)] objectAtIndex:indexPath.row]);
        
    }
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
#pragma TextField Delegate Method
-(void)textFieldDidBeginEditing:(UITextField *)textField{
    
    
    
    
}

#pragma TextField Delegate Method
- (void)textFieldDidEndEditing:(UITextField *)textField{
    
    
    
    
}
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    
    return YES;
    
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    [textField resignFirstResponder];
   // per.fullName=textField.text;
    
    return YES;
}

@end
