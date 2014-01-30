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
    
    if (self) {
        
        
    //=================================================BASIC INFO===================================================
        fname = person.firstName ;
        lname = person.lastName ;
        
        
        
    //=================================================PHONE NUMBERS===================================================
        
        for (int i=0; i<[person.phoneNumber_home count]; i++) {
            if ([person.phoneNumber_home objectAtIndex:i] !=Nil) {
                [phoneNumber_home addObject:[NSString stringWithFormat:@"Home     : %@",[person.phoneNumber_home objectAtIndex:i]] ];
            }
            
        }
        if (person.phoneNumber_Work !=Nil)
            [phoneNumber_home addObject:[NSString stringWithFormat:@"Work      : %@",person.phoneNumber_Work]];
        if (person.phoneNumber_iPhone !=Nil)
            [phoneNumber_home addObject:[NSString stringWithFormat:@"iPhone   : %@",person.phoneNumber_iPhone]];
        if (person.phoneNumber_mobile !=Nil)
            [phoneNumber_home addObject:[NSString stringWithFormat:@"Mobile   : %@",person.phoneNumber_mobile]];
        if (person.phoneNumber_main !=Nil)
            [phoneNumber_home addObject:[NSString stringWithFormat:@"Main      : %@",person.phoneNumber_main]];
        if (person.phoneNumber_HomeFax !=Nil)
            [phoneNumber_home addObject:[NSString stringWithFormat:@"Home Fax : %@",person.phoneNumber_HomeFax]];
        if (person.phoneNumber_WorkFax !=Nil)
            [phoneNumber_home addObject:[NSString stringWithFormat:@"Work Fax  : %@",person.phoneNumber_WorkFax]];
        if (person.phoneNumber_Pager !=Nil)
            [phoneNumber_home addObject:[NSString stringWithFormat:@"Pager     : %@",person.phoneNumber_Pager]];
        if (person.phoneNumber_other !=Nil)
            [phoneNumber_home addObject:[NSString stringWithFormat:@"Other     : %@",person.phoneNumber_other]];
        
        
    //=================================================ADDRESS===================================================
        for (int i=0; i<[person.address_home count]; i++)
        {
            if ([person.address_home objectAtIndex:i] !=Nil)
            {
                [address addObject:@"Home"];
                [address addObject:[NSString stringWithFormat:@"%@",[person.address_home objectAtIndex:i]]];
            }
        }
        
        if (person.address_work !=Nil)
        {
            [address addObject:@"Work"];
            [address addObject:[NSString stringWithFormat:@"%@",person.address_work]];
        }
        
        
        if (person.address_other !=Nil)
        {
            [address addObject:@"Other"];
            [address addObject:[NSString stringWithFormat:@"%@",person.address_other]];
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
    return 5;
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
        title_Header=@"                    Social Profile";
    }

    else if (section==4){
        title_Header=@"                   Instant Messaging";
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
    else
    {
        rows=(int)[IMProfiles count];
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
        if ([cell.textLabel.text isEqualToString:@"Facebook ID"] ||[cell.textLabel.text isEqualToString:@"Flickr ID"]||[cell.textLabel.text isEqualToString:@"MySpace ID"] || [cell.textLabel.text isEqualToString:@"SinaWeibo ID"] || [cell.textLabel.text isEqualToString:@"Twitter ID"] || [cell.textLabel.text isEqualToString:@"LinkedIn ID"]) {
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
