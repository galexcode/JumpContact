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
    
    
    
    scrollview3 = [[UIScrollView alloc] init];
    scrollview3.backgroundColor = [UIColor clearColor];
    if (IS_IPHONE_5) {
        scrollview3.frame=CGRectMake(0,91, 320, [UIScreen mainScreen].bounds.size.height-90);
        
    }
    else
    {
        scrollview3.frame=CGRectMake(0,81, 320, [UIScreen mainScreen].bounds.size.height-80);
        
    }
    [scrollview3 setTag:111];
    scrollview3.contentSize = CGSizeMake(320, 300);
    [scrollview3 setCanCancelContentTouches:NO];
    scrollview3.clipsToBounds = YES;
    scrollview3.scrollEnabled = YES;
    [mainbg_img addSubview:scrollview3];
    
    
    UIButton *shareContacts_btn =[UIButton buttonWithType:UIButtonTypeCustom];
   
    [shareContacts_btn setTitle:@"Share Contacts" forState:UIControlStateNormal];
    [[shareContacts_btn titleLabel] setFont:[UIFont fontWithName:@"AmericanTypewriter" size:18]];
    [shareContacts_btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    shareContacts_btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    CGFloat spacing = 50; // the amount of spacing to appear between image and title
    shareContacts_btn.titleEdgeInsets = UIEdgeInsetsMake(0, spacing, 0, 0);
    [shareContacts_btn addTarget:self action:@selector(Setting_btnAction) forControlEvents:UIControlEventTouchUpInside];
    [scrollview3 addSubview:shareContacts_btn];
    
    
    //shareimg.png
    
    UIImageView  *share_image =[[UIImageView alloc] init];
    share_image.backgroundColor = [UIColor clearColor];
    
    share_image.image=[UIImage imageNamed:@"shareimg.png"];
    [shareContacts_btn addSubview:share_image];
    
    
    UIImageView  *seprator_image =[[UIImageView alloc] init];
    seprator_image.image=[UIImage imageNamed:@"seprator.png"];
    [scrollview3 addSubview:seprator_image];
    
#pragma Navigation Bar Title
    selectContact_lbl=[[UILabel alloc] init];
    selectContact_lbl.text=[NSString stringWithFormat:@"100 Contacts Selected"];
    selectContact_lbl.textAlignment=0;
    selectContact_lbl.textColor= [UIColor whiteColor];
    selectContact_lbl.backgroundColor=[UIColor clearColor];
    selectContact_lbl.font=[UIFont fontWithName:@"AmericanTypewriter" size:12];
    selectContact_lbl.shadowColor = [UIColor whiteColor];
    selectContact_lbl.shadowOffset = CGSizeMake(0,0);
    [scrollview3 addSubview:selectContact_lbl];
    
    
    
    
    
    UIButton *add_btn =[UIButton buttonWithType:UIButtonTypeCustom];
    [add_btn setBackgroundImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"add-icon" ofType:@"png"]] forState:UIControlStateNormal];
    [add_btn addTarget:self action:@selector(Setting_btnAction) forControlEvents:UIControlEventTouchUpInside];
    [scrollview3 addSubview:add_btn];

    
    
//    UIImageView  *add_image =[[UIImageView alloc] init];
//    add_image.backgroundColor = [UIColor clearColor];
//    add_image.image=[UIImage imageNamed:@"add-icon.png"];
//    [mainbg_img addSubview:add_image];

    
    UIImageView  *seprator_image1 =[[UIImageView alloc] init];
    seprator_image1.image=[UIImage imageNamed:@"seprator.png"];
    [scrollview3 addSubview:seprator_image1];
    
    UIButton *createShareID_btn =[UIButton buttonWithType:UIButtonTypeCustom];
    [createShareID_btn setTitle:@"Create Share ID" forState:UIControlStateNormal];
    [[createShareID_btn titleLabel] setFont:[UIFont fontWithName:@"AmericanTypewriter" size:18]];
    [createShareID_btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    createShareID_btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    CGFloat spacing2 = 50; // the amount of spacing to appear between image and title
    createShareID_btn.titleEdgeInsets = UIEdgeInsetsMake(0, spacing2, 0, 0);
    [createShareID_btn addTarget:self action:@selector(Setting_btnAction) forControlEvents:UIControlEventTouchUpInside];
    [scrollview3 addSubview:createShareID_btn];
    
    UIImageView  *createShareID_image =[[UIImageView alloc] init];
    createShareID_image.image=[UIImage imageNamed:@"send-to-icon.png"];
    [createShareID_btn addSubview:createShareID_image];
    
    UIImageView  *seprator_image2 =[[UIImageView alloc] init];
    seprator_image2.image=[UIImage imageNamed:@"seprator.png"];
    [scrollview3 addSubview:seprator_image2];
    
    UILabel *id_lbl=[[UILabel alloc] init];
    id_lbl.text=[NSString stringWithFormat:@"ID:1234567"];
    id_lbl.textAlignment=0;
 
    id_lbl.textColor= [UIColor whiteColor];
    id_lbl.backgroundColor=[UIColor clearColor];
    id_lbl.font=[UIFont fontWithName:@"AmericanTypewriter" size:15];
    id_lbl.shadowColor = [UIColor whiteColor];
    id_lbl.shadowOffset = CGSizeMake(0,0);
    [scrollview3 addSubview:id_lbl];

    
    enterpsw_lbl=[[UILabel alloc] init];
    enterpsw_lbl.text=[NSString stringWithFormat:@"Enter Password"];
    enterpsw_lbl.textAlignment=0;
 
    enterpsw_lbl.textColor= [UIColor grayColor];
    enterpsw_lbl.backgroundColor=[UIColor clearColor];
    enterpsw_lbl.font=[UIFont fontWithName:@"AmericanTypewriter" size:13];
    enterpsw_lbl.shadowColor = [UIColor whiteColor];
    enterpsw_lbl.shadowOffset = CGSizeMake(0,0);
    [scrollview3 addSubview:enterpsw_lbl];
    
    

    

#pragma Restaurent TextField
    psw_Txt = [[UITextField  alloc] init];
    psw_Txt.borderStyle = UITextBorderStyleNone;
    psw_Txt.font = [UIFont fontWithName:@"ArialMT" size:(13.0)];
    psw_Txt.layer.borderColor=[[UIColor grayColor] CGColor];
    psw_Txt.layer.borderWidth= 1.0f;

    psw_Txt.textColor=[UIColor grayColor];
    psw_Txt.placeholder=@"Password";
    [psw_Txt setSecureTextEntry:YES];
    psw_Txt.backgroundColor=[UIColor clearColor];
    psw_Txt.delegate = self;
    psw_Txt.returnKeyType = UIReturnKeyDefault;
    psw_Txt.textAlignment=0;
    psw_Txt.tag=100;
    [psw_Txt setUserInteractionEnabled:NO];
    psw_Txt.autocapitalizationType = UITextAutocapitalizationTypeNone;
    [scrollview3 addSubview:psw_Txt];
    UIView *paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 20)] ;
    psw_Txt.leftView = paddingView;
    psw_Txt.leftViewMode = UITextFieldViewModeAlways;
    
    
    
    check_btn =[UIButton buttonWithType:UIButtonTypeCustom];
    [check_btn setBackgroundImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"check-box-disable" ofType:@"png"]] forState:UIControlStateNormal];
     [check_btn setBackgroundImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"check-box" ofType:@"png"]] forState:UIControlStateSelected];
    [check_btn setSelected:NO];
    [check_btn setTag:1];
    [check_btn addTarget:self action:@selector(checkBoxClicked) forControlEvents:UIControlEventTouchUpInside];
    [scrollview3 addSubview:check_btn];

    
    UIButton *protectpsw_lbl=[UIButton buttonWithType:UIButtonTypeCustom];
    [protectpsw_lbl setTitle:@"Protect Using Password" forState:UIControlStateNormal];
    [protectpsw_lbl setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [protectpsw_lbl.titleLabel setFont:[UIFont fontWithName:@"AmericanTypewriter" size:13]];
    [protectpsw_lbl setTitleShadowColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [protectpsw_lbl setBackgroundColor:[UIColor clearColor]];
    [protectpsw_lbl setTag:2];
    [protectpsw_lbl addTarget:self action:@selector(checkBoxClicked) forControlEvents:UIControlEventTouchUpInside];
    protectpsw_lbl.titleLabel.shadowOffset = CGSizeMake(0,0);
    [scrollview3 addSubview:protectpsw_lbl];
    
    
    UIImageView  *seprator_image3 =[[UIImageView alloc] init];
    seprator_image3.image=[UIImage imageNamed:@"seprator.png"];
    [scrollview3 addSubview:seprator_image3];
    
 
    
#pragma mark Canecl Button
    UIButton *sendwithImage_btn =[UIButton buttonWithType:UIButtonTypeCustom];
    [sendwithImage_btn setBackgroundImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"button-bg1" ofType:@"png"]] forState:UIControlStateNormal];
    [sendwithImage_btn setTitle:@"Send with Images" forState:UIControlStateNormal];
    [[sendwithImage_btn titleLabel] setFont:[UIFont fontWithName:@"AmericanTypewriter" size:12]];
    [sendwithImage_btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [sendwithImage_btn addTarget:self action:@selector(SendwithImage_btnAction) forControlEvents:UIControlEventTouchUpInside];
    [scrollview3 addSubview:sendwithImage_btn];
    
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
    [scrollview3 addSubview:sendwithoutImage_btn];
    
    
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
        setting_btn.frame=CGRectMake(290,13.625+20, 19,19);
        back_btn.frame=CGRectMake(15, 13.75+21.5, 9, 19);
        navbartitle.frame=CGRectMake(0,20,320,50);
        shareContacts_btn.frame=CGRectMake(0,0, 320,70);
        share_image.frame=CGRectMake(20, 26, 20, 18);
        seprator_image.frame=CGRectMake(0,70, 320, 2);
        selectContact_lbl.frame=CGRectMake(50, 72, 150, 70);
        add_btn.frame=CGRectMake(280, 146.75-50, 20, 20.5);
        seprator_image1.frame=CGRectMake(0, 142, 320, 2);
        createShareID_btn.frame=CGRectMake(0,144, 320,70);
        createShareID_image.frame=CGRectMake(20, 25, 20, 20);
        seprator_image2.frame=CGRectMake(0, 214, 320, 2);
        seprator_image3.frame=CGRectMake(0, 325, 320, 2);
        sendwithImage_btn.frame=CGRectMake(15,scrollview3.frame.size.height-60, 135,39.5);
        sendwithoutImage_btn.frame=CGRectMake(170,scrollview3.frame.size.height-60, 135,39.5);
        
        
        id_lbl.frame=CGRectMake(50, 225, 100, 25);
        enterpsw_lbl.frame=CGRectMake(50, 290-3, 105, 25);
        psw_Txt.frame=CGRectMake(157, 290-3, 150, 24);
        check_btn.frame=CGRectMake(50, 260, 15, 15);
        protectpsw_lbl.frame=CGRectMake(72, 255, 150, 25);
        
    }
    else{
        
        mainbg_img.frame=CGRectMake(0,0, 320, 480);
        nav_img.frame=CGRectMake(0,0,320,80);
        back_btn.frame=CGRectMake(15, 13.75+21.5, 9, 19);
     
        setting_btn.frame=CGRectMake(290,13.625+20, 19,19);
        navbartitle.frame=CGRectMake(0,20,320,50);
        shareContacts_btn.frame=CGRectMake(0,0, 320,50);

        share_image.frame=CGRectMake(20, 14.25, 20, 18);
        seprator_image.frame=CGRectMake(0,50, 320, 2);
        selectContact_lbl.frame=CGRectMake(50, 52, 150, 50);
        add_btn.frame=CGRectMake(280, 146.75-80, 20, 20.5);
        seprator_image1.frame=CGRectMake(0, 102, 320, 2);
        createShareID_btn.frame=CGRectMake(0,104, 320,50);
        createShareID_image.frame=CGRectMake(20, 15, 20, 20);
        seprator_image2.frame=CGRectMake(0, 154, 320, 2);
        seprator_image3.frame=CGRectMake(0, 265, 320, 2);
        sendwithImage_btn.frame=CGRectMake(15,scrollview3.frame.size.height-60, 135,39.5);
        sendwithoutImage_btn.frame=CGRectMake(170,scrollview3.frame.size.height-60, 135,39.5);
        
        
        id_lbl.frame=CGRectMake(50, 165, 100, 25);
        enterpsw_lbl.frame=CGRectMake(50, 227, 105, 25);
       
        psw_Txt.frame=CGRectMake(157, 227, 150, 24);
        
        check_btn.frame=CGRectMake(50, 200, 15, 15);
        protectpsw_lbl.frame=CGRectMake(72, 195, 150, 25);
    }


	
}


-(void)checkBoxClicked
{
    
        if ([check_btn isSelected]) {
            [check_btn setSelected:NO];
            [enterpsw_lbl setTextColor:[UIColor grayColor]];
            [psw_Txt setUserInteractionEnabled:NO];
            [psw_Txt setBackgroundColor:[UIColor clearColor]];
        }
        else
        {
            [check_btn setSelected:YES];
            [enterpsw_lbl setTextColor:[UIColor whiteColor]];
            [psw_Txt setUserInteractionEnabled:YES];
            [psw_Txt setBackgroundColor:[UIColor whiteColor]];
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



-(void)SendwithImage_btnAction{
    
}

-(void)sendwithoutImage_btnAction{
    
}
#pragma TextField Delegate Method
-(void)textFieldDidBeginEditing:(UITextField *)textField{
    
    
    
    
    
    UIScrollView *scrollview=(UIScrollView *)[self.view viewWithTag:111];
    scrollview.scrollEnabled=YES;
    
    
    [scrollview setContentOffset:CGPointMake(0, 100) animated:YES];

    
}

#pragma TextField Delegate Method
- (void)textFieldDidEndEditing:(UITextField *)textField{
    
    
    
    UIScrollView *scrollview=(UIScrollView *)[self.view viewWithTag:111];
    scrollview.scrollEnabled=YES;
    [scrollview setContentOffset:CGPointMake(0, 0) animated:YES];
    
    
}
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    textField.textColor = [UIColor blackColor];
    return YES;
    
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    [textField resignFirstResponder];
    UIScrollView *scrollview=(UIScrollView *)[self.view viewWithTag:111];
    scrollview.scrollEnabled=YES;
   
    [scrollview setContentOffset:CGPointMake(0, 0) animated:YES];

    return YES;
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [psw_Txt resignFirstResponder];
    UIScrollView *scrollview=(UIScrollView *)[self.view viewWithTag:111];
    scrollview.scrollEnabled=YES;
    
    
    [scrollview setContentOffset:CGPointMake(0, 0) animated:YES];

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
