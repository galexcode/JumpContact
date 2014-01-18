

//  ContactGetSelectMethodViewController.m
//  ContactJump
//
//  Created by Raman on 11/01/14.
//  Copyright (c) 2014 iyasoft. All rights reserved.
//

#import "ContactGetSelectMethodViewController.h"
#import "KxMenu.h"

#define IS_IPHONE_5 ( fabs( ( double )[ [ UIScreen mainScreen ] bounds ].size.height - ( double )568 ) < DBL_EPSILON )
@interface ContactGetSelectMethodViewController ()

@end

@implementation ContactGetSelectMethodViewController

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
    navbartitle.text=[NSString stringWithFormat:@"Select Method"];
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
    
    
    
    
    
    UIButton *getuseingid_btn =[UIButton buttonWithType:UIButtonTypeCustom];
    getuseingid_btn.frame=CGRectMake(0, 46.5, 320, 50);
    [getuseingid_btn setTitle:@"GetUsing ID/Password" forState:UIControlStateNormal];
    [[getuseingid_btn titleLabel] setFont:[UIFont fontWithName:@"AmericanTypewriter" size:18]];
    [getuseingid_btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    getuseingid_btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    CGFloat spacing = 50; // the amount of spacing to appear between image and title
    getuseingid_btn.titleEdgeInsets = UIEdgeInsetsMake(0, spacing, 0, 0);
    [getuseingid_btn addTarget:self action:@selector(Setting_btnAction) forControlEvents:UIControlEventTouchUpInside];
    [mainbg_img addSubview:getuseingid_btn];

    
    UIImageView  *get_img =[[UIImageView alloc] init];
    get_img.frame=CGRectMake(15, 16, 20, 18);
    get_img.image=[UIImage imageNamed:@"shareimg.png"];
    [getuseingid_btn addSubview:get_img];
    
    
    
    UIImageView  *seprator_image =[[UIImageView alloc] init];
    seprator_image.frame=CGRectMake(0, 96.5, 320, 2);
    seprator_image.image=[UIImage imageNamed:@"seprator.png"];
    [mainbg_img addSubview:seprator_image];
    
    UITextView *textview=[[UITextView alloc]init];
    
    textview.text=[NSString stringWithFormat:@"2011 PayPal, Inc. All rights reserved. PayPal is a registered trademark of PayPal, Inc. The PayPal logo is a trademark of PayPal, Inc. Other trademarks and brands are the property of their respective owners.  The information in this document belongs to PayPal, Inc. It may not be used, reproduced or disclosed without the written approval of PayPal, Inc. Copyright © PayPal. All rights reserved. PayPal S.à r.l. et Cie, S.C.A., Société en Commandite par Actions. Registered offi"];
    textview.scrollEnabled=YES;
    textview.editable=FALSE;
    textview.frame=CGRectMake(5, 103.5+5, 310, 150);
    textview.backgroundColor=[UIColor clearColor];
    textview.textColor=[UIColor whiteColor];
    
    [mainbg_img addSubview:textview];
    
        
    
    UIImageView  *seprator_image1 =[[UIImageView alloc] init];
    seprator_image1.frame=CGRectMake(0, 270, 320, 2);
    seprator_image1.image=[UIImage imageNamed:@"seprator.png"];
    [mainbg_img addSubview:seprator_image1];
    
    
    
#pragma Navigation Bar Title
    UILabel  *id_lbl=[[UILabel alloc] init];
    id_lbl.text=[NSString stringWithFormat:@"ID"];
    id_lbl.textAlignment=2;
    id_lbl.frame=CGRectMake(60, 292, 30, 25);
    id_lbl.textColor= [UIColor whiteColor];
    id_lbl.backgroundColor=[UIColor clearColor];
    id_lbl.font=[UIFont fontWithName:@"AmericanTypewriter" size:16];
    id_lbl.shadowColor = [UIColor whiteColor];
    id_lbl.shadowOffset = CGSizeMake(0,0);
    [mainbg_img addSubview:id_lbl];
    
    
    
    UIImageView  *idbg_img =[[UIImageView alloc] init];
    idbg_img.frame=CGRectMake(95, 292, 211, 24);
    idbg_img.image=[UIImage imageNamed:@"text-box.png"];
    idbg_img.userInteractionEnabled=YES;
    [mainbg_img addSubview:idbg_img];
    
#pragma Restaurent TextField
    id_Txt = [[UITextField  alloc] init];
    id_Txt.borderStyle = UITextBorderStyleNone;
    id_Txt.frame=CGRectMake(0, 0, 211, 24);
    id_Txt.font = [UIFont fontWithName:@"ArialMT" size:(14.0)];
    id_Txt.textColor=[UIColor grayColor];
    id_Txt.placeholder=@"Id";
    id_Txt.backgroundColor=[UIColor clearColor];
    id_Txt.delegate = self;
    id_Txt.returnKeyType = UIReturnKeyDefault;
    id_Txt.textAlignment=0;
    id_Txt.secureTextEntry=YES;
    id_Txt.tag=100;
    id_Txt.autocapitalizationType = UITextAutocapitalizationTypeNone;
    [idbg_img addSubview:id_Txt];

    
    
    
    UIImageView  *pswtxtbg_img =[[UIImageView alloc] init];
    pswtxtbg_img.frame=CGRectMake(95, 327, 211, 24);
    pswtxtbg_img.image=[UIImage imageNamed:@"text-box.png"];
    pswtxtbg_img.userInteractionEnabled=YES;
    [mainbg_img addSubview:pswtxtbg_img];

    
#pragma Navigation Bar Title
    UILabel  *psw_lbl=[[UILabel alloc] init];
    psw_lbl.text=[NSString stringWithFormat:@"Password"];
    psw_lbl.textAlignment=2;
    psw_lbl.frame=CGRectMake(15, 327, 75, 25);
    psw_lbl.textColor= [UIColor whiteColor];
    psw_lbl.backgroundColor=[UIColor clearColor];
    psw_lbl.font=[UIFont fontWithName:@"AmericanTypewriter" size:13];
    psw_lbl.shadowColor = [UIColor whiteColor];
    psw_lbl.shadowOffset = CGSizeMake(0,0);
    [mainbg_img addSubview:psw_lbl];
    
    
#pragma Restaurent TextField
    psw_Txt = [[UITextField  alloc] init];
    psw_Txt.frame=CGRectMake(0, 0, 211, 24);
    psw_Txt.borderStyle = UITextBorderStyleNone;
    psw_Txt.font = [UIFont fontWithName:@"ArialMT" size:(14.0)];
    psw_Txt.textColor=[UIColor grayColor];
    psw_Txt.placeholder=@"Password";
    psw_Txt.backgroundColor=[UIColor clearColor];
    psw_Txt.delegate = self;
    psw_Txt.returnKeyType = UIReturnKeyDefault;
    psw_Txt.textAlignment=0;
    psw_Txt.tag=100;
    psw_Txt.autocapitalizationType = UITextAutocapitalizationTypeNone;
    [pswtxtbg_img addSubview:psw_Txt];
    
   
    
    
    
    
    UIImageView  *seprator_image2 =[[UIImageView alloc] init];
    seprator_image2.frame=CGRectMake(0, 370, 320, 2);
    seprator_image2.image=[UIImage imageNamed:@"seprator.png"];
    [mainbg_img addSubview:seprator_image2];
    

    
#pragma mark Canecl Button
    UIButton *sendwithImage_btn =[UIButton buttonWithType:UIButtonTypeCustom];
    [sendwithImage_btn setBackgroundImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"button-bg1" ofType:@"png"]] forState:UIControlStateNormal];
    [sendwithImage_btn setTitle:@"Get with Images" forState:UIControlStateNormal];
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
    [sendwithoutImage_btn setTitle:@"Get without Images" forState:UIControlStateNormal];
    [[sendwithoutImage_btn titleLabel] setFont:[UIFont fontWithName:@"AmericanTypewriter" size:12]];
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
        navbartitle.frame=CGRectMake(0,5,320,50);
        nav_img.frame=CGRectMake(0,0,320,46.5);
        setting_btn.frame=CGRectMake(290,13.625, 19,19);
        back_btn.frame=CGRectMake(15, 13.75, 9, 19);
        navbartitle.frame=CGRectMake(0,0,320,50);
         sendwithImage_btn.frame=CGRectMake(16.66,515, 135,39.5);
        sendwithoutImage_btn.frame=CGRectMake(168.66,515, 135,39.5);
        
    }else{
        
        mainbg_img.frame=CGRectMake(0,0, 320, 480);
        nav_img.frame=CGRectMake(0,0,320,46.5);
        back_btn.frame=CGRectMake(15, 13.75, 9, 19);
        // navbartitle.frame=CGRectMake(0,5,320,50);
        setting_btn.frame=CGRectMake(290,13.625, 19,19);
        navbartitle.frame=CGRectMake(0,0,320,50);
         sendwithImage_btn.frame=CGRectMake(16.66,427.5, 135,39.5);
         sendwithoutImage_btn.frame=CGRectMake(168.66,427.5, 135,39.5);
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

-(void)SendwithImage_btnAction{
    
}

-(void)sendwithoutImage_btnAction{
    
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    [id_Txt resignFirstResponder];
    [psw_Txt resignFirstResponder];
    return YES;
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    [id_Txt resignFirstResponder];
    [psw_Txt resignFirstResponder];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
