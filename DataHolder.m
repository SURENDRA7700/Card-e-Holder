//
//  DataHolder.m
//  Card-e-Holder
//
//  Created by ahex-mac on 29/02/16.
//  Copyright © 2016 Ahextechnologies. All rights reserved.
//

#import "DataHolder.h"

@implementation DataHolder

-(instancetype)init

{
    self=[super init];
    if (self)
    {
        self.type = [[NSString alloc]init];
    }
    return self;
}

@end