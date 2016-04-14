//
//  ImageTextField.m
//  Card-e-Holder
//
//  Created by ahex-mac on 29/02/16.
//  Copyright © 2016 Ahextechnologies. All rights reserved.
//

#import "ImageTextField.h"

@implementation ImageTextField

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.background = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        [self addSubview:self.background];
        
        self.title = [[UITextField alloc]initWithFrame:CGRectMake(self.frame.size.width/5, 0, self.frame.size.width-self.frame.size.width/5, self.frame.size.height)];
        [self addSubview:self.title];
    }
    return self;
}

@end
