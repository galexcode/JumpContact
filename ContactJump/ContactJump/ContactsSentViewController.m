//
//  ContactsSentViewController.m
//  ContactJump
//
//  Created by Dex on 21/01/14.
//  Copyright (c) 2014 iyasoft. All rights reserved.
//

#import "ContactsSentViewController.h"
#import "ContacsSentDetailsViewController.h"
@interface ContactsSentViewController ()

@end

@implementation ContactsSentViewController

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
    
#pragma mark navigation image.
    UIImageView  *nav_img =[[UIImageView alloc] init];
    nav_img.image=[UIImage imageNamed:@"header-bg.png"];
    [mainbg_img addSubview:nav_img];
    
#pragma mark back button.
    UIButton *back_btn =[UIButton buttonWithType:UIButtonTypeCustom];
    [back_btn setBackgroundImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"back-button" ofType:@"png"]] forState:UIControlStateNormal];
    [back_btn addTarget:self action:@selector(back_btnAction) forControlEvents:UIControlEventTouchUpInside];
    [mainbg_img addSubview:back_btn];
    
#pragma mark settings button.
   
    
#pragma Navigation Bar Title
    UILabel *navbartitle=[[UILabel alloc] init];
    navbartitle.text=[NSString stringWithFormat:@"Sent Contacts"];
    navbartitle.textAlignment=1;
    navbartitle.textColor= [UIColor whiteColor];
    navbartitle.backgroundColor=[UIColor clearColor];
    navbartitle.font=[UIFont fontWithName:@"AmericanTypewriter" size:16];
    navbartitle.shadowColor = [UIColor whiteColor];
    navbartitle.shadowOffset = CGSizeMake(0,0);
    [mainbg_img addSubview:navbartitle];
    
#pragma mark UITableview.
    tableview=[[UITableView alloc]init];
    tableview.backgroundColor=[UIColor whiteColor];
    tableview.delegate=self;
    tableview.dataSource=self;
    [self.view addSubview:tableview];
    
    if (IS_IPHONE_5) {
        
        mainbg_img.frame=CGRectMake(0,0, 320, 568);
        nav_img.frame=CGRectMake(0,0,320,90);
        
        back_btn.frame=CGRectMake(15, 14, 33, 54);
        navbartitle.frame=CGRectMake(0,20,320,50);
        tableview.frame=CGRectMake(0, 91, 320, 477);
        
    }else{
        mainbg_img.frame=CGRectMake(0,0, 320, 480);
        nav_img.frame=CGRectMake(0,0,320,80);
       
        back_btn.frame=CGRectMake(15, 13, 33, 54);
        navbartitle.frame=CGRectMake(0,20,320,50);
        tableview.frame=CGRectMake(0, 81, 320, 399);
    }
    

}


-(void)sentDetails:(NSArray *)detailsArray
{
    NSLog(@"%@",detailsArray);
    self.senderArray=detailsArray;
}


#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.senderArray count];
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        
        UIImageView *arrow_btn=[[UIImageView alloc ]init];
        arrow_btn.frame=CGRectMake(295,18.5, 8, 13);
        [arrow_btn setImage:[UIImage imageNamed:@"arrow.png"] ];
        cell.accessoryView=arrow_btn;
        
        
#pragma mark cell message image.
        UIImageView  *msgBox_Imge =[[UIImageView alloc] init];
        msgBox_Imge.frame=CGRectMake(20,20.5, 20, 14);
        msgBox_Imge.tag=39;
        [cell.contentView addSubview:msgBox_Imge];
        
#pragma mark Name label  Cell.
        UILabel *name_lbl=[[UILabel alloc] init];
        name_lbl.frame=CGRectMake(60, 8, 120, 20);
        name_lbl.textAlignment=NSTextAlignmentLeft;
        [name_lbl setTag:40];
        name_lbl.textColor= [UIColor blackColor];
        name_lbl.backgroundColor=[UIColor clearColor];
        name_lbl.font=[UIFont fontWithName:@"AmericanTypewriter" size:16];
        [cell addSubview:name_lbl];
        
#pragma mark cell number of contacts label.
        UILabel *nofcontacts_lbl=[[UILabel alloc] init];
        nofcontacts_lbl.frame=CGRectMake(60, 33, 120, 18);
        nofcontacts_lbl.textAlignment=NSTextAlignmentLeft;
        [nofcontacts_lbl setTag:41];
        nofcontacts_lbl.textColor= [UIColor blackColor];
        nofcontacts_lbl.backgroundColor=[UIColor clearColor];
        nofcontacts_lbl.font=[UIFont fontWithName:@"AmericanTypewriter" size:12];
        [cell addSubview:nofcontacts_lbl];
        
#pragma Navigation Bar Title
        UILabel *time_lbl=[[UILabel alloc] init];
        time_lbl.frame=CGRectMake(208, 15, 80, 25);
        time_lbl.textAlignment=1;
        [time_lbl setTag:42];
        time_lbl.textColor= [UIColor blackColor];
        time_lbl.backgroundColor=[UIColor clearColor];
        time_lbl.font=[UIFont fontWithName:@"AmericanTypewriter" size:12];
        [cell addSubview:time_lbl];
        
        
    }
    
    
    UIImageView *imgVw=(UIImageView*)[cell viewWithTag:39];
    imgVw.image=[UIImage imageNamed:@"inbox-ixon.png"];
    
    UILabel *lblName =(UILabel*) [cell viewWithTag:40];
    
    
    lblName.text=[[self.senderArray objectAtIndex:indexPath.row] objectForKey:@"sendername"];
    
    UILabel *lblNumberOfContacts =(UILabel*) [cell viewWithTag:41];
    
    if ([[[self.senderArray objectAtIndex:indexPath.row] objectForKey:@"total_sharedcontacts"] isEqualToString:@"1"]) {
        lblNumberOfContacts.text=[NSString stringWithFormat:@"%@ contact",[[self.senderArray objectAtIndex:indexPath.row] objectForKey:@"total_sharedcontacts"]];
    } else {
        lblNumberOfContacts.text=[NSString stringWithFormat:@"%@ contacts",[[self.senderArray objectAtIndex:indexPath.row] objectForKey:@"total_sharedcontacts"]];
    }
    
    
    
    
    UILabel *lblTime =(UILabel*)[cell viewWithTag:42];
    lblTime.text=[[self.senderArray objectAtIndex:indexPath.row] objectForKey:@"created"];
    
    
    
    
    return cell;
    
}

//-(void)senderNoteText:(NSString *)note :(NSString*)recordId :(NSString*)name :(NSString*)time :(NSString*)totalContactsShared;
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 55.0f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ContacsSentDetailsViewController *contactDetails_Cls=[[ContacsSentDetailsViewController  alloc]init];
    
    [contactDetails_Cls senderNoteText:[[self.senderArray objectAtIndex:indexPath.row] objectForKey:@"note"]
                                      :[[self.senderArray objectAtIndex:indexPath.row] objectForKey:@"Record_id"]
                                      :[[self.senderArray objectAtIndex:indexPath.row] objectForKey:@"sendername"]
                                      :[[self.senderArray objectAtIndex:indexPath.row] objectForKey:@"created"]
                                      :[[self.senderArray objectAtIndex:indexPath.row] objectForKey:@"total_sharedcontacts"]
                                      :[[self.senderArray objectAtIndex:indexPath.row] objectForKey:@"sizewithimage"]
                                      :[[self.senderArray objectAtIndex:indexPath.row] objectForKey:@"sizewithoutimage"]
     
     
     ];
    
    [self.navigationController pushViewController:contactDetails_Cls animated:YES];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)back_btnAction
{
    [self.navigationController popViewControllerAnimated:YES];
}









@end
