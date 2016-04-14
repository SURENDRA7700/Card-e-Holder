//
//  User.h
//  Card-e-Holder
//
//  Created by ahex-mac on 29/02/16.
//  Copyright © 2016 Ahextechnologies. All rights reserved.
//

#import <CoreData/CoreData.h>

@interface User : NSManagedObject

@property (nonatomic, retain) NSString * byname;
@property (nonatomic, retain) NSString * bycompany;
@property (nonatomic, retain) NSString * bydate;
@property (nonatomic, retain) NSString * bydesignation;
@property (nonatomic, retain) NSString * byemail;
@property (nonatomic, retain) NSString * byphone;
@property (nonatomic, retain) NSString * bynote;
@property (nonatomic, retain) NSData   * userimage;






@end
