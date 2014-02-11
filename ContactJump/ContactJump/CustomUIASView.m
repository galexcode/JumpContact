
#import "CustomUIASView.h"


@implementation CustomUIASView



- (id)initWithFrame:(CGRect)frame {
  
  if ((self = [super initWithFrame:frame])) {
    
    //self.alpha           = 1.8;
   // self.backgroundColor = [UIColor clearColor];
    self.backgroundColor = [UIColor colorWithRed:0/255.0f green:0/255.0f blue:0/255.0f alpha:0.8];
     // self.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"transparent-bg.png"] ];
    //-58, g-76, b-83
   // [UIColor colorWithRed:68/255.0f green:192/255.0f blue:181/255.0f alpha:1];

      
      self.doneBtn =[UIButton buttonWithType:UIButtonTypeCustom];
      self.doneBtn.frame=CGRectMake(123,170,54,25);
      [self.doneBtn setTitle:@"Done" forState:UIControlStateNormal];
       [self.doneBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
      [self.doneBtn setBackgroundColor:[UIColor whiteColor]];
//     [self.doneBtn setBackgroundImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"close" ofType:@"png"]] forState:UIControlStateNormal];
      [self addSubview:self.doneBtn];

      
      
    
      
      self.celltxt_lbl3=[[UILabel alloc] init];

      self.celltxt_lbl3.frame=CGRectMake(25+10,34,250,64.5);
 
      self.celltxt_lbl3.numberOfLines=2;
      self.celltxt_lbl3.text=[NSString stringWithFormat:@"Enter your Name and Mobile Number To be verfied"];
      self.celltxt_lbl3.textAlignment=UITextAlignmentLeft;
      self.celltxt_lbl3.textColor= [UIColor colorWithRed:255/255.0f green:255/255.0f blue:255/255.0f alpha:1];
      self.celltxt_lbl3.backgroundColor=[UIColor clearColor];
      self.celltxt_lbl3.font=[UIFont systemFontOfSize:15.0f];
     
      [self addSubview:self.celltxt_lbl3];
      
      self.nametxtfld=[[UITextField alloc] init];
      self.nametxtfld.frame=CGRectMake(25+10,94,240,30);
      self.nametxtfld.placeholder=@"Name";
      self.nametxtfld.textAlignment=UITextAlignmentLeft;
      self.nametxtfld.textColor= [UIColor blackColor];
      self.nametxtfld.backgroundColor=[UIColor whiteColor];
      self.nametxtfld.font=[UIFont systemFontOfSize:15.0f];
      self.nametxtfld.keyboardType=UIKeyboardTypeNamePhonePad;
      [self addSubview:self.nametxtfld];
      
      self.phntxtfld=[[UITextField alloc] init];
      self.phntxtfld.frame=CGRectMake(25+10,134,240,30);
      self.phntxtfld.placeholder=@"Phone Number";
      self.phntxtfld.textAlignment=UITextAlignmentLeft;
      self.phntxtfld.textColor= [UIColor blackColor];
      self.phntxtfld.backgroundColor=[UIColor whiteColor];
      self.phntxtfld.font=[UIFont systemFontOfSize:15.0f];
      self.phntxtfld.keyboardType=UIKeyboardTypeNumberPad;
      [self addSubview:self.phntxtfld];

      
      
      
      

  }
  
  return self;
}



@end