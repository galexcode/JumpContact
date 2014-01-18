//
//  ContactReceivedViewController.m
//  ContactJump
//
//  Created by Raman on 12/01/14.
//  Copyright (c) 2014 iyasoft. All rights reserved.
//

#import "ContactReceivedViewController.h"
#import "ContactDetailesViewController.h"
#import "KxMenu.h"
#define IS_IPHONE_5 ( fabs( ( double )[ [ UIScreen mainScreen ] bounds ].size.height - ( double )568 ) < DBL_EPSILON )
@interface ContactReceivedViewController ()

@end

@implementation ContactReceivedViewController

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
    
    if ([self respondsToSelector:@selector(setNeedsStatusBarAppearanceUpdate)]) {
        // iOS 7
        [self performSelector:@selector(setNeedsStatusBarAppearanceUpdate)];
    } else {
        // iOS 6
        [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationSlide];
    }

    
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
    UIButton *setting_btn =[UIButton buttonWithType:UIButtonTypeCustom];
    [setting_btn setBackgroundImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"setting-icon" ofType:@"png"]] forState:UIControlStateNormal];
    [setting_btn addTarget:self action:@selector(Setting_btnAction22:) forControlEvents:UIControlEventTouchUpInside];
    [mainbg_img addSubview:setting_btn];
    
#pragma Navigation Bar Title
    UILabel *navbartitle=[[UILabel alloc] init];
    navbartitle.text=[NSString stringWithFormat:@"Received Contacts"];
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
        nav_img.frame=CGRectMake(0,0,320,46.5);
        setting_btn.frame=CGRectMake(290,13.625, 19,19);
        back_btn.frame=CGRectMake(15, 13.75, 9, 19);
        navbartitle.frame=CGRectMake(0,0,320,50);
        tableview.frame=CGRectMake(0, 46.5, 320, 521.5);
        
    }else{
    mainbg_img.frame=CGRectMake(0,0, 320, 480);
    nav_img.frame=CGRectMake(0,0,320,46.5);
    setting_btn.frame=CGRectMake(290,13.625, 19,19);
    back_btn.frame=CGRectMake(15, 13.75, 9, 19);
    navbartitle.frame=CGRectMake(0,0,320,50);
    tableview.frame=CGRectMake(0, 46.5, 320, 433);
    }

	// Do any additional setup after loading the view.
}
#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 50;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:nil];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
// cell.selectionStyle=UITableViewCellSelectionStyleNone;
    
#pragma mark cell message image.
    UIImageView  *msgBox_Imge =[[UIImageView alloc] init];
    msgBox_Imge.frame=CGRectMake(20,20.5, 20, 14);
    msgBox_Imge.image=[UIImage imageNamed:@"inbox-ixon.png"];
    [cell.contentView addSubview:msgBox_Imge];
    
#pragma mark Name label  Cell.
    UILabel *name_lbl=[[UILabel alloc] init];
    name_lbl.text=[NSString stringWithFormat:@"Jon Lax"];
    name_lbl.frame=CGRectMake(30, 8, 120, 20);
    name_lbl.textAlignment=1;
    name_lbl.textColor= [UIColor blackColor];
    name_lbl.backgroundColor=[UIColor clearColor];
    name_lbl.font=[UIFont fontWithName:@"AmericanTypewriter" size:16];
    name_lbl.shadowColor = [UIColor whiteColor];
    name_lbl.shadowOffset = CGSizeMake(0,0);
    [cell addSubview:name_lbl];
    
#pragma mark cell number of contacts label.
    UILabel *nofcontacts_lbl=[[UILabel alloc] init];
    nofcontacts_lbl.text=[NSString stringWithFormat:@"5 Contact"];
    nofcontacts_lbl.frame=CGRectMake(30, 33, 120, 18);
    nofcontacts_lbl.textAlignment=1;
    nofcontacts_lbl.textColor= [UIColor blackColor];
    nofcontacts_lbl.backgroundColor=[UIColor clearColor];
    nofcontacts_lbl.font=[UIFont fontWithName:@"AmericanTypewriter" size:12];
    nofcontacts_lbl.shadowColor = [UIColor whiteColor];
    nofcontacts_lbl.shadowOffset = CGSizeMake(0,0);
    [cell addSubview:nofcontacts_lbl];
    
#pragma Navigation Bar Title
    UILabel *time_lbl=[[UILabel alloc] init];
    time_lbl.text=[NSString stringWithFormat:@"12:41 PM"];
    time_lbl.frame=CGRectMake(208, 15, 80, 25);
    time_lbl.textAlignment=1;
    time_lbl.textColor= [UIColor blackColor];
    time_lbl.backgroundColor=[UIColor clearColor];
    time_lbl.font=[UIFont fontWithName:@"AmericanTypewriter" size:12];
    time_lbl.shadowColor = [UIColor whiteColor];
    time_lbl.shadowOffset = CGSizeMake(0,0);
    [cell addSubview:time_lbl];
    
#pragma mark arrow button.
    UIButton *arrow_btn=[UIButton buttonWithType:UIButtonTypeCustom];
    arrow_btn.tag=indexPath.row;
    arrow_btn.frame=CGRectMake(295,18.5, 8, 13);
    arrow_btn.backgroundColor=[UIColor clearColor];
    [cell.contentView addSubview:arrow_btn];
    [arrow_btn setImage:[UIImage imageNamed:@"arrow.png"] forState:UIControlStateNormal];
    [arrow_btn addTarget:self action:@selector(arrowbtn) forControlEvents:UIControlEventTouchUpInside];
    
    return cell;
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 55.0f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    ContactDetailesViewController *contactDetails_Cls=[[ContactDetailesViewController  alloc]init];
    [self.navigationController pushViewController:contactDetails_Cls animated:YES];
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)Setting_btnAction
{
    NSLog(@"BtnAction");
}
-(void)back_btnAction
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (BOOL)prefersStatusBarHidden {
    return YES;
}
-(void)arrowbtn{
    
}

#pragma mark Settings button Action
-(void)Setting_btnAction22:(UIButton *)sender{
    NSInteger tagVal=((UIButton *)sender).tag;
    NSLog(@"List button Action==%d",tagVal);
    
    //Email Facebook Share Tweet
    NSArray *menuItems =
    @[
      [KxMenuItem menuItem:@""
                     image:[UIImage imageNamed:@"popbtn.png"]
                    target:self
                    action:@selector(pushMenuItem1:)],
      
      [KxMenuItem menuItem:@""
                     image:[UIImage imageNamed:@"popbtn.png"]
                    target:self
                    action:@selector(pushMenuItem2:)],
      
      [KxMenuItem menuItem:@""
                     image:[UIImage imageNamed:@"popbtn.png"]
                    target:self
                    action:@selector(pushMenuItem3:)],
      
      [KxMenuItem menuItem:@""
                     image:[UIImage imageNamed:@"popbtn.png"]
                    target:self
                    action:@selector(pushMenuItem4:)],
      
      ];
    
    KxMenuItem *first = menuItems[0];
    first.foreColor = [UIColor colorWithRed:47/255.0f green:112/255.0f blue:225/255.0f alpha:1.0];
    first.alignment = NSTextAlignmentCenter;
    
    [KxMenu showMenuInView:self.navigationController.view fromRect:sender.frame menuItems:menuItems];
    
}

-(void)pushMenuItem1:(id)sender{
    
    NSLog(@"FIRST Item Clicked");
}
-(void)pushMenuItem2:(id)sender{
    
    NSLog(@"SECOND Item Clicked");
}
-(void)pushMenuItem3:(id)sender{
    
    NSLog(@"THIRD Item Clicked");
}
-(void)pushMenuItem4:(id)sender{
    
    NSLog(@"FOURTH Item Clicked");
}





@end
