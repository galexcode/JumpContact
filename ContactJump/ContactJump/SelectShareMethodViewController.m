//
//  SelectShareMethodViewController.m
//  ContactJump
//
//  Created by Raman on 08/01/14.
//  Copyright (c) 2014 iyasoft. All rights reserved.
//

#import "SelectShareMethodViewController.h"
#import "KxMenu.h"
#define IS_IPHONE_5 ( fabs( ( double )[ [ UIScreen mainScreen ] bounds ].size.height - ( double )568 ) < DBL_EPSILON )

@interface SelectShareMethodViewController ()

@end

@implementation SelectShareMethodViewController


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
    
    [self.navigationController setNavigationBarHidden:YES animated:NO];
    
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
    
#pragma mark share contact button.
    UIButton *shareContacts_btn =[UIButton buttonWithType:UIButtonTypeCustom];
    [shareContacts_btn setTitle:@"Share Contacts" forState:UIControlStateNormal];
    [[shareContacts_btn titleLabel] setFont:[UIFont fontWithName:@"AmericanTypewriter" size:16]];
    [shareContacts_btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    shareContacts_btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    CGFloat spacing = 50; // the amount of spacing to appear between image and title
    shareContacts_btn.titleEdgeInsets = UIEdgeInsetsMake(0, spacing, 0, 0);
    [shareContacts_btn addTarget:self action:@selector(Setting_btnAction) forControlEvents:UIControlEventTouchUpInside];
    [mainbg_img addSubview:shareContacts_btn];
    
#pragma mark share button left image share image.
    UIImageView  *share_image =[[UIImageView alloc] init];
    share_image.backgroundColor = [UIColor clearColor];
    share_image.image=[UIImage imageNamed:@"shareimg.png"];
    [shareContacts_btn addSubview:share_image];

#pragma mark separator image.
    UIImageView  *seprator_image1 =[[UIImageView alloc] init];
    seprator_image1.image=[UIImage imageNamed:@"seprator.png"];
    [mainbg_img addSubview:seprator_image1];
    
#pragma mark selected contact label.
    selectContact_lbl=[[UILabel alloc] init];
    selectContact_lbl.text=[NSString stringWithFormat:@"100 Contacts Selected"];
    selectContact_lbl.textAlignment=0;
    selectContact_lbl.textColor= [UIColor whiteColor];
    selectContact_lbl.backgroundColor=[UIColor clearColor];
    selectContact_lbl.font=[UIFont fontWithName:@"AmericanTypewriter" size:12];
    selectContact_lbl.shadowColor = [UIColor whiteColor];
    selectContact_lbl.shadowOffset = CGSizeMake(0,0);
    [mainbg_img addSubview:selectContact_lbl];
    
#pragma mark contact add button right side. plus button.
    UIButton *add1_btn =[UIButton buttonWithType:UIButtonTypeCustom];
    [add1_btn setBackgroundImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"add-icon" ofType:@"png"]] forState:UIControlStateNormal];
    [add1_btn addTarget:self action:@selector(Setting_btnAction) forControlEvents:UIControlEventTouchUpInside];
    [mainbg_img addSubview:add1_btn];
    
#pragma mark separator image.
    UIImageView  *seprator_image2 =[[UIImageView alloc] init];
    seprator_image2.image=[UIImage imageNamed:@"seprator.png"];
    [mainbg_img addSubview:seprator_image2];
    
#pragma mark share with contacts button.
    UIButton *sharewithContacts_btn =[UIButton buttonWithType:UIButtonTypeCustom];
    [sharewithContacts_btn setTitle:@"Share With Contacts" forState:UIControlStateNormal];
    [[sharewithContacts_btn titleLabel] setFont:[UIFont fontWithName:@"AmericanTypewriter" size:16]];
    [sharewithContacts_btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    sharewithContacts_btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    CGFloat spacing2 = 50; // the amount of spacing to appear between image and title
    sharewithContacts_btn.titleEdgeInsets = UIEdgeInsetsMake(0, spacing2, 0, 0);
    [sharewithContacts_btn addTarget:self action:@selector(Setting_btnAction) forControlEvents:UIControlEventTouchUpInside];
    [mainbg_img addSubview:sharewithContacts_btn];
    
#pragma mark share with contact button left image.
    UIImageView  *sharewithContact_image =[[UIImageView alloc] init];
    sharewithContact_image.image=[UIImage imageNamed:@"send-to-icon.png"];
    [sharewithContacts_btn addSubview:sharewithContact_image];
    
#pragma mark separator image.
    UIImageView  *seprator_image3 =[[UIImageView alloc] init];
    seprator_image3.image=[UIImage imageNamed:@"seprator.png"];
    [mainbg_img addSubview:seprator_image3];
    
#pragma mark Recipients label.
    recipients_lbl=[[UILabel alloc] init];
    recipients_lbl.text=[NSString stringWithFormat:@"10 Recipients"];
    recipients_lbl.textAlignment=0;
    recipients_lbl.textColor= [UIColor whiteColor];
    recipients_lbl.backgroundColor=[UIColor clearColor];
    recipients_lbl.font=[UIFont fontWithName:@"AmericanTypewriter" size:12];
    recipients_lbl.shadowColor = [UIColor whiteColor];
    recipients_lbl.shadowOffset = CGSizeMake(0,0);
    [mainbg_img addSubview:recipients_lbl];

#pragma mark recipients add button plus image.
    UIButton *recipien_btn =[UIButton buttonWithType:UIButtonTypeCustom];
    [recipien_btn setBackgroundImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"add-icon" ofType:@"png"]] forState:UIControlStateNormal];
    [recipien_btn addTarget:self action:@selector(Setting_btnAction) forControlEvents:UIControlEventTouchUpInside];
    [mainbg_img addSubview:recipien_btn];
    
#pragma mark separator image.
    UIImageView  *seprator_image4 =[[UIImageView alloc] init];
    seprator_image4.image=[UIImage imageNamed:@"seprator.png"];
    [mainbg_img addSubview:seprator_image4];
    
#pragma Navigation Bar Title
    navbartitle=[[UILabel alloc] init];
    navbartitle.text=[NSString stringWithFormat:@"Select Share Method"];
    navbartitle.textAlignment=1;
    navbartitle.textColor= [UIColor whiteColor];
    navbartitle.backgroundColor=[UIColor clearColor];
    navbartitle.font=[UIFont fontWithName:@"AmericanTypewriter" size:16];
    navbartitle.shadowColor = [UIColor whiteColor];
    navbartitle.shadowOffset = CGSizeMake(0,0);
    [mainbg_img addSubview:navbartitle];
    
#pragma mark  text view iamge.
    UIImageView *txtView_img = [[UIImageView alloc]init];
    txtView_img.image = [UIImage imageNamed:@"add-note-box.png"];
    [mainbg_img addSubview:txtView_img];
    
    
#pragma TextView
    addNote_txtview = [[UITextView alloc]init];
    addNote_txtview.backgroundColor=[UIColor clearColor];
    addNote_txtview.text=@"Add Note";
    addNote_txtview.scrollEnabled=YES;
    addNote_txtview.delegate=self;
    addNote_txtview.textColor = [UIColor whiteColor];
    addNote_txtview.font = [UIFont fontWithName:@"AmericanTypewriter" size:12];
    [mainbg_img addSubview:addNote_txtview];
    
#pragma mark SendwithImage Button
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
    
    
    
#pragma mark SendwithoutImage Button
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
        nav_img.frame=CGRectMake(0,0,320,46.5);
        setting_btn.frame=CGRectMake(290,13.625, 19,19);
        back_btn.frame=CGRectMake(15, 13.75, 9, 19);
        navbartitle.frame=CGRectMake(0,0,320,50);
        share_image.frame=CGRectMake(20, 14.25, 20, 18);
        shareContacts_btn.frame=CGRectMake(0,50, 320,60);
        seprator_image1.frame=CGRectMake(0, 110, 320, 2);
        selectContact_lbl.frame=CGRectMake(50,127,150,30);
        add1_btn.frame=CGRectMake(280, 131.75, 20, 20.5);
        seprator_image2.frame=CGRectMake(0, 172, 320, 2);
        sharewithContacts_btn.frame=CGRectMake(0,174, 320,60);
        sharewithContact_image.frame=CGRectMake(20, 20, 20, 20);
        seprator_image3.frame=CGRectMake(0, 234, 320, 2);
        recipients_lbl.frame=CGRectMake(50,251,150,30);
        recipien_btn.frame=CGRectMake(280, 255.75, 20, 20.5);
        seprator_image4.frame=CGRectMake(0, 296, 320, 2);
        addNote_txtview.frame = CGRectMake(13.5, 308, 293, 145);
        txtView_img.frame = CGRectMake(13.5, 308, 293, 145);
        sendwithImage_btn.frame=CGRectMake(16.66,500.5, 135,39.5);
        sendwithoutImage_btn.frame=CGRectMake(168.66,500.5, 135,39.5);
        
    }else{
        
        mainbg_img.frame=CGRectMake(0,0, 320, 480);
        nav_img.frame=CGRectMake(0,0,320,46.5);
        setting_btn.frame=CGRectMake(290,13.625, 19,19);
        back_btn.frame=CGRectMake(15, 13.75, 9, 19);
        navbartitle.frame=CGRectMake(0,0,320,50);
        shareContacts_btn.frame=CGRectMake(0,46.5, 320,50);
        share_image.frame=CGRectMake(20, 14.25, 20, 18);
        seprator_image1.frame=CGRectMake(0, 96.5, 320, 2);
        selectContact_lbl.frame=CGRectMake(50, 108.5, 150, 30);
        add1_btn.frame=CGRectMake(280, 113.25, 20, 20.5);
        seprator_image2.frame=CGRectMake(0, 148.5, 320, 2);
        sharewithContacts_btn.frame=CGRectMake(0,150.5, 320,50);
        sharewithContact_image.frame=CGRectMake(20, 15, 20, 20);
        seprator_image3.frame=CGRectMake(0, 200.5, 320, 2);
        recipients_lbl.frame=CGRectMake(50, 212.5, 150, 30);
        recipien_btn.frame=CGRectMake(280, 217.5, 20, 20.5);
        seprator_image4.frame=CGRectMake(0, 252.5, 320, 2);
        txtView_img.frame = CGRectMake(13.5, 262.5, 293, 145);
        addNote_txtview.frame = CGRectMake(13.5+5, 262.5+5, 293-10, 145-10);
        sendwithImage_btn.frame=CGRectMake(16.66,420, 135,39.5);
        sendwithoutImage_btn.frame=CGRectMake(168.66,423, 135,39.5);

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

- (BOOL)prefersStatusBarHidden {
    return YES;
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [addNote_txtview resignFirstResponder];
    return YES;
    
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    [addNote_txtview resignFirstResponder];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)SendwithImage_btnAction{
    
}

-(void)sendwithoutImage_btnAction{
    
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
