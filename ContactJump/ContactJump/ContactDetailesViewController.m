//
//  ContactDetailesViewController.m
//  ContactJump
//
//  Created by Raman on 12/01/14.
//  Copyright (c) 2014 iyasoft. All rights reserved.
//

#import "ContactDetailesViewController.h"
#import "SendContactsViewController.h"
#import "KxMenu.h"
#define IS_IPHONE_5 ( fabs( ( double )[ [ UIScreen mainScreen ] bounds ].size.height - ( double )568 ) < DBL_EPSILON )
@interface ContactDetailesViewController ()

@end

@implementation ContactDetailesViewController

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
    [super viewDidLoad];
#pragma Main BG ImageView
    UIImageView *mainbg_img = [[UIImageView alloc] init];
    mainbg_img.userInteractionEnabled=TRUE;
    mainbg_img.opaque = YES;
//    [mainbg_img setImage:[UIImage imageNamed:@"Min-bg.png"]];
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
    
#pragma mark logout button.
    UIButton *logout_btn =[UIButton buttonWithType:UIButtonTypeCustom];
    [logout_btn setBackgroundImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"logount-icon" ofType:@"png"]] forState:UIControlStateNormal];
    [logout_btn addTarget:self action:@selector(Setting_btnAction22:) forControlEvents:UIControlEventTouchUpInside];
    [mainbg_img addSubview:logout_btn];
    
#pragma Navigation Bar Title
    UILabel *navbartitle=[[UILabel alloc] init];
    navbartitle.text=[NSString stringWithFormat:@"Jon Lax"];
    navbartitle.textAlignment=1;
    navbartitle.textColor= [UIColor whiteColor];
    navbartitle.backgroundColor=[UIColor clearColor];
    navbartitle.font=[UIFont fontWithName:@"AmericanTypewriter" size:18];
    navbartitle.shadowColor = [UIColor whiteColor];
    navbartitle.shadowOffset = CGSizeMake(0,0);
    [mainbg_img addSubview:navbartitle];
    
#pragma mark number of selected contacts.
    UILabel *noofselectedcontacts=[[UILabel alloc] init];
    noofselectedcontacts.frame=CGRectMake(30, 60, 150, 40);
    noofselectedcontacts.text=@"25 Contacts Recieved";
    noofselectedcontacts.textAlignment=1;
    noofselectedcontacts.textColor= [UIColor blackColor];
    noofselectedcontacts.backgroundColor=[UIColor clearColor];
    noofselectedcontacts.font=[UIFont fontWithName:@"AmericanTypewriter" size:14];
    noofselectedcontacts.shadowColor = [UIColor whiteColor];
    noofselectedcontacts.shadowOffset = CGSizeMake(0,0);
    [mainbg_img addSubview:noofselectedcontacts];
    
#pragma Navigation Bar Title
    UILabel *time_lbl=[[UILabel alloc] init];
    time_lbl.text=[NSString stringWithFormat:@"12:41 PM"];
    time_lbl.frame=CGRectMake(220, 70, 80, 25);
    time_lbl.textAlignment=1;
    time_lbl.textColor= [UIColor blackColor];
    time_lbl.backgroundColor=[UIColor clearColor];
    time_lbl.font=[UIFont fontWithName:@"AmericanTypewriter" size:12];
    time_lbl.shadowColor = [UIColor whiteColor];
    time_lbl.shadowOffset = CGSizeMake(0,0);
    [mainbg_img addSubview:time_lbl];
    
    
#pragma mark Text Area  image.
    UIImageView  *textarea_img =[[UIImageView alloc] init];
    textarea_img.image=[UIImage imageNamed:@"text=area.png"];
    textarea_img.frame=CGRectMake(15, 110, 290, 142.5);
    [mainbg_img addSubview:textarea_img];
    
#pragma mark Text View.
    UITextView *textview=[[UITextView alloc]init];
    textview.text=[NSString stringWithFormat:@"2011 PayPal, Inc. All rights reserved. PayPal is a registered trademark of PayPal, Inc. The PayPal logo is a trademark of PayPal, Inc. Other trademarks and brands are the property of their respective owners.The information in this document belongs to PayPal, Inc. It may not be used, reproduced or disclosed without the written approval of PayPal, Inc."];
    textview.scrollEnabled=YES;
    textview.frame=CGRectMake(5, 5, 280, 132.5);
    textview.backgroundColor=[UIColor clearColor];
    textview.textColor=[UIColor darkGrayColor];
    [textarea_img addSubview:textview];
    
#pragma mark Canecl Button
    UIButton *sendwithImage_btn =[UIButton buttonWithType:UIButtonTypeCustom];
    [sendwithImage_btn setBackgroundImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"button-bg1" ofType:@"png"]] forState:UIControlStateNormal];
    [sendwithImage_btn setTitle:@"Received with Images" forState:UIControlStateNormal];
    [[sendwithImage_btn titleLabel] setFont:[UIFont fontWithName:@"AmericanTypewriter" size:12]];
    [sendwithImage_btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [sendwithImage_btn addTarget:self action:@selector(SendwithImage_btnAction) forControlEvents:UIControlEventTouchUpInside];
    [mainbg_img addSubview:sendwithImage_btn];
    
#pragma mark send button sub title label.
    UILabel *sendbtnsubtitle_lbl=[[UILabel alloc] init];
    sendbtnsubtitle_lbl.frame=CGRectMake(40, 22, 50, 18);
    sendbtnsubtitle_lbl.text=@"1.25 MB";
    sendbtnsubtitle_lbl.textAlignment=1;
    sendbtnsubtitle_lbl.textColor= [UIColor whiteColor];
    sendbtnsubtitle_lbl.backgroundColor=[UIColor clearColor];
    sendbtnsubtitle_lbl.font=[UIFont fontWithName:@"AmericanTypewriter" size:8];
    sendbtnsubtitle_lbl.shadowColor = [UIColor whiteColor];
    sendbtnsubtitle_lbl.shadowOffset = CGSizeMake(0,0);
    [sendwithImage_btn addSubview:sendbtnsubtitle_lbl];
    
    
#pragma mark Done Button
    UIButton *sendwithoutImage_btn =[UIButton buttonWithType:UIButtonTypeCustom];
    [sendwithoutImage_btn setBackgroundImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"button-bg1" ofType:@"png"]] forState:UIControlStateNormal];
    [sendwithoutImage_btn setTitle:@"Received without Images" forState:UIControlStateNormal];
    [[sendwithoutImage_btn titleLabel] setFont:[UIFont fontWithName:@"AmericanTypewriter" size:10]];
    [sendwithoutImage_btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [sendwithoutImage_btn addTarget:self action:@selector(sendwithoutImage_btnAction) forControlEvents:UIControlEventTouchUpInside];
    [mainbg_img addSubview:sendwithoutImage_btn];
 
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
    [sendwithoutImage_btn addSubview:sendwithoutbtnsubtitle_lbl];

    
    if (IS_IPHONE_5) {
        
        mainbg_img.frame=CGRectMake(0,0, 320, 568);
        nav_img.frame=CGRectMake(0,0,320,46.5);
        logout_btn.frame=CGRectMake(290,14, 21,18.5);
        back_btn.frame=CGRectMake(15, 13.75, 9, 19);
        navbartitle.frame=CGRectMake(0,0,320,50);
        sendwithImage_btn.frame=CGRectMake(16.66,500, 135,39.5);
        sendwithoutImage_btn.frame=CGRectMake(168.66,500, 135,39.5);
        
    }else{
        mainbg_img.frame=CGRectMake(0,0, 320, 480);
        nav_img.frame=CGRectMake(0,0,320,46.5);
       logout_btn.frame=CGRectMake(290,14, 21,18.5);
        back_btn.frame=CGRectMake(15, 13.75, 9, 19);
        navbartitle.frame=CGRectMake(0,0,320,50);
        sendwithImage_btn.frame=CGRectMake(16.66,410, 135,39.5);
        sendwithoutImage_btn.frame=CGRectMake(168.66,410, 135,39.5);
   
    }
    
	// Do any additional setup after loading the view.
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
-(void)SendwithImage_btnAction{
    
    SendContactsViewController *addContact_Cls=[[SendContactsViewController alloc]init];
    [self.navigationController pushViewController:addContact_Cls animated:YES];
    
}
-(void)sendwithoutImage_btnAction{
    
    SendContactsViewController *addContact_Cls=[[SendContactsViewController alloc]init];
    [self.navigationController pushViewController:addContact_Cls animated:YES];

}
#pragma mark Settings button Action
-(void)Setting_btnAction22:(UIButton *)sender{
    NSInteger tagVal=((UIButton *)sender).tag;
    NSLog(@"List button Action==%d",tagVal);
 /*
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
    */
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
