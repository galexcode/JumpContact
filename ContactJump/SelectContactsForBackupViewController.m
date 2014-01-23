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
    [super viewDidLoad];
    namesArry=[[NSArray alloc]initWithObjects:@"Aruna",@"Chandra",@"chinna",@"danam",@"Gangadhar",@"Gowthami",@"Japana",@"kareemulla",@"Kombi",@"Kirshna", nil];
    alphabetsArray = [[NSMutableArray alloc] init];
    [alphabetsArray addObject:@"A"];
    [alphabetsArray addObject:@"B"];
    [alphabetsArray addObject:@"C"];
    [alphabetsArray addObject:@"D"];
    [alphabetsArray addObject:@"E"];
    [alphabetsArray addObject:@"F"];
    [alphabetsArray addObject:@"G"];
    [alphabetsArray addObject:@"H"];
    [alphabetsArray addObject:@"I"];
    [alphabetsArray addObject:@"J"];
    [alphabetsArray addObject:@"K"];
    [alphabetsArray addObject:@"L"];
    [alphabetsArray addObject:@"M"];
    [alphabetsArray addObject:@"N"];
    [alphabetsArray addObject:@"O"];
    [alphabetsArray addObject:@"P"];
    [alphabetsArray addObject:@"Q"];
    [alphabetsArray addObject:@"R"];
    [alphabetsArray addObject:@"S"];
    [alphabetsArray addObject:@"T"];
    [alphabetsArray addObject:@"U"];
    [alphabetsArray addObject:@"V"];
    [alphabetsArray addObject:@"W"];
    [alphabetsArray addObject:@"Y"];
    [alphabetsArray addObject:@"X"];
    [alphabetsArray addObject:@"Z"];
    
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
    UIButton   * checkBox=[UIButton buttonWithType:UIButtonTypeCustom];
    [checkBox setImage:[UIImage imageNamed:@"check-box-inactive.png"] forState:UIControlStateNormal];
    [checkBox setImage:[UIImage imageNamed:@"cehck-box-active.png"] forState:UIControlStateSelected];
    [checkBox addTarget:self action:@selector(checkBoxClicked:) forControlEvents:UIControlEventTouchUpInside];
    [checkBox setSelected:NO];
    [topview addSubview:checkBox];
    
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
    
#pragma mark number of selected contacts label.
    noofselected=[[UILabel alloc] init];
    noofselected.text=[NSString stringWithFormat:@"100 Contacts Selected"];
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
        checkBox.frame=CGRectMake(20,15, 15, 15);
        selectAll_lbl.frame=CGRectMake(40,8,80,30);
        noofselected.frame=CGRectMake(175,8,135,25);
        tableview.frame=CGRectMake(0, 136, 320, 360);
        backupWithImage_btn.frame=CGRectMake(15,518, 135,39.5);
        backupWithoutImage_btn.frame=CGRectMake(170,518, 135,39.5);

        
    }else{
        nav_img.frame=CGRectMake(0, 0, 320, 80);
        mainbg_img.frame=CGRectMake(0,0, 320, 480);
        
        back_btn.frame=CGRectMake(15, 13, 33, 54);
        navbartitle.frame=CGRectMake(0,20,320,50);
        
        topview.frame=CGRectMake(0, 81, 320, 45);
        checkBox.frame=CGRectMake(20,15, 15, 15);
        selectAll_lbl.frame=CGRectMake(40,8,80,30);
        noofselected.frame=CGRectMake(175,8,135,25);
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
    
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [namesArry count];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:nil];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    }
    
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    
    
    
    UILabel  *name_lbl=[[UILabel alloc] init];
    name_lbl.text=[NSString stringWithFormat:@"%@",[namesArry objectAtIndex:indexPath.row]];
    name_lbl.frame=CGRectMake(60, 7, 150, 30);
    name_lbl.textAlignment=0;
    name_lbl.textColor= [UIColor blackColor];
    name_lbl.backgroundColor=[UIColor clearColor];
    name_lbl.font=[UIFont fontWithName:@"ArialMT" size:15];
    name_lbl.shadowColor = [UIColor whiteColor];
    name_lbl.shadowOffset = CGSizeMake(0,0);
    [cell.contentView addSubview:name_lbl];
    
    
    
    UIButton   * checkBox=[UIButton buttonWithType:UIButtonTypeCustom];
    checkBox.tag=indexPath.row;
    checkBox.frame=CGRectMake(20,15, 15, 15);
    [cell.contentView addSubview:checkBox];
    [checkBox setImage:[UIImage imageNamed:@"check-box-inactive.png"] forState:UIControlStateNormal];
    [checkBox setImage:[UIImage imageNamed:@"cehck-box-active.png"] forState:UIControlStateSelected];
    [checkBox addTarget:self action:@selector(checkBoxClicked:) forControlEvents:UIControlEventTouchUpInside];
    [checkBox setSelected:NO];
    
    
    UIButton   * editbtn=[UIButton buttonWithType:UIButtonTypeCustom];
    editbtn.tag=indexPath.row;
    [editbtn setHidden:YES];
    editbtn.frame=CGRectMake(280,15, 16, 16);
    editbtn.backgroundColor=[UIColor clearColor];
    [cell.contentView addSubview:editbtn];
    [editbtn setImage:[UIImage imageNamed:@"edit-icon.png"] forState:UIControlStateNormal];
    [editbtn addTarget:self action:@selector(editbtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    
    return cell;
    
}
- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView {
    return alphabetsArray;
}

- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index {
    
    return index;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 50.0f;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=(UITableViewCell*)[tableview cellForRowAtIndexPath:indexPath];
    NSLog(@"%@", cell.contentView.subviews);
    UIButton *tappedButton = (UIButton*)[cell.contentView.subviews objectAtIndex:1];
    
    UIButton *editButton = (UIButton*)[cell.contentView.subviews objectAtIndex:2];
    if ([tappedButton isSelected]) {
        [tappedButton setSelected:NO];
        [editButton setHidden:YES];
    } else {
        [tappedButton setSelected:YES];
        [editButton setHidden:NO];
    }
    
    
    
}

-(void)checkBoxClicked:(id)sender {
    
    UIButton *editButton = (UIButton*)[[[sender superview] subviews] objectAtIndex:2];
    UIButton *tappedButton = (UIButton*)sender;
    if ([tappedButton isSelected]) {
        [tappedButton setSelected:NO];
        
        [editButton setHidden:YES];
    }
    else {
        [tappedButton setSelected:YES];
        [editButton setHidden:NO];
    }
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    
    NSLog(@"titleForHeaderInSection section=%ld",(long)section);
    if (section ==0) {
        
        return @"A";
    }
    else if(section ==1){
        
        return @"B";
    }
    else if(section ==2){
        
        return @"C";
    }
    else if(section ==3){
        
        return @"D";
    }
    else if(section ==4){
        
        return @"E";
    }
    else if(section ==5){
        
        return @"F";
    }
    else if(section ==6){
        
        return @"G";
    }
    else if(section ==7){
        
        return @"H";
    }
    else if(section ==8){
        
        return @"I";
    }
    else if(section ==9){
        
        return @"J";
    }
    else if(section ==10){
        
        return @"K";
    }
    else if(section ==11){
        
        return @"L";
    }
    else if(section ==12){
        
        return @"M";
    }
    else if(section ==13){
        
        return @"N";
    }
    else if(section ==14){
        
        return @"O";
    }
    else if(section ==15){
        
        return @"P";
    }
    else if(section ==16){
        
        return @"Q";
    }
    else if(section ==17){
        
        return @"R";
    }
    else if(section ==18){
        
        return @"S";
    }
    else if(section ==19){
        
        return @"T";
    }
    else if(section ==20){
        
        return @"U";
    }
    else if(section ==21){
        
        return @"V";
    }
    else if(section ==22){
        
        return @"W";
    }
    else if(section ==23){
        
        return @"X";
    }
    else if(section ==24){
        
        return @"Y";
    }
    else if(section ==25){
        
        return @"Z";
    }
    return NO;
}

-(void)editbtnClicked:(id)sender
{
    NSLog(@"%ld",(long)[sender tag]);
}



@end
