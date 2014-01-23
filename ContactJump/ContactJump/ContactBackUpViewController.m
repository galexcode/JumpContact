//
//  ContactBackUpViewController.m
//  ContactJump
//
//  Created by Raman on 15/01/14.
//  Copyright (c) 2014 iyasoft. All rights reserved.
//

#import "ContactBackUpViewController.h"
#import "SelectContactsForBackupViewController.h"

#define IS_IPHONE_5 ( fabs( ( double )[ [ UIScreen mainScreen ] bounds ].size.height - ( double )568 ) < DBL_EPSILON )
@interface ContactBackUpViewController ()

@end

@implementation ContactBackUpViewController

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
    
    
    UIImageView  *nav_img =[[UIImageView alloc] init];
    nav_img.image=[UIImage imageNamed:@"header-bg.png"];
    [mainbg_img addSubview:nav_img];
    
#pragma Navigation Bar Title
    navbartitle=[[UILabel alloc] init];
    navbartitle.text=[NSString stringWithFormat:@"Contact Backup"];
    navbartitle.textAlignment=1;
    navbartitle.textColor= [UIColor whiteColor];
    navbartitle.backgroundColor=[UIColor clearColor];
    navbartitle.font=[UIFont fontWithName:@"AmericanTypewriter" size:16];
    navbartitle.shadowColor = [UIColor whiteColor];
    navbartitle.shadowOffset = CGSizeMake(0,0);
    [nav_img addSubview:navbartitle];
    
    
    
    UIButton *back_btn =[UIButton buttonWithType:UIButtonTypeCustom];
    [back_btn setBackgroundImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"back-button" ofType:@"png"]] forState:UIControlStateNormal];
    [back_btn addTarget:self action:@selector(back_btnAction) forControlEvents:UIControlEventTouchUpInside];
    [mainbg_img addSubview:back_btn];
    
    
  
    
    
#pragma mark Backup Your Contacs Button
    UIButton *backupyourcontacts_btn =[UIButton buttonWithType:UIButtonTypeCustom];
    [backupyourcontacts_btn setBackgroundImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"button-bg1" ofType:@"png"]] forState:UIControlStateNormal];
    [backupyourcontacts_btn setTitle:@"Backup Your Contacts" forState:UIControlStateNormal];
    [backupyourcontacts_btn setTitleEdgeInsets:UIEdgeInsetsMake(-20.0f, 10.0f, 0.0f, 0.0f)];
    [[backupyourcontacts_btn titleLabel] setFont:[UIFont fontWithName:@"AmericanTypewriter" size:16]];
    [backupyourcontacts_btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [backupyourcontacts_btn addTarget:self action:@selector(backupyourcontacts_btnAction) forControlEvents:UIControlEventTouchUpInside];
    [mainbg_img addSubview:backupyourcontacts_btn];
    

#pragma mark backupcontactsubtitle_lbl button sub title label.
    UILabel *backupcontactsubtitle_lbl=[[UILabel alloc] init];
    backupcontactsubtitle_lbl.frame=CGRectMake(0, 45, 279, 18);
    backupcontactsubtitle_lbl.text=@"1.25 MB";
    backupcontactsubtitle_lbl.textAlignment=UITextAlignmentCenter;
    backupcontactsubtitle_lbl.textColor= [UIColor lightGrayColor];
    backupcontactsubtitle_lbl.backgroundColor=[UIColor clearColor];
    backupcontactsubtitle_lbl.font=[UIFont fontWithName:@"AmericanTypewriter" size:13];
    [backupyourcontacts_btn addSubview:backupcontactsubtitle_lbl];
   
    NSDate *localDate = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    dateFormatter.dateFormat = @"MM/dd/yy";
    

    NSDateFormatter *timeFormatter = [[NSDateFormatter alloc]init];
    timeFormatter.dateFormat = @"HH:mm a";
    

    UILabel *lastBackup_Date=[[UILabel alloc] init];
    
    lastBackup_Date.text=[NSString stringWithFormat:@"Last backup:  %@,  %@",[timeFormatter stringFromDate: localDate],[dateFormatter stringFromDate: localDate]];
    lastBackup_Date.textAlignment=UITextAlignmentLeft;
    lastBackup_Date.textColor= [UIColor whiteColor];
    lastBackup_Date.backgroundColor=[UIColor clearColor];
    lastBackup_Date.font=[UIFont fontWithName:@"AmericanTypewriter" size:12];
    lastBackup_Date.shadowColor = [UIColor whiteColor];
    lastBackup_Date.shadowOffset = CGSizeMake(0,0);
    [mainbg_img addSubview:lastBackup_Date];
    
#pragma mark Download With Image Button
    
    UIButton *downloadwithImage_btn =[UIButton buttonWithType:UIButtonTypeCustom];
    [downloadwithImage_btn setBackgroundImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"button-bg1" ofType:@"png"]] forState:UIControlStateNormal];
    [downloadwithImage_btn setTitleEdgeInsets:UIEdgeInsetsMake(-20.0f, 10.0f, 0.0f, 0.0f)];
    [downloadwithImage_btn setTitle:@"Download With Images" forState:UIControlStateNormal];
    [[downloadwithImage_btn titleLabel] setFont:[UIFont fontWithName:@"AmericanTypewriter" size:16]];
    [downloadwithImage_btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [downloadwithImage_btn addTarget:self action:@selector(downloadwithImage_btnAction) forControlEvents:UIControlEventTouchUpInside];
    [mainbg_img addSubview:downloadwithImage_btn];
    
#pragma mark downloadwithimgsubtitle_lbl button sub title label.
    UILabel *downloadwithimgsubtitle_lbl=[[UILabel alloc] init];
    downloadwithimgsubtitle_lbl.frame=CGRectMake(0, 45, 279, 18);
    downloadwithimgsubtitle_lbl.text=@"1.25 MB";
    downloadwithimgsubtitle_lbl.textAlignment=UITextAlignmentCenter;
    downloadwithimgsubtitle_lbl.textColor= [UIColor lightGrayColor];
    downloadwithimgsubtitle_lbl.backgroundColor=[UIColor clearColor];
    downloadwithimgsubtitle_lbl.font=[UIFont fontWithName:@"AmericanTypewriter" size:13];
    
    [downloadwithImage_btn addSubview:downloadwithimgsubtitle_lbl];
    

    
    
    
#pragma mark Download Without Image Button
    
    UIButton *downloadwithoutImage_btn =[UIButton buttonWithType:UIButtonTypeCustom];
    [downloadwithoutImage_btn setBackgroundImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"button-bg1" ofType:@"png"]] forState:UIControlStateNormal];
     [downloadwithoutImage_btn setTitleEdgeInsets:UIEdgeInsetsMake(-20.0f, 10.0f, 0.0f, 0.0f)];
    [downloadwithoutImage_btn setTitle:@"Download without Images" forState:UIControlStateNormal];
    [[downloadwithoutImage_btn titleLabel] setFont:[UIFont fontWithName:@"AmericanTypewriter" size:16]];
    [downloadwithoutImage_btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [downloadwithoutImage_btn addTarget:self action:@selector(downloadwithoutImage_btnAction) forControlEvents:UIControlEventTouchUpInside];
    [mainbg_img addSubview:downloadwithoutImage_btn];

    
#pragma mark downloadwithoutimgsubtitle_lbl button sub title label.
    UILabel *downloadwithoutimgsubtitle_lbl=[[UILabel alloc] init];
    downloadwithoutimgsubtitle_lbl.frame=CGRectMake(0, 45, 279, 18);
    downloadwithoutimgsubtitle_lbl.text=@"1.25 MB";
    downloadwithoutimgsubtitle_lbl.textAlignment=UITextAlignmentCenter;
    downloadwithoutimgsubtitle_lbl.textColor= [UIColor lightGrayColor];
    downloadwithoutimgsubtitle_lbl.backgroundColor=[UIColor clearColor];
    downloadwithoutimgsubtitle_lbl.font=[UIFont fontWithName:@"AmericanTypewriter" size:13];
    [downloadwithoutImage_btn addSubview:downloadwithoutimgsubtitle_lbl];
    
    if (IS_IPHONE_5) {
        
        mainbg_img.frame=CGRectMake(0,0, 320, 568);
        nav_img.frame=CGRectMake(0,0,320,90);
        back_btn.frame=CGRectMake(15, 14, 33, 54);
        navbartitle.frame=CGRectMake(0,20,320,50);
        
        backupyourcontacts_btn.frame=CGRectMake(20.5,140, 279,79);
        lastBackup_Date.frame=CGRectMake(23.5,223, 279,30);
        downloadwithImage_btn.frame=CGRectMake(20.5,310, 279,79);
        downloadwithoutImage_btn.frame=CGRectMake(20.5,439, 279,79);

     
        
    }else{
        
        mainbg_img.frame=CGRectMake(0,0, 320, 480);
        nav_img.frame=CGRectMake(0,0,320,80);
        back_btn.frame=CGRectMake(15, 13, 33, 54);
        navbartitle.frame=CGRectMake(0,20,320,50);
        
        lastBackup_Date.frame=CGRectMake(23.5,198, 279,30);
        backupyourcontacts_btn.frame=CGRectMake(20.5,115, 279,79);
        downloadwithImage_btn.frame=CGRectMake(20.5,257, 279,79);
        downloadwithoutImage_btn.frame=CGRectMake(20.5,361+5, 279,79);
       
    }

	// Do any additional setup after loading the view.
}




-(void)back_btnAction
{
    
    [self.navigationController popViewControllerAnimated:YES];
}


-(void)backupyourcontacts_btnAction{
    
    SelectContactsForBackupViewController *backupcontacts=[[SelectContactsForBackupViewController alloc]init];
    [self.navigationController pushViewController:backupcontacts animated:YES];
    
}
-(void)downloadwithImage_btnAction{
    
//    DownloadBackupContactViewController *downloadBackupcontacts=[[DownloadBackupContactViewController alloc]init];
//    [self.navigationController pushViewController:downloadBackupcontacts animated:YES];
//    
}
-(void)downloadwithoutImage_btnAction{
    
   // DownloadBackupContactViewController *downloadBackupcontacts=[[DownloadBackupContactViewController alloc]init];
 //   [self.navigationController pushViewController:downloadBackupcontacts animated:YES];
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
