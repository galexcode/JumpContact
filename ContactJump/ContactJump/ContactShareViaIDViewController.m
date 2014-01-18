//
//  ContactShareViaIDViewController.m
//  ContactJump
//
//  Created by Raman on 08/01/14.
//  Copyright (c) 2014 iyasoft. All rights reserved.
//

#import "ContactShareViaIDViewController.h"
#import "KxMenu.h"
#define IS_IPHONE_5 ( fabs( ( double )[ [ UIScreen mainScreen ] bounds ].size.height - ( double )568 ) < DBL_EPSILON )



@interface ContactShareViaIDViewController ()

@end

@implementation ContactShareViaIDViewController

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
    navbartitle.text=[NSString stringWithFormat:@" Share Via ID"];
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
    
    UIButton *shareContacts_btn =[UIButton buttonWithType:UIButtonTypeCustom];
    [shareContacts_btn setTitle:@"Share Contacts" forState:UIControlStateNormal];
    [[shareContacts_btn titleLabel] setFont:[UIFont fontWithName:@"AmericanTypewriter" size:18]];
    [shareContacts_btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    shareContacts_btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    CGFloat spacing = 50; // the amount of spacing to appear between image and title
    shareContacts_btn.titleEdgeInsets = UIEdgeInsetsMake(0, spacing, 0, 0);
    [shareContacts_btn addTarget:self action:@selector(Setting_btnAction) forControlEvents:UIControlEventTouchUpInside];
    [mainbg_img addSubview:shareContacts_btn];
    
    
    //shareimg.png
    
    UIImageView  *share_image =[[UIImageView alloc] init];
    share_image.backgroundColor = [UIColor clearColor];
    share_image.image=[UIImage imageNamed:@"shareimg.png"];
    [shareContacts_btn addSubview:share_image];

    
    UIImageView  *seprator_image =[[UIImageView alloc] init];
    seprator_image.image=[UIImage imageNamed:@"seprator.png"];
    [mainbg_img addSubview:seprator_image];
    
#pragma Navigation Bar Title
    selectContact_lbl=[[UILabel alloc] init];
    selectContact_lbl.text=[NSString stringWithFormat:@"100 Contacts Selected"];
    selectContact_lbl.textAlignment=0;
    selectContact_lbl.textColor= [UIColor whiteColor];
    selectContact_lbl.backgroundColor=[UIColor clearColor];
    selectContact_lbl.font=[UIFont fontWithName:@"AmericanTypewriter" size:12];
    selectContact_lbl.shadowColor = [UIColor whiteColor];
    selectContact_lbl.shadowOffset = CGSizeMake(0,0);
    [mainbg_img addSubview:selectContact_lbl];
    
    
    
    
    
    UIButton *add_btn =[UIButton buttonWithType:UIButtonTypeCustom];
    [add_btn setBackgroundImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"add-icon" ofType:@"png"]] forState:UIControlStateNormal];
    [add_btn addTarget:self action:@selector(Setting_btnAction) forControlEvents:UIControlEventTouchUpInside];
    [mainbg_img addSubview:add_btn];

    
    
//    UIImageView  *add_image =[[UIImageView alloc] init];
//    add_image.backgroundColor = [UIColor clearColor];
//    add_image.image=[UIImage imageNamed:@"add-icon.png"];
//    [mainbg_img addSubview:add_image];

    
    UIImageView  *seprator_image1 =[[UIImageView alloc] init];
    seprator_image1.image=[UIImage imageNamed:@"seprator.png"];
    [mainbg_img addSubview:seprator_image1];
    
    UIButton *createShareID_btn =[UIButton buttonWithType:UIButtonTypeCustom];
    [createShareID_btn setTitle:@"Create Share ID" forState:UIControlStateNormal];
    [[createShareID_btn titleLabel] setFont:[UIFont fontWithName:@"AmericanTypewriter" size:18]];
    [createShareID_btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    createShareID_btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    CGFloat spacing2 = 50; // the amount of spacing to appear between image and title
    createShareID_btn.titleEdgeInsets = UIEdgeInsetsMake(0, spacing2, 0, 0);
    [createShareID_btn addTarget:self action:@selector(Setting_btnAction) forControlEvents:UIControlEventTouchUpInside];
    [mainbg_img addSubview:createShareID_btn];
    
    UIImageView  *createShareID_image =[[UIImageView alloc] init];
    createShareID_image.image=[UIImage imageNamed:@"send-to-icon.png"];
    [createShareID_btn addSubview:createShareID_image];
    
    UIImageView  *seprator_image2 =[[UIImageView alloc] init];
    seprator_image2.image=[UIImage imageNamed:@"seprator.png"];
    [mainbg_img addSubview:seprator_image2];
    
    UILabel *id_lbl=[[UILabel alloc] init];
    id_lbl.text=[NSString stringWithFormat:@"ID:1234567"];
    id_lbl.textAlignment=0;
 
    id_lbl.textColor= [UIColor whiteColor];
    id_lbl.backgroundColor=[UIColor clearColor];
    id_lbl.font=[UIFont fontWithName:@"AmericanTypewriter" size:15];
    id_lbl.shadowColor = [UIColor whiteColor];
    id_lbl.shadowOffset = CGSizeMake(0,0);
    [mainbg_img addSubview:id_lbl];

    
    UILabel *enterpsw_lbl=[[UILabel alloc] init];
    enterpsw_lbl.text=[NSString stringWithFormat:@"Enter Password"];
    enterpsw_lbl.textAlignment=0;
 
    enterpsw_lbl.textColor= [UIColor whiteColor];
    enterpsw_lbl.backgroundColor=[UIColor clearColor];
    enterpsw_lbl.font=[UIFont fontWithName:@"AmericanTypewriter" size:13];
    enterpsw_lbl.shadowColor = [UIColor whiteColor];
    enterpsw_lbl.shadowOffset = CGSizeMake(0,0);
    [mainbg_img addSubview:enterpsw_lbl];
    
    
    UIImageView  *pswtxtbg_img =[[UIImageView alloc] init];
    pswtxtbg_img.image=[UIImage imageNamed:@"text-box.png"];
    pswtxtbg_img.userInteractionEnabled=YES;
    [mainbg_img addSubview:pswtxtbg_img];
    

#pragma Restaurent TextField
    psw_Txt = [[UITextField  alloc] init];
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
    
    
    UIButton *check_btn =[UIButton buttonWithType:UIButtonTypeCustom];
    [check_btn setBackgroundImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"check-box-disable" ofType:@"png"]] forState:UIControlStateNormal];
    [check_btn addTarget:self action:@selector(checkBoxClicked:) forControlEvents:UIControlEventTouchUpInside];
    [mainbg_img addSubview:check_btn];

    
    UILabel *protectpsw_lbl=[[UILabel alloc] init];
    protectpsw_lbl.text=[NSString stringWithFormat:@"Protect Using Password"];
    protectpsw_lbl.textAlignment=0;
    protectpsw_lbl.textColor= [UIColor whiteColor];
    protectpsw_lbl.backgroundColor=[UIColor clearColor];
    protectpsw_lbl.font=[UIFont fontWithName:@"AmericanTypewriter" size:11];
    protectpsw_lbl.shadowColor = [UIColor whiteColor];
    protectpsw_lbl.shadowOffset = CGSizeMake(0,0);
    [mainbg_img addSubview:protectpsw_lbl];
    
    
    UIImageView  *seprator_image3 =[[UIImageView alloc] init];
    seprator_image3.image=[UIImage imageNamed:@"seprator.png"];
    [mainbg_img addSubview:seprator_image3];
    
 
    
#pragma mark Canecl Button
    UIButton *sendwithImage_btn =[UIButton buttonWithType:UIButtonTypeCustom];
    [sendwithImage_btn setBackgroundImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"button-bg1" ofType:@"png"]] forState:UIControlStateNormal];
    [sendwithImage_btn setTitle:@"Send with Images" forState:UIControlStateNormal];
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
    [sendwithoutImage_btn setTitle:@"Send without Images" forState:UIControlStateNormal];
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
        shareContacts_btn.frame=CGRectMake(0,46.5, 320,70);
        share_image.frame=CGRectMake(20, 26, 20, 18);
        seprator_image.frame=CGRectMake(0,120, 320, 2);
        selectContact_lbl.frame=CGRectMake(50, 140, 150, 30);
        add_btn.frame=CGRectMake(280, 146.75, 20, 20.5);
        seprator_image1.frame=CGRectMake(0, 192, 320, 2);
        createShareID_btn.frame=CGRectMake(0,194, 320,70);
        createShareID_image.frame=CGRectMake(20, 25, 20, 20);
        seprator_image2.frame=CGRectMake(0, 264, 320, 2);
        seprator_image3.frame=CGRectMake(0, 426, 320, 2);
        sendwithImage_btn.frame=CGRectMake(16.66,495, 135,39.5);
        sendwithoutImage_btn.frame=CGRectMake(168.66,495, 135,39.5);
        
        
        id_lbl.frame=CGRectMake(50, 275, 100, 25);
        enterpsw_lbl.frame=CGRectMake(50, 310, 105, 25);
        pswtxtbg_img.frame=CGRectMake(157, 310, 150, 24);
        psw_Txt.frame=CGRectMake(0, 0, 150, 24);
        
        check_btn.frame=CGRectMake(50, 350, 13, 13);
        protectpsw_lbl.frame=CGRectMake(70, 347, 150, 25);
        
    }else{
        
        mainbg_img.frame=CGRectMake(0,0, 320, 480);
        nav_img.frame=CGRectMake(0,0,320,46.5);
        back_btn.frame=CGRectMake(15, 13.75, 9, 19);
       // navbartitle.frame=CGRectMake(0,5,320,50);
        setting_btn.frame=CGRectMake(290,13.625, 19,19);
        navbartitle.frame=CGRectMake(0,0,320,50);
        shareContacts_btn.frame=CGRectMake(0,46.5, 320,50);
        share_image.frame=CGRectMake(20, 14.25, 20, 18);
        seprator_image.frame=CGRectMake(0, 96.5, 320, 2);
        selectContact_lbl.frame=CGRectMake(50, 108.5, 150, 30);
        add_btn.frame=CGRectMake(280, 113.25, 20, 20.5);
        seprator_image1.frame=CGRectMake(0, 148.5, 320, 2);
        createShareID_btn.frame=CGRectMake(0,150.5, 320,50);
        createShareID_image.frame=CGRectMake(20, 15, 20, 20);
        seprator_image2.frame=CGRectMake(0, 204, 320, 2);
        
        
        seprator_image3.frame=CGRectMake(0, 321, 320, 2);
        sendwithImage_btn.frame=CGRectMake(16.66,415, 135,39.5);
        sendwithoutImage_btn.frame=CGRectMake(168.66,415, 135,39.5);
        
        
        id_lbl.frame=CGRectMake(50, 216, 100, 25);
        enterpsw_lbl.frame=CGRectMake(50, 251, 105, 25);
        pswtxtbg_img.frame=CGRectMake(157, 251, 150, 24);
        psw_Txt.frame=CGRectMake(0, 0, 150, 24);
        check_btn.frame=CGRectMake(50, 290, 13, 13);
        protectpsw_lbl.frame=CGRectMake(70, 286, 150, 25);
        
    }


	// Do any additional setup after loading the view.
}


-(void)checkBoxClicked:(id)sender {
    
    UIButton *tappedButton = (UIButton*)sender;
    if([tappedButton.currentImage isEqual:[UIImage imageNamed:@"check-box-disable.png"]])
    {
        [sender  setImage:[UIImage imageNamed: @"check-box.png"] forState:UIControlStateNormal];
    } else {
        [sender setImage:[UIImage imageNamed:@"check-box-disable.png"]forState:UIControlStateNormal];
    }
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
    
}

-(void)sendwithoutImage_btnAction{
    
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    [psw_Txt resignFirstResponder];
    return YES;
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
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
