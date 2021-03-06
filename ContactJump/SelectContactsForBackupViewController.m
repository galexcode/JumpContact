//
//  SelectContactsForBackupViewController.m
//  ContactJump
//
//  Created by Dex on 23/01/14.
//  Copyright (c) 2014 iyasoft. All rights reserved.
//

#import "SelectContactsForBackupViewController.h"

@interface SelectContactsForBackupViewController ()

@end

@implementation SelectContactsForBackupViewController
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
    
    obj=[ContactGlobalDataClass getInstance];
    
    
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
    
    // Loop through the books and create our keys
    for (Person *chr in obj.contactDetails)
    {
        NSString *c = [chr.firstName substringToIndex:1];
        
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
    
    
    for (Person *contct_name in obj.contactDetails)
    {
        
        
        [[self.alphabetsArray objectForKey:[contct_name.firstName substringToIndex:1]] addObject:contct_name];
        [[self.checkboxClicked_Dict objectForKey:[NSString stringWithFormat:@"checked-%@",[contct_name.firstName substringToIndex:1]]] addObject:@"1"];
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
    selectAll_lbl.shadowColor = [UIColor whiteColor];
    selectAll_lbl.shadowOffset = CGSizeMake(0,0);
    [topview addSubview:selectAll_lbl];
    
    UIButton   * checkBox_all1=[UIButton buttonWithType:UIButtonTypeCustom];
    [checkBox_all1 setBackgroundColor:[UIColor clearColor]];
    [checkBox_all1 addTarget:self action:@selector(checkBoxClicked1:) forControlEvents:UIControlEventTouchUpInside];
    [topview addSubview:checkBox_all1];

#pragma mark number of selected contacts label.
    noofselected=[[UILabel alloc] init];
    noofselected.text=[NSString stringWithFormat:@"%d contacts selected",(int)[obj.contactDetails count]];
    noofselected.textAlignment=1;
    noofselected.textColor= [UIColor blackColor];
    noofselected.backgroundColor=[UIColor clearColor];
    noofselected.font=[UIFont fontWithName:@"AmericanTypewriter" size:12];
    noofselected.shadowColor = [UIColor whiteColor];
    noofselected.shadowOffset = CGSizeMake(0,0);
    [topview addSubview:noofselected];
    
#pragma Navigation Bar Title
    navbartitle=[[UILabel alloc] init];
    navbartitle.text=[NSString stringWithFormat:@"Backup Contacts"];
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
#pragma mark search bar.
    
    

#pragma mark BackupwithImage Button
    UIButton *backupWithImage_btn =[UIButton buttonWithType:UIButtonTypeCustom];
    [backupWithImage_btn setBackgroundImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"button-bg1" ofType:@"png"]] forState:UIControlStateNormal];
    [backupWithImage_btn setTitle:@"Backup with Images" forState:UIControlStateNormal];
    [[backupWithImage_btn titleLabel] setFont:[UIFont fontWithName:@"AmericanTypewriter" size:12]];
    [backupWithImage_btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [backupWithImage_btn addTarget:self action:@selector(backupWithImages_btnAction) forControlEvents:UIControlEventTouchUpInside];
    [mainbg_img addSubview:backupWithImage_btn];
    
#pragma mark backup button sub title label.
    UILabel *sendbtnsubtitle_lbl=[[UILabel alloc] init];
    sendbtnsubtitle_lbl.frame=CGRectMake(40, 22, 50, 18);
    sendbtnsubtitle_lbl.text=@"1.25 MB";
    sendbtnsubtitle_lbl.textAlignment=1;
    sendbtnsubtitle_lbl.textColor= [UIColor whiteColor];
    sendbtnsubtitle_lbl.backgroundColor=[UIColor clearColor];
    sendbtnsubtitle_lbl.font=[UIFont fontWithName:@"AmericanTypewriter" size:8];
    sendbtnsubtitle_lbl.shadowColor = [UIColor whiteColor];
    sendbtnsubtitle_lbl.shadowOffset = CGSizeMake(0,0);
    [backupWithImage_btn addSubview:sendbtnsubtitle_lbl];
    
    
    
#pragma mark SendwithoutImage Button
    UIButton *backupWithoutImage_btn =[UIButton buttonWithType:UIButtonTypeCustom];
    [backupWithoutImage_btn setBackgroundImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"button-bg1" ofType:@"png"]] forState:UIControlStateNormal];
    [backupWithoutImage_btn setTitle:@"Backup without Images" forState:UIControlStateNormal];
    [[backupWithoutImage_btn titleLabel] setFont:[UIFont fontWithName:@"AmericanTypewriter" size:12]];
    [backupWithoutImage_btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [backupWithoutImage_btn addTarget:self action:@selector(backupWithoutImage_btnAction) forControlEvents:UIControlEventTouchUpInside];
    [mainbg_img addSubview:backupWithoutImage_btn];
    
    
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
    [backupWithoutImage_btn addSubview:sendwithoutbtnsubtitle_lbl];
    

    
    if (IS_IPHONE_5) {
        nav_img.frame=CGRectMake(0, 0, 320, 90);
        mainbg_img.frame=CGRectMake(0,0, 320, 568);
        
        back_btn.frame=CGRectMake(15, 14, 33, 54);
        navbartitle.frame=CGRectMake(0,20,320,50);
        
        topview.frame=CGRectMake(0, 91, 320, 45);
        checkBox_all.frame=CGRectMake(20,15, 15, 15);
        selectAll_lbl.frame=CGRectMake(40,8,80,30);
        checkBox_all1.frame=CGRectMake(40,8,80,30);
        noofselected.frame=CGRectMake(185,10,135,25);
        tableview.frame=CGRectMake(0, 136, 320, 360);
        backupWithImage_btn.frame=CGRectMake(15,518, 135,39.5);
        backupWithoutImage_btn.frame=CGRectMake(170,518, 135,39.5);

        
    }else{
        nav_img.frame=CGRectMake(0, 0, 320, 80);
        mainbg_img.frame=CGRectMake(0,0, 320, 480);
        
        back_btn.frame=CGRectMake(15, 13, 33, 54);
        navbartitle.frame=CGRectMake(0,20,320,50);
        
        topview.frame=CGRectMake(0, 81, 320, 45);
        checkBox_all.frame=CGRectMake(20,15, 15, 15);
        selectAll_lbl.frame=CGRectMake(40,8,80,30);
        checkBox_all1.frame=CGRectMake(40,8,80,30);
        noofselected.frame=CGRectMake(185,10,135,25);
        tableview.frame=CGRectMake(0, 126, 320, 278+10);
        backupWithImage_btn.frame=CGRectMake(15,430, 135,39.5);
        backupWithoutImage_btn.frame=CGRectMake(170,430, 135,39.5);

    }
    
    
	// Do any additional setup after loading the view.
}
-(void)Setting_btnAction
{
    NSLog(@"BtnAction");
}
-(void)backupWithoutImage_btnAction
{
    NSLog(@"BtnAction");
}
-(void)backupWithImages_btnAction
{
    NSLog(@"BtnAction");
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
    //static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:nil];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Nil];
        
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
    }
    
    NSLog(@"sssssss----\n%@",[[self.alphabetsArray valueForKey:[[[self.alphabetsArray allKeys] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)] objectAtIndex:indexPath.section]] objectAtIndex:indexPath.row]);
    
    
    
    name_lbl=[[UILabel alloc] init];
    
    name_lbl.frame=CGRectMake(60, 10, 150, 30);
    name_lbl.textAlignment=0;
    [name_lbl setTag:1];
    name_lbl.text=[NSString stringWithFormat:@"%@",[(Person*)[[self.alphabetsArray valueForKey:[[[self.alphabetsArray allKeys] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)] objectAtIndex:indexPath.section]] objectAtIndex:indexPath.row] firstName]];
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
    
    
    
    
    
    if ([[[self.checkboxClicked_Dict objectForKey:[NSString stringWithFormat:@"checked-%@",[[[self.alphabetsArray allKeys] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)] objectAtIndex:indexPath.section]]] objectAtIndex:indexPath.row] isEqualToString:@"0"]) {
        [checkBox setSelected:NO];
        
    } else {
        [checkBox setSelected:YES];
        
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
    
    
    if ([tappedButton isSelected]) {
        [tappedButton setSelected:NO];
        
        [[self.checkboxClicked_Dict objectForKey:[NSString stringWithFormat:@"checked-%@",[[[self.alphabetsArray allKeys] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)] objectAtIndex:indexPath.section]]] replaceObjectAtIndex:indexPath.row withObject:@"0"];
        if (k>0) {
            k--;
        }
        
    }
    else {
        
        [[self.checkboxClicked_Dict objectForKey:[NSString stringWithFormat:@"checked-%@",[[[self.alphabetsArray allKeys] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)] objectAtIndex:indexPath.section]]] replaceObjectAtIndex:indexPath.row withObject:@"1"];
        [tappedButton setSelected:YES];
        
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
        [[self.checkboxClicked_Dict objectForKey:[NSString stringWithFormat:@"checked-%@",[[[self.alphabetsArray allKeys] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)] objectAtIndex:indexPath.section]]] replaceObjectAtIndex:[sender tag] withObject:@"0"];
        //[editButton setHidden:YES];
        [cell.accessoryView setHidden:YES];
        if (k>0) {
            k--;
        }
        
    }
    else {
        
        [[self.checkboxClicked_Dict objectForKey:[NSString stringWithFormat:@"checked-%@",[[[self.alphabetsArray allKeys] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)] objectAtIndex:indexPath.section]]] replaceObjectAtIndex:[sender tag] withObject:@"1"];
        [tappedButton setSelected:YES];
        //[editButton setHidden:NO];
        
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
        k=(int)[obj.contactDetails count];
        noofselected.text=[NSString stringWithFormat:@"%lu Contacts Selected",(unsigned long)[obj.contactDetails count]];
    }
    
    
    NSLog(@"CHECK BOX -----%@",self.checkboxClicked_Dict);
    [tableview reloadData];
}





@end
