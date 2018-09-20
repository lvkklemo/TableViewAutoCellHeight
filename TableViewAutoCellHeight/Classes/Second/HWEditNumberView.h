//
//  HWEditNumberView.h
//  TableViewAutoCellHeight
//
//  Created by 宇航 on 2018/9/20.
//  Copyright © 2018年 HWD. All rights reserved.
//

//#import <UIKit/UIKit.h>
//
//@interface HWEditNumberView : UIView
//
//@end

#import <UIKit/UIKit.h>
#import "HWEditNumberModel.h"
@class HWEditNumberView;
@protocol HQMPhoneNumberViewDelegate<NSObject>
@optional;
///点击删除按钮
- (void)phoneNumberViewdidSelectedDeleteAction:(HWEditNumberView *)phoneNumberView;
///点击修改联系方式类型
- (void)phoneNumberViewdidSelectedChangeContactType:(HWEditNumberView *)phoneNumberView;
@end
///添加手机号码视图
@interface HWEditNumberView : UIView
@property (nonatomic, strong) UITextField *textFiled;
@property (nonatomic, copy) NSString *titleStr;
- (instancetype)initWithTitleName:(NSString *)titleName;
@property (nonatomic, assign) id<HQMPhoneNumberViewDelegate> delegate;
@property (nonatomic, strong) HQMContactTypeModel *contactModel;
@end
