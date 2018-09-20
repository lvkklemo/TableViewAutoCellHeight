//
//  ScrollViewTextController.m
//  TableViewAutoCellHeight
//
//  Created by 宇航 on 2018/9/20.
//  Copyright © 2018年 HWD. All rights reserved.
//

#import "ScrollViewTextController.h"
#import "Masonry.h"
#import "HWEditNumberView.h"

@interface ScrollViewTextController ()<HQMPhoneNumberViewDelegate>
@property(nonatomic,weak)UIScrollView*scrollView;
@property(nonatomic,weak)UIView*contentView;
@property(nonatomic,weak)UIButton*addNumButton;
@property(nonatomic,assign)NSInteger i;
//最后一个联系信息视图
@property(nonatomic,strong)HWEditNumberView*lastPhoneView;
//联系人数组
@property(nonatomic,strong)NSMutableArray*contactArray;
@end

@implementation ScrollViewTextController

- (NSMutableArray *)contactArray{
    if (!_contactArray) {
        _contactArray=[NSMutableArray array];
    }
    return _contactArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //self.navigationController.navigationBar.translucent=NO;
    [self setUPUI];
}

- (void)setUPUI{
    
    UIScrollView*scrollView=[[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, OB_SCREEN_WIDTH, OB_SCREEN_HEIGHT)];
    scrollView.backgroundColor=[UIColor groupTableViewBackgroundColor];
    _scrollView=scrollView;
    [self.view addSubview:scrollView];
    
    UIView *containerView = [[UIView alloc]init];
    [scrollView addSubview:containerView];
    
    UIView*headerView=[[UIView alloc] init];
    headerView.backgroundColor=[UIColor orangeColor];
    [containerView addSubview:headerView];
    
    UIView*contentView=[[UIView alloc] init];
    contentView.backgroundColor=[UIColor lightGrayColor];
    [containerView addSubview:contentView];
    _contentView=contentView;
    
    UIView*footerView=[[UIView alloc] init];
    footerView.backgroundColor=[UIColor lightGrayColor];
    [containerView addSubview:footerView];
    /*添加约束*/
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    [containerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(scrollView);
        make.width.equalTo(scrollView);
    }];
    /*headerView*/
    [headerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(containerView);
        make.left.mas_equalTo(0);
        make.height.mas_equalTo(100);
        make.width.mas_equalTo(OB_SCREEN_WIDTH);
    }];
    
    /*contentView*/
    [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(headerView.mas_bottom).offset(12);
        make.left.mas_equalTo(0);
        make.height.mas_equalTo(300);
        make.width.mas_equalTo(OB_SCREEN_WIDTH);
    }];
    
    /*footerView*/
    [footerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(contentView.mas_bottom).offset(12);
        make.left.mas_equalTo(0);
        make.height.mas_equalTo(300);
        make.width.mas_equalTo(OB_SCREEN_WIDTH);
    }];
    
    // 设置过渡视图的底边距（此设置将影响到scrollView的contentSize）
    [containerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(footerView.mas_bottom);
    }];
    
    //添加联系方式
    UIButton * addPhoneNumButton = [[UIButton alloc] init];
    [addPhoneNumButton setTitle:@"添加联系方式" forState:UIControlStateNormal];
    [contentView addSubview:addPhoneNumButton];
    addPhoneNumButton.backgroundColor=[UIColor blueColor];
    addPhoneNumButton.titleLabel.font=[UIFont systemFontOfSize:13];
    addPhoneNumButton.layer.cornerRadius=15;
    addPhoneNumButton.layer.masksToBounds=YES;
    [addPhoneNumButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(16);
        make.top.mas_equalTo(10);
        make.size.mas_equalTo(CGSizeMake(90, 30));
    }];
    [addPhoneNumButton addTarget:self action:@selector(addPhoneNumButtonDidClick) forControlEvents:UIControlEventTouchUpInside];
    _addNumButton=addPhoneNumButton;
    
}

/*添加按钮*/
- (void)addPhoneNumButtonDidClick{
    
    self.i++;
    
    HWEditNumberView*phoneView=[[HWEditNumberView alloc] initWithTitleName:@"手机号码"];
    HQMContactTypeModel*contactModel=[[HQMContactTypeModel alloc] init];
    contactModel.contactType=@"1";
    [self.contactArray addObject:contactModel];
    phoneView.contactModel=contactModel;
    phoneView.delegate=self;
    [_contentView addSubview:phoneView];
    if (self.lastPhoneView==nil) {
        [phoneView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.equalTo(self.contentView);
            make.height.mas_equalTo(@48);
        }];
    }else{
        [phoneView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(self.contentView);
            make.top.equalTo(self.lastPhoneView.mas_bottom);
            make.height.mas_equalTo(@48);
        }];
    }
    self.lastPhoneView=phoneView;
    
    [self updateContentViewAndAddButtonPosition];
}

#pragma mark - HQMPhoneNumberViewDelegate 删除按钮
- (void)phoneNumberViewdidSelectedDeleteAction:(HWEditNumberView *)phoneView
{
    self.i--;
    phoneView.hidden = YES;
    [phoneView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@0);
    }];
   
    ///删除数据
    if ([self.contactArray containsObject:phoneView.contactModel]) {
        [self.contactArray removeObject:phoneView.contactModel];
    }
    
    [self updateContentViewAndAddButtonPosition];
}

- (void)updateContentViewAndAddButtonPosition{
    
    [UIView animateWithDuration:0.3 animations:^{
        [_contentView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(300 + self.i*48);
        }];
        [_addNumButton mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(10 + self.i*48);
        }];
        
        [self.view updateConstraintsIfNeeded];
        [self.view layoutIfNeeded];
    }];
    
}


//*********************************************************************/
#pragma mark 垂直方向
- (void)verticalScrollviewView{
    
    UIScrollView *verticalScrollView = [[UIScrollView alloc]init];
    verticalScrollView.backgroundColor = [UIColor greenColor];
    verticalScrollView.pagingEnabled =YES;
    // 添加scrollView添加到父视图，并设置其约束
    [self.view addSubview:verticalScrollView];
    [verticalScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.bottom.and.right.mas_equalTo(-10.0);
        make.height.mas_equalTo(100);
    }];
    // 设置scrollView的子视图，即过渡视图contentSize，并设置其约束
    UIView *verticalContainerView = [[UIView alloc]init];
    [verticalScrollView addSubview:verticalContainerView];
    [verticalContainerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.bottom.and.right.equalTo(verticalScrollView).with.insets(UIEdgeInsetsZero);
        make.width.equalTo(verticalScrollView);
    }];
    //过渡视图添加子视图
    UIView *lastView =nil;
    for (NSInteger index =0; index <10; index++)
    {
        UILabel *label = [[UILabel alloc]init];
        label.textAlignment =NSTextAlignmentCenter;
        label.backgroundColor = [UIColor colorWithHue:(arc4random() %256 / 256.0)
                                          saturation:(arc4random() %128 /256.0) +0.5
                                          brightness:(arc4random() %128 /256.0) +0.5
                                               alpha:1];
        label.text = [NSString stringWithFormat:@"第 %ld个视图", index];
        
        
        //添加到父视图，并设置过渡视图中子视图的约束
        [verticalContainerView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.and.right.equalTo(verticalContainerView);
            make.height.mas_equalTo(verticalScrollView.mas_height);
            
            if (lastView)
            {
                make.top.mas_equalTo(lastView.mas_bottom);
            }
            else
            {
                make.top.mas_equalTo(0);
            }
        }];
        
        lastView = label;
    }
    
    // 设置过渡视图的底边距（此设置将影响到scrollView的contentSize）
    [verticalContainerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(lastView.mas_bottom);
    }];
}

#pragma mark 水平方向
- (void)horizontalScrollView{
    UIScrollView *horizontalScrollView = [[UIScrollView alloc]init];
    horizontalScrollView.backgroundColor = [UIColor orangeColor];
    horizontalScrollView.pagingEnabled =YES;
    // 添加scrollView添加到父视图，并设置其约束
    [self.view addSubview:horizontalScrollView];
    [horizontalScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(80);
        make.left.mas_equalTo(10);
        make.right.mas_equalTo(-10);
        make.height.mas_equalTo(100);
    }];
    // 设置scrollView的子视图，即过渡视图contentSize，并设置其约束
    UIView *horizontalContainerView = [[UIView alloc]init];
    [horizontalScrollView addSubview:horizontalContainerView];
    [horizontalContainerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(horizontalScrollView);
        make.height.equalTo(horizontalScrollView);
    }];
    //过渡视图添加子视图
    UIView *previousView =nil;
    for (int i =0; i <10; i++)
    {
        UILabel *label = [[UILabel alloc]init];
        label.textAlignment =NSTextAlignmentCenter;
        label.backgroundColor = [UIColor colorWithHue:(arc4random() %256 / 256.0)
                                          saturation:(arc4random() %128 /256.0) +0.5
                                          brightness:(arc4random() %128 /256.0) +0.5
                                               alpha:1];
        label.text = [NSString stringWithFormat:@"第 %d个视图", i];
        
        //添加到父视图，并设置过渡视图中子视图的约束
        [horizontalContainerView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.and.bottom.equalTo(horizontalContainerView);
            make.width.equalTo(horizontalScrollView);
            
            if (previousView)
            {
                make.left.mas_equalTo(previousView.mas_right);
            }
            else
            {
                make.left.mas_equalTo(0);
            }
        }];
        previousView = label;
    }
    // 设置过渡视图的右距（此设置将影响到scrollView的contentSize）
    [horizontalContainerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(previousView.mas_right);
    }];
}
//*********************************************************************/

@end
