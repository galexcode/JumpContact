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
    
    
    obj=[ContactGlobalDataClass getInstance];
    [obj setBackBtnActivate:@"0"];
     //[obj setFrom_ShareMethodViewController:@"0"];
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
    back_btn =[UIButton buttonWithType:UIButtonTypeCustom];
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

    
#pragma mark share contact button.
    UIButton *shareContacts_btn =[UIButton buttonWithType:UIButtonTypeCustom];
    [shareContacts_btn setTitle:@"Share Contacts" forState:UIControlStateNormal];
    [[shareContacts_btn titleLabel] setFont:[UIFont fontWithName:@"AmericanTypewriter" size:16]];
    [shareContacts_btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    shareContacts_btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    CGFloat spacing = 50; // the amount of spacing to appear between image and title
    shareContacts_btn.titleEdgeInsets = UIEdgeInsetsMake(0, spacing, 0, 0);
    [scrollview addSubview:shareContacts_btn];
    
#pragma mark share button left image share image.
    UIImageView  *share_image =[[UIImageView alloc] init];
    share_image.backgroundColor = [UIColor clearColor];
    share_image.image=[UIImage imageNamed:@"shareimg.png"];
    [shareContacts_btn addSubview:share_image];

#pragma mark separator image.
    UIImageView  *seprator_image1 =[[UIImageView alloc] init];
    seprator_image1.image=[UIImage imageNamed:@"seprator.png"];
    [scrollview addSubview:seprator_image1];
    
#pragma mark selected contact label.
    selectContact_lbl=[[UILabel alloc] init];
    selectContact_lbl.text=[NSString stringWithFormat:@"%@ contacts selected",obj.contactsToBeShared_selected];
    selectContact_lbl.textAlignment=0;
    selectContact_lbl.textColor= [UIColor whiteColor];
    selectContact_lbl.backgroundColor=[UIColor clearColor];
    selectContact_lbl.font=[UIFont fontWithName:@"AmericanTypewriter" size:12];
    selectContact_lbl.shadowColor = [UIColor whiteColor];
    selectContact_lbl.shadowOffset = CGSizeMake(0,0);
    [scrollview addSubview:selectContact_lbl];
    
#pragma mark contact add button right side. plus button.
    UIButton *add1_btn =[UIButton buttonWithType:UIButtonTypeCustom];
    [add1_btn setBackgroundImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"add-icon" ofType:@"png"]] forState:UIControlStateNormal];
    add1_btn.tag=1;
    [add1_btn addTarget:self action:@selector(Setting_btnAction:) forControlEvents:UIControlEventTouchUpInside];
    [scrollview addSubview:add1_btn];
    
#pragma mark separator image.
    UIImageView  *seprator_image2 =[[UIImageView alloc] init];
    seprator_image2.image=[UIImage imageNamed:@"seprator.png"];
    [scrollview addSubview:seprator_image2];
    
#pragma mark share with contacts button.
    UIButton *sharewithContacts_btn =[UIButton buttonWithType:UIButtonTypeCustom];
    [sharewithContacts_btn setTitle:@"Share With Contacts" forState:UIControlStateNormal];
    [[sharewithContacts_btn titleLabel] setFont:[UIFont fontWithName:@"AmericanTypewriter" size:16]];
    [sharewithContacts_btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    sharewithContacts_btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    CGFloat spacing2 = 50; // the amount of spacing to appear between image and title
    sharewithContacts_btn.titleEdgeInsets = UIEdgeInsetsMake(0, spacing2, 0, 0);
    [scrollview addSubview:sharewithContacts_btn];
    
#pragma mark share with contact button left image.
    UIImageView  *sharewithContact_image =[[UIImageView alloc] init];
    sharewithContact_image.image=[UIImage imageNamed:@"send-to-icon.png"];
    [sharewithContacts_btn addSubview:sharewithContact_image];
    
#pragma mark separator image.
    UIImageView  *seprator_image3 =[[UIImageView alloc] init];
    seprator_image3.image=[UIImage imageNamed:@"seprator.png"];
    [scrollview addSubview:seprator_image3];
    
#pragma mark Recipients label.
    recipients_lbl=[[UILabel alloc] init];
    recipients_lbl.text=[NSString stringWithFormat:@"%@ contacts selected",obj.recipients_selected];
    recipients_lbl.textAlignment=0;
    recipients_lbl.textColor= [UIColor whiteColor];
    recipients_lbl.backgroundColor=[UIColor clearColor];
    recipients_lbl.font=[UIFont fontWithName:@"AmericanTypewriter" size:12];
    recipients_lbl.shadowColor = [UIColor whiteColor];
    recipients_lbl.shadowOffset = CGSizeMake(0,0);
    [scrollview addSubview:recipients_lbl];

#pragma mark recipients add button plus image.
    UIButton *recipien_btn =[UIButton buttonWithType:UIButtonTypeCustom];
    [recipien_btn setBackgroundImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"add-icon" ofType:@"png"]] forState:UIControlStateNormal];
    recipien_btn.tag=2;
    [recipien_btn addTarget:self action:@selector(Setting_btnAction:) forControlEvents:UIControlEventTouchUpInside];
    [scrollview addSubview:recipien_btn];
    
#pragma mark separator image.
    UIImageView  *seprator_image4 =[[UIImageView alloc] init];
    seprator_image4.image=[UIImage imageNamed:@"seprator.png"];
    [scrollview addSubview:seprator_image4];
    
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
    [scrollview addSubview:txtView_img];
    
    
#pragma TextView
    addNote_txtview = [[UITextView alloc]init];
    addNote_txtview.backgroundColor=[UIColor clearColor];
    addNote_txtview.text=@"Add Note";
    addNote_txtview.scrollEnabled=YES;
    addNote_txtview.delegate=self;
    addNote_txtview.textColor = [UIColor lightGrayColor];
    addNote_txtview.font = [UIFont fontWithName:@"AmericanTypewriter" size:12];
    addNote_txtview.keyboardType=UIKeyboardTypeDefault;
    addNote_txtview.returnKeyType=UIReturnKeyDefault;
    [scrollview addSubview:addNote_txtview];
    
#pragma mark SendwithImage Button
    UIButton *sendwithImage_btn =[UIButton buttonWithType:UIButtonTypeCustom];
    [sendwithImage_btn setBackgroundImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"button-bg1" ofType:@"png"]] forState:UIControlStateNormal];
    [sendwithImage_btn setTitle:@"Send with Images" forState:UIControlStateNormal];
    [[sendwithImage_btn titleLabel] setFont:[UIFont fontWithName:@"AmericanTypewriter" size:12]];
    [sendwithImage_btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [sendwithImage_btn addTarget:self action:@selector(SendwithImage_btnAction) forControlEvents:UIControlEventTouchUpInside];
    [scrollview addSubview:sendwithImage_btn];
    
    
   
#pragma mark send button sub title label.
   UILabel *sendbtnsubtitle_lbl=[[UILabel alloc] init];
    sendbtnsubtitle_lbl.frame=CGRectMake(40, 22, 50, 18);
    sendbtnsubtitle_lbl.text= [NSString stringWithFormat:@"%.2f KB",(float)([[obj.jsonString stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding] length]/1024.0f)];
    sendbtnsubtitle_lbl.textAlignment=1;
    sendbtnsubtitle_lbl.textColor= [UIColor whiteColor];
    sendbtnsubtitle_lbl.backgroundColor=[UIColor clearColor];
    sendbtnsubtitle_lbl.font=[UIFont fontWithName:@"AmericanTypewriter" size:8];
    [sendwithImage_btn addSubview:sendbtnsubtitle_lbl];
    
    
   
#pragma mark SendwithoutImage Button
    UIButton *sendwithoutImage_btn =[UIButton buttonWithType:UIButtonTypeCustom];
    [sendwithoutImage_btn setBackgroundImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"button-bg1" ofType:@"png"]] forState:UIControlStateNormal];
    [sendwithoutImage_btn setTitle:@"Send without Images" forState:UIControlStateNormal];
    [[sendwithoutImage_btn titleLabel] setFont:[UIFont fontWithName:@"AmericanTypewriter" size:12]];
    [sendwithoutImage_btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [sendwithoutImage_btn addTarget:self action:@selector(sendwithoutImage_btnAction) forControlEvents:UIControlEventTouchUpInside];
    [scrollview addSubview:sendwithoutImage_btn];
    
    
#pragma mark send button sub title label.
    UILabel *sendwithoutbtnsubtitle_lbl=[[UILabel alloc] init];
    sendwithoutbtnsubtitle_lbl.frame=CGRectMake(40, 22, 50, 18);
    sendwithoutbtnsubtitle_lbl.text=[NSString stringWithFormat:@"%.2f KB",(float)([[obj.jsonString_withoutImages stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding] length]/1024.0f)];
    sendwithoutbtnsubtitle_lbl.textAlignment=1;
    sendwithoutbtnsubtitle_lbl.textColor= [UIColor whiteColor];
    sendwithoutbtnsubtitle_lbl.backgroundColor=[UIColor clearColor];
    sendwithoutbtnsubtitle_lbl.font=[UIFont fontWithName:@"AmericanTypewriter" size:8];
    [sendwithoutImage_btn addSubview:sendwithoutbtnsubtitle_lbl];
    
    bg=[[UIView alloc] init];
    
    if (IS_IPHONE_5) {
        bg.frame=CGRectMake(0, 90, 320, 568-90);
    } else {
        bg.frame=CGRectMake(0, 80, 320, 400);
    }
    bg.backgroundColor=[UIColor clearColor];
    
    [bg setHidden:YES];
    [self.view addSubview:bg];
    
    if (IS_IPHONE_5) {
        mainbg_img.frame=CGRectMake(0,0, 320, 568);
        nav_img.frame=CGRectMake(0,0,320,90);
        
        back_btn.frame=CGRectMake(15, 14, 33, 54);
        navbartitle.frame=CGRectMake(0,20,320,50);
        share_image.frame=CGRectMake(20, 21, 20, 18);
        shareContacts_btn.frame=CGRectMake(0,0, 320,60);
        seprator_image1.frame=CGRectMake(0, 60, 320, 2);
        selectContact_lbl.frame=CGRectMake(50,62,150,60);
        add1_btn.frame=CGRectMake(280, 19.75+60, 20, 20.5);
        seprator_image2.frame=CGRectMake(0, 122, 320, 2);
        sharewithContacts_btn.frame=CGRectMake(0,124, 320,60);
        sharewithContact_image.frame=CGRectMake(20, 20, 20, 20);
        seprator_image3.frame=CGRectMake(0, 184, 320, 2);
        recipients_lbl.frame=CGRectMake(50,186,150,60);
        recipien_btn.frame=CGRectMake(280, 19.75+185, 20, 20.5);
        seprator_image4.frame=CGRectMake(0, 246, 320, 2);
        addNote_txtview.frame = CGRectMake(15, 248+10, 290, 143);
        txtView_img.frame = CGRectMake(15, 248+10, 290, 145);
        sendwithImage_btn.frame=CGRectMake(15,scrollview.frame.size.height-60, 135,39.5);
        sendwithoutImage_btn.frame=CGRectMake(170,scrollview.frame.size.height-60, 135,39.5);
        
    }else{
        
        mainbg_img.frame=CGRectMake(0,0, 320, 480);
        nav_img.frame=CGRectMake(0,0,320,80);
       
        back_btn.frame=CGRectMake(15, 13, 33, 54);
        navbartitle.frame=CGRectMake(0,20,320,50);
        shareContacts_btn.frame=CGRectMake(0,0, 320,50);
        share_image.frame=CGRectMake(20, 14.25, 20, 18);
        seprator_image1.frame=CGRectMake(0, 50, 320, 2);
        selectContact_lbl.frame=CGRectMake(50, 52, 150, 50);
        add1_btn.frame=CGRectMake(280, 113.25-50, 20, 20.5);
        seprator_image2.frame=CGRectMake(0, 102, 320, 2);
        sharewithContacts_btn.frame=CGRectMake(0,104, 320,50);
        sharewithContact_image.frame=CGRectMake(20, 15, 20, 20);
        seprator_image3.frame=CGRectMake(0, 154, 320, 2);
        recipients_lbl.frame=CGRectMake(50, 156, 150, 50);
        recipien_btn.frame=CGRectMake(280, 217.5-50, 20, 20.5);
        seprator_image4.frame=CGRectMake(0, 206, 320, 2);
        txtView_img.frame = CGRectMake(15, 218, 290, 145-25);
        addNote_txtview.frame = CGRectMake(17, 218, 290, 145-28);
        sendwithImage_btn.frame=CGRectMake(15,scrollview.frame.size.height-50, 135,39.5);
        sendwithoutImage_btn.frame=CGRectMake(170,scrollview.frame.size.height-50, 135,39.5);

    }
    

	// Do any additional setup after loading the view.
}
-(void)viewWillAppear:(BOOL)animated
{
    
    selectContact_lbl.text=[NSString stringWithFormat:@"%@ contacts selected",obj.contactsToBeShared_selected];

    recipients_lbl.text=[NSString stringWithFormat:@"%@ contacts selected",obj.recipients_selected];
}
-(void)Setting_btnAction:(id)sender
{
    if ([obj.from_ShareMethodViewController isEqualToString:@"0"])
    {
        obj.vcs =  [NSMutableArray arrayWithArray:self.navigationController.viewControllers];
        [self.navigationController setViewControllers:obj.vcs animated:NO];
    }
    
    [obj setFrom_ShareMethodViewController:@"1"];
    [obj setBackBtnActivate:@"1"];
    if([sender tag]==1)
    {
       
    
             for (UIViewController *controller in self.navigationController.viewControllers)
             {
                 if ([controller isKindOfClass:[SelectContact_toShareViewController class]]) {
                     
                     if([self.navigationController.viewControllers containsObject:controller])
                     {
                         [self.navigationController popToViewController:controller
                                                               animated:YES];

                     }
                     else
                     {
                         CATransition *transition = [CATransition animation];
                         transition.duration =0;
                         transition.type = kCATransitionPush;
                         transition.subtype= kCATransitionFromLeft;
                         [self.navigationController.view.layer addAnimation:transition forKey:nil];
                         [self.navigationController pushViewController:controller
                                                               animated:YES];
                     }
                     break;
                 }
             }
        
    }
    else if([sender tag]==2)
    {
        
        for (UIViewController *controller in obj.vcs)
        {
            if ([controller isKindOfClass:[SelectRecipientsViewController class]])
            {
                if([self.navigationController.viewControllers containsObject:controller])
                {
                    [self.navigationController popToViewController:controller
                                                         animated:YES];
                }
                else
                {
                    CATransition *transition = [CATransition animation];
                    transition.duration =0;
                    transition.type = kCATransitionPush;
                    transition.subtype= kCATransitionFromLeft;
                    [self.navigationController.view.layer addAnimation:transition forKey:nil];
                    
                    [self.navigationController pushViewController:controller
                                                         animated:NO];

                }
                break;
            }
           
        }

    }
}

-(void)back_btnAction
{
    [obj setBackBtnActivate:@"0"];
    if ([obj.from_ShareMethodViewController isEqualToString:@"0"])
    {
        
        [self.navigationController popViewControllerAnimated:YES];
    }
    else
    {
        
        for (UIViewController *controller in obj.vcs)
        {
            if ([controller isKindOfClass:[SelectRecipientsViewController class]]) {
                if([self.navigationController.viewControllers containsObject:controller])
                {
                    [self.navigationController popToViewController:controller
                                                          animated:YES];
                }
                else
                {
                    CATransition *transition = [CATransition animation];
                    transition.duration =0;
                    transition.type = kCATransitionPush;
                    transition.subtype= kCATransitionFromLeft;
                    [self.navigationController.view.layer addAnimation:transition forKey:nil];
                    
                    [self.navigationController pushViewController:controller
                                                         animated:NO];
                    
                }
              
                 break;
            }
            
        }
        
    }
    
    
}


- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    
    if([text isEqualToString:@"\n"]) {
        //[textView resignFirstResponder];
        
//        UIScrollView *scrollview3=(UIScrollView *)[self.view viewWithTag:111];
//        scrollview3.scrollEnabled=YES;
//        
//        
//        [scrollview3 setContentOffset:CGPointMake(0, 0) animated:YES];
//
//        if(textView.text.length == 0){
//            textView.textColor = [UIColor lightGrayColor];
//            textView.text = @"Add Note";
//            [textView resignFirstResponder];
//        }
        return YES;
    }
    
    return YES;
    
}
- (BOOL) textViewShouldBeginEditing:(UITextView *)textView
{
    UIScrollView *scrollview3=(UIScrollView *)[self.view viewWithTag:111];
    scrollview3.scrollEnabled=YES;
    
    
    [scrollview3 setContentOffset:CGPointMake(0, 170) animated:YES];

    if ([textView.text isEqualToString:@"Add Note"]) {
        textView.text = @"";
    }
    textView.textColor = [UIColor whiteColor];
    
    [bg setHidden:NO];
    
    return YES;
}

-(void) textViewDidChange:(UITextView *)textView
{
    
    if(textView.text.length == 0){
        textView.textColor = [UIColor lightGrayColor];
        textView.text = @"Add Note";
        [textView resignFirstResponder];
        [bg setHidden:YES];
        UIScrollView *scrollview3=(UIScrollView *)[self.view viewWithTag:111];
        scrollview3.scrollEnabled=YES;
        [scrollview3 setContentOffset:CGPointMake(0, 0) animated:YES];
    }
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    [addNote_txtview resignFirstResponder];
    [bg setHidden:YES];
    UIScrollView *scrollview3=(UIScrollView *)[self.view viewWithTag:111];
    scrollview3.scrollEnabled=YES;
    
    
    [scrollview3 setContentOffset:CGPointMake(0, 0) animated:YES];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (alertView.tag==1 && buttonIndex==0) {
            }
}
-(void)SendwithImage_btnAction
{
    
    ContactSignUpDataService * sendContacts_cls=[[ContactSignUpDataService alloc] init];
    sendContacts_cls.delegate=self;
    activityIndicator = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge] ;
    activityIndicator.frame = CGRectMake(0.0, 0.0, 40.0, 40.0);
    activityIndicator.center = self.view.center;
    [self.view addSubview: activityIndicator];
    [activityIndicator startAnimating];
    
    
    NSUUID* uuid = [[UIDevice currentDevice] identifierForVendor];
    NSLog(@"[uuid UUIDString] %@",[uuid UUIDString]);
   
    NSString* url=[NSString stringWithFormat:@"%@",kBASEURL];
    NSString* payload=[NSString stringWithFormat:@"{\"deviceid\":\"%@\",\"send\":\"%@\",\"receive\":\"%@\",\"note\":\"%@\",\"count\":\"%@\"}",[uuid UUIDString],obj.jsonString,obj.jsonString_recipients,addNote_txtview.text,obj.contactsToBeShared_selected];
   
    
    [sendContacts_cls callWebService:url :@"savecontacts" :payload];

}
-(void)getresponse:(NSString *)result :(id)data :message status:(BOOL)value
{
    [activityIndicator stopAnimating];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:result
                                                    message: message
                                                   delegate:nil
                                          cancelButtonTitle:@"Ok"
                                          otherButtonTitles:Nil,Nil];
    
   
    [alert show];
    
    NSLog(@"\n\n\n%@",[data stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding]);
    //*****************************PARSING THE JSON**********************************************************
    NSData* data1 = [[data stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding]  dataUsingEncoding:NSUTF8StringEncoding];
    NSError *localError = nil;
    
    if (data1!=nil) {
    
    NSDictionary *parsedObject = [NSJSONSerialization JSONObjectWithData:data1 options:0 error:&localError];
   
   
//    NSData* jsonData = [NSJSONSerialization dataWithJSONObject:parsedObject
//                                                       options:kNilOptions error:&localError];
    
//    NSString* newStr = [[NSString alloc] initWithData:jsonData
//                                             encoding:NSUTF8StringEncoding] ;
    
    NSLog(@"\n\n\njsonData %@", [parsedObject objectForKey:@"Data"]);
    
    NSArray *totalPerson=[parsedObject objectForKey:@"Data"];
    
    NSLog(@"NUMBER:/n/n/n/n%ld\n\n\n",(unsigned long)[totalPerson count]);
    NSDictionary *dic=[totalPerson objectAtIndex:0];
    NSLog(@"DIC:/n/n/n/n%@\n\n\n",dic);
    
    NSArray* a=[dic objectForKey:@"Person"];
    NSDictionary *imgDic=[a objectAtIndex:0];
    
    
    NSArray* a1=[imgDic objectForKey:@"data"];
    NSDictionary *imgDic1=[a1 objectAtIndex:3];
    NSLog(@"\n\n\nIMAGE VALUE %@", [imgDic1 objectForKey:@"value"] );
    
   
    NSData *imageData = [Base64 decode:[[imgDic1 objectForKey:@"value"]stringByReplacingOccurrencesOfString:@" " withString:@"+"]];
    
    UIImage *img=[UIImage imageWithData:imageData];
    
    UIImageView *i=[[UIImageView alloc] initWithFrame:CGRectMake(30, 30, 100, 100)];
    i.image=img;
    [self.view addSubview:i];
    
    }
    

}

-(void)sendwithoutImage_btnAction{
    
    ContactSignUpDataService * sendContacts_cls=[[ContactSignUpDataService alloc] init];
    sendContacts_cls.delegate=self;
    activityIndicator = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge] ;
    activityIndicator.frame = CGRectMake(0.0, 0.0, 40.0, 40.0);
    activityIndicator.center = self.view.center;
    [self.view addSubview: activityIndicator];
    [activityIndicator startAnimating];
    
    
    NSUUID* uuid = [[UIDevice currentDevice] identifierForVendor];
    NSLog(@"[uuid UUIDString] %@",obj.jsonString_withoutImages);
    
    NSString* url=[NSString stringWithFormat:@"%@",kBASEURL];
    NSString* payload=[NSString stringWithFormat:@"{\"deviceid\":\"%@\",\"send\":\"%@\",\"receive\":\"%@\",\"note\":\"%@\",\"count\":\"%@\"}",[uuid UUIDString],obj.jsonString_withoutImages,obj.jsonString_recipients,addNote_txtview.text,obj.contactsToBeShared_selected];
    
    
    [sendContacts_cls callWebService:url :@"savecontacts" :payload];

}

@end
