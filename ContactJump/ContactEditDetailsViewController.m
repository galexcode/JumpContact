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
    
    
    
    imgvw=[[UIImageView alloc] initWithFrame:CGRectMake(80, 80, 20, 20)];
    
    image=[UIImage imageNamed:@"check-box.png"];
    imgvw.image=image;
    
    img=[UIButton buttonWithType:UIButtonTypeCustom] ;
   
    [img setBackgroundColor:[UIColor clearColor]];
    if (per.pic ==nil) {
        [img setUserInteractionEnabled:FALSE];
        [img setBackgroundImage:[UIImage imageNamed:@"user.png"] forState:UIControlStateNormal];
        [img setBackgroundImage:[UIImage imageNamed:@"user.png"] forState:UIControlStateSelected];
    }
    else{
        [img setBackgroundImage:per.pic forState:UIControlStateNormal];
        [img setBackgroundImage:per.pic forState:UIControlStateSelected];
        image=[UIImage imageNamed:@"check-box.png"];
        [img setSelected:YES];
        
    }
    [img addTarget:self action:@selector(sendImage:) forControlEvents:UIControlEventTouchUpInside];
    [mainbg_img addSubview:img];
    
    [img addSubview:imgvw];
    
    
    
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

-(void)sendImage:(id)sender
{
    if ([sender isSelected]) {
        [sender setSelected:NO];
        image=[UIImage imageNamed:@"check-box-disable.png"];
        imgvw.image=image;
        per.editablePic=nil;
    } else {
        [sender setSelected:YES];
        image=[UIImage imageNamed:@"check-box.png"];
        imgvw.image=image;
        per.editablePic=per.pic;
    }
   
}
- (id)initWithPerson:(Person *)person
{
    
    per=person;
   
    
    section_Names=[[NSMutableDictionary alloc] init];
    [section_Names removeAllObjects];
    section_LabelType=[[NSMutableDictionary alloc] init];
    [section_LabelType removeAllObjects];
     self.checkboxClicked_Dict=[[NSMutableDictionary alloc] init];
    if (self) {
        
      
    //=================================================BASIC INFO===================================================
        fname = person.fullName ;
        lname = person.lastName ;
        cname=person.companyName;
        
//        img.image=person.pic;
//        NSLog(@"IMAGE :::%@",img.image);
   
       per.editablePic=person.pic;
        if ([person.phoneNumber_Value count] !=0)
        {
            [section_LabelType setObject:person.phoneNumber_Type forKey:@"1"];
            [section_Names setObject:person.phoneNumber_Value forKey:@"1"];
           [self.checkboxClicked_Dict setValue:[[NSMutableArray alloc] init] forKey:@"1"];
        }
        if ([person.address_Value count] !=0)
        {
            [section_LabelType setObject:person.address_Type forKey:@"2"];
            [section_Names setObject:person.address_Value forKey:@"2"];
            [self.checkboxClicked_Dict setValue:[[NSMutableArray alloc] init] forKey:@"2"];
            
        }
        if ([person.email_Value count] !=0) {
            
            [section_LabelType setObject:person.email_Type forKey:@"3"];
            [section_Names setObject:person.email_Value forKey:@"3"];
            [self.checkboxClicked_Dict setValue:[[NSMutableArray alloc] init] forKey:@"3"];
            
        }
        if ([person.socialProfile_Value count] !=0)
        {
            [section_LabelType setObject:person.socialProfile_Type forKey:@"4"];
            [section_Names setObject:person.socialProfile_Value forKey:@"4"];
            [self.checkboxClicked_Dict setValue:[[NSMutableArray alloc] init] forKey:@"4"];
            
        }
        if ([person.IM_Value count] !=0)
        {
            [section_LabelType setObject:person.IM_Type forKey:@"5"];
            [section_Names setObject:person.IM_Value forKey:@"5"];
            [self.checkboxClicked_Dict setValue:[[NSMutableArray alloc] init] forKey:@"5"];
            
        }
        if ([person.url_Value count] !=0)
        {
            [section_LabelType setObject:person.url_Type forKey:@"6"];
            [section_Names setObject:person.url_Value forKey:@"6"];
            [self.checkboxClicked_Dict setValue:[[NSMutableArray alloc] init] forKey:@"6"];
            
        }
        if ([person.date_Value count] !=0)
        {
            [section_LabelType setObject:person.date_Type forKey:@"7"];
            [section_Names setObject:person.date_Value forKey:@"7"];
            [self.checkboxClicked_Dict setValue:[[NSMutableArray alloc] init] forKey:@"7"];
            
        }
        
        for (int i=0; i<[person.phoneNumber_Value count]; i++) {
            [[self.checkboxClicked_Dict objectForKey:@"1"] addObject:@"1"];
        }
        for (int i=0; i<[person.address_Value count]; i++) {
            [[self.checkboxClicked_Dict objectForKey:@"2"] addObject:@"1"];
        }
        for (int i=0; i<[person.email_Value count]; i++) {
            [[self.checkboxClicked_Dict objectForKey:@"3"] addObject:@"1"];
        }
        for (int i=0; i<[person.socialProfile_Value count]; i++) {
            [[self.checkboxClicked_Dict objectForKey:@"4"] addObject:@"1"];
        }
        for (int i=0; i<[person.IM_Value count]; i++) {
            [[self.checkboxClicked_Dict objectForKey:@"5"] addObject:@"1"];
        }
        for (int i=0; i<[person.url_Value count]; i++) {
            [[self.checkboxClicked_Dict objectForKey:@"6"] addObject:@"1"];
        }
        for (int i=0; i<[person.date_Value count]; i++) {
            [[self.checkboxClicked_Dict objectForKey:@"7"] addObject:@"1"];
        }
        
    }
    return self;
}
-(void)back_btnAction
{
     per.fullName=first_Name.text;
    if (![img isSelected]) {
       
        per.editablePic=nil;
    }
    
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
        
        UIButton *checkBox=[UIButton buttonWithType:UIButtonTypeCustom];
        checkBox.tag=39;
        checkBox.frame=CGRectMake(15,5, 15, 15);
        [cell.contentView addSubview:checkBox];
        [checkBox setImage:[UIImage imageNamed:@"check-box-inactive.png"] forState:UIControlStateNormal];
        [checkBox setImage:[UIImage imageNamed:@"cehck-box-active.png"] forState:UIControlStateSelected];
        [checkBox addTarget:self action:@selector(checkBoxClicked:) forControlEvents:UIControlEventTouchUpInside];
       
        
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
       
       
       UIButton *checkBox=[UIButton buttonWithType:UIButtonTypeCustom];
       checkBox.tag=39;
       checkBox.frame=CGRectMake(15,42.5, 15, 15);
       [first_Cell.contentView addSubview:checkBox];
       [checkBox setImage:[UIImage imageNamed:@"check-box-inactive.png"] forState:UIControlStateNormal];
       [checkBox setImage:[UIImage imageNamed:@"cehck-box-active.png"] forState:UIControlStateSelected];
       [checkBox addTarget:self action:@selector(checkBoxClicked:) forControlEvents:UIControlEventTouchUpInside];

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
        
       

        
       
        if ([[[self.checkboxClicked_Dict objectForKey:[[[section_Names allKeys] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)] objectAtIndex:indexPath.section]] objectAtIndex:indexPath.row] isEqualToString:@"0"]) {
            [checkBox setSelected:NO];
            
        } else {
            [checkBox setSelected:YES];
            
        }

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

        
        
        UIButton *checkBox=(UIButton*)[cell viewWithTag:39];
        if ([[[self.checkboxClicked_Dict objectForKey:[[[section_Names allKeys] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)] objectAtIndex:indexPath.section]] objectAtIndex:indexPath.row] isEqualToString:@"0"]) {
            [checkBox setSelected:NO];
            
        } else {
            [checkBox setSelected:YES];
            
        }
        return cell;
    }
    //return cell;
    
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
    
    if ([tappedButton isSelected]) {
        [tappedButton setSelected:NO];
        
        [[self.checkboxClicked_Dict objectForKey:[[[section_Names allKeys] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)] objectAtIndex:indexPath.section]] replaceObjectAtIndex:indexPath.row withObject:@"0"];
        
        
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
        NSLog(@"NOT SELECTED---%@",[[[section_Names allKeys] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)] objectAtIndex:indexPath.section]);
        
    }
    else {
        
        
        [[self.checkboxClicked_Dict objectForKey:[[[section_Names allKeys] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)] objectAtIndex:indexPath.section]] replaceObjectAtIndex:indexPath.row withObject:@"1"];
        
        
        [tappedButton setSelected:YES];
        
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
        

        NSLog(@"SELECTED---%@",[[[section_Names allKeys] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)] objectAtIndex:indexPath.section]);
        
    }
   
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
-(void)checkBoxClicked:(id)sender {
    
    
    //UIButton *editButton = (UIButton*)[[[sender superview] subviews] objectAtIndex:2];
    UIButton *tappedButton = (UIButton*)sender;
    
    
    UITableViewCell* cell;
    UITableView *tv;
    
    if (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"7.0"))
    {
        //UIView *contentView = (UIView *)[tappedButton superview];
        cell = (UITableViewCell *)[[[tappedButton superview] superview] superview];
        NSLog(@"[tappedButton superview]  ----%@",[[[tappedButton superview] superview] superview]);
        tv = (UITableView *)cell.superview.superview;
    }
    else
    {
        cell = (UITableViewCell*)[[tappedButton superview] superview];
        tv=(UITableView *)[[cell.contentView superview] superview];
    }
    
    
    NSIndexPath *indexPath = [(UITableView *)tv indexPathForCell:(UITableViewCell *)cell];
    
    
    
    
    if ([tappedButton isSelected]) {
        [tappedButton setSelected:NO];
       
        [[self.checkboxClicked_Dict objectForKey:[[[section_Names allKeys] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)] objectAtIndex:indexPath.section]] replaceObjectAtIndex:indexPath.row withObject:@"0"];
        

      
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
    else {
        

        [[self.checkboxClicked_Dict objectForKey:[[[section_Names allKeys] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)] objectAtIndex:indexPath.section]] replaceObjectAtIndex:indexPath.row withObject:@"1"];
        
       
        [tappedButton setSelected:YES];
        
        [[self.checkboxClicked_Dict objectForKey:[[[section_Names allKeys] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)] objectAtIndex:indexPath.section]] replaceObjectAtIndex:indexPath.row withObject:@"1"];
        
        
        [tappedButton setSelected:YES];
        
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
        

        NSLog(@"SELECTED---%@",[[[section_Names allKeys] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)] objectAtIndex:indexPath.section]);
        
    }
    
    NSLog(@"CHECK BOX -----%@",self.checkboxClicked_Dict);
    
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
