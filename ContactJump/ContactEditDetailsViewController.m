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
    [mainbg_img setImage:[UIImage imageNamed:@"Min-bg.png"]];
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
    first_Name.textColor=[UIColor whiteColor];
    first_Name.placeholder=@"First name";
    first_Name.text=fname;
    first_Name.delegate = self;
    [mainbg_img addSubview:first_Name];
    
    last_Name=[[UITextField alloc] init];
    [last_Name setBackgroundColor:[UIColor clearColor]];
    last_Name.placeholder=@"last name";
    last_Name.textColor=[UIColor whiteColor];
    last_Name.text=lname;
    last_Name.delegate = self;
    [mainbg_img addSubview:last_Name];
    
    
    company_Name=[[UITextField alloc] init];
    [company_Name setBackgroundColor:[UIColor clearColor]];
    company_Name.placeholder=@"Company name";
    company_Name.textColor=[UIColor whiteColor];
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
    
    phoneNumber_home=[[NSMutableArray alloc] init];
    address=[[NSMutableArray alloc] init];
    emailIDs=[[NSMutableArray alloc] init];
    socialProfiles=[[NSMutableArray alloc] init];
    IMProfiles=[[NSMutableArray alloc] init];
    URLs=[[NSMutableArray alloc] init];
    dates=[[NSMutableArray alloc] init];
    
    if (self) {
        
        
    //=================================================BASIC INFO===================================================
        fname = person.firstName ;
        lname = person.lastName ;
        
        
        
    //=================================================PHONE NUMBERS===================================================
        
        for (int i=0; i<[person.phoneNumber_home count]; i++) {
            if ([person.phoneNumber_home objectAtIndex:i] !=Nil)
            {
                [phoneNumber_home addObject:@"Home"];
                [phoneNumber_home addObject:[NSString stringWithFormat:@"%@",[person.phoneNumber_home objectAtIndex:i]] ];
            }
            
        }
        for (int i=0; i<[person.phoneNumber_HomeFax count]; i++)
        {
            if ([person.phoneNumber_HomeFax objectAtIndex:i] !=Nil)
            {
                [phoneNumber_home addObject:@"Home Fax"];
                [phoneNumber_home addObject:[NSString stringWithFormat:@"%@",[person.phoneNumber_HomeFax objectAtIndex:i]] ];
            }
            
        }
        for (int i=0; i<[person.phoneNumber_iPhone count]; i++)
        {
            if ([person.phoneNumber_iPhone objectAtIndex:i] !=Nil)
            {
                [phoneNumber_home addObject:@"iPhone"];
                [phoneNumber_home addObject:[NSString stringWithFormat:@"%@",[person.phoneNumber_iPhone objectAtIndex:i]] ];
            }
            
        }
        for (int i=0; i<[person.phoneNumber_main count]; i++)
        {
            if ([person.phoneNumber_main objectAtIndex:i] !=Nil)
            {
                [phoneNumber_home addObject:@"Main"];
                [phoneNumber_home addObject:[NSString stringWithFormat:@"%@",[person.phoneNumber_main objectAtIndex:i]] ];
            }
            
        }
        for (int i=0; i<[person.phoneNumber_mobile count]; i++)
        {
            if ([person.phoneNumber_mobile objectAtIndex:i] !=Nil)
            {
                [phoneNumber_home addObject:@"Mobile"];
                [phoneNumber_home addObject:[NSString stringWithFormat:@"%@",[person.phoneNumber_mobile objectAtIndex:i]] ];
            }
            
        }
        for (int i=0; i<[person.phoneNumber_other count]; i++)
        {
            if ([person.phoneNumber_other objectAtIndex:i] !=Nil)
            {
                [phoneNumber_home addObject:@"Other"];
                [phoneNumber_home addObject:[NSString stringWithFormat:@"%@",[person.phoneNumber_other objectAtIndex:i]] ];
            }
            
        }
        for (int i=0; i<[person.phoneNumber_Pager count]; i++) {
            if ([person.phoneNumber_Pager objectAtIndex:i] !=Nil)
            {
                [phoneNumber_home addObject:@"Pager"];
                [phoneNumber_home addObject:[NSString stringWithFormat:@"%@",[person.phoneNumber_Pager objectAtIndex:i]] ];
            }
            
        }
        for (int i=0; i<[person.phoneNumber_Work count]; i++) {
            if ([person.phoneNumber_Work objectAtIndex:i] !=Nil) {
                [phoneNumber_home addObject:@"Work"];
                [phoneNumber_home addObject:[NSString stringWithFormat:@"%@",[person.phoneNumber_Work objectAtIndex:i]] ];
            }
            
        }
        for (int i=0; i<[person.phoneNumber_WorkFax count]; i++) {
            if ([person.phoneNumber_WorkFax objectAtIndex:i] !=Nil) {
                [phoneNumber_home addObject:@"Work Fax"];
                [phoneNumber_home addObject:[NSString stringWithFormat:@"%@",[person.phoneNumber_WorkFax objectAtIndex:i]] ];
            }
            
        }
       
        
    //=================================================ADDRESS===================================================
        for (int i=0; i<[person.address_home count]; i++)
        {
            if ([person.address_home objectAtIndex:i] !=Nil)
            {
                [address addObject:@"Home"];
                [address addObject:[NSString stringWithFormat:@"%@",[person.address_home objectAtIndex:i]]];
            }
        }
        for (int i=0; i<[person.address_work count]; i++)
        {
            if ([person.address_work objectAtIndex:i] !=Nil)
            {
                [address addObject:@"Work"];
                [address addObject:[NSString stringWithFormat:@"%@",[person.address_work objectAtIndex:i]]];
            }
        }
        
        for (int i=0; i<[person.address_other count]; i++)
        {
            if ([person.address_other objectAtIndex:i] !=Nil)
            {
                [address addObject:@"Other"];
                [address addObject:[NSString stringWithFormat:@"%@",[person.address_other objectAtIndex:i]]];
            }
        }
        
    //=================================================EMAIL IDs===================================================
        
        for (int i=0; i<[person.email_home count]; i++)
        {
            if ([person.email_home objectAtIndex:i] !=Nil)
            {
                [emailIDs addObject:@"Home"];
                [emailIDs addObject:[NSString stringWithFormat:@"%@",[person.email_home objectAtIndex:i]]];
            }
        }
        for (int i=0; i<[person.email_other count]; i++)
        {
            if ([person.email_other objectAtIndex:i] !=Nil)
            {
                [emailIDs addObject:@"Other"];
                [emailIDs addObject:[NSString stringWithFormat:@"%@",[person.email_other objectAtIndex:i]]];
            }
        }
        for (int i=0; i<[person.email_iCloud count]; i++)
        {
            if ([person.email_iCloud objectAtIndex:i] !=Nil)
            {
                [emailIDs addObject:@"iCloud"];
                [emailIDs addObject:[NSString stringWithFormat:@"%@",[person.email_iCloud objectAtIndex:i]]];
            }
        }
        for (int i=0; i<[person.email_work count]; i++)
        {
            if ([person.email_work objectAtIndex:i] !=Nil)
            {
                [emailIDs addObject:@"Work"];
                [emailIDs addObject:[NSString stringWithFormat:@"%@",[person.email_work objectAtIndex:i]]];
            }
        }
       
        //=================================================SOCIAL PROFILES===================================================
        
        for (int i=0; i<[person.socialProfile_Facebook count]; i++) {
            if ([person.socialProfile_Facebook objectAtIndex:i] !=Nil)
            {
                [socialProfiles addObject:@"Facebook ID"];
                [socialProfiles addObject:[NSString stringWithFormat:@"%@",[person.socialProfile_Facebook objectAtIndex:i]]];
            }
        }
        
        for (int i=0; i<[person.socialProfile_Flickr count]; i++) {
            if ([person.socialProfile_Flickr objectAtIndex:i] !=Nil)
            {
                [socialProfiles addObject:@"Flickr ID"];
                [socialProfiles addObject:[NSString stringWithFormat:@"%@",[person.socialProfile_Flickr objectAtIndex:i]]];
            }
        }
        
        for (int i=0; i<[person.socialProfile_LinkedIn count]; i++) {
            if ([person.socialProfile_LinkedIn objectAtIndex:i] !=Nil)
            {
                [socialProfiles addObject:@"LinkedIn ID"];
                [socialProfiles addObject:[NSString stringWithFormat:@"%@",[person.socialProfile_LinkedIn objectAtIndex:i]]];
            }
        }
        for (int i=0; i<[person.socialProfile_MySpace count]; i++) {
            if ([person.socialProfile_MySpace objectAtIndex:i] !=Nil)
            {
                [socialProfiles addObject:@"MySpace ID"];
                [socialProfiles addObject:[NSString stringWithFormat:@"%@",[person.socialProfile_MySpace objectAtIndex:i]]];
            }
        }
        for (int i=0; i<[person.socialProfile_SinaWeibo count]; i++) {
            if ([person.socialProfile_SinaWeibo objectAtIndex:i] !=Nil)
            {
                [socialProfiles addObject:@"SinaWeibo ID"];
                [socialProfiles addObject:[NSString stringWithFormat:@"%@",[person.socialProfile_SinaWeibo objectAtIndex:i]]];
            }
        }
        for (int i=0; i<[person.socialProfile_Twitter count]; i++) {
            if ([person.socialProfile_Twitter objectAtIndex:i] !=Nil)
            {
                [socialProfiles addObject:@"Twitter ID"];
                [socialProfiles addObject:[NSString stringWithFormat:@"%@",[person.socialProfile_Twitter objectAtIndex:i]]];
            }
        }
        
        
        //=================================================IM PROFILES===================================================
        
        for (int i=0; i<[person.IM_AIM count]; i++) {
            if ([person.IM_AIM objectAtIndex:i] !=Nil)
            {
                [IMProfiles addObject:@"AIM ID"];
                [IMProfiles addObject:[NSString stringWithFormat:@"%@",[person.IM_AIM objectAtIndex:i]]];
            }
        }
        for (int i=0; i<[person.IM_AIM count]; i++) {
            if ([person.IM_AIM objectAtIndex:i] !=Nil)
            {
                [IMProfiles addObject:@"FACEBOOK ID"];
                [IMProfiles addObject:[NSString stringWithFormat:@"%@",[person.IM_FBMsg objectAtIndex:i]]];
            }
        }
        for (int i=0; i<[person.IM_AIM count]; i++) {
            if ([person.IM_AIM objectAtIndex:i] !=Nil)
            {
                [IMProfiles addObject:@"GADU-GADU ID"];
                [IMProfiles addObject:[NSString stringWithFormat:@"%@",[person.IM_GaduGadu objectAtIndex:i]]];
            }
        }
        for (int i=0; i<[person.IM_AIM count]; i++) {
            if ([person.IM_AIM objectAtIndex:i] !=Nil)
            {
                [IMProfiles addObject:@"GTALK ID"];
                [IMProfiles addObject:[NSString stringWithFormat:@"%@",[person.IM_GTalk objectAtIndex:i]]];
            }
        }
        for (int i=0; i<[person.IM_AIM count]; i++) {
            if ([person.IM_AIM objectAtIndex:i] !=Nil)
            {
                [IMProfiles addObject:@"ICQ ID"];
                [IMProfiles addObject:[NSString stringWithFormat:@"%@",[person.IM_ICQ objectAtIndex:i]]];
            }
        }
        for (int i=0; i<[person.IM_AIM count]; i++) {
            if ([person.IM_AIM objectAtIndex:i] !=Nil)
            {
                [IMProfiles addObject:@"JABBER ID"];
                [IMProfiles addObject:[NSString stringWithFormat:@"%@",[person.IM_Jabber objectAtIndex:i]]];
            }
        }
        for (int i=0; i<[person.IM_AIM count]; i++) {
            if ([person.IM_AIM objectAtIndex:i] !=Nil)
            {
                [IMProfiles addObject:@"MSN ID"];
                [IMProfiles addObject:[NSString stringWithFormat:@"%@",[person.IM_MSNMsg objectAtIndex:i]]];
            }
        }
        for (int i=0; i<[person.IM_AIM count]; i++) {
            if ([person.IM_AIM objectAtIndex:i] !=Nil)
            {
                [IMProfiles addObject:@"QQ ID"];
                [IMProfiles addObject:[NSString stringWithFormat:@"%@",[person.IM_QQ objectAtIndex:i]]];
            }
        }
        for (int i=0; i<[person.IM_YahooMsg count]; i++) {
            if ([person.IM_YahooMsg objectAtIndex:i] !=Nil)
            {
                [IMProfiles addObject:@"YAHOO ID"];
                [IMProfiles addObject:[NSString stringWithFormat:@"%@",[person.IM_YahooMsg objectAtIndex:i]]];
            }
        }
        for (int i=0; i<[person.IM_Skype count]; i++) {
            if ([person.IM_Skype objectAtIndex:i] !=Nil)
            {
                [IMProfiles addObject:@"SKYPE ID"];
                [IMProfiles addObject:[NSString stringWithFormat:@"%@",[person.IM_Skype objectAtIndex:i]]];
            }
        }
        
        //=================================================URLs===================================================
        
        for (int i=0; i<[person.url_home count]; i++)
        {
            if ([person.url_home objectAtIndex:i] !=Nil)
            {
                [URLs addObject:@"Home"];
                [URLs addObject:[NSString stringWithFormat:@"%@",[person.url_home objectAtIndex:i]]];
            }
        }
        for (int i=0; i<[person.url_homePage count]; i++)
        {
            if ([person.url_homePage objectAtIndex:i] !=Nil)
            {
                [URLs addObject:@"Home Page"];
                [URLs addObject:[NSString stringWithFormat:@"%@",[person.url_homePage objectAtIndex:i]]];
            }
        }
        for (int i=0; i<[person.url_other count]; i++)
        {
            if ([person.url_other objectAtIndex:i] !=Nil)
            {
                [URLs addObject:@"Other"];
                [URLs addObject:[NSString stringWithFormat:@"%@",[person.url_other objectAtIndex:i]]];
            }
        }
        for (int i=0; i<[person.url_work count]; i++)
        {
            if ([person.url_work objectAtIndex:i] !=Nil)
            {
                [URLs addObject:@"Work"];
                [URLs addObject:[NSString stringWithFormat:@"%@",[person.url_work objectAtIndex:i]]];
            }
        }
        
        //=================================================DATES===================================================
        
        for (int i=0; i<[person.date_other count]; i++)
        {
            if ([person.date_other objectAtIndex:i] !=Nil)
            {
                [dates addObject:@"Other"];
                [dates addObject:[NSString stringWithFormat:@"%@",[person.date_other objectAtIndex:i]]];
            }
        }
        for (int i=0; i<[person.date_Anniversary count]; i++)
        {
            if ([person.date_Anniversary objectAtIndex:i] !=Nil)
            {
                [dates addObject:@"Anniversary"];
                [dates addObject:[NSString stringWithFormat:@"%@",[person.date_Anniversary objectAtIndex:i]]];
            }
        }
        if (person.date_bday !=Nil) {
            [dates addObject:@"Birthday"];
            [dates addObject:person.date_bday];
        }
        
    }
    return self;
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
    return 7;
}
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSString *title_Header=nil;
    if (section==0) {
        title_Header=@"                          Phone";
    }
    else if (section==1){
        title_Header=@"                         Address";
    }
    else if (section==2){
        title_Header=@"                          Email";
    }

    else if (section==3){
        title_Header=@"                     Social Profile";
    }

    else if (section==4){
        title_Header=@"                   Instant Messaging";
    }
    else if (section==5){
        title_Header=@"                            URL";
    }
    else if (section==6){
        title_Header=@"                           Dates";
    }
    
    return title_Header;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    int rows;
    if (section==0) {
        rows=(int)[phoneNumber_home count];
    }
    else if (section==1)
    {
        rows=(int)[address count];
        
    }
    else if(section==2)
    {
        rows=(int)[emailIDs count];
    }
    else if(section==3)
    {
        rows=(int)[socialProfiles count];
    }
    else if(section==4)
    {
        rows=(int)[IMProfiles count];
    }
    else if(section==5)
    {
        rows=(int)[URLs count];
    }
    else {
        rows=(int)[dates count];
    }
    return  rows;
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:Nil];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
        cell.textLabel.font=[UIFont systemFontOfSize:13];
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
    }
    if (indexPath.section==0)
    {
       
            cell.textLabel.text=[phoneNumber_home objectAtIndex:indexPath.row];
        
        
    }
    else if (indexPath.section==1)
    {
        cell.textLabel.numberOfLines=8;
        
        cell.textLabel.text=[address objectAtIndex:indexPath.row];
        if ([cell.textLabel.text isEqualToString:@"Home"] ||[cell.textLabel.text isEqualToString:@"Work"]||[cell.textLabel.text isEqualToString:@"Other"]) {
            cell.textLabel.textColor=[UIColor blueColor];
        }

    }
    else if (indexPath.section==2)
    {
       
        cell.textLabel.text=[emailIDs objectAtIndex:indexPath.row];
        if ([cell.textLabel.text isEqualToString:@"Home"] ||[cell.textLabel.text isEqualToString:@"Work"]||[cell.textLabel.text isEqualToString:@"Other"] || [cell.textLabel.text isEqualToString:@"iCloud"]) {
            cell.textLabel.textColor=[UIColor blueColor];
        }
        
    }
    
    else if (indexPath.section==3)
    {
        
        cell.textLabel.text=[socialProfiles objectAtIndex:indexPath.row];
        if ([cell.textLabel.text isEqualToString:@"Facebook ID"] ||[cell.textLabel.text isEqualToString:@"Flickr ID"]||[cell.textLabel.text isEqualToString:@"MySpace ID"] || [cell.textLabel.text isEqualToString:@"SinaWeibo ID"] || [cell.textLabel.text isEqualToString:@"Twitter ID"] || [cell.textLabel.text isEqualToString:@"LinkedIn ID"]) {
            cell.textLabel.textColor=[UIColor blueColor];
        }
        
    }
    else if (indexPath.section==4)
    {
        
        cell.textLabel.text=[IMProfiles objectAtIndex:indexPath.row];
        if ([cell.textLabel.text isEqualToString:@"FACEBOOK ID"] ||[cell.textLabel.text isEqualToString:@"GTALK ID"]||[cell.textLabel.text isEqualToString:@"ICQ ID"] || [cell.textLabel.text isEqualToString:@"JABBER ID"] || [cell.textLabel.text isEqualToString:@"MSN ID"] || [cell.textLabel.text isEqualToString:@"QQ ID"] ||[cell.textLabel.text isEqualToString:@"AIM ID"]||[cell.textLabel.text isEqualToString:@"GADU-GADU ID"] ||[cell.textLabel.text isEqualToString:@"YAHOO ID"]||[cell.textLabel.text isEqualToString:@"SKYPE ID"]) {
            cell.textLabel.textColor=[UIColor blueColor];
        }
        
    }
    else if (indexPath.section==5)
    {
        
        cell.textLabel.text=[URLs objectAtIndex:indexPath.row];
        if ([cell.textLabel.text isEqualToString:@"Home"] ||[cell.textLabel.text isEqualToString:@"Home Page"]||[cell.textLabel.text isEqualToString:@"Other"] || [cell.textLabel.text isEqualToString:@"Work"] )
        {
            cell.textLabel.textColor=[UIColor blueColor];
        }
        
    }

    else if (indexPath.section==6)
    {
        
        cell.textLabel.text=[dates objectAtIndex:indexPath.row];
        if ([cell.textLabel.text isEqualToString:@"Anniversary"] ||[cell.textLabel.text isEqualToString:@"Other"]) {
            cell.textLabel.textColor=[UIColor blueColor];
        }
        
    }

    return cell;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    int height;
    if (indexPath.section==0)
    {
        height=23.0f;
    }
    else {
        height=50.0f;
    }
    return height;
}


#pragma TextField Delegate Method
-(void)textFieldDidBeginEditing:(UITextField *)textField{
    
    
    
    
    
//    UIScrollView *scrollview=(UIScrollView *)[self.view viewWithTag:111];
//    scrollview.scrollEnabled=YES;
//    
//    
//    [scrollview setContentOffset:CGPointMake(0, 100) animated:YES];
    
    
}

#pragma TextField Delegate Method
- (void)textFieldDidEndEditing:(UITextField *)textField{
    
    
    
//    UIScrollView *scrollview=(UIScrollView *)[self.view viewWithTag:111];
//    scrollview.scrollEnabled=YES;
//    [scrollview setContentOffset:CGPointMake(0, 0) animated:YES];
    
    
}
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
//    textField.textColor = [UIColor blackColor];
    return YES;
    
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    [textField resignFirstResponder];
   
    
    return YES;
}
@end
