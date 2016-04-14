
//
//  TextFieldFilter.h
//  CardeHolder
//
//  Created by ahex-mac on 04/01/16.
//  Copyright © 2016 AhexTechnologies. All rights reserved.
//


#import "TextFieldFilter.h"

@implementation TextFieldFilter
@synthesize title,popUpPointer;
- (id)initWithFrame:(CGRect)frame menuItems:(NSString *)aPopUpName
{
    self = [super initWithFrame:frame];
    
    if (self)
    {
        CGFloat f = self.frame.size.width/10;
        popUpPointer = [[UIView alloc]initWithFrame:CGRectMake(self.frame.size.width-(f+10),-f/3, f, f)];
        popUpPointer.backgroundColor = [UIColor redColor];
        [self addSubview:popUpPointer];
        popUpPointer.transform=CGAffineTransformMakeRotation(M_PI / 4);
        
        
        title = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        title.text = aPopUpName;
        title.textColor = [UIColor whiteColor];
        title.backgroundColor = [UIColor redColor];
        [self addSubview:title];
    }
    
    return self;
}

-(void)setBackgroundColor:(UIColor *)backgroundColor
{
    self.backgroundColor = backgroundColor;
    self.title.backgroundColor = backgroundColor;
}

-(void)setTitleColor:(UIColor*)textColor
{
    self.title.textColor = textColor;
}
-(void)setPointerColor:(UIColor*)pointerColor
{
    popUpPointer.backgroundColor = pointerColor;
}
@end
