//
//  ContactBackUpViewController.m
//  ContactJump
//
//  Created by Raman on 15/01/14.
//  Copyright (c) 2014 iyasoft. All rights reserved.
//

#import "ContactBackUpViewController.h"
#import "KxMenu.h"
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
    
    
    if ([self respondsToSelector:@selector(setNeedsStatusBarAppearanceUpdate)]) {
        // iOS 7
        [self performSelector:@selector(setNeedsStatusBarAppearanceUpdate)];
    } else {
        // iOS 6
        [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationSlide];
    }
    
    [self.navigationController setNavigationBarHidden:YES animated:NO];
    
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
    
    
    UIButton *setting_btn =[UIButton buttonWithType:UIButtonTypeCustom];
    [setting_btn setBackgroundImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"setting-icon" ofType:@"png"]] forState:UIControlStateNormal];
    [setting_btn addTarget:self action:@selector(Setting_btnAction22:) forControlEvents:UIControlEventTouchUpInside];
    [mainbg_img addSubview:setting_btn];
    
    
#pragma mark Backup Your Contacs Button
    UIButton *backupyourcontacts_btn =[UIButton buttonWithType:UIButtonTypeCustom];
    [backupyourcontacts_btn setBackgroundImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"button-bg1" ofType:@"png"]] forState:UIControlStateNormal];
    [backupyourcontacts_btn setTitle:@"Backup Your Contacts" forState:UIControlStateNormal];
    [[backupyourcontacts_btn titleLabel] setFont:[UIFont fontWithName:@"AmericanTypewriter" size:16]];
    [backupyourcontacts_btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [backupyourcontacts_btn addTarget:self action:@selector(backupyourcontacts_btnAction) forControlEvents:UIControlEventTouchUpInside];
    [mainbg_img addSubview:backupyourcontacts_btn];
    

#pragma mark backupcontactsubtitle_lbl button sub title label.
    UILabel *backupcontactsubtitle_lbl=[[UILabel alloc] init];
    backupcontactsubtitle_lbl.frame=CGRectMake(114.5, 55, 50, 18);
    backupcontactsubtitle_lbl.text=@"1.25 MB";
    backupcontactsubtitle_lbl.textAlignment=1;
    backupcontactsubtitle_lbl.textColor= [UIColor whiteColor];
    backupcontactsubtitle_lbl.backgroundColor=[UIColor clearColor];
    backupcontactsubtitle_lbl.font=[UIFont fontWithName:@"AmericanTypewriter" size:12];
    backupcontactsubtitle_lbl.shadowColor = [UIColor whiteColor];
    backupcontactsubtitle_lbl.shadowOffset = CGSizeMake(0,0);
    [backupyourcontacts_btn addSubview:backupcontactsubtitle_lbl];
   
    
    
    
#pragma mark Download With Image Button
    
    UIButton *downloadwithImage_btn =[UIButton buttonWithType:UIButtonTypeCustom];
    [downloadwithImage_btn setBackgroundImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"button-bg1" ofType:@"png"]] forState:UIControlStateNormal];
    [downloadwithImage_btn setTitle:@"Download With Images" forState:UIControlStateNormal];
    [[downloadwithImage_btn titleLabel] setFont:[UIFont fontWithName:@"AmericanTypewriter" size:16]];
    [downloadwithImage_btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [downloadwithImage_btn addTarget:self action:@selector(downloadwithImage_btnAction) forControlEvents:UIControlEventTouchUpInside];
    [mainbg_img addSubview:downloadwithImage_btn];
    
#pragma mark downloadwithimgsubtitle_lbl button sub title label.
    UILabel *downloadwithimgsubtitle_lbl=[[UILabel alloc] init];
    downloadwithimgsubtitle_lbl.frame=CGRectMake(114.5, 55, 50, 18);
    downloadwithimgsubtitle_lbl.text=@"1.25 MB";
    downloadwithimgsubtitle_lbl.textAlignment=1;
    downloadwithimgsubtitle_lbl.textColor= [UIColor whiteColor];
    downloadwithimgsubtitle_lbl.backgroundColor=[UIColor clearColor];
    downloadwithimgsubtitle_lbl.font=[UIFont fontWithName:@"AmericanTypewriter" size:12];
    downloadwithimgsubtitle_lbl.shadowColor = [UIColor whiteColor];
    downloadwithimgsubtitle_lbl.shadowOffset = CGSizeMake(0,0);
    [downloadwithImage_btn addSubview:downloadwithimgsubtitle_lbl];
    

    
    
    
#pragma mark Download Without Image Button
    
    UIButton *downloadwithoutImage_btn =[UIButton buttonWithType:UIButtonTypeCustom];
    [downloadwithoutImage_btn setBackgroundImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"button-bg1" ofType:@"png"]] forState:UIControlStateNormal];
    [downloadwithoutImage_btn setTitle:@"Download without Images" forState:UIControlStateNormal];
    [[downloadwithoutImage_btn titleLabel] setFont:[UIFont fontWithName:@"AmericanTypewriter" size:16]];
    [downloadwithoutImage_btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [downloadwithoutImage_btn addTarget:self action:@selector(downloadwithoutImage_btnAction) forControlEvents:UIControlEventTouchUpInside];
    [mainbg_img addSubview:downloadwithoutImage_btn];

    
#pragma mark downloadwithoutimgsubtitle_lbl button sub title label.
    UILabel *downloadwithoutimgsubtitle_lbl=[[UILabel alloc] init];
    downloadwithoutimgsubtitle_lbl.frame=CGRectMake(114.5, 55, 50, 18);
    downloadwithoutimgsubtitle_lbl.text=@"1.25 MB";
    downloadwithoutimgsubtitle_lbl.textAlignment=1;
    downloadwithoutimgsubtitle_lbl.textColor= [UIColor whiteColor];
    downloadwithoutimgsubtitle_lbl.backgroundColor=[UIColor clearColor];
    downloadwithoutimgsubtitle_lbl.font=[UIFont fontWithName:@"AmericanTypewriter" size:12];
    downloadwithoutimgsubtitle_lbl.shadowColor = [UIColor whiteColor];
    downloadwithoutimgsubtitle_lbl.shadowOffset = CGSizeMake(0,0);
    [downloadwithoutImage_btn addSubview:downloadwithoutimgsubtitle_lbl];
    
    if (IS_IPHONE_5) {
        
        mainbg_img.frame=CGRectMake(0,0, 320, 568);
        navbartitle.frame=CGRectMake(0,5,320,50);
        nav_img.frame=CGRectMake(0,0,320,46.5);
        setting_btn.frame=CGRectMake(290,13.625, 19,19);
        back_btn.frame=CGRectMake(15, 13.75, 9, 19);
        navbartitle.frame=CGRectMake(0,0,320,50);
        
        backupyourcontacts_btn.frame=CGRectMake(20.5,98.25, 279,79);
        downloadwithImage_btn.frame=CGRectMake(20.5,280.5, 279,79);
        downloadwithoutImage_btn.frame=CGRectMake(20.5,389.5, 279,79);

     
        
    }else{
        
        mainbg_img.frame=CGRectMake(0,0, 320, 480);
        nav_img.frame=CGRectMake(0,0,320,46.5);
        back_btn.frame=CGRectMake(15, 13.75, 9, 19);
        // navbartitle.frame=CGRectMake(0,5,320,50);
        setting_btn.frame=CGRectMake(290,13.625, 19,19);
        navbartitle.frame=CGRectMake(0,0,320,50);
        
        
        backupyourcontacts_btn.frame=CGRectMake(20.5,92.5, 279,79);
        downloadwithImage_btn.frame=CGRectMake(20.5,240.5, 279,79);
        downloadwithoutImage_btn.frame=CGRectMake(20.5,349.5, 279,79);
       
    }

	// Do any additional setup after loading the view.
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}

-(void)Setting_btnAction
{
    NSLog(@"BtnAction");
}

-(void)back_btnAction
{
    
    [self.navigationController popViewControllerAnimated:YES];
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

-(void)backupyourcontacts_btnAction{
    
//    BackupContactsViewController *backupcontacts=[[BackupContactsViewController alloc]init];
//    [self.navigationController pushViewController:backupcontacts animated:YES];
    
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
