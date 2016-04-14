//
//  AllCardViewController.h
//  CardeHolder
//
//  Created by ahex-mac on 04/01/16.
//  Copyright © 2016 AhexTechnologies. All rights reserved.
//





#import <UIKit/UIKit.h>
#import "Header.h"
#import "AllCardViewController.h"
#import "ViewController.h"
#import "UIColor+Hexadecimal.h"

@interface AllCardViewController : UIViewController <HeaderDelegate>

@property (strong, nonatomic) UIScrollView *cardScroll;
@property (strong, nonatomic) NSArray *datarray;
-(void)createCard:(NSArray*)data;
@end
