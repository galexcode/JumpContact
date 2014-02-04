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
   
       
        if ([person.phoneNumber_Value count] !=0)
        {
            [section_LabelType setObject:person.phoneNumber_Type forKey:@"1"];
            [section_Names setObject:person.phoneNumber_Value forKey:@"1"];
           
        }
        if ([person.address_Value count] !=0)
        {
            [section_LabelType setObject:person.address_Type forKey:@"2"];
            [section_Names setObject:person.address_Value forKey:@"2"];
            
            
        }
        if ([person.email_Value count] !=0) {
            
            [section_LabelType setObject:person.email_Type forKey:@"3"];
            [section_Names setObject:person.email_Value forKey:@"3"];
            
            
        }
        if ([person.socialProfile_Value count] !=0)
        {
            [section_LabelType setObject:person.socialProfile_Type forKey:@"4"];
            [section_Names setObject:person.socialProfile_Value forKey:@"4"];
            
            
        }
        if ([person.IM_Value count] !=0)
        {
            [section_LabelType setObject:person.IM_Type forKey:@"5"];
            [section_Names setObject:person.IM_Value forKey:@"5"];
            
            
        }
        if ([person.url_Value count] !=0)
        {
            [section_LabelType setObject:person.url_Type forKey:@"6"];
            [section_Names setObject:person.url_Value forKey:@"6"];
            
            
        }
        if ([person.date_Value count] !=0)
        {
            [section_LabelType setObject:person.date_Type forKey:@"7"];
            [section_Names setObject:person.date_Value forKey:@"7"];
            
            
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
        
      
        
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
       
        
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
    
    
    
    
    if ([indexPath section] == 1) {
        UITableViewCell *first_Cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil] ;
        
        UILabel *lblType = [[UILabel alloc]init];
        lblType.frame=CGRectMake(40, 0, 100, 100);
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
        
        
        
       
        lblType.text=[[section_LabelType objectForKey:[[[section_LabelType allKeys] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)] objectAtIndex:indexPath.section]] objectAtIndex:indexPath.row];
        

        lblMainLabel.text=[[section_Names objectForKey:[[[section_Names allKeys] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)] objectAtIndex:indexPath.section]] objectAtIndex:indexPath.row];

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
   
   
    if([tableView cellForRowAtIndexPath:indexPath].accessoryType == UITableViewCellAccessoryCheckmark)
    {
        [tableView cellForRowAtIndexPath:indexPath].accessoryType = UITableViewCellAccessoryNone;
       
        if ([[[[section_Names allKeys] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)] objectAtIndex:indexPath.section] isEqualToString:@"1"])
        {
            [per.editablePhoneNumber_Value replaceObjectAtIndex:indexPath.row withObject:@""];
            [per.editablePhoneNumber_Type replaceObjectAtIndex:indexPath.row withObject:@""];
            NSLog(@"----------%@",[per.phoneNumber_Value objectAtIndex:indexPath.row]);
        }
        else if ([[[[section_Names allKeys] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)] objectAtIndex:indexPath.section] isEqualToString:@"2"])
        {
             [per.editableAddress_Value replaceObjectAtIndex:indexPath.row withObject:@""];
             [per.editableAddress_Type replaceObjectAtIndex:indexPath.row withObject:@""];
        }
        else if ([[[[section_Names allKeys] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)] objectAtIndex:indexPath.section] isEqualToString:@"3"])
        {
            [per.editableEmail_Type replaceObjectAtIndex:indexPath.row withObject:@""];
            [per.editableEmail_Value replaceObjectAtIndex:indexPath.row withObject:@""];
        }
        else if ([[[[section_Names allKeys] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)] objectAtIndex:indexPath.section] isEqualToString:@"4"])
        {
            [per.editableSocialProfile_Type replaceObjectAtIndex:indexPath.row withObject:@""];
            [per.editableSocialProfile_Value replaceObjectAtIndex:indexPath.row withObject:@""];
        }
        else if ([[[[section_Names allKeys] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)] objectAtIndex:indexPath.section] isEqualToString:@"5"])
        {
            [per.editableIM_Type replaceObjectAtIndex:indexPath.row withObject:@""];
            [per.editableIM_Value replaceObjectAtIndex:indexPath.row withObject:@""];
        }
        else if ([[[[section_Names allKeys] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)] objectAtIndex:indexPath.section] isEqualToString:@"6"])
        {
            [per.editableUrl_Type replaceObjectAtIndex:indexPath.row withObject:@""];
            [per.editableUrl_Value replaceObjectAtIndex:indexPath.row withObject:@""];
        }
        else if ([[[[section_Names allKeys] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)] objectAtIndex:indexPath.section] isEqualToString:@"7"])
        {
            [per.editableDate_Type replaceObjectAtIndex:indexPath.row withObject:@""];
            [per.editableDate_Value replaceObjectAtIndex:indexPath.row withObject:@""];
        }
        
    }
    else
    {
        [tableView cellForRowAtIndexPath:indexPath].accessoryType = UITableViewCellAccessoryCheckmark;
        
        NSLog(@"%@",[per.phoneNumber_Value objectAtIndex:indexPath.row]);
        if ([[[[section_Names allKeys] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)] objectAtIndex:indexPath.section] isEqualToString:@"1"])
        {
            [per.editablePhoneNumber_Value replaceObjectAtIndex:indexPath.row withObject:[per.phoneNumber_Value objectAtIndex:indexPath.row]];
            [per.editablePhoneNumber_Type replaceObjectAtIndex:indexPath.row withObject:[per.phoneNumber_Type objectAtIndex:indexPath.row]];
            
        }
        else if ([[[[section_Names allKeys] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)] objectAtIndex:indexPath.section] isEqualToString:@"2"])
        {
            [per.editableAddress_Value replaceObjectAtIndex:indexPath.row withObject:[per.address_Value objectAtIndex:indexPath.row]];
            [per.editableAddress_Type replaceObjectAtIndex:indexPath.row withObject:[per.address_Type objectAtIndex:indexPath.row]];
        }
        else if ([[[[section_Names allKeys] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)] objectAtIndex:indexPath.section] isEqualToString:@"3"])
        {
            [per.editableEmail_Type replaceObjectAtIndex:indexPath.row withObject:[per.email_Type objectAtIndex:indexPath.row]];
            [per.editableEmail_Value replaceObjectAtIndex:indexPath.row withObject:[per.email_Value objectAtIndex:indexPath.row]];
        }
        else if ([[[[section_Names allKeys] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)] objectAtIndex:indexPath.section] isEqualToString:@"4"])
        {
            [per.editableSocialProfile_Type replaceObjectAtIndex:indexPath.row withObject:[per.socialProfile_Type objectAtIndex:indexPath.row]];
            [per.editableSocialProfile_Value replaceObjectAtIndex:indexPath.row withObject:[per.socialProfile_Value objectAtIndex:indexPath.row]];
        }
        else if ([[[[section_Names allKeys] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)] objectAtIndex:indexPath.section] isEqualToString:@"5"])
        {
            [per.editableIM_Type replaceObjectAtIndex:indexPath.row withObject:[per.IM_Type objectAtIndex:indexPath.row]];
            [per.editableIM_Value replaceObjectAtIndex:indexPath.row withObject:[per.IM_Value objectAtIndex:indexPath.row]];
        }
        else if ([[[[section_Names allKeys] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)] objectAtIndex:indexPath.section] isEqualToString:@"6"])
        {
            [per.editableUrl_Type replaceObjectAtIndex:indexPath.row withObject:[per.url_Type objectAtIndex:indexPath.row]];
            [per.editableUrl_Value replaceObjectAtIndex:indexPath.row withObject:[per.url_Value objectAtIndex:indexPath.row]];
        }
        else if ([[[[section_Names allKeys] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)] objectAtIndex:indexPath.section] isEqualToString:@"7"])
        {
            [per.editableDate_Type replaceObjectAtIndex:indexPath.row withObject:[per.date_Type objectAtIndex:indexPath.row]];
            [per.editableDate_Value replaceObjectAtIndex:indexPath.row withObject:[per.date_Value objectAtIndex:indexPath.row]];
        }

        
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
