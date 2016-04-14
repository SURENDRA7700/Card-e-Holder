//
//  ViewController.h
//  CardeHolder
//
//  Created by ahex-mac on 04/01/16.
//  Copyright © 2016 AhexTechnologies. All rights reserved.
//






#import <UIKit/UIKit.h>
#import "Header.h"
#import "AddNewCardViewController.h"
#import "AllCardViewController.h"
#import "ByTypeViewController.h"
#import "DataHolder.h"
#import "UIColor+Hexadecimal.h"
#import <QuartzCore/QuartzCore.h>
@interface ViewController : UIViewController<HeaderDelegate>



@property (strong, nonatomic) UIScrollView *pageScroll;
@property (strong, nonatomic) DataHolder *modalObj;  //This is NSObject object..
@end

