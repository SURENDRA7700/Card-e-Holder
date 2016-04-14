//
//  Header.m
//  Card-e-Holder
//
//  Created by ahex-mac on 29/02/16.
//  Copyright © 2016 Ahextechnologies. All rights reserved.
//

#import "Header.h"

@implementation Header

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        UIImageView *headerIcon = [[UIImageView alloc]initWithFrame:CGRectMake(10, 15, self.frame.size.height-30, self.frame.size.height-30)];
        headerIcon.image=[UIImage imageNamed:@"header.png"];
        headerIcon.backgroundColor = [UIColor clearColor];
        [self addSubview:headerIcon];
        
        UILabel *heading = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(headerIcon.frame)+10, 10, self.frame.size.width, self.frame.size.height-20)];
        heading.text = @"Card-E-Holder";
        heading.textColor = [UIColor whiteColor];
        [self addSubview:heading];
        
        UIButton *home = [[UIButton alloc]initWithFrame:CGRectMake(self.frame.size.width-((self.frame.size.height-30)*3+30), 15, self.frame.size.height-30, self.frame.size.height-30)];
        home.backgroundColor = [UIColor clearColor];
        [home addTarget:self action:@selector(homeButtonPressed) forControlEvents:UIControlEventTouchUpInside];
        [home setImage:[UIImage imageNamed:@"home_action.png"] forState:UIControlStateNormal];
        [self addSubview:home];
        
        
        UIButton *add = [[UIButton alloc]initWithFrame:CGRectMake(CGRectGetMaxX(home.frame)+10, 15, self.frame.size.height-30, self.frame.size.height-30)];
        add.backgroundColor = [UIColor clearColor];
        [add addTarget:self action:@selector(addButtonPressed) forControlEvents:UIControlEventTouchUpInside];
        [add setImage:[UIImage imageNamed:@"addcard_action.png"] forState:UIControlStateNormal];
        
        [self addSubview:add];
        
        
        UIButton *show = [[UIButton alloc]initWithFrame:CGRectMake(CGRectGetMaxX(add.frame)+10, 15, self.frame.size.height-30, self.frame.size.height-30)];
        show.backgroundColor = [UIColor clearColor];
        [show addTarget:self action:@selector(showButtonPressed) forControlEvents:UIControlEventTouchUpInside];
        [show setImage:[UIImage imageNamed:@"viewall_action.png"] forState:UIControlStateNormal];
        [self addSubview:show];
    }
    return self;
}


-(void)homeButtonPressed
{
    [_delegate goHome];
}

-(void)addButtonPressed
{
    [_delegate goAddVc];
}
-(void)showButtonPressed
{
    [_delegate goShowVc];
}


@end

