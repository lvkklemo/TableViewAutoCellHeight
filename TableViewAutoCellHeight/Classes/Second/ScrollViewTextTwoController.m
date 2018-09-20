//
//  ScrollViewTextTwoController.m
//  TableViewAutoCellHeight
//
//  Created by 宇航 on 2018/9/20.
//  Copyright © 2018年 HWD. All rights reserved.
//

#import "ScrollViewTextTwoController.h"
//#import "NSDictionary+NilSafe.h"

@interface ScrollViewTextTwoController ()
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *scrollHConstrain;

@end

@implementation ScrollViewTextTwoController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.scrollHConstrain.constant = 1000;
    
//    https://www.jianshu.com/p/d5499c7b0807
    NSMutableDictionary *dict =[NSMutableDictionary dictionary];
    [dict setObject:nil forKey:nil];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
