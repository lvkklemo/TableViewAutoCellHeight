//
//  HWEditNumberView.m
//  TableViewAutoCellHeight
//
//  Created by 宇航 on 2018/9/20.
//  Copyright © 2018年 HWD. All rights reserved.
//

#import "HWEditNumberView.h"
#import "Masonry.h"
#import "UIColor+RCColor.h"

@interface HWEditNumberView()<UITextFieldDelegate>
@property (nonatomic, strong) UIButton *titleButton;
@property (nonatomic, strong) UIButton *delButton;
@property (nonatomic, strong) UIView *bottomLine;
@property (nonatomic, strong) UIView *grayView;
///联系类型
@property (nonatomic, copy) NSArray *contactTypes;
@end
@implementation HWEditNumberView

- (instancetype)initWithTitleName:(NSString *)titleName
{
    if (self = [super init]) {
        self.titleStr = titleName;
        self.backgroundColor = [UIColor whiteColor];
        self.contactTypes = @[@"手机号码",@"父母手机",@"固定电话",@"国外号码",@"微信号码"];
        [self initViewWithName:titleName];
    }
    return self;
}
- (void)initViewWithName:(NSString *)titleName
{
    UIButton *delButton = [[UIButton alloc]init];
    [delButton setImage:[UIImage imageNamed:@"delBtn"] forState:UIControlStateNormal];
    [delButton addTarget:self action:@selector(delAction:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:delButton];
    self.delButton = delButton;
    ///选择按钮
    UIButton *titleButton = [[UIButton alloc]init];
    self.titleButton = titleButton;
    [titleButton setTitle:@"手机号码" forState:UIControlStateNormal];
    titleButton.titleLabel.font = [UIFont systemFontOfSize:16];
    [titleButton setTitleColor:[UIColor colorWithHexString:@"#333333" alpha:1.0] forState:UIControlStateNormal];
    [titleButton addTarget:self action:@selector(titleButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [titleButton setImage:[UIImage imageNamed:@"down"] forState:UIControlStateNormal];
    [titleButton setImageEdgeInsets:UIEdgeInsetsMake(0, 70, 0, 0)];
    [titleButton setTitleEdgeInsets:UIEdgeInsetsMake(0, -15, 0, 20)];
    [self addSubview:titleButton];
    ///灰线
    UIView *grayView = [[UIView alloc]init];
    grayView.backgroundColor = [UIColor colorWithHexString:@"#CCCCCC" alpha:1.0];
    self.grayView = grayView;
    [self addSubview:grayView];
    UITextField *textFiled = [[UITextField alloc]init];
    textFiled.textColor = [UIColor colorWithHexString:@"#3B75D4" alpha:1.0];
    textFiled.textAlignment = NSTextAlignmentLeft;
    textFiled.placeholder = @"请输入";
    textFiled.font = [UIFont systemFontOfSize:16];
    textFiled.keyboardType = UIKeyboardTypeNumberPad;
    [self addSubview:textFiled];
    self.textFiled = textFiled;
    self.textFiled.delegate = self;
    
    //    self.textFiled.backgroundColor = [UIColor redColor];
    UIView *line = [[UIView alloc]init];
    line.backgroundColor = [UIColor colorWithHexString:@"#F0f0f0" alpha:1.0];
    [self addSubview:line];
    self.bottomLine = line;
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    [self.delButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(10);
        make.width.height.equalTo(@30);
        make.centerY.equalTo(self);
    }];
    [self.titleButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_delButton.mas_right).offset(5);
        make.centerY.equalTo(self);
        make.width.equalTo(@86);
    }];
    [self.grayView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_titleButton.mas_right).offset(5);
        make.centerY.equalTo(self);
        make.width.equalTo(@1);
        make.height.equalTo(@24);
    }];
    [self.textFiled mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_grayView.mas_right).offset(10);
        make.right.equalTo(self).offset(-15);
        make.centerY.equalTo(self);
    }];
    [self.bottomLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self).offset(-15);
        make.bottom.equalTo(self);
        make.height.equalTo(@0.5);
    }];
    
    
}
- (void)titleButtonAction:(UIButton *)btn
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(phoneNumberViewdidSelectedChangeContactType:)]) {
        [self.delegate phoneNumberViewdidSelectedChangeContactType:self];
    }
}
- (void)delAction:(UIButton *)btn
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(phoneNumberViewdidSelectedDeleteAction:)]) {
        [self.delegate phoneNumberViewdidSelectedDeleteAction:self];
    }
}
- (void)setTitleStr:(NSString *)titleStr
{
    _titleStr = titleStr;
    [self.titleButton setTitle:_titleStr forState:UIControlStateNormal];
}
@end
