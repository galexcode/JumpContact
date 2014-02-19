//
//  CustomUIViewForBackUp.m
//  ContactJump
//
//  Created by Dex on 19/02/14.
//  Copyright (c) 2014 iyasoft. All rights reserved.
//

#import "CustomUIViewForBackUp.h"

@implementation CustomUIViewForBackUp

- (id)initWithFrame:(CGRect)frame {
    
    if ((self = [super initWithFrame:frame])) {
        
        //self.alpha           = 1.8;
        // self.backgroundColor = [UIColor clearColor];
        self.backgroundColor = [UIColor colorWithRed:0/255.0f green:0/255.0f blue:0/255.0f alpha:0.8];
        // self.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"transparent-bg.png"] ];
        //-58, g-76, b-83
        // [UIColor colorWithRed:68/255.0f green:192/255.0f blue:181/255.0f alpha:1];
        
        
        self.backupWithImageBtn =[UIButton buttonWithType:UIButtonTypeCustom];
        //self.backupWithImageBtn.frame=CGRectMake(15,170,135,39.5);
        self.backupWithImageBtn.frame=CGRectMake(20,42.5,260,60);
         [ self.backupWithImageBtn setBackgroundImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"button-bg1" ofType:@"png"]] forState:UIControlStateNormal];
         [self.backupWithImageBtn setTitleEdgeInsets:UIEdgeInsetsMake(-20.0f, 10.0f, 0.0f, 0.0f)];
        [self.backupWithImageBtn setTitle:@"Backup With Images" forState:UIControlStateNormal];
        [[self.backupWithImageBtn titleLabel] setFont:[UIFont fontWithName:@"AmericanTypewriter" size:16]];
        [self.backupWithImageBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
   
        [self addSubview:self.backupWithImageBtn];
        
        self.backupWithoutImageBtn =[UIButton buttonWithType:UIButtonTypeCustom];
        //self.backupWithoutImageBtn.frame=CGRectMake(170,170,135,39.5);
        self.backupWithoutImageBtn.frame=CGRectMake(20,147.5,260,60);
        [self.backupWithoutImageBtn setBackgroundImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"button-bg1" ofType:@"png"]] forState:UIControlStateNormal];
        [self.backupWithoutImageBtn setTitleEdgeInsets:UIEdgeInsetsMake(-20.0f, 10.0f, 0.0f, 0.0f)];
        [self.backupWithoutImageBtn setTitle:@"Backup Without Images" forState:UIControlStateNormal];
        [[self.backupWithoutImageBtn titleLabel] setFont:[UIFont fontWithName:@"AmericanTypewriter" size:16]];
        [self.backupWithoutImageBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];

        
        
        [self addSubview:self.backupWithoutImageBtn];

        
        self.celltxt_sizeWithImage=[[UILabel alloc] init];
        self.celltxt_sizeWithImage.frame=CGRectMake(35, 34, 190, 18);
        
        self.celltxt_sizeWithImage.textAlignment=NSTextAlignmentCenter;
        self.celltxt_sizeWithImage.textColor= [UIColor lightGrayColor];
        self.celltxt_sizeWithImage.backgroundColor=[UIColor clearColor];
        self.celltxt_sizeWithImage.font=[UIFont fontWithName:@"AmericanTypewriter" size:13];
        [self.backupWithImageBtn  addSubview:self.celltxt_sizeWithImage];

        
        self.celltxt_sizeWithoutImage=[[UILabel alloc] init];
        
        self.celltxt_sizeWithoutImage.frame=CGRectMake(35, 34, 190, 18);
        
        self.celltxt_sizeWithoutImage.numberOfLines=2;
        
        self.celltxt_sizeWithoutImage.textAlignment=NSTextAlignmentCenter;
        self.celltxt_sizeWithoutImage.textColor= [UIColor lightGrayColor];
        self.celltxt_sizeWithoutImage.backgroundColor=[UIColor clearColor];
        self.celltxt_sizeWithoutImage.font=[UIFont systemFontOfSize:15.0f];
        
        [self.backupWithoutImageBtn  addSubview:self.celltxt_sizeWithoutImage];
        
       
        
        
        
        
        
        
    }
    
    return self;
}

@end
