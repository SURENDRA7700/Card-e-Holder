//
//  Header.h
//  Card-e-Holder
//
//  Created by ahex-mac on 29/02/16.
//  Copyright © 2016 Ahextechnologies. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol HeaderDelegate <NSObject>

-(void)goHome;
-(void)goAddVc;
-(void)goShowVc;
@end

@interface Header : UIView

@property id <HeaderDelegate> delegate;
@end