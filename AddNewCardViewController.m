//
//  AddNewCardViewController.h
//  CardeHolder
//
//  Created by ahex-mac on 04/01/16.
//  Copyright © 2016 AhexTechnologies. All rights reserved.
//

#import "AddNewCardViewController.h"
#import "UITextField+CustomInputViews.h"//sri
#import "MBProgressHUD.h"
#import "TextFieldFilter.h"
@interface AddNewCardViewController ()
{
    UITextField *selectedTextField;
    UIDatePicker *picker1;
    UIView *customAlert;
    MBProgressHUD *hud ;
    BOOL *isMandatory;
    UIButton *errornameButton;
    UIButton *errorCompmayButton;
    UIButton *errorDateButton;
    UIButton *errorDesignation;
    UIButton *errorNoteBuuton;
    UIButton *errorPhoneButton;
    UIButton *errorEmailButton;
    TextFieldFilter *nameFilter,*companyFilter,*dateFilter,*designationFilter,*emailFilter,*phoneFilter,*noteFilter;

}
@end

@implementation AddNewCardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    Header *header = [[Header alloc]initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, 60)];
    header.backgroundColor = [UIColor blackColor];
    header.delegate = self;
    [self.view addSubview:header];
    
    self.view.backgroundColor = [UIColor colorWithHexString:@"#2E3540"];

    
    self.cardDetailScroll = [[UIScrollView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(header.frame), self.view.frame.size.width, self.view.frame.size.height-CGRectGetMaxY(header.frame))];
//    self.cardDetailScroll.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:self.cardDetailScroll];
    
    UILabel *cardHeader = [[UILabel alloc]initWithFrame:CGRectMake(30, 10, self.view.frame.size.width-60, 30)];
    cardHeader.text = @"Add Details Here";
    cardHeader.textColor=[UIColor whiteColor];
    cardHeader.textAlignment = NSTextAlignmentCenter;
    [self.cardDetailScroll addSubview:cardHeader];
    
    UIImageView *cardHeaderImg = [[UIImageView alloc]initWithFrame:CGRectMake(self.view.frame.size.width/2-10, CGRectGetMaxY(cardHeader.frame)+10, 20, 20)];
    [self.cardDetailScroll addSubview:cardHeaderImg];
    
    
    
    self.name = [[ImageTextField alloc]initWithFrame:CGRectMake(30, CGRectGetMaxY(cardHeaderImg.frame)+10, self.view.frame.size.width-60, 50)];
    [self.name.background setImage:[UIImage imageNamed:@"name.png"]];
    self.name.title.placeholder = @" Name";
    self.name.title.tag = 1;
    [self.cardDetailScroll addSubview:self.name];
    
    nameFilter = [[TextFieldFilter alloc]initWithFrame:CGRectMake(CGRectGetMidX(self.name.frame)-60, CGRectGetMaxY(self.name.frame), CGRectGetMidX(self.name.frame)+20, 20) menuItems:@"Field Cannot be Empty"];
    [self.cardDetailScroll addSubview:nameFilter];
    
    
    
    
    
    // Displaying Errror message if textfield is Empty...
    errornameButton=[[UIButton alloc]initWithFrame:CGRectMake(self.view.frame.size.width-110, 10, 30, 30)];
    [errornameButton setImage:[UIImage imageNamed:@"error@2x.png"] forState:UIControlStateNormal];
    errornameButton.hidden=YES;
    [self.name addSubview:errornameButton];
    
    
    

    
    self.company = [[ImageTextField alloc]initWithFrame:CGRectMake(30, CGRectGetMaxY(self.name.frame)+20, self.view.frame.size.width-60, 50)];
    [self.company.background setImage:[UIImage imageNamed:@"company.png"]];
    self.company.title.placeholder = @" Company";
    self.company.title.tag = 2;
    [self.cardDetailScroll addSubview:self.company];
    
    companyFilter = [[TextFieldFilter alloc]initWithFrame:CGRectMake(CGRectGetMidX(self.company.frame)-60, CGRectGetMaxY(self.company.frame), CGRectGetMidX(self.company.frame)+20, 20) menuItems:@"Field Cannot be Empty"];
    [self.cardDetailScroll addSubview:companyFilter];
    
    
    //Displaying Error message if Cmpnay is Empty..
    
    errorCompmayButton=[[UIButton alloc]initWithFrame:CGRectMake(self.view.frame.size.width-110, 10, 30, 30)];
    [errorCompmayButton setImage:[UIImage imageNamed:@"error@2x.png"] forState:UIControlStateNormal];
    errorCompmayButton.hidden=YES;
    [self.company addSubview:errorCompmayButton];
    
    
    
    
    
    
    self.date = [[ImageTextField alloc]initWithFrame:CGRectMake(30, CGRectGetMaxY(self.company.frame)+20, self.view.frame.size.width-60, 50)];
    [self.date.background setImage:[UIImage imageNamed:@"meeting.png"]];
    self.date.title.placeholder = @"   Date";
    self.date.title.tag = 3;
    [self.cardDetailScroll addSubview:self.date];
    
    dateFilter = [[TextFieldFilter alloc]initWithFrame:CGRectMake(CGRectGetMidX(self.date.frame)-60, CGRectGetMaxY(self.date.frame), CGRectGetMidX(self.date.frame)+20, 20) menuItems:@"Field Cannot be Empty"];
    [self.cardDetailScroll addSubview:dateFilter];
    
    
    
    //Displaying Error message if Cmpnay is Empty..

    errorDateButton=[[UIButton alloc]initWithFrame:CGRectMake(self.view.frame.size.width-110, 10, 30, 30)];
    [errorDateButton setImage:[UIImage imageNamed:@"error@2x.png"] forState:UIControlStateNormal];
    errorDateButton.hidden=YES;
    [self.date addSubview:errorDateButton];
    
    
    
    
    
    
    self.designation = [[ImageTextField alloc]initWithFrame:CGRectMake(30, CGRectGetMaxY(self.date.frame)+20, self.view.frame.size.width-60, 50)];
    [self.designation.background setImage:[UIImage imageNamed:@"name.png"]];
    self.designation.title.placeholder = @" Designation";
    self.designation.title.tag = 4;
    [self.cardDetailScroll addSubview:self.designation];
    
    designationFilter = [[TextFieldFilter alloc]initWithFrame:CGRectMake(CGRectGetMidX(self.designation.frame)-60, CGRectGetMaxY(self.designation.frame), CGRectGetMidX(self.designation.frame)+20, 20) menuItems:@"Field Cannot be Empty"];
    [self.cardDetailScroll addSubview:designationFilter];
    
    
    
    //Displaying Error message if Designation is Empty
    errorDesignation=[[UIButton alloc]initWithFrame:CGRectMake(self.view.frame.size.width-110, 10, 30, 30)];
    [errorDesignation setImage:[UIImage imageNamed:@"error@2x.png"] forState:UIControlStateNormal];
    errorDesignation.hidden=YES;
    [self.designation addSubview:errorDesignation];
    
    
    
    self.email = [[ImageTextField alloc]initWithFrame:CGRectMake(30, CGRectGetMaxY(self.designation.frame)+20, self.view.frame.size.width-60, 50)];
    [self.email.background setImage:[UIImage imageNamed:@"email.png"]];
    self.email.title.placeholder = @" Email";
    self.email.title.tag = 5;
    [self.cardDetailScroll addSubview:self.email];
    
    emailFilter = [[TextFieldFilter alloc]initWithFrame:CGRectMake(CGRectGetMidX(self.email.frame)-60, CGRectGetMaxY(self.email.frame), CGRectGetMidX(self.email.frame)+20, 20) menuItems:@"Field Cannot be Empty"];
    [self.cardDetailScroll addSubview:emailFilter];
    
    
    errorEmailButton=[[UIButton alloc]initWithFrame:CGRectMake(self.view.frame.size.width-110, 10, 30, 30)];
    [errorEmailButton setImage:[UIImage imageNamed:@"error@2x.png"] forState:UIControlStateNormal];
    errorEmailButton.hidden=YES;
    [self.email addSubview:errorEmailButton];
    
    
    
    
    
    self.phone = [[ImageTextField alloc]initWithFrame:CGRectMake(30, CGRectGetMaxY(self.email.frame)+20, self.view.frame.size.width-60, 50)];
    [self.phone.background setImage:[UIImage imageNamed:@"phone.png"]];
    self.phone.title.placeholder = @" Phone Number";
    self.phone.title.tag = 6;
    [self.cardDetailScroll addSubview:self.phone];
    
    phoneFilter = [[TextFieldFilter alloc]initWithFrame:CGRectMake(CGRectGetMidX(self.phone.frame)-60, CGRectGetMaxY(self.phone.frame), CGRectGetMidX(self.phone.frame)+20, 20) menuItems:@"Field Cannot be Empty"];
    [self.cardDetailScroll addSubview:phoneFilter];
    
    
    errorPhoneButton=[[UIButton alloc]initWithFrame:CGRectMake(self.view.frame.size.width-110, 10, 30, 30)];
    [errorPhoneButton setImage:[UIImage imageNamed:@"error@2x.png"] forState:UIControlStateNormal];
     errorPhoneButton.hidden=YES;
    [self.phone addSubview:errorPhoneButton];
    
    
    
    
    self.note = [[ImageTextField alloc]initWithFrame:CGRectMake(30, CGRectGetMaxY(self.phone.frame)+20, self.view.frame.size.width-60, 50)];
    [self.note.background setImage:[UIImage imageNamed:@"note.png"]];
    self.note.title.placeholder = @" Note";
    self.note.title.tag = 7;
    self.note.backgroundColor = [UIColor clearColor];
    [self.cardDetailScroll addSubview:self.note];
    
    noteFilter = [[TextFieldFilter alloc]initWithFrame:CGRectMake(CGRectGetMidX(self.note.frame)-60, CGRectGetMaxY(self.note.frame), CGRectGetMidX(self.note.frame)+20, 20) menuItems:@"Field Cannot be Empty"];
    [self.cardDetailScroll addSubview:noteFilter];
    
    
    
    
    // Displaying Errror message if NOTE Button is Empty...

    errorNoteBuuton=[[UIButton alloc]initWithFrame:CGRectMake(self.view.frame.size.width-110, 10, 30, 30)];
    [errorNoteBuuton setImage:[UIImage imageNamed:@"error@2x.png"] forState:UIControlStateNormal];
    errorNoteBuuton.hidden=YES;
    [self.note addSubview:errorNoteBuuton];
    
    
    
    
    
        
    UILabel *imageHeader = [[UILabel alloc]initWithFrame:CGRectMake(40, CGRectGetMaxY(self.note.frame)+20, self.view.frame.size.width-80, 30)];
    imageHeader.text = @"Upload Visiting Card Here";
    imageHeader.textColor = [UIColor greenColor];
    [self.cardDetailScroll addSubview:imageHeader];
    
    self.cardImage = [[UIImageView alloc]initWithFrame:CGRectMake(40, CGRectGetMaxY(imageHeader.frame)+20, self.view.frame.size.width-180, (self.view.frame.size.width-140)/2)];
    self.cardImage.backgroundColor = [UIColor brownColor];
    [self.cardDetailScroll addSubview:self.cardImage];
    
    self.cameraButton = [[UIButton alloc]initWithFrame:CGRectMake(self.view.frame.size.width-130, CGRectGetMidY(self.cardImage.frame)-20, 40, 40)];
    [self.cameraButton setImage:[UIImage imageNamed:@"cam.png"] forState:UIControlStateNormal];
    self.cameraButton.backgroundColor = [UIColor clearColor];
    [self.cameraButton addTarget:self action:@selector(showCamera) forControlEvents:UIControlEventTouchUpInside];
    [self.cardDetailScroll addSubview:self.cameraButton];
    
    self.albumButton = [[UIButton alloc]initWithFrame:CGRectMake(self.view.frame.size.width-80, CGRectGetMidY(self.cardImage.frame)-20, 40, 40)];
    self.albumButton.backgroundColor = [UIColor clearColor];
    [self.albumButton setImage:[UIImage imageNamed:@"gallery.png"] forState:UIControlStateNormal];
    [self.albumButton addTarget:self action:@selector(showAlbum) forControlEvents:UIControlEventTouchUpInside];
    [self.cardDetailScroll addSubview:self.albumButton];
    
    
    
    
    
    
    
    
    
    self.addToCardButton = [[UIButton alloc]initWithFrame:CGRectMake(40, CGRectGetMaxY(self.cardImage.frame)+20, self.view.frame.size.width-80, 50)];
    [self.addToCardButton setTitle:@"Add To Cards" forState:UIControlStateNormal];
    self.addToCardButton.backgroundColor = [UIColor colorWithHexString:@"#1791CC"];
    [self.addToCardButton addTarget:self action:@selector(addToCardPressed) forControlEvents:UIControlEventTouchUpInside];
    [self.cardDetailScroll addSubview:self.addToCardButton];
    
    self.cardImage.image=[UIImage imageNamed:@"ahex.png"];
    
    self.cardDetailScroll.contentSize = CGSizeMake(0, CGRectGetMaxY(self.addToCardButton.frame)+100);
    
    _picker = [[UIImagePickerController alloc] init];
    _picker.delegate = self;
    _picker.allowsEditing = YES;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyboard)];
    
    [self.view addGestureRecognizer:tap];
    
    self.name.title.delegate = self;
    self.email.title.delegate = self;
    self.company.title.delegate = self;
    self.phone.title.delegate = self;
    self.note.title.delegate = self;
    self.designation.title.delegate = self;
    self.date.title.delegate = self;
    
    nameFilter.hidden = YES;
    companyFilter.hidden = YES;
    dateFilter.hidden = YES;
    designationFilter.hidden = YES;
    emailFilter.hidden = YES;
    phoneFilter.hidden = YES;
    noteFilter.hidden = YES;
}

-(void)dismissKeyboard
{
    [self.name.title resignFirstResponder];
    [self.email.title resignFirstResponder];
    [self.company.title resignFirstResponder];
    [self.phone.title resignFirstResponder];
    [self.note.title resignFirstResponder];
    [self.designation.title resignFirstResponder];
    [self.date.title resignFirstResponder];
    
}

-(void)showCamera
{
    _picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    [self presentViewController:_picker animated:YES completion:nil];
}

-(void)showAlbum
{
    _picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    [self presentViewController:_picker animated:YES completion:nil];
}
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
    self.cardImage.image = chosenImage;
    
    [picker dismissViewControllerAnimated:YES completion:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





-(void)addToCardPressed
{
    
if (([self.name.title.text  isEqualToString:@""])||([self.company.title.text isEqualToString:@""])||([self.designation.title.text isEqualToString:@""])||([self.email.title.text isEqualToString:@""])||([self.phone.title.text isEqualToString:@""])||([self.date.title.text isEqualToString:@""])||([self.note.title.text isEqualToString:@""]))
    {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Sending Failed " message:@"Fields Cannot be Empty" delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil,nil];
        
        [alert show];
        

   }
        
    else
    {
    
    
        AppDelegate  *appdelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
        
        
        User *newUser = [NSEntityDescription insertNewObjectForEntityForName:@"User"
                                                      inManagedObjectContext:appdelegate.managedObjectContext];
        newUser.byname = self.name.title.text;
        newUser.byphone=self.phone.title.text;
        newUser.bycompany =self.company.title.text;
        newUser.bydate=self.date.title.text;
        newUser.bydesignation=self.designation.title.text;
        newUser.byemail=self.email.title.text;
        newUser.bynote=self.note.title.text;
        
      //  NSData *dataImage = UIImageJPEGRepresentation(SaveImage, 0.0);

        NSData *dataImage = UIImageJPEGRepresentation(self.cardImage.image, 0.0);
        newUser.userimage=dataImage;
        
        
        [self goHome];
        
        NSError *error;
        if (![appdelegate.managedObjectContext save:&error]) {
            NSLog(@"Whoops, couldn't save: %@", [error localizedDescription]);
        }

        
        
    }
    
    
    
}





-(void)goHome
{
    ViewController *homeVc = [[ViewController alloc]init];
    [self presentViewController:homeVc animated:YES completion:nil];
    
    
    if (([self.name.title.text  isEqualToString:@""])||([self.company.title.text isEqualToString:@""])||([self.designation.title.text isEqualToString:@""])||([self.email.title.text isEqualToString:@""])||([self.phone.title.text isEqualToString:@""])||([self.date.title.text isEqualToString:@""])||([self.note.title.text isEqualToString:@""]))
        
    {
        [hud show:NO];
    }
    
    else
        
    {
        hud = [[MBProgressHUD alloc] initWithView:homeVc.view];
        hud.mode = MBProgressHUDModeText;
        hud.labelText = @"Sucessfully Saved!! ...";
        [homeVc.view addSubview:hud];
        hud.margin = 10.f;
        hud.yOffset = 200.0f;
        hud.removeFromSuperViewOnHide = YES;
        [hud show:YES];
        [hud hide:YES afterDelay:3];
    }
    
    
    
    

    
            

   }








-(void)goAddVc
{
    AddNewCardViewController *addVc = [[AddNewCardViewController alloc]init];
    [self presentViewController:addVc animated:YES completion:nil];
    
}
-(void)goShowVc
{
//    AllCardViewController *allCardVc = [[AllCardViewController alloc]init];
//    
//    [self presentViewController:allCardVc animated:YES completion:nil];
    
    NSArray *array_user=[self getRecords];
    AllCardViewController *allCardVc = [[AllCardViewController alloc]init];
    allCardVc.datarray = array_user;
    [self presentViewController:allCardVc animated:YES completion:nil];
}

-(NSArray*)getRecords
{
    // initializing NSFetchRequest
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
     AppDelegate  *delegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];

    
    //Setting Entity to be Queried
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"User"
                                              inManagedObjectContext:delegate.managedObjectContext];
    [fetchRequest setEntity:entity];
    NSError* error;
    
    // Query on managedObjectContext With Generated fetchRequest
    NSArray *fetchedRecords = [delegate.managedObjectContext executeFetchRequest:fetchRequest error:&error];
    
    
    // Returning Fetched Records
    return fetchedRecords;
}




-(void)moveViewUpWithKeyboard:(BOOL)bMovedUp
{
    
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.4];
    
    CGRect rect = self.view.frame;
    if (bMovedUp) {
        if (self.view.frame.origin.y==0) {
            
            rect.origin.y -= k_KEYBOARD_OFFSET;
            rect.size.height += k_KEYBOARD_OFFSET;
        }
    } else {
        
        if (self.view.frame.origin.y<0) {
            rect.origin.y += k_KEYBOARD_OFFSET;
            rect.size.height -= k_KEYBOARD_OFFSET;
        }
        
    }
    
    
    self.view.frame = rect;
    
    [UIView commitAnimations];
    
}




- (void)textFieldDidBeginEditing:(UITextField *)textField{
    

    
    if (self.phone.title == textField)
    {
    
        self.phone.title.keyboardType=UIKeyboardTypeNumberPad;
    
    
    }
    if (self.email.title == textField)
    {
        
        self.phone.title.keyboardType=UIKeyboardTypeEmailAddress;
        
        
    }
    
    
    if (self.date.title == textField)
    {
        [self.date.title changeInputViewAsDatePickerView];   //sri
        
//        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"\n\n\n\n\n\n\n\n\n" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
//        picker1 = [[UIDatePicker alloc] init];
//        [picker1 setDatePickerMode:UIDatePickerModeDate];
//        [alertController.view addSubview:picker1];
//        [alertController addAction:({
//            UIAlertAction *action = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
//                [picker1 addTarget:self action:@selector(updateDatePickerLabel) forControlEvents:UIControlEventValueChanged];
//                //NSLog(@"Picker date is %@",picker.date);
//                [self updateDatePickerLabel];
//            }];
//            action;
//        })];
//        UIPopoverPresentationController *popoverController = alertController.popoverPresentationController;
//        popoverController.sourceView = self.view;
//        popoverController.sourceRect = [textField bounds];
//        [self presentViewController:alertController  animated:YES completion:nil];
    
        
    }
    else
    {
        if  (self.view.frame.origin.y >= 0)
        {
            if (self.email.title == textField || self.phone.title == textField || self.note.title == textField)
            {
                [self moveViewUpWithKeyboard:YES];
            }
        }
    }
   
    
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    
    [textField resignFirstResponder];
    
    return YES;
    
    

}

- (void)updateDatePickerLabel
{
    NSDateFormatter  *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"DD-MM-YYYY"];
    NSString *str=[NSString stringWithFormat:@"%@",[dateFormatter  stringFromDate:picker1.date]];
    
    self.date.title.text = str;
    
   
    
}


- (void)textFieldDidEndEditing:(UITextField *)textField
{
    [self moveViewUpWithKeyboard:NO];
    
    switch (textField.tag)
    {
        case 1:
            if ([textField.text length]>=1)
            {
                nameFilter.hidden = YES;
                errornameButton.hidden=YES;
            }
            else
            {
                nameFilter.hidden = NO;
                errornameButton.hidden=NO;
            
            }
            break;
        case 2:
            if ([textField.text length]>=1)
            {
                companyFilter.hidden = YES;
                errorCompmayButton.hidden=YES;
            }
            else
            {
                companyFilter.hidden = NO;
                errorCompmayButton.hidden=NO;
            }
            break;
        case 3:
            if ([textField.text length]>=1)
            {
                dateFilter.hidden = YES;
                errorDateButton.hidden=YES;
            }
            else
            {
                dateFilter.hidden = NO;
                errorDateButton.hidden=NO;
            }
            break;
        case 4:
            if ([textField.text length]>=1)
            {
                designationFilter.hidden = YES;
                errorDesignation.hidden=YES;
            }
            else
            {
                designationFilter.hidden = NO;
                errorDesignation.hidden=NO;
            }
            break;
        case 5:
            if ([textField.text length]>=1)
            {
                emailFilter.hidden = YES;
                errorEmailButton.hidden=YES;
            }
            else
            {
                emailFilter.hidden = NO;
                errorEmailButton.hidden=NO;
            }
            break;
        case 6:
            if ([textField.text length]>=1)
            {
                phoneFilter.hidden = YES;
                errorPhoneButton.hidden=YES;
            }
            else
            {
                phoneFilter.hidden = NO;
                errorPhoneButton.hidden=NO;
            }
            break;
        case 7:
            if ([textField.text length]>=1)
            {
                noteFilter.hidden = YES;
                errorNoteBuuton.hidden=YES;
            }
            else
            {
                noteFilter.hidden = NO;
                errorNoteBuuton.hidden=NO;
            }
            break;
            
        default:
            break;
    }

}



@end
