//
//  ContacsSentDetailsViewController.m
//  ContactJump
//
//  Created by Dex on 21/01/14.
//  Copyright (c) 2014 iyasoft. All rights reserved.
//

#import "ContacsSentDetailsViewController.h"
#import "SelectRecipientsViewController.h"
@interface ContacsSentDetailsViewController ()

@end

@implementation ContacsSentDetailsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}



-(void)senderNoteText:(NSString *)note :(NSString *)recordId :(NSString *)name :(NSString *)time :(NSString *)totalContactsShared :(NSString *)sizewithimage :(NSString *)sizeWithoutimage
{
    NSLog(@"%@, %@ ",note,recordId);
    self.recordID=recordId;
    noteText=note;
    time_shared=time;
    name_sender=name;
    size_withImage=sizewithimage;
    size_withoutImage=sizeWithoutimage;
    numberOfContact_shared=totalContactsShared;
}




- (void)viewDidLoad
{
    [super viewDidLoad];
#pragma Main BG ImageView
    UIImageView *mainbg_img = [[UIImageView alloc] init];
    mainbg_img.userInteractionEnabled=TRUE;
    //mainbg_img.opaque = YES;
    [mainbg_img setImage:[UIImage imageNamed:@"text=area.png"]];
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
    [logout_btn addTarget:self action:@selector(Setting_btnAction) forControlEvents:UIControlEventTouchUpInside];
    [mainbg_img addSubview:logout_btn];
    
#pragma Navigation Bar Title
    UILabel *navbartitle=[[UILabel alloc] init];
    navbartitle.text=[NSString stringWithFormat:@"%@",name_sender];
    navbartitle.textAlignment=1;
    navbartitle.textColor= [UIColor whiteColor];
    navbartitle.backgroundColor=[UIColor clearColor];
    navbartitle.font=[UIFont fontWithName:@"AmericanTypewriter" size:18];
    navbartitle.shadowColor = [UIColor whiteColor];
    navbartitle.shadowOffset = CGSizeMake(0,0);
    [mainbg_img addSubview:navbartitle];
    
#pragma mark number of selected contacts.
    UILabel *noofselectedcontacts=[[UILabel alloc] init];
    noofselectedcontacts.frame=CGRectMake(15, 100, 150, 40);
    noofselectedcontacts.text=[NSString stringWithFormat:@"%@ Contacts sent",numberOfContact_shared];
    noofselectedcontacts.textAlignment=NSTextAlignmentLeft;
    noofselectedcontacts.textColor= [UIColor blackColor];
    noofselectedcontacts.backgroundColor=[UIColor clearColor];
    noofselectedcontacts.font=[UIFont fontWithName:@"AmericanTypewriter" size:14];
    noofselectedcontacts.shadowColor = [UIColor whiteColor];
    noofselectedcontacts.shadowOffset = CGSizeMake(0,0);
    [mainbg_img addSubview:noofselectedcontacts];
    
    
    UILabel *time_lbl=[[UILabel alloc] init];
    time_lbl.text=[NSString stringWithFormat:@"%@",time_shared];
    time_lbl.frame=CGRectMake(235, 100, 80, 40);
    time_lbl.textAlignment=1;
    time_lbl.numberOfLines=2;
    time_lbl.textColor= [UIColor blackColor];
    time_lbl.backgroundColor=[UIColor clearColor];
    time_lbl.font=[UIFont fontWithName:@"AmericanTypewriter" size:12];
    time_lbl.shadowColor = [UIColor whiteColor];
    time_lbl.shadowOffset = CGSizeMake(0,0);
    [mainbg_img addSubview:time_lbl];
    
    
#pragma mark Text Area  image.
    UIImageView  *textarea_img =[[UIImageView alloc] init];
    textarea_img.image=[UIImage imageNamed:@"text=area.png"];
    textarea_img.frame=CGRectMake(15, 150, 290, 142.5);
    [mainbg_img addSubview:textarea_img];
    
#pragma mark Text View.
    UITextView *textview=[[UITextView alloc]init];
    textview.text=[NSString stringWithFormat:@"%@",noteText];
    textview.scrollEnabled=YES;
    textview.frame=CGRectMake(5, 5, 280, 132.5);
    textview.backgroundColor=[UIColor clearColor];
    textview.textColor=[UIColor darkGrayColor];
    [textarea_img addSubview:textview];
    
#pragma mark Canecl Button
    
    if (IS_IPHONE_5) {
        
        mainbg_img.frame=CGRectMake(0,0, 320, 568);
        nav_img.frame=CGRectMake(0,0,320,90);
        logout_btn.frame=CGRectMake(240,0, 90,90);
        back_btn.frame=CGRectMake(15, 14, 33, 54);
        navbartitle.frame=CGRectMake(0,20,320,50);
       
        
    }else{
        mainbg_img.frame=CGRectMake(0,0, 320, 480);
        nav_img.frame=CGRectMake(0,0,320,80);
        logout_btn.frame=CGRectMake(240,0, 90,90);
        back_btn.frame=CGRectMake(15, 13, 33, 54);
        navbartitle.frame=CGRectMake(0,20,320,50);
       
        
    }

}
-(void)Setting_btnAction
{
    ContactGlobalDataClass *obj=[ContactGlobalDataClass getInstance];
    [obj setFrom_ShareMethodViewController:@"0"];
    SelectRecipientsViewController *selectRecipient=[[SelectRecipientsViewController alloc]init];
    
    [selectRecipient sendID:self.recordID :1];
    [self.navigationController pushViewController:selectRecipient animated:YES];

}
-(void)back_btnAction
{
    
    [self.navigationController popViewControllerAnimated:YES];
}





- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
