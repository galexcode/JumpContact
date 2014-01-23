

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
    
    
//    if ([self respondsToSelector:@selector(setNeedsStatusBarAppearanceUpdate)]) {
//        // iOS 7
//        [self performSelector:@selector(setNeedsStatusBarAppearanceUpdate)];
//    } else {
//        // iOS 6
//        [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationSlide];
//    }
//    
//    [self.navigationController setNavigationBarHidden:YES animated:NO];
    
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
    
    
   
    
    scrollview = [[UIScrollView alloc] init];
    scrollview.backgroundColor = [UIColor clearColor];
    if (IS_IPHONE_5) {
        scrollview.frame=CGRectMake(0,91, 320, [UIScreen mainScreen].bounds.size.height-90);
        
    }
    else
    {
        scrollview.frame=CGRectMake(0,81, 320, [UIScreen mainScreen].bounds.size.height-80);
        
    }
    [scrollview setTag:111];
    scrollview.contentSize = CGSizeMake(320, 300);
    [scrollview setCanCancelContentTouches:NO];
    scrollview.clipsToBounds = YES;
    scrollview.scrollEnabled = YES;
    [mainbg_img addSubview:scrollview];

    
    
    
    UIButton *getuseingid_btn =[UIButton buttonWithType:UIButtonTypeCustom];
    if (IS_IPHONE_5) {
         getuseingid_btn.frame=CGRectMake(0, 0, 320, 70);
    } else {
         getuseingid_btn.frame=CGRectMake(0, 0, 320, 50);
    }
   
    
    
    [getuseingid_btn setTitle:@"GetUsing ID/Password" forState:UIControlStateNormal];
    [[getuseingid_btn titleLabel] setFont:[UIFont fontWithName:@"AmericanTypewriter" size:18]];
    [getuseingid_btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    getuseingid_btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    CGFloat spacing = 50; // the amount of spacing to appear between image and title
    getuseingid_btn.titleEdgeInsets = UIEdgeInsetsMake(0, spacing, 0, 0);
    [getuseingid_btn addTarget:self action:@selector(Setting_btnAction) forControlEvents:UIControlEventTouchUpInside];
    [scrollview addSubview:getuseingid_btn];

    
    UIImageView  *get_img =[[UIImageView alloc] init];
    if (IS_IPHONE_5) {
         get_img.frame=CGRectMake(15, 24, 20, 18);
    } else {
         get_img.frame=CGRectMake(15, 16, 20, 18);
    }
   
    get_img.image=[UIImage imageNamed:@"shareimg.png"];
    [getuseingid_btn addSubview:get_img];
    
    
    
    UIImageView  *seprator_image =[[UIImageView alloc] init];
    if (IS_IPHONE_5) {
         seprator_image.frame=CGRectMake(0, 70, 320, 2);
    } else {
         seprator_image.frame=CGRectMake(0, 50, 320, 2);
    }
   
    seprator_image.image=[UIImage imageNamed:@"seprator.png"];
    [scrollview addSubview:seprator_image];
    
    
    UITextView *textview=[[UITextView alloc]init];
    textview.text=[NSString stringWithFormat:@"2011 PayPal, Inc. All rights reserved. PayPal is a registered trademark of PayPal, Inc. The PayPal logo is a trademark of PayPal, Inc. Other trademarks and brands are the property of their respective owners.  The information in this document belongs to PayPal, Inc. "];
    textview.scrollEnabled=YES;
    textview.editable=FALSE;
    textview.textAlignment=NSTextAlignmentJustified;
     if (IS_IPHONE_5)
     {
         textview.frame=CGRectMake(10, 82, 300, 100);
     }
    else
    {
        textview.frame=CGRectMake(10, 62, 300, 80);
    }
    
    textview.backgroundColor=[UIColor clearColor];
    textview.textColor=[UIColor whiteColor];
    [textview setFont:[UIFont fontWithName:@"AmericanTypewriter" size:14]];
    [scrollview addSubview:textview];
    
        
    
    UIImageView  *seprator_image1 =[[UIImageView alloc] init];
    if (IS_IPHONE_5) {
        seprator_image1.frame=CGRectMake(0, 192+20, 320, 2);
    } else {
        seprator_image1.frame=CGRectMake(0, 172, 320, 2);
    }
    
    seprator_image1.image=[UIImage imageNamed:@"seprator.png"];
    [scrollview addSubview:seprator_image1];
    
    
    
#pragma Navigation Bar Title
    UILabel  *id_lbl=[[UILabel alloc] init];
    id_lbl.text=[NSString stringWithFormat:@"ID"];
    id_lbl.textAlignment=UITextAlignmentRight;
    if (IS_IPHONE_5) {
         id_lbl.frame=CGRectMake(15, 230, 75, 25);
    } else {
         id_lbl.frame=CGRectMake(15, 200-10, 75, 25);
    }
   
    id_lbl.textColor= [UIColor whiteColor];
    id_lbl.backgroundColor=[UIColor clearColor];
    id_lbl.font=[UIFont fontWithName:@"AmericanTypewriter" size:16];
    id_lbl.shadowColor = [UIColor whiteColor];
    id_lbl.shadowOffset = CGSizeMake(0,0);
    [scrollview addSubview:id_lbl];
    
    
    
   
    
#pragma Restaurent TextField
    id_Txt = [[UITextField  alloc] init];
    id_Txt.borderStyle = UITextBorderStyleNone;
    if (IS_IPHONE_5) {
        id_Txt.frame=CGRectMake(95, 230, 211, 24);
    } else {
        id_Txt.frame=CGRectMake(95, 200-10, 211, 24);
    }
    
    id_Txt.layer.borderColor=[[UIColor grayColor] CGColor];
    id_Txt.layer.borderWidth= 1.0f;
    id_Txt.font = [UIFont fontWithName:@"ArialMT" size:(13.0)];
    id_Txt.textColor=[UIColor grayColor];
    id_Txt.placeholder=@"Id";
    id_Txt.backgroundColor=[UIColor whiteColor];
    id_Txt.delegate = self;
    id_Txt.returnKeyType = UIReturnKeyDefault;
    id_Txt.textAlignment=0;
    id_Txt.secureTextEntry=YES;
    id_Txt.tag=100;
    id_Txt.autocapitalizationType = UITextAutocapitalizationTypeNone;
    [scrollview addSubview:id_Txt];
    UIView *paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 20)] ;
    id_Txt.leftView = paddingView;
    id_Txt.leftViewMode = UITextFieldViewModeAlways;
    
    
    
   

    
#pragma Navigation Bar Title
    UILabel  *psw_lbl=[[UILabel alloc] init];
    psw_lbl.text=[NSString stringWithFormat:@"Password"];
    psw_lbl.textAlignment=UITextAlignmentLeft;
    if (IS_IPHONE_5) {
        psw_lbl.frame=CGRectMake(15, 266, 75, 25);
    } else {
        psw_lbl.frame=CGRectMake(15, 236-10, 75, 25);
    }
    
    psw_lbl.textColor= [UIColor whiteColor];
    psw_lbl.backgroundColor=[UIColor clearColor];
    psw_lbl.font=[UIFont fontWithName:@"AmericanTypewriter" size:16];
    psw_lbl.shadowColor = [UIColor whiteColor];
    psw_lbl.shadowOffset = CGSizeMake(0,0);
    [scrollview addSubview:psw_lbl];
    
    
#pragma Restaurent TextField
    psw_Txt = [[UITextField  alloc] init];
    if (IS_IPHONE_5) {
         psw_Txt.frame=CGRectMake(95, 266, 211, 24);
    } else {
         psw_Txt.frame=CGRectMake(95, 236-10, 211, 24);
    }
   
    psw_Txt.layer.borderColor=[[UIColor grayColor] CGColor];
    psw_Txt.layer.borderWidth= 1.0f;
    psw_Txt.borderStyle = UITextBorderStyleNone;
    psw_Txt.font = [UIFont fontWithName:@"ArialMT" size:(13.0)];
    psw_Txt.textColor=[UIColor grayColor];
    psw_Txt.placeholder=@"Password";
    psw_Txt.backgroundColor=[UIColor whiteColor];
    psw_Txt.delegate = self;
    psw_Txt.returnKeyType = UIReturnKeyDefault;
    psw_Txt.textAlignment=0;
    psw_Txt.tag=100;
    psw_Txt.autocapitalizationType = UITextAutocapitalizationTypeNone;
    [scrollview addSubview:psw_Txt];
    UIView *paddingView1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 20)] ;
    psw_Txt.leftView = paddingView1;
    psw_Txt.leftViewMode = UITextFieldViewModeAlways;

   
    
    
    
    
    UIImageView  *seprator_image2 =[[UIImageView alloc] init];
    if (IS_IPHONE_5) {
        seprator_image2.frame=CGRectMake(0, 310, 320, 2);
    } else {
        seprator_image2.frame=CGRectMake(0, 266, 320, 2);
    }
    
    seprator_image2.image=[UIImage imageNamed:@"seprator.png"];
    [scrollview addSubview:seprator_image2];
    

    
#pragma mark Canecl Button
    UIButton *sendwithImage_btn =[UIButton buttonWithType:UIButtonTypeCustom];
    [sendwithImage_btn setBackgroundImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"button-bg1" ofType:@"png"]] forState:UIControlStateNormal];
    [sendwithImage_btn setTitle:@"Get with Images" forState:UIControlStateNormal];
    [[sendwithImage_btn titleLabel] setFont:[UIFont fontWithName:@"AmericanTypewriter" size:12]];
    [sendwithImage_btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [sendwithImage_btn addTarget:self action:@selector(SendwithImage_btnAction) forControlEvents:UIControlEventTouchUpInside];
    [scrollview addSubview:sendwithImage_btn];
       
    
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
    [scrollview addSubview:sendwithoutImage_btn];
    
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
        nav_img.frame=CGRectMake(0,0,320,90);
        
        back_btn.frame=CGRectMake(15, 14, 33, 54);
        navbartitle.frame=CGRectMake(0,20,320,50);
         sendwithImage_btn.frame=CGRectMake(16.66,scrollview.frame.size.height-60, 135,39.5);
        sendwithoutImage_btn.frame=CGRectMake(168.66,scrollview.frame.size.height-60, 135,39.5);
        
    }else{
        
        mainbg_img.frame=CGRectMake(0,0, 320, 480);
        nav_img.frame=CGRectMake(0,0,320,80);
        back_btn.frame=CGRectMake(15, 13, 33, 54);
        navbartitle.frame=CGRectMake(0,20,320,50);
         sendwithImage_btn.frame=CGRectMake(16.66,scrollview.frame.size.height-60, 135,39.5);
         sendwithoutImage_btn.frame=CGRectMake(168.66,scrollview.frame.size.height-60, 135,39.5);
    }
    
	// Do any additional setup after loading the view.
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


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    [id_Txt resignFirstResponder];
    [psw_Txt resignFirstResponder];
    UIScrollView *scrollview3=(UIScrollView *)[self.view viewWithTag:111];
    scrollview3.scrollEnabled=YES;
    
    
    [scrollview3 setContentOffset:CGPointMake(0, 0) animated:YES];

}
-(void)textFieldDidBeginEditing:(UITextField *)textField{
    
    
    
    
    
    UIScrollView *scrollview3=(UIScrollView *)[self.view viewWithTag:111];
    scrollview3.scrollEnabled=YES;
    
    
    [scrollview3 setContentOffset:CGPointMake(0, 100) animated:YES];
    
    
}

#pragma TextField Delegate Method
- (void)textFieldDidEndEditing:(UITextField *)textField{
    
    
    
    UIScrollView *scrollview2=(UIScrollView *)[self.view viewWithTag:111];
    scrollview2.scrollEnabled=YES;
    [scrollview2 setContentOffset:CGPointMake(0, 0) animated:YES];
    
    
}
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    textField.textColor = [UIColor blackColor];
    return YES;
    
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    [textField resignFirstResponder];
    UIScrollView *scrollview1=(UIScrollView *)[self.view viewWithTag:111];
    scrollview1.scrollEnabled=YES;
    
    [scrollview1 setContentOffset:CGPointMake(0, 0) animated:YES];
    
    return YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
