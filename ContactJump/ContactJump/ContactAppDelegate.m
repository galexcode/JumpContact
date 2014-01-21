//
//  ContactAppDelegate.m
//  ContactJump
//
//  Created by Raman on 02/01/14.
//  Copyright (c) 2014 iyasoft. All rights reserved.
//

#import "ContactAppDelegate.h"
#import "ContactMainViewController.h"
@implementation ContactAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
     self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    
     ContactMainViewController *mainView=[[ContactMainViewController alloc]init];
     UINavigationController *navController=[[UINavigationController alloc]initWithRootViewController:mainView];
     self.window.rootViewController=navController;
    
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    ContactGlobalDataClass *obj=[ContactGlobalDataClass getInstance];
    
//    ABAddressBookRef addressBook = ABAddressBookCreate();
//    CFArrayRef allSources = ABAddressBookCopyArrayOfAllPeople( addressBook );
//    for (CFIndex i = 0; i < ABAddressBookGetPersonCount( addressBook ); i++)
//    {
//        ABRecordRef aSource = CFArrayGetValueAtIndex(allSources,i);
//        ABMultiValueRef phones =(__bridge ABMultiValueRef)((__bridge NSString*)ABRecordCopyValue(aSource, kABPersonFirstNameProperty));
//        NSString* name = (__bridge_transfer NSString*)ABRecordCopyValue(aSource,
//                                                                        
//                                                                        kABPersonFirstNameProperty);
//        
//        NSLog(@"name %@",name);
//        NSString* mobileLabel;
//        
//        for(CFIndex i = 0; i < ABMultiValueGetCount(phones); i++) {
//            
//            mobileLabel = (__bridge NSString*)ABMultiValueCopyLabelAtIndex(phones, i);
//            
////            if([mobileLabel isEqualToString:(NSString *)kABPersonPhoneMobileLabel])
////            {
////                home_mobile = (__bridge NSString*)ABMultiValueCopyValueAtIndex(phones, i) ;
////                
////            }
////            
////            if ([mobileLabel isEqualToString:(NSString*)kABPersonPhoneIPhoneLabel])
////            {
////                basic_mobile = (__bridge NSString*)ABMultiValueCopyValueAtIndex(phones, i);
////                
////                
////            }
////            if([mobileLabel isEqualToString:(NSString *)kABPersonPhoneMainLabel])
////            {
////                work_mobile = (__bridge NSString*)ABMultiValueCopyValueAtIndex(phones, i);
////                
////            }
//        }
//    
//    }
    ABAddressBookRef addressBook = ABAddressBookCreateWithOptions(NULL,NULL);
    __block BOOL accessGranted = NO;
    if (ABAddressBookGetAuthorizationStatus() == kABAuthorizationStatusNotDetermined)
    {
        NSLog(@"kABAuthorizationStatusNotDetermined");
        dispatch_semaphore_t sema = dispatch_semaphore_create(0);
        ABAddressBookRequestAccessWithCompletion(addressBook, ^(bool granted, CFErrorRef error) {
            accessGranted = granted;
            dispatch_semaphore_signal(sema);
        });
        dispatch_semaphore_wait(sema, DISPATCH_TIME_FOREVER);
        dispatch_release(sema);
    }
    else  if (ABAddressBookGetAuthorizationStatus() == kABAuthorizationStatusAuthorized)
    {
         NSLog(@"kABAuthorizationStatusAuthorized");
        accessGranted = YES;
    }
    
    if (accessGranted) {
        CFArrayRef allPeople = ABAddressBookCopyArrayOfAllPeople(addressBook);
        CFIndex nPeople = ABAddressBookGetPersonCount(addressBook);
        
        NSMutableArray *contacts = [[NSMutableArray alloc] init];
        
        
        for (int i = 0; i < nPeople; i++) {
//            // Get the next address book record.
//            ABRecordRef record = CFArrayGetValueAtIndex(allPeople, i);
//            
//            // Get array of email addresses from address book record.
//            ABMultiValueRef emailMultiValue = ABRecordCopyValue(record, kABPersonFirstNameProperty);
//            NSArray *emailArray = (__bridge_transfer NSArray *)ABMultiValueCopyArrayOfAllValues(emailMultiValue);
//            if (emailArray !=nil) {
//                [contacts addObject:emailArray];
//            }
            ABRecordRef ref = CFArrayGetValueAtIndex(allPeople, i);
            NSString *firstName = (__bridge NSString *)ABRecordCopyValue(ref, kABPersonFirstNameProperty);
            NSLog(@"Name %@", firstName);
            if (firstName.length==0 ) {
                [contacts addObject:@"##"];
            } else {
                [contacts addObject:firstName];
            }
            
            ABMultiValueRef phones = ABRecordCopyValue(ref, kABPersonPhoneProperty);
            for(CFIndex j = 0; j < ABMultiValueGetCount(phones); j++)
            {
                
                CFStringRef locLabel1 = ABMultiValueCopyLabelAtIndex(phones, j);
                NSString *phoneLabel1 =(__bridge NSString*) ABAddressBookCopyLocalizedLabel(locLabel1);
                
                NSLog(@"  ### %@  --- %@ ### )", locLabel1, phoneLabel1);
                
            }
        }
        NSLog(@"%@",contacts);
        obj.contactDetails=[[NSMutableArray alloc] init];
        [obj setContactDetails:contacts];
    }
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
