//
//  ContactEditDetailsViewController.m
//  ContactJump
//
//  Created by Dex on 27/01/14.
//  Copyright (c) 2014 iyasoft. All rights reserved.
//

#import "ContactEditDetailsViewController.h"

@interface ContactEditDetailsViewController ()

@end

@implementation ContactEditDetailsViewController

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
    
    img=[[UIImageView alloc] init];
    [img setBackgroundColor:[UIColor whiteColor]];
    [mainbg_img addSubview:img];
    
    navbartitle=[[UILabel alloc] init];
    navbartitle.text=[NSString stringWithFormat:@"Edit"];
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
        img.frame=CGRectMake(10,100,100,100);
        first_Name.frame=CGRectMake(130,100,180,30);
        last_Name.frame=CGRectMake(130,135,180,30);
        company_Name.frame=CGRectMake(130,170,180,30);
        tblVw.frame=CGRectMake(0,210,320,358);
        
    }
    else
    {
        
        nav_img.frame=CGRectMake(0, 0, 320, 80);
        mainbg_img.frame=CGRectMake(0,0, 320, 480);
        navbartitle.frame=CGRectMake(0,20,320,50);
        back_btn.frame=CGRectMake(15, 13, 33, 54);
        img.frame=CGRectMake(10,90,100,100);
        first_Name.frame=CGRectMake(130,90,180,30);
        last_Name.frame=CGRectMake(130,125,180,30);
        company_Name.frame=CGRectMake(130,160,180,30);
        tblVw.frame=CGRectMake(0,200,320,280);
    }
}
- (id)initWithPerson:(Person *)person
{
    
    per=person;
    phoneNumber_home=[[NSMutableArray alloc] init];
    address=[[NSMutableArray alloc] init];
    emailIDs=[[NSMutableArray alloc] init];
    socialProfiles=[[NSMutableArray alloc] init];
    IMProfiles=[[NSMutableArray alloc] init];
    URLs=[[NSMutableArray alloc] init];
    dates=[[NSMutableArray alloc] init];
    
    phoneNumber_LabelType=[[NSMutableArray alloc] init];
    address_LabelType=[[NSMutableArray alloc] init];
    emailIDs_LabelType=[[NSMutableArray alloc] init];
    socialProfiles_LabelType=[[NSMutableArray alloc] init];
    IMProfiles_LabelType=[[NSMutableArray alloc] init];
    URLs_LabelType=[[NSMutableArray alloc] init];
    dates_LabelType=[[NSMutableArray alloc] init];
    
    section_Names=[[NSMutableDictionary alloc] init];
    [section_Names removeAllObjects];
    section_LabelType=[[NSMutableDictionary alloc] init];
    [section_LabelType removeAllObjects];

    if (self) {
        
        
    //=================================================BASIC INFO===================================================
        fname = person.fullName ;
        lname = person.lastName ;
        cname=person.companyName;
        
        //img.image=person.pic;
    //=================================================PHONE NUMBERS===================================================
        
        for (int i=0; i<[person.phoneNumber_home count]; i++) {
            if ([person.phoneNumber_home objectAtIndex:i] !=Nil)
            {
                [phoneNumber_LabelType addObject:@"Home"];
                [phoneNumber_home addObject:[NSString stringWithFormat:@"%@",[person.phoneNumber_home objectAtIndex:i]] ];
            }
            
        }
        for (int i=0; i<[person.phoneNumber_HomeFax count]; i++)
        {
            if ([person.phoneNumber_HomeFax objectAtIndex:i] !=Nil)
            {
                [phoneNumber_LabelType addObject:@"Home Fax"];
                [phoneNumber_home addObject:[NSString stringWithFormat:@"%@",[person.phoneNumber_HomeFax objectAtIndex:i]] ];
            }
            
        }
        for (int i=0; i<[person.phoneNumber_iPhone count]; i++)
        {
            if ([person.phoneNumber_iPhone objectAtIndex:i] !=Nil)
            {
                [phoneNumber_LabelType addObject:@"iPhone"];
                [phoneNumber_home addObject:[NSString stringWithFormat:@"%@",[person.phoneNumber_iPhone objectAtIndex:i]] ];
            }
            
        }
        for (int i=0; i<[person.phoneNumber_main count]; i++)
        {
            if ([person.phoneNumber_main objectAtIndex:i] !=Nil)
            {
                [phoneNumber_LabelType addObject:@"Main"];
                [phoneNumber_home addObject:[NSString stringWithFormat:@"%@",[person.phoneNumber_main objectAtIndex:i]] ];
            }
            
        }
        for (int i=0; i<[person.phoneNumber_mobile count]; i++)
        {
            if ([person.phoneNumber_mobile objectAtIndex:i] !=Nil)
            {
                [phoneNumber_LabelType addObject:@"Mobile"];
                [phoneNumber_home addObject:[NSString stringWithFormat:@"%@",[person.phoneNumber_mobile objectAtIndex:i]] ];
            }
            
        }
        for (int i=0; i<[person.phoneNumber_other count]; i++)
        {
            if ([person.phoneNumber_other objectAtIndex:i] !=Nil)
            {
                [phoneNumber_LabelType addObject:@"Other"];
                [phoneNumber_home addObject:[NSString stringWithFormat:@"%@",[person.phoneNumber_other objectAtIndex:i]] ];
            }
            
        }
        for (int i=0; i<[person.phoneNumber_Pager count]; i++) {
            if ([person.phoneNumber_Pager objectAtIndex:i] !=Nil)
            {
                [phoneNumber_LabelType addObject:@"Pager"];
                [phoneNumber_home addObject:[NSString stringWithFormat:@"%@",[person.phoneNumber_Pager objectAtIndex:i]] ];
            }
            
        }
        for (int i=0; i<[person.phoneNumber_Work count]; i++) {
            if ([person.phoneNumber_Work objectAtIndex:i] !=Nil) {
                [phoneNumber_LabelType addObject:@"Work"];
                [phoneNumber_home addObject:[NSString stringWithFormat:@"%@",[person.phoneNumber_Work objectAtIndex:i]] ];
            }
            
        }
        for (int i=0; i<[person.phoneNumber_WorkFax count]; i++) {
            if ([person.phoneNumber_WorkFax objectAtIndex:i] !=Nil) {
                [phoneNumber_LabelType addObject:@"Work Fax"];
                [phoneNumber_home addObject:[NSString stringWithFormat:@"%@",[person.phoneNumber_WorkFax objectAtIndex:i]] ];
            }
            
        }
       
        
    //=================================================ADDRESS===================================================
        for (int i=0; i<[person.address_home count]; i++)
        {
            if ([person.address_home objectAtIndex:i] !=Nil)
            {
                [address_LabelType addObject:@"Home"];
                [address addObject:[NSString stringWithFormat:@"%@",[person.address_home objectAtIndex:i]]];
            }
        }
        for (int i=0; i<[person.address_work count]; i++)
        {
            if ([person.address_work objectAtIndex:i] !=Nil)
            {
                [address_LabelType addObject:@"Work"];
                [address addObject:[NSString stringWithFormat:@"%@",[person.address_work objectAtIndex:i]]];
            }
        }
        
        for (int i=0; i<[person.address_other count]; i++)
        {
            if ([person.address_other objectAtIndex:i] !=Nil)
            {
                [address_LabelType addObject:@"Other"];
                [address addObject:[NSString stringWithFormat:@"%@",[person.address_other objectAtIndex:i]]];
            }
        }
        
    //=================================================EMAIL IDs===================================================
        
        for (int i=0; i<[person.email_home count]; i++)
        {
            if ([person.email_home objectAtIndex:i] !=Nil)
            {
                [emailIDs_LabelType addObject:@"Home"];
                [emailIDs addObject:[NSString stringWithFormat:@"%@",[person.email_home objectAtIndex:i]]];
            }
        }
        for (int i=0; i<[person.email_other count]; i++)
        {
            if ([person.email_other objectAtIndex:i] !=Nil)
            {
                [emailIDs_LabelType addObject:@"Other"];
                [emailIDs addObject:[NSString stringWithFormat:@"%@",[person.email_other objectAtIndex:i]]];
            }
        }
        for (int i=0; i<[person.email_iCloud count]; i++)
        {
            if ([person.email_iCloud objectAtIndex:i] !=Nil)
            {
                [emailIDs_LabelType addObject:@"iCloud"];
                [emailIDs addObject:[NSString stringWithFormat:@"%@",[person.email_iCloud objectAtIndex:i]]];
            }
        }
        for (int i=0; i<[person.email_work count]; i++)
        {
            if ([person.email_work objectAtIndex:i] !=Nil)
            {
                [emailIDs_LabelType addObject:@"Work"];
                [emailIDs addObject:[NSString stringWithFormat:@"%@",[person.email_work objectAtIndex:i]]];
            }
        }
       
        //=================================================SOCIAL PROFILES===================================================
        
        for (int i=0; i<[person.socialProfile_Facebook count]; i++) {
            if ([person.socialProfile_Facebook objectAtIndex:i] !=Nil)
            {
                [socialProfiles_LabelType addObject:@"Facebook ID"];
                [socialProfiles addObject:[NSString stringWithFormat:@"%@",[person.socialProfile_Facebook objectAtIndex:i]]];
            }
        }
        
        for (int i=0; i<[person.socialProfile_Flickr count]; i++) {
            if ([person.socialProfile_Flickr objectAtIndex:i] !=Nil)
            {
                [socialProfiles_LabelType addObject:@"Flickr ID"];
                [socialProfiles addObject:[NSString stringWithFormat:@"%@",[person.socialProfile_Flickr objectAtIndex:i]]];
            }
        }
        
        for (int i=0; i<[person.socialProfile_LinkedIn count]; i++) {
            if ([person.socialProfile_LinkedIn objectAtIndex:i] !=Nil)
            {
                [socialProfiles_LabelType addObject:@"LinkedIn ID"];
                [socialProfiles addObject:[NSString stringWithFormat:@"%@",[person.socialProfile_LinkedIn objectAtIndex:i]]];
            }
        }
        for (int i=0; i<[person.socialProfile_MySpace count]; i++) {
            if ([person.socialProfile_MySpace objectAtIndex:i] !=Nil)
            {
                [socialProfiles_LabelType addObject:@"MySpace ID"];
                [socialProfiles addObject:[NSString stringWithFormat:@"%@",[person.socialProfile_MySpace objectAtIndex:i]]];
            }
        }
        for (int i=0; i<[person.socialProfile_SinaWeibo count]; i++) {
            if ([person.socialProfile_SinaWeibo objectAtIndex:i] !=Nil)
            {
                [socialProfiles_LabelType addObject:@"SinaWeibo ID"];
                [socialProfiles addObject:[NSString stringWithFormat:@"%@",[person.socialProfile_SinaWeibo objectAtIndex:i]]];
            }
        }
        for (int i=0; i<[person.socialProfile_Twitter count]; i++) {
            if ([person.socialProfile_Twitter objectAtIndex:i] !=Nil)
            {
                [socialProfiles_LabelType addObject:@"Twitter ID"];
                [socialProfiles addObject:[NSString stringWithFormat:@"%@",[person.socialProfile_Twitter objectAtIndex:i]]];
            }
        }
        
        
        //=================================================IM PROFILES===================================================
        
        for (int i=0; i<[person.IM_AIM count]; i++) {
            if ([person.IM_AIM objectAtIndex:i] !=Nil)
            {
                [IMProfiles_LabelType addObject:@"AIM ID"];
                [IMProfiles addObject:[NSString stringWithFormat:@"%@",[person.IM_AIM objectAtIndex:i]]];
            }
        }
        for (int i=0; i<[person.IM_AIM count]; i++) {
            if ([person.IM_AIM objectAtIndex:i] !=Nil)
            {
                [IMProfiles_LabelType addObject:@"FACEBOOK ID"];
                [IMProfiles addObject:[NSString stringWithFormat:@"%@",[person.IM_FBMsg objectAtIndex:i]]];
            }
        }
        for (int i=0; i<[person.IM_AIM count]; i++) {
            if ([person.IM_AIM objectAtIndex:i] !=Nil)
            {
                [IMProfiles_LabelType addObject:@"GADU-GADU ID"];
                [IMProfiles addObject:[NSString stringWithFormat:@"%@",[person.IM_GaduGadu objectAtIndex:i]]];
            }
        }
        for (int i=0; i<[person.IM_AIM count]; i++) {
            if ([person.IM_AIM objectAtIndex:i] !=Nil)
            {
                [IMProfiles_LabelType addObject:@"GTALK ID"];
                [IMProfiles addObject:[NSString stringWithFormat:@"%@",[person.IM_GTalk objectAtIndex:i]]];
            }
        }
        for (int i=0; i<[person.IM_AIM count]; i++) {
            if ([person.IM_AIM objectAtIndex:i] !=Nil)
            {
                [IMProfiles_LabelType addObject:@"ICQ ID"];
                [IMProfiles addObject:[NSString stringWithFormat:@"%@",[person.IM_ICQ objectAtIndex:i]]];
            }
        }
        for (int i=0; i<[person.IM_AIM count]; i++) {
            if ([person.IM_AIM objectAtIndex:i] !=Nil)
            {
                [IMProfiles_LabelType addObject:@"JABBER ID"];
                [IMProfiles addObject:[NSString stringWithFormat:@"%@",[person.IM_Jabber objectAtIndex:i]]];
            }
        }
        for (int i=0; i<[person.IM_AIM count]; i++) {
            if ([person.IM_AIM objectAtIndex:i] !=Nil)
            {
                [IMProfiles_LabelType addObject:@"MSN ID"];
                [IMProfiles addObject:[NSString stringWithFormat:@"%@",[person.IM_MSNMsg objectAtIndex:i]]];
            }
        }
        for (int i=0; i<[person.IM_AIM count]; i++) {
            if ([person.IM_AIM objectAtIndex:i] !=Nil)
            {
                [IMProfiles_LabelType addObject:@"QQ ID"];
                [IMProfiles addObject:[NSString stringWithFormat:@"%@",[person.IM_QQ objectAtIndex:i]]];
            }
        }
        for (int i=0; i<[person.IM_YahooMsg count]; i++) {
            if ([person.IM_YahooMsg objectAtIndex:i] !=Nil)
            {
                [IMProfiles_LabelType addObject:@"YAHOO ID"];
                [IMProfiles addObject:[NSString stringWithFormat:@"%@",[person.IM_YahooMsg objectAtIndex:i]]];
            }
        }
        for (int i=0; i<[person.IM_Skype count]; i++) {
            if ([person.IM_Skype objectAtIndex:i] !=Nil)
            {
                [IMProfiles_LabelType addObject:@"SKYPE ID"];
                [IMProfiles addObject:[NSString stringWithFormat:@"%@",[person.IM_Skype objectAtIndex:i]]];
            }
        }
        
        //=================================================URLs===================================================
        
        for (int i=0; i<[person.url_home count]; i++)
        {
            if ([person.url_home objectAtIndex:i] !=Nil)
            {
                [URLs_LabelType addObject:@"Home"];
                [URLs addObject:[NSString stringWithFormat:@"%@",[person.url_home objectAtIndex:i]]];
            }
        }
        for (int i=0; i<[person.url_homePage count]; i++)
        {
            if ([person.url_homePage objectAtIndex:i] !=Nil)
            {
                [URLs_LabelType addObject:@"Home Page"];
                [URLs addObject:[NSString stringWithFormat:@"%@",[person.url_homePage objectAtIndex:i]]];
            }
        }
        for (int i=0; i<[person.url_other count]; i++)
        {
            if ([person.url_other objectAtIndex:i] !=Nil)
            {
                [URLs_LabelType addObject:@"Other"];
                [URLs addObject:[NSString stringWithFormat:@"%@",[person.url_other objectAtIndex:i]]];
            }
        }
        for (int i=0; i<[person.url_work count]; i++)
        {
            if ([person.url_work objectAtIndex:i] !=Nil)
            {
                [URLs_LabelType addObject:@"Work"];
                [URLs addObject:[NSString stringWithFormat:@"%@",[person.url_work objectAtIndex:i]]];
            }
        }
        
        //=================================================DATES===================================================
        
        for (int i=0; i<[person.date_other count]; i++)
        {
            if ([person.date_other objectAtIndex:i] !=Nil)
            {
                [dates_LabelType addObject:@"Other"];
                [dates addObject:[NSString stringWithFormat:@"%@",[person.date_other objectAtIndex:i]]];
            }
        }
        for (int i=0; i<[person.date_Anniversary count]; i++)
        {
            if ([person.date_Anniversary objectAtIndex:i] !=Nil)
            {
                [dates_LabelType addObject:@"Anniversary"];
                [dates addObject:[NSString stringWithFormat:@"%@",[person.date_Anniversary objectAtIndex:i]]];
            }
        }
        if (person.date_bday !=Nil)
        {
            [dates_LabelType addObject:@"Birthday"];
            [dates addObject:person.date_bday];
        }
        
        //===========================================================================================================
        NSLog(@"%@",[person.phone objectForKey:[[[person.phone allKeys] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)] objectAtIndex:0]]) ;
        if ([phoneNumber_home count] !=0)
        {
            [section_LabelType setObject:person.phoneNumber_home forKey:@"1"];
            [section_Names setObject:person.phoneNumber_Work forKey:@"1"];
        }
        if ([address count] !=0)
        {
            [section_LabelType setObject:address_LabelType forKey:@"2"];
            [section_Names setObject:address forKey:@"2"];
            
        }
        if ([emailIDs count] !=0) {
            
            [section_LabelType setObject:emailIDs_LabelType forKey:@"3"];
            [section_Names setObject:emailIDs forKey:@"3"];
        }
        if ([socialProfiles count] !=0)
        {
            [section_LabelType setObject:socialProfiles_LabelType forKey:@"4"];
            [section_Names setObject:socialProfiles forKey:@"4"];
            
        }
        if ([IMProfiles count] !=0)
        {
            [section_LabelType setObject:IMProfiles_LabelType forKey:@"5"];
            [section_Names setObject:IMProfiles forKey:@"5"];
        }
        if ([URLs count] !=0)
        {
            [section_LabelType setObject:URLs_LabelType forKey:@"6"];
            [section_Names setObject:URLs forKey:@"6"];
        }
        if ([dates count] !=0)
        {
            [section_LabelType setObject:dates_LabelType forKey:@"7"];
            [section_Names setObject:dates forKey:@"7"];
        }
        
       
    }
    return self;
}
-(void)back_btnAction
{
     per.fullName=first_Name.text;
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
   // return  [[section_Names objectForKey:[[section_Names allKeys] objectAtIndex:section]] count];
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        //cell.textLabel.font=[UIFont systemFontOfSize:13];
        cell.selectionStyle=UITableViewCellSelectionStyleGray;
        cell.textLabel.textColor=[UIColor blackColor];
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
        
        UILabel *lblType = [[UILabel alloc]init];
       
        lblType.numberOfLines=2;
        lblType.frame=CGRectMake(20, 0, 100, 25);
        lblType.tag = 41;
        lblType.font = [UIFont systemFontOfSize:12];
        lblType.backgroundColor = [UIColor clearColor];
        lblType.textColor = [UIColor blueColor];
        [cell.contentView addSubview:lblType];
        
        UILabel *line = [[UILabel alloc]init];
        line.frame=CGRectMake(110, 3, 1, 19);
        line.tag = 43;
        line.backgroundColor = [UIColor lightGrayColor];
        [cell.contentView addSubview:line];

        
        UILabel *lblMainLabel = [[UILabel alloc]init];
        lblMainLabel.tag = 42;
        lblMainLabel.numberOfLines=2;
        lblMainLabel.frame=CGRectMake(125, 0, 170, 25);
        lblMainLabel.font = [UIFont systemFontOfSize:12];
        lblMainLabel.backgroundColor = [UIColor clearColor];
        lblMainLabel.textColor = [UIColor blackColor];
        [cell.contentView addSubview:lblMainLabel];
    }
    
    
    
    
    if ([indexPath section] == 1) {
        UITableViewCell *first_Cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil] ;
        
        UILabel *lblType = [[UILabel alloc]init];
        lblType.frame=CGRectMake(20, 0, 100, 100);
        lblType.numberOfLines=1;
        lblType.tag = 41;
        lblType.font = [UIFont systemFontOfSize:12];
        lblType.backgroundColor = [UIColor clearColor];
        lblType.textColor = [UIColor blueColor];
        
        UILabel *line = [[UILabel alloc]init];
        line.frame=CGRectMake(110, 3, 1, 93);
        line.tag = 43;
        line.backgroundColor = [UIColor lightGrayColor];
        
        
        UILabel *lblMainLabel = [[UILabel alloc]init];
        lblMainLabel.tag = 42;
        lblMainLabel.textAlignment=NSTextAlignmentLeft;
        lblMainLabel.frame=CGRectMake(125, 0, 170, 100);
        lblMainLabel.numberOfLines=8;
        lblMainLabel.font = [UIFont systemFontOfSize:12];
        lblMainLabel.backgroundColor = [UIColor clearColor];
        lblMainLabel.textColor = [UIColor blackColor];
        
        
        
        lblType.text= [[[per.phone allKeys] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)] objectAtIndex:indexPath.row];
        lblMainLabel.text=[per.phone objectForKey:[[[per.phone allKeys] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)] objectAtIndex:indexPath.row]];
//        lblType.text=[[section_LabelType objectForKey:[[[section_LabelType allKeys] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)] objectAtIndex:indexPath.section]] objectAtIndex:indexPath.row];
//        
//
//        lblMainLabel.text=[[section_Names objectForKey:[[[section_Names allKeys] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)] objectAtIndex:indexPath.section]] objectAtIndex:indexPath.row];

        first_Cell.accessoryType=UITableViewCellAccessoryCheckmark;
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
    //return cell;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    int height;
    if (indexPath.section==1)
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
   
    NSLog(@"*******  %@",[[[section_Names allKeys] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)] objectAtIndex:indexPath.section] );
    if([tableView cellForRowAtIndexPath:indexPath].accessoryType == UITableViewCellAccessoryCheckmark)
    {
        [tableView cellForRowAtIndexPath:indexPath].accessoryType = UITableViewCellAccessoryNone;
        
        
    }
    else
    {
        [tableView cellForRowAtIndexPath:indexPath].accessoryType = UITableViewCellAccessoryCheckmark;
        
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
    per.fullName=textField.text;
    
    return YES;
}
@end
