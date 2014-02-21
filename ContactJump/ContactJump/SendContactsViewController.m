//
//  SendContactsViewController.m
//  ContactJump
//
//  Created by Raman on 04/01/14.
//  Copyright (c) 2014 iyasoft. All rights reserved.
//

#import "SendContactsViewController.h"
#import "KxMenu.h"
#define IS_IPHONE_5 ( fabs( ( double )[ [ UIScreen mainScreen ] bounds ].size.height - ( double )568 ) < DBL_EPSILON )
@interface SendContactsViewController ()

@end

@implementation SendContactsViewController

static int k=0;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(void)viewWillAppear:(BOOL)animated
{
    if ([obj.fromRecievedDetailsPage isEqualToString:@"1"])
    {
        [obj setFromRecievedDetailsPage:@"0"];
       // ABRecordRef newPerson = CFArrayGetValueAtIndex((__bridge CFArrayRef)(personRecord), 0);
        CFErrorRef error = NULL;
        ABRecordSetValue(editedPersonRef, kABPersonFirstNameProperty, (__bridge CFTypeRef)(obj.edit_fullName), &error);
        
        ABRecordSetValue(editedPersonRef, kABPersonOrganizationProperty, (__bridge CFTypeRef)(obj.edit_lname), &error);
        ABRecordSetValue(editedPersonRef, kABPersonJobTitleProperty, (__bridge CFTypeRef)(obj.edit_cname), &error);
        
        [tableview reloadData];
    }
    
    
}

-(void)getNewContacts:(NSArray *)newPersonRecord
{
    obj=[ContactGlobalDataClass getInstance];
    personRecord=[NSArray arrayWithArray:newPersonRecord];
    k=(int)[personRecord count];
    contactsToBeAddedArray=[[NSMutableArray alloc] initWithArray:newPersonRecord];
    
    
//    for (int i = 0; i < [newPersonRecord count]; i++)
//    {
//    
//        ABRecordRef ref = CFArrayGetValueAtIndex((__bridge CFArrayRef)(newPersonRecord), i);
//    
//        ABMultiValueRef date = ABRecordCopyValue(ref, kABPersonDateProperty);
//        //NSString *firstName = (__bridge NSString *)ABRecordCopyValue(ref, kABPersonDateProperty);
//        for(int j = 0; j < ABMultiValueGetCount(date); j++)
//        {
//            
//            NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
//            [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
//            CFStringRef typeTmp = ABMultiValueCopyLabelAtIndex(date, j);
//            NSString* dateType = (__bridge NSString*)ABAddressBookCopyLocalizedLabel(typeTmp);
//            
//            NSString *dateValue = [dateFormatter stringFromDate:(__bridge NSDate *)ABMultiValueCopyValueAtIndex(date, j)];
//            
//
//        NSLog(@"first name---->%@",dateValue);
//        
//    }
//    }
}
- (void)viewDidLoad
{
    
    
    [super viewDidLoad];
    
    
    
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
    
    
    for (int i = 0; i < [personRecord count]; i++)
    {
        
        ABRecordRef ref = CFArrayGetValueAtIndex((__bridge CFArrayRef)(personRecord), i);
        NSString *c = [(__bridge NSString *)ABRecordCopyValue(ref, kABPersonFirstNameProperty) substringToIndex:1];
        
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
    
    
    for (int i = 0; i < [personRecord count]; i++)
    {
        ABRecordRef ref = CFArrayGetValueAtIndex((__bridge CFArrayRef)(personRecord), i);
        
        [[self.alphabetsArray objectForKey:[(__bridge NSString *)ABRecordCopyValue(ref, kABPersonFirstNameProperty) substringToIndex:1]] addObject:(__bridge id)(ref)];
        [[self.checkboxClicked_Dict objectForKey:[NSString stringWithFormat:@"checked-%@",[(__bridge NSString *)ABRecordCopyValue(ref, kABPersonFirstNameProperty) substringToIndex:1]]] addObject:@"1"];
    }
    
    


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
    

    

    
#pragma mark topview.
    topview=[[UIView alloc]init];
    topview.backgroundColor=[UIColor whiteColor];
    [mainbg_img addSubview:topview];
    
#pragma mark check button.
    checkBox_all=[UIButton buttonWithType:UIButtonTypeCustom];
    [checkBox_all setImage:[UIImage imageNamed:@"check-box-inactive.png"] forState:UIControlStateNormal];
    [checkBox_all setImage:[UIImage imageNamed:@"cehck-box-active.png"] forState:UIControlStateSelected];
    [checkBox_all addTarget:self action:@selector(checkBoxClicked1:) forControlEvents:UIControlEventTouchUpInside];
    [checkBox_all setSelected:YES];
    [topview addSubview:checkBox_all];
    
#pragma mark select all label.
    selectAll_lbl=[[UILabel alloc] init];
    selectAll_lbl.text=[NSString stringWithFormat:@"Select All"];
    selectAll_lbl.textAlignment=0;
    selectAll_lbl.textColor= [UIColor blackColor];
    selectAll_lbl.backgroundColor=[UIColor clearColor];
    selectAll_lbl.font=[UIFont fontWithName:@"AmericanTypewriter" size:16];
    [topview addSubview:selectAll_lbl];
    
    UIButton   * checkBox_all1=[UIButton buttonWithType:UIButtonTypeCustom];
    [checkBox_all1 setBackgroundColor:[UIColor clearColor]];
    [checkBox_all1 addTarget:self action:@selector(checkBoxClicked1:) forControlEvents:UIControlEventTouchUpInside];
    [topview addSubview:checkBox_all1];
    
#pragma mark number of selected contacts label.
    noofselected=[[UILabel alloc] init];
    noofselected.text=[NSString stringWithFormat:@"%d contacts selected",(int)[personRecord count]];
    noofselected.textAlignment=1;
    noofselected.textColor= [UIColor blackColor];
    noofselected.backgroundColor=[UIColor clearColor];
    noofselected.font=[UIFont fontWithName:@"AmericanTypewriter" size:12];
    [topview addSubview:noofselected];
    
#pragma Navigation Bar Title
    navbartitle=[[UILabel alloc] init];
    navbartitle.text=[NSString stringWithFormat:@"Add to Contacts"];
    navbartitle.textAlignment=1;
    navbartitle.textColor= [UIColor whiteColor];
    navbartitle.backgroundColor=[UIColor clearColor];
    navbartitle.font=[UIFont fontWithName:@"AmericanTypewriter" size:18];
    [mainbg_img addSubview:navbartitle];
    
#pragma mark UITableview.
    tableview=[[UITableView alloc]init];
    tableview.backgroundColor=[UIColor whiteColor];
    tableview.delegate=self;
    tableview.dataSource=self;
    [mainbg_img addSubview:tableview];
    tableview.sectionIndexColor=[UIColor darkGrayColor];
#pragma mark search bar.
   
    
#pragma mark Add contacts Button
    UIButton *addcontact_btn =[UIButton buttonWithType:UIButtonTypeCustom];
    [addcontact_btn setBackgroundImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"button-bg" ofType:@"png"]] forState:UIControlStateNormal];
    [addcontact_btn setTitle:@"Add to Contacts" forState:UIControlStateNormal];
    [[addcontact_btn titleLabel] setFont:[UIFont fontWithName:@"AmericanTypewriter" size:12]];
    [addcontact_btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [addcontact_btn addTarget:self action:@selector(addcontact_btnAction) forControlEvents:UIControlEventTouchUpInside];
    [mainbg_img addSubview:addcontact_btn];
    
    if (IS_IPHONE_5) {
        nav_img.frame=CGRectMake(0, 0, 320, 90);
        mainbg_img.frame=CGRectMake(0,0, 320, 568);
        
        back_btn.frame=CGRectMake(15, 14, 33, 54);
        navbartitle.frame=CGRectMake(0,20,320,50);
       
        topview.frame=CGRectMake(0, 91, 320, 45);
        checkBox_all.frame=CGRectMake(20,15, 15, 15);
        selectAll_lbl.frame=CGRectMake(40,8,80,30);
        checkBox_all1.frame=CGRectMake(40,8,80,30);
        noofselected.frame=CGRectMake(185,8,135,25);
        tableview.frame=CGRectMake(0, 136, 320, 360);
        addcontact_btn.frame=CGRectMake(46.5, 515, 226.5, 39.5);
        
    }else{
        nav_img.frame=CGRectMake(0, 0, 320, 80);
        mainbg_img.frame=CGRectMake(0,0, 320, 480);
        
        back_btn.frame=CGRectMake(15, 13, 33, 54);
        navbartitle.frame=CGRectMake(0,20,320,50);
       
        topview.frame=CGRectMake(0, 81, 320, 45);
        checkBox_all.frame=CGRectMake(20,15, 15, 15);
        selectAll_lbl.frame=CGRectMake(40,8,80,30);
        checkBox_all1.frame=CGRectMake(40,8,80,30);
        noofselected.frame=CGRectMake(185,8,135,25);
        tableview.frame=CGRectMake(0, 126, 320, 278+10);
        addcontact_btn.frame=CGRectMake(46.5, 427.5, 226.5, 39.5);
    }

    
	// Do any additional setup after loading the view.
}
-(void)Setting_btnAction
{
    NSLog(@"BtnAction");
}
-(void)addcontact_btnAction
{
    NSLog(@"BtnAction");
    
    
    if (k==0 || [noofselected.text isEqualToString:@" "])
    {
        UIAlertView *alert=[[UIAlertView alloc] initWithTitle:nil message:@"Please select atleast one contact" delegate:Nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alert show];
        
    }
    else
    {
        
        CFErrorRef error = NULL;
        ABAddressBookRef iPhoneAddressBook = ABAddressBookCreateWithOptions(NULL, NULL);
        for (int i=0; i<[contactsToBeAddedArray count]; i++) {
            ABAddressBookAddRecord(iPhoneAddressBook, (__bridge ABRecordRef)([contactsToBeAddedArray objectAtIndex:i]), &error);
            
        }
        ABAddressBookSave(iPhoneAddressBook, &error);
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
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
    
    
    NSLog(@"sssssss----\n%@",[[self.alphabetsArray valueForKey:[[[self.alphabetsArray allKeys] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)] objectAtIndex:indexPath.section]] objectAtIndex:indexPath.row]);
    
    
    
    name_lbl=[[UILabel alloc] init];
    
    name_lbl.frame=CGRectMake(60, 10, 150, 30);
    name_lbl.textAlignment=0;
    [name_lbl setTag:1];
    name_lbl.textColor= [UIColor blackColor];
    name_lbl.backgroundColor=[UIColor clearColor];
    name_lbl.font=[UIFont fontWithName:@"ArialMT" size:15];
    [cell.contentView addSubview:name_lbl];
    
    
    checkBox=[UIButton buttonWithType:UIButtonTypeCustom];
    checkBox.tag=2;
    checkBox.frame=CGRectMake(20,15+3, 15, 15);
    [cell.contentView addSubview:checkBox];
    [checkBox setImage:[UIImage imageNamed:@"check-box-inactive.png"] forState:UIControlStateNormal];
    [checkBox setImage:[UIImage imageNamed:@"cehck-box-active.png"] forState:UIControlStateSelected];
    [checkBox addTarget:self action:@selector(checkBoxClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    
    
  

    editbtn=[UIButton buttonWithType:UIButtonTypeCustom];
    editbtn.tag=indexPath.row;
    editbtn.frame=CGRectMake(270,15, 20, 20);
    editbtn.backgroundColor=[UIColor clearColor];
    [editbtn setImage:[UIImage imageNamed:@"edit-icon.png"] forState:UIControlStateNormal];
    [editbtn addTarget:self action:@selector(editbtnClicked:event:) forControlEvents:UIControlEventTouchUpInside];
    cell.accessoryView=editbtn;
    
    }
    
    
    
    UILabel* name_lbl1=(UILabel*)[cell viewWithTag:1];
    name_lbl1.text=[NSString stringWithFormat:@"%@",(__bridge NSString *)ABRecordCopyValue((__bridge ABRecordRef)([[self.alphabetsArray valueForKey:[[[self.alphabetsArray allKeys] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)] objectAtIndex:indexPath.section]] objectAtIndex:indexPath.row]), kABPersonFirstNameProperty)];
    
    
    UIButton* checkBox1=(UIButton *)[cell viewWithTag:2];
    if ([[[self.checkboxClicked_Dict objectForKey:[NSString stringWithFormat:@"checked-%@",[[[self.alphabetsArray allKeys] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)] objectAtIndex:indexPath.section]]] objectAtIndex:indexPath.row] isEqualToString:@"0"]) {
        [checkBox1 setSelected:NO];
        [cell.accessoryView setHidden:YES];
        //[editbtn setHidden:YES];
    } else {
        [checkBox1 setSelected:YES];
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
    
    //UIButton *editButton = (UIButton*)[cell.contentView.subviews objectAtIndex:2];
    if ([tappedButton isSelected]) {
        [tappedButton setSelected:NO];
        [contactsToBeAddedArray removeObject:[[self.alphabetsArray valueForKey:[[[self.alphabetsArray allKeys] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)] objectAtIndex:indexPath.section]] objectAtIndex:indexPath.row]];
        [cell.accessoryView setHidden:YES];
        [[self.checkboxClicked_Dict objectForKey:[NSString stringWithFormat:@"checked-%@",[[[self.alphabetsArray allKeys] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)] objectAtIndex:indexPath.section]]] replaceObjectAtIndex:indexPath.row withObject:@"0"];
        if (k>0) {
            k--;
        }
        
    }
    else {
        
       
        [contactsToBeAddedArray addObject:[[self.alphabetsArray valueForKey:[[[self.alphabetsArray allKeys] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)] objectAtIndex:indexPath.section]] objectAtIndex:indexPath.row]];
        [[self.checkboxClicked_Dict objectForKey:[NSString stringWithFormat:@"checked-%@",[[[self.alphabetsArray allKeys] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)] objectAtIndex:indexPath.section]]] replaceObjectAtIndex:indexPath.row withObject:@"1"];
        [tappedButton setSelected:YES];
        [cell.accessoryView setHidden:NO];
        k++;
    }
    
    if (k==0) {
        k=0;
        noofselected.text=@" ";
    } else {
        noofselected.text=[NSString stringWithFormat:@"%d Contacts Selected",k];
    }
    
    if (k==[personRecord count]) {
        [checkBox_all setSelected:YES];
    }
    else
    {
        [checkBox_all setSelected:NO];
    }
    NSLog(@"CHECK BOX -----%@",self.checkboxClicked_Dict);
    
}

-(void)checkBoxClicked:(id)sender
{
    
    
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
        
        [contactsToBeAddedArray removeObject:[[self.alphabetsArray valueForKey:[[[self.alphabetsArray allKeys] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)] objectAtIndex:indexPath.section]] objectAtIndex:indexPath.row]];
        [[self.checkboxClicked_Dict objectForKey:[NSString stringWithFormat:@"checked-%@",[[[self.alphabetsArray allKeys] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)] objectAtIndex:indexPath.section]]] replaceObjectAtIndex:indexPath.row withObject:@"0"];
        [cell.accessoryView setHidden:YES];
        if (k>0) {
            k--;
        }
        
    }
    else {
        
        [contactsToBeAddedArray addObject:[[self.alphabetsArray valueForKey:[[[self.alphabetsArray allKeys] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)] objectAtIndex:indexPath.section]] objectAtIndex:indexPath.row]];
        [[self.checkboxClicked_Dict objectForKey:[NSString stringWithFormat:@"checked-%@",[[[self.alphabetsArray allKeys] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)] objectAtIndex:indexPath.section]]] replaceObjectAtIndex:indexPath.row withObject:@"1"];
        [tappedButton setSelected:YES];
        [cell.accessoryView setHidden:NO];
        k++;
        
    }
    if (k==0) {
        k=0;
        noofselected.text=@" ";
    } else {
        noofselected.text=[NSString stringWithFormat:@"%d Contacts Selected",k];
    }
    
    if (k==[personRecord count]) {
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
    NSLog(@"gdhd------%ld",(long)indexPath.section);
    

    ABRecordRef ref = (__bridge ABRecordRef)([[self.alphabetsArray valueForKey:[[[self.alphabetsArray allKeys] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)] objectAtIndex:indexPath.section]] objectAtIndex:indexPath.row]);
    editedPersonRef=(__bridge ABRecordRef)([[self.alphabetsArray valueForKey:[[[self.alphabetsArray allKeys] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)] objectAtIndex:indexPath.section]] objectAtIndex:indexPath.row]);
    RecievedContactDetailsViewController *contactDetail_cls=[[RecievedContactDetailsViewController alloc] initWithPerson:ref];
    [self.navigationController pushViewController:contactDetail_cls animated:YES];
    
    
    
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
        k=(int)[personRecord count];
        noofselected.text=[NSString stringWithFormat:@"%lu Contacts Selected",(unsigned long)[personRecord count]];
    }
    
    
    NSLog(@"CHECK BOX -----%@",self.checkboxClicked_Dict);
    [tableview reloadData];
}






@end
