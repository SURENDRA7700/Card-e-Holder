//
//  UITextField+CustomInputViews.h
//  Card-e-Holder
//
//  Created by ahex-mac on 29/02/16.
//  Copyright © 2016 Ahextechnologies. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (CustomInputViews) <UIPickerViewDataSource,UIPickerViewDelegate,UITextFieldDelegate>
{
   
}


-(void)setFirsttag:(int)start andLastTag:(int)last ;
-(void)AddCustomToolBarAndStartTextFiledTag:(int)startTag andEndFieldTag:(int)endTag;
-(void)changeInputViewAsPickerView:(NSMutableArray *)dataArray;
-(void)changeInputViewAsDatePickerView;
// keyborad show and hide
-(void)myTextFieldDidBeginEditing:(UITextField *)textField;
-(void)myTextFieldDidEndEditing:(UITextField *)textField;
@end
