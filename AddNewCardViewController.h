//
//  AddNewCardViewController.h
//  CardeHolder
//
//  Created by ahex-mac on 04/01/16.
//  Copyright © 2016 AhexTechnologies. All rights reserved.
//







#import <UIKit/UIKit.h>
#import "Header.h"
#import "ViewController.h"
#import "AllCardViewController.h"
#import "ImageTextField.h"
#import "User.h"
#import "AppDelegate.h"



#define k_KEYBOARD_OFFSET 200

@interface AddNewCardViewController : UIViewController <HeaderDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate,UITextFieldDelegate>


@property (strong, nonatomic) UIImagePickerController *picker;


@property (strong, nonatomic) ImageTextField *name;
@property (strong, nonatomic) ImageTextField *company;
@property (strong, nonatomic) ImageTextField *email;
@property (strong, nonatomic) ImageTextField *phone;
@property (strong, nonatomic) ImageTextField *note;
@property (strong, nonatomic) ImageTextField *date;
@property (strong, nonatomic) ImageTextField *designation;


@property (strong, nonatomic) UIImageView *cardImage;
@property (strong, nonatomic) UIButton *cameraButton;
@property (strong, nonatomic) UIButton *albumButton;

@property (strong, nonatomic) UIButton *addToCardButton;

@property (strong, nonatomic) UIScrollView *cardDetailScroll;
@end
