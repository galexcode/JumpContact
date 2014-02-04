//
//  SelectContact toShareViewController.m
//  ContactJump
//
//  Created by Raman on 07/01/14.
//  Copyright (c) 2014 iyasoft. All rights reserved.
//

#import "SelectContact toShareViewController.h"
#import "SelectRecipientsViewController.h"
#import "ContactShareViaIDViewController.h"
#import  "KxMenu.h"


@interface SelectContact_toShareViewController ()

@end

@implementation SelectContact_toShareViewController

@synthesize isBulkContacts,string1;
static int k=0;

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
    k=0;
    if ([string1 isEqualToString:@"SHARE"])
    {
        isBulkContacts=NO;
    }
    else
    {
        isBulkContacts=YES;
    }
    
    
    
    obj=[ContactGlobalDataClass getInstance];
    [obj setFrom_ShareMethodViewController:@"0"];
    
    
    sectionIndex = [NSArray arrayWithObjects:
                    @"A", @"B", @"C", @"D",
                    @"E", @"F", @"G", @"H",
                    @"I", @"J", @"K", @"L", @"M",
                    @"N", @"O", @"P", @"Q", @"R",@"S",
                    @"T", @"U", @"V", @"W",@"X",@"Y",@"Z",
                    nil];
    self.alphabetsArray = [[NSMutableDictionary alloc] init];
    self.checkboxClicked_Dict = [[NSMutableDictionary alloc] init];
    
    
    
    BOOL found;
    
    
    for (Person *chr in obj.contactDetails)
    {
        NSString *c = [chr.fullName substringToIndex:1];
        
        found = NO;
        
        for (NSString *str in [self.alphabetsArray allKeys])
        {
            
            if ([str isEqualToString:c])
            {
                found = YES;
            }
        }
        
        if (!found)
        {
            [self.checkboxClicked_Dict setValue:[[NSMutableArray alloc] init] forKey:[NSString stringWithFormat:@"checked-%@",c]];
            [self.alphabetsArray setValue:[[NSMutableArray alloc] init] forKey:c];
        }
    }
    
    NSLog(@"---------------\n%@\n---------------",self.alphabetsArray);
    for (Person *person in obj.contactDetails)
    {
        
        
        [[self.alphabetsArray objectForKey:[person.fullName substringToIndex:1]] addObject:person];
        [[self.checkboxClicked_Dict objectForKey:[NSString stringWithFormat:@"checked-%@",[person.fullName substringToIndex:1]]] addObject:@"0"];
    }
    
    
    NSLog(@"\nARRRAY-----%@-------------\n CHECKED BOXES CLICKED \n%@",self.alphabetsArray,self.checkboxClicked_Dict );
    
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
    back_btn =[UIButton buttonWithType:UIButtonTypeCustom];
    [back_btn setBackgroundImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"back-button" ofType:@"png"]] forState:UIControlStateNormal];
    [back_btn addTarget:self action:@selector(back_btnAction) forControlEvents:UIControlEventTouchUpInside];
    [mainbg_img addSubview:back_btn];
    
#pragma mark setting button.
    UIButton *setting_btn =[UIButton buttonWithType:UIButtonTypeCustom];
    [setting_btn setBackgroundImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"done1" ofType:@"png"]] forState:UIControlStateNormal];
    [setting_btn addTarget:self action:@selector(done_btnAction) forControlEvents:UIControlEventTouchUpInside];
    [mainbg_img addSubview:setting_btn];
    
#pragma mark separator image.
    UIImageView  *seprator_image =[[UIImageView alloc] init];
    seprator_image.image=[UIImage imageNamed:@"seprator.png"];
    [mainbg_img addSubview:seprator_image];
    
#pragma mark topview.
    topview=[[UIView alloc]init];
    topview.backgroundColor=[UIColor whiteColor];
    [mainbg_img addSubview:topview];
    
#pragma mark check button.
    checkBox_all=[UIButton buttonWithType:UIButtonTypeCustom];
    [checkBox_all setImage:[UIImage imageNamed:@"check-box-inactive.png"] forState:UIControlStateNormal];
    [checkBox_all setImage:[UIImage imageNamed:@"cehck-box-active.png"] forState:UIControlStateSelected];
    [checkBox_all addTarget:self action:@selector(checkBoxClicked1:) forControlEvents:UIControlEventTouchUpInside];
    [checkBox_all setSelected:NO];
    [topview addSubview:checkBox_all];
    
    
    
#pragma mark select all label.
    selectAll_lbl=[[UILabel alloc] init];
    selectAll_lbl.text=[NSString stringWithFormat:@"Select All"];
    selectAll_lbl.textAlignment=0;
    selectAll_lbl.textColor= [UIColor blackColor];
    selectAll_lbl.backgroundColor=[UIColor clearColor];
    selectAll_lbl.font=[UIFont fontWithName:@"AmericanTypewriter" size:16];
    selectAll_lbl.shadowColor = [UIColor whiteColor];
    selectAll_lbl.shadowOffset = CGSizeMake(0,0);
    [topview addSubview:selectAll_lbl];
    
    UIButton   * checkBox_all1=[UIButton buttonWithType:UIButtonTypeCustom];
    [checkBox_all1 setBackgroundColor:[UIColor clearColor]];
    [checkBox_all1 addTarget:self action:@selector(checkBoxClicked1:) forControlEvents:UIControlEventTouchUpInside];
    [topview addSubview:checkBox_all1];
    
#pragma mark number of selected contacts label.
    noofselected=[[UILabel alloc] init];
    noofselected.text=@" ";
    noofselected.textAlignment=1;
    noofselected.textColor= [UIColor blackColor];
    noofselected.backgroundColor=[UIColor clearColor];
    noofselected.font=[UIFont fontWithName:@"AmericanTypewriter" size:12];
    noofselected.shadowColor = [UIColor whiteColor];
    noofselected.shadowOffset = CGSizeMake(0,0);
    [topview addSubview:noofselected];
    
#pragma Navigation Bar Title
    navbartitle=[[UILabel alloc] init];
    navbartitle.text=[NSString stringWithFormat:@"Select Contacts"];
    navbartitle.textAlignment=1;
    navbartitle.textColor= [UIColor whiteColor];
    navbartitle.backgroundColor=[UIColor clearColor];
    navbartitle.font=[UIFont fontWithName:@"AmericanTypewriter" size:18];
    navbartitle.shadowColor = [UIColor whiteColor];
    navbartitle.shadowOffset = CGSizeMake(0,0);
    [mainbg_img addSubview:navbartitle];
    
#pragma mark UITableview.
    tableview=[[UITableView alloc]init];
    tableview.backgroundColor=[UIColor whiteColor];
    tableview.delegate=self;
    tableview.dataSource=self;
    [mainbg_img addSubview:tableview];
    tableview.sectionIndexColor=[UIColor darkGrayColor];
    
    if (IS_IPHONE_5) {
        nav_img.frame=CGRectMake(0, 0, 320, 90);
        mainbg_img.frame=CGRectMake(0,0, 320, 568);
        setting_btn.frame=CGRectMake(230,0, 90,90);
        back_btn.frame=CGRectMake(15, 14, 33, 54);
        navbartitle.frame=CGRectMake(0,20,320,50);
        
        topview.frame=CGRectMake(0, 91, 320, 45);
        checkBox_all.frame=CGRectMake(20,15, 15, 15);
        selectAll_lbl.frame=CGRectMake(40,8,80,30);
        checkBox_all1.frame=CGRectMake(40,8,80,30);
        noofselected.frame=CGRectMake(185,10,135,25);
        tableview.frame=CGRectMake(0, 136, 320, 432);
        
        
    }
    else
    {
        
        nav_img.frame=CGRectMake(0, 0, 320, 80);
        mainbg_img.frame=CGRectMake(0,0, 320, 480);
        setting_btn.frame=CGRectMake(230,0, 90,90);
        back_btn.frame=CGRectMake(15, 13, 33, 54);
        navbartitle.frame=CGRectMake(0,20,320,50);
        
        topview.frame=CGRectMake(0, 81, 320, 45);
        checkBox_all.frame=CGRectMake(20,15, 15, 15);
        selectAll_lbl.frame=CGRectMake(40,8,80,30);
        checkBox_all1.frame=CGRectMake(40,8,80,30);
        noofselected.frame=CGRectMake(185,10,135,25);
        tableview.frame=CGRectMake(0, 126.5, 320, 353);
        
        
        
        
    }
    
	
}
-(void)viewWillAppear:(BOOL)animated
{
    [tableview reloadData];
    if ([obj.backBtnActivate isEqualToString:@"0"] )
    {
        [back_btn setHidden:NO];
    }
    else
    {
        [back_btn setHidden:YES];
    }
}
-(void)Setting_btnAction
{
    NSLog(@"BtnAction");
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}


- (void)viewDidUnload {
    
    
    [super viewDidUnload];
    
}



#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return [[self.alphabetsArray allKeys] count];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return  [[self.alphabetsArray valueForKey:[[[self.alphabetsArray allKeys] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)] objectAtIndex:section]] count];
    
}
- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    return sectionIndex;
}

- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index {
    
    return index;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:nil];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Nil];
        cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
    }
    
    NSLog(@"sssssss----\n%@",[(Person*)[[self.alphabetsArray valueForKey:[[[self.alphabetsArray allKeys] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)] objectAtIndex:indexPath.section]] objectAtIndex:indexPath.row] fullName]);
    
    
    
    name_lbl=[[UILabel alloc] init];
    
    name_lbl.frame=CGRectMake(60, 10, 150, 30);
    name_lbl.textAlignment=0;
    [name_lbl setTag:1];
    Person *p=[[self.alphabetsArray valueForKey:[[[self.alphabetsArray allKeys] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)] objectAtIndex:indexPath.section]] objectAtIndex:indexPath.row];
    if ([p.fullName isEqualToString:@"#"]) {
        name_lbl.text=[NSString stringWithFormat:@"No Name"];
    } else {
        name_lbl.text=[NSString stringWithFormat:@"%@",p.fullName];
    }
    
    name_lbl.textColor= [UIColor blackColor];
    name_lbl.backgroundColor=[UIColor clearColor];
    name_lbl.font=[UIFont fontWithName:@"ArialMT" size:15];
    name_lbl.shadowColor = [UIColor whiteColor];
    name_lbl.shadowOffset = CGSizeMake(0,0);
    [cell.contentView addSubview:name_lbl];
    
    
    checkBox=[UIButton buttonWithType:UIButtonTypeCustom];
    checkBox.tag=indexPath.row;
    checkBox.frame=CGRectMake(20,15+3, 15, 15);
    [cell.contentView addSubview:checkBox];
    [checkBox setImage:[UIImage imageNamed:@"check-box-inactive.png"] forState:UIControlStateNormal];
    [checkBox setImage:[UIImage imageNamed:@"cehck-box-active.png"] forState:UIControlStateSelected];
    [checkBox addTarget:self action:@selector(checkBoxClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    
    editbtn=[UIButton buttonWithType:UIButtonTypeCustom];
    editbtn.tag=indexPath.row;
    
    editbtn.frame=CGRectMake(270,15, 20, 20);
    editbtn.backgroundColor=[UIColor clearColor];
    //[cell.contentView addSubview:editbtn];
    [editbtn setImage:[UIImage imageNamed:@"edit-icon.png"] forState:UIControlStateNormal];
    [editbtn addTarget:self action:@selector(editbtnClicked:event:) forControlEvents:UIControlEventTouchUpInside];
    cell.accessoryView=editbtn;
    
    
    
    if ([[[self.checkboxClicked_Dict objectForKey:[NSString stringWithFormat:@"checked-%@",[[[self.alphabetsArray allKeys] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)] objectAtIndex:indexPath.section]]] objectAtIndex:indexPath.row] isEqualToString:@"0"]) {
        [checkBox setSelected:NO];
        [cell.accessoryView setHidden:YES];
        //[editbtn setHidden:YES];
    } else {
        [checkBox setSelected:YES];
        [cell.accessoryView setHidden:NO];
        //[editbtn setHidden:NO];
    }
    
    
    
    return cell;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50.0f;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    
    
    return [[[self.alphabetsArray allKeys] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)] objectAtIndex:section];
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=(UITableViewCell*)[tableView cellForRowAtIndexPath:indexPath];
    NSLog(@"%@", cell.contentView.subviews);
    UIButton *tappedButton = (UIButton*)[cell.contentView.subviews objectAtIndex:1];
    
    Person *p = [[self.alphabetsArray valueForKey:[[[self.alphabetsArray allKeys] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)] objectAtIndex:indexPath.section]] objectAtIndex:indexPath.row];
    
    if ([tappedButton isSelected]) {
        [tappedButton setSelected:NO];
        
        [cell.accessoryView setHidden:YES];
        
        [obj.contactsArray removeObject:p];
        [[self.checkboxClicked_Dict objectForKey:[NSString stringWithFormat:@"checked-%@",[[[self.alphabetsArray allKeys] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)] objectAtIndex:indexPath.section]]] replaceObjectAtIndex:indexPath.row withObject:@"0"];
        if (k>0) {
            k--;
        }
        
    }
    else {
        
        [[self.checkboxClicked_Dict objectForKey:[NSString stringWithFormat:@"checked-%@",[[[self.alphabetsArray allKeys] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)] objectAtIndex:indexPath.section]]] replaceObjectAtIndex:indexPath.row withObject:@"1"];
        [tappedButton setSelected:YES];
        
        [obj.contactsArray addObject:p];
        [cell.accessoryView setHidden:NO];
        k++;
    }
    
    if (k==0) {
        k=0;
        noofselected.text=@" ";
    } else {
        noofselected.text=[NSString stringWithFormat:@"%d Contacts Selected",k];
    }
    
    if (k==[obj.contactDetails count])
    {
        [checkBox_all setSelected:YES];
    }
    else
    {
        [checkBox_all setSelected:NO];
    }
    NSLog(@"CHECK BOX -----%@",self.checkboxClicked_Dict);
   

    
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
    
    Person *p = [[self.alphabetsArray valueForKey:[[[self.alphabetsArray allKeys] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)] objectAtIndex:indexPath.section]] objectAtIndex:indexPath.row];
    
    
    if ([tappedButton isSelected]) {
        [tappedButton setSelected:NO];
        [[self.checkboxClicked_Dict objectForKey:[NSString stringWithFormat:@"checked-%@",[[[self.alphabetsArray allKeys] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)] objectAtIndex:indexPath.section]]] replaceObjectAtIndex:[sender tag] withObject:@"0"];
        [obj.contactsArray removeObject:p];
        [cell.accessoryView setHidden:YES];
        if (k>0) {
            k--;
        }
        
    }
    else {
        
        [[self.checkboxClicked_Dict objectForKey:[NSString stringWithFormat:@"checked-%@",[[[self.alphabetsArray allKeys] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)] objectAtIndex:indexPath.section]]] replaceObjectAtIndex:[sender tag] withObject:@"1"];
        [tappedButton setSelected:YES];
        
         [obj.contactsArray addObject:p];
        [cell.accessoryView setHidden:NO];
        k++;
        
    }
    if (k==0) {
        k=0;
        noofselected.text=@" ";
    } else {
        noofselected.text=[NSString stringWithFormat:@"%d Contacts Selected",k];
    }
    
    if (k==[obj.contactDetails count]) {
        [checkBox_all setSelected:YES];
    }
    else
    {
        [checkBox_all setSelected:NO];
    }
    NSLog(@"CHECK BOX -----%@",self.checkboxClicked_Dict);
    
}

-(void)editbtnClicked:(id)sender event:(id)event
{
    NSSet *touches = [event allTouches];
    UITouch *touch = [touches anyObject];
    CGPoint currentTouchPosition = [touch locationInView:tableview];
    NSIndexPath *indexPath = [tableview indexPathForRowAtPoint: currentTouchPosition];
    if (indexPath != nil){
        [self tableView: tableview accessoryButtonTappedForRowWithIndexPath: indexPath];
    }
    
    NSLog(@"%ld",(long)[sender tag]);
}

-(void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    Person *person = [[self.alphabetsArray valueForKey:[[[self.alphabetsArray allKeys] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)] objectAtIndex:indexPath.section]] objectAtIndex:indexPath.row];
    
    
    ContactEditDetailsViewController *edit_cls=[[ContactEditDetailsViewController alloc] initWithPerson:person];
    [self.navigationController pushViewController:edit_cls animated:YES];
}
-(void)back_btnAction
{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)done_btnAction
{
    
    if (k==0 || [noofselected.text isEqualToString:@" "])
    {
        UIAlertView *alert=[[UIAlertView alloc] initWithTitle:nil message:@"Please select atleast one contact" delegate:Nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alert show];
        
    }
    else
    {
        
        
        
       
       
        NSMutableArray *allPersonArr=[[NSMutableArray alloc] init];
      
        
        NSLog(@"%lu",(unsigned long)[obj.contactsArray count]);
        for (int k=0; k<[obj.contactsArray count]; k++)
        {
            NSMutableDictionary *person=[[NSMutableDictionary alloc] init];
            NSMutableArray *personArr=[[NSMutableArray alloc] init];
            
            
            NSMutableDictionary *dic_PersonName=[[NSMutableDictionary alloc] init];
            NSMutableArray *personName_DataArr=[[NSMutableArray alloc] init];
          
                NSMutableDictionary *dic_NameData=[[NSMutableDictionary alloc] init];
                [dic_NameData setObject:@"Name"  forKey:@"name"];
                [dic_NameData setObject:[[obj.contactsArray objectAtIndex:k] fullName]  forKey:@"value"];
 
                [personName_DataArr addObject:dic_NameData];
            
            NSMutableDictionary *dic_JobTitleData=[[NSMutableDictionary alloc] init];
            [dic_JobTitleData setObject:@"JobTitle"  forKey:@"name"];
            [dic_JobTitleData setObject:[[obj.contactsArray objectAtIndex:k] lastName]  forKey:@"value"];
            
            [personName_DataArr addObject:dic_JobTitleData];
            
            NSMutableDictionary *dic_OrganizationData=[[NSMutableDictionary alloc] init];
            [dic_OrganizationData setObject:@"Name"  forKey:@"name"];
            [dic_OrganizationData setObject:[[obj.contactsArray objectAtIndex:k] companyName]  forKey:@"value"];
            
            [personName_DataArr addObject:dic_OrganizationData];
            
            
           
            [dic_PersonName setObject:@"General" forKey:@"category"];
            [dic_PersonName setObject:personName_DataArr forKey:@"data"];
            [personArr addObject:dic_PersonName];
            
            NSMutableDictionary *dic_PersonPhone=[[NSMutableDictionary alloc] init];
            NSMutableArray *personPhone_DataArr=[[NSMutableArray alloc] init];
            for (int i=0; i<[[[obj.contactsArray objectAtIndex:k] editablePhoneNumber_Value] count]; i++)
            {
                NSMutableDictionary *dic_PhoneData=[[NSMutableDictionary alloc] init];
                [dic_PhoneData setObject:[[[obj.contactsArray objectAtIndex:k] editablePhoneNumber_Type] objectAtIndex:i] forKey:@"name"];
                [dic_PhoneData setObject:[[[obj.contactsArray objectAtIndex:k] editablePhoneNumber_Value] objectAtIndex:i] forKey:@"value"];
                [personPhone_DataArr addObject:dic_PhoneData];
            }
            [dic_PersonPhone setObject:@"Phone" forKey:@"category"];
            [dic_PersonPhone setObject:personPhone_DataArr forKey:@"data"];
            [personArr addObject:dic_PersonPhone];
            
            
            NSMutableDictionary *dic_PersonEmail=[[NSMutableDictionary alloc] init];
            NSMutableArray *personEmail_DataArr=[[NSMutableArray alloc] init];

            for (int i=0; i<[[[obj.contactsArray objectAtIndex:k] editableEmail_Value] count]; i++)
            {
                NSMutableDictionary *dic_EmailData=[[NSMutableDictionary alloc] init];
                [dic_EmailData setObject:[[[obj.contactsArray objectAtIndex:k] editableEmail_Type] objectAtIndex:i] forKey:@"name"];
                [dic_EmailData setObject:[[[obj.contactsArray objectAtIndex:k] editableEmail_Value] objectAtIndex:i] forKey:@"value"];
                [personEmail_DataArr addObject:dic_EmailData];
            }
            [dic_PersonEmail setObject:@"Email_ID" forKey:@"category"];
            [dic_PersonEmail setObject:personEmail_DataArr forKey:@"data"];
            [personArr addObject:dic_PersonEmail];
            
            
            
            NSMutableDictionary *dic_PersonAddress=[[NSMutableDictionary alloc] init];
            NSMutableArray *personAddress_DataArr=[[NSMutableArray alloc] init];
            for (int i=0; i<[[[obj.contactsArray objectAtIndex:k] editableAddress_Value] count]; i++)
            {
                NSMutableDictionary *dic_addressData=[[NSMutableDictionary alloc] init];
                [dic_addressData setObject:[[[obj.contactsArray objectAtIndex:k] editableAddress_Type] objectAtIndex:i] forKey:@"name"];
                [dic_addressData setObject:[[[obj.contactsArray objectAtIndex:k] editableAddress_Value] objectAtIndex:i] forKey:@"value"];
                [personAddress_DataArr addObject:dic_addressData];
            }
            [dic_PersonAddress setObject:@"Address" forKey:@"category"];
            [dic_PersonAddress setObject:personAddress_DataArr forKey:@"data"];
            [personArr addObject:dic_PersonAddress];
            
            
            NSMutableDictionary *dic_PersonSocialProfile=[[NSMutableDictionary alloc] init];
            NSMutableArray *personSocialProfile_DataArr=[[NSMutableArray alloc] init];
            for (int i=0; i<[[[obj.contactsArray objectAtIndex:k] editableSocialProfile_Value] count]; i++)
            {
                NSMutableDictionary *dic_socialProfileData=[[NSMutableDictionary alloc] init];
                [dic_socialProfileData setObject:[[[obj.contactsArray objectAtIndex:k] editableSocialProfile_Type] objectAtIndex:i] forKey:@"name"];
                [dic_socialProfileData setObject:[[[obj.contactsArray objectAtIndex:k] editableSocialProfile_Value] objectAtIndex:i] forKey:@"value"];
                [personSocialProfile_DataArr addObject:dic_socialProfileData];
            }
            [dic_PersonSocialProfile setObject:@"Social Profile" forKey:@"category"];
            [dic_PersonSocialProfile setObject:personSocialProfile_DataArr forKey:@"data"];
            [personArr addObject:dic_PersonSocialProfile];
            
            NSMutableDictionary *dic_PersonIM=[[NSMutableDictionary alloc] init];
            NSMutableArray *personIM_DataArr=[[NSMutableArray alloc] init];
            for (int i=0; i<[[[obj.contactsArray objectAtIndex:k] editableIM_Value] count]; i++)
            {
            
                NSMutableDictionary *dic_IMData=[[NSMutableDictionary alloc] init];
                [dic_IMData setObject:[[[obj.contactsArray objectAtIndex:k] editableIM_Type] objectAtIndex:i] forKey:@"name"];
                [dic_IMData setObject:[[[obj.contactsArray objectAtIndex:k] editableIM_Value] objectAtIndex:i] forKey:@"value"];
                [personIM_DataArr addObject:dic_IMData];
            }
            [dic_PersonIM setObject:@"Instant Message ID" forKey:@"category"];
            [dic_PersonIM setObject:personIM_DataArr forKey:@"data"];
            [personArr addObject:dic_PersonIM];
            
            
            NSMutableDictionary *dic_PersonURL=[[NSMutableDictionary alloc] init];
            NSMutableArray *personURL_DataArr=[[NSMutableArray alloc] init];
            for (int i=0; i<[[[obj.contactsArray objectAtIndex:k] editableUrl_Value] count]; i++)
            {
                NSMutableDictionary *dic_urlData=[[NSMutableDictionary alloc] init];
                [dic_urlData setObject:[[[obj.contactsArray objectAtIndex:k] editableUrl_Type] objectAtIndex:i] forKey:@"name"];
                [dic_urlData setObject:[[[obj.contactsArray objectAtIndex:k] editableUrl_Value] objectAtIndex:i] forKey:@"value"];
                [personURL_DataArr addObject:dic_urlData];
            }
            [dic_PersonURL setObject:@"URL" forKey:@"category"];
            [dic_PersonURL setObject:personURL_DataArr forKey:@"data"];
            [personArr addObject:dic_PersonURL];
            
            NSMutableDictionary *dic_PersonDate=[[NSMutableDictionary alloc] init];
            NSMutableArray *personDate_DataArr=[[NSMutableArray alloc] init];
            for (int i=0; i<[[[obj.contactsArray objectAtIndex:k] editableDate_Value] count]; i++)
            {
                NSMutableDictionary *dic_datesData=[[NSMutableDictionary alloc] init];
                [dic_datesData setObject:[[[obj.contactsArray objectAtIndex:k] editableDate_Type] objectAtIndex:i] forKey:@"name"];
                [dic_datesData setObject:[[[obj.contactsArray objectAtIndex:k] editableDate_Value] objectAtIndex:i] forKey:@"value"];
                [personDate_DataArr addObject:dic_datesData];
            }
            [dic_PersonDate setObject:@"Date" forKey:@"category"];
            [dic_PersonDate setObject:personDate_DataArr forKey:@"data"];
            [personArr addObject:dic_PersonDate];

            
            
            
            

            
           
           [person setObject:personArr forKey:@"Person"];
           [allPersonArr addObject:person];
        }
        
        NSDictionary *allPersonDic=[NSDictionary dictionaryWithObject:allPersonArr forKey:@"Data"];
        
        NSLog(@"allPersonDic \n %@",allPersonDic);
        
        NSError* error;
        NSData* jsonData = [NSJSONSerialization dataWithJSONObject:allPersonDic
                                                           options:kNilOptions error:&error];
        
        
        
        //NSString* newStr = [NSString stringWithUTF8String:[jsonData bytes]];
        NSString* newStr = [[NSString alloc] initWithData:jsonData
                                                  encoding:NSUTF8StringEncoding] ;
        NSLog(@"JSON %@",newStr);
        obj.jsonString=newStr;
// obj.jsonString=@"{"Data":[{"Person":[{"category":"General","data":[{"name":"Name","value":"#"},{"name":"JobTitle","value":""},{"name":"Name","value":""}]},{"category":"Phone","data":[{"name":"home","value":"223-5455"}]},{"category":"Email_ID","data":[]},{"category":"Address","data":[]},{"category":"Social Profile","data":[]},{"category":"Instant Message ID","data":[]},{"category":"URL","data":[]},{"category":"Date","data":[]}]}]}";
        
        [obj setContactsToBeShared_selected:[NSString stringWithFormat:@"%d",k]];
        if (isBulkContacts==NO)
        {
            if ([obj.from_ShareMethodViewController isEqualToString:@"0"])
            {
                SelectRecipientsViewController *recipients=[[SelectRecipientsViewController alloc]init];
                [self.navigationController pushViewController:recipients animated:YES];
                
            }
            else  if ([obj.from_ShareMethodViewController isEqualToString:@"1"])
            {
                
                for (UIViewController *controller in obj.vcs)
                {
                    if ([controller isKindOfClass:[SelectShareMethodViewController class]]) {
                        
                        
                        [self.navigationController pushViewController:controller
                                                             animated:YES];
                        
                        break;
                    }
                }
                
            }
            
            
        }
        else
        {
            ContactShareViaIDViewController *ShareViaID_Cls=[[ContactShareViaIDViewController alloc]init];
            [self.navigationController pushViewController:ShareViaID_Cls animated:YES];
            
        }
        
        
    }
    
}


-(void)checkBoxClicked1:(id)sender {
    
    
    
    UIButton *tappedButton =  checkBox_all;
    
    
    
    
    if ([tappedButton isSelected]) {
        [tappedButton setSelected:NO];
        for (int i=0; i<[[self.alphabetsArray allKeys]  count]; i++) {
            for (int j=0; j<[[self.checkboxClicked_Dict objectForKey:[NSString stringWithFormat:@"checked-%@",[[[self.alphabetsArray allKeys] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)] objectAtIndex:i]]] count]; j++) {
                [[self.checkboxClicked_Dict objectForKey:[NSString stringWithFormat:@"checked-%@",[[[self.alphabetsArray allKeys] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)] objectAtIndex:i]]] replaceObjectAtIndex:j withObject:@"0"];
            }
            
        }
        [obj.contactsArray removeAllObjects];
        k=0;
        noofselected.text=@" ";
        
    }
    else {
        
        
        [tappedButton setSelected:YES];
        for (int i=0; i<[[self.alphabetsArray allKeys]  count]; i++) {
            for (int j=0; j<[[self.checkboxClicked_Dict objectForKey:[NSString stringWithFormat:@"checked-%@",[[[self.alphabetsArray allKeys] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)] objectAtIndex:i]]] count]; j++) {
                [[self.checkboxClicked_Dict objectForKey:[NSString stringWithFormat:@"checked-%@",[[[self.alphabetsArray allKeys] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)] objectAtIndex:i]]] replaceObjectAtIndex:j withObject:@"1"];
                
            }
            
        }
        [obj.contactsArray addObjectsFromArray:obj.contactDetails];
        k=(int)[obj.contactDetails count];
        noofselected.text=[NSString stringWithFormat:@"%lu Contacts Selected",(unsigned long)[obj.contactDetails count]];
    }
    
    
    NSLog(@"CHECK BOX -----%@",self.checkboxClicked_Dict);
    [tableview reloadData];
}



@end
