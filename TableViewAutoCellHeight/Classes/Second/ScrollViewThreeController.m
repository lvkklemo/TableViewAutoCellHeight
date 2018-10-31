//
//  ScrollViewThreeController.m
//  TableViewAutoCellHeight
//
//  Created by 宇航 on 2018/9/21.
//  Copyright © 2018年 HWD. All rights reserved.
//

#import "ScrollViewThreeController.h"

@interface ScrollViewThreeController ()

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *scrollBottonConstraint;

@end

@implementation ScrollViewThreeController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.scrollBottonConstraint.constant = 900;

}
- (IBAction)tapAction:(id)sender {
    
}

@end
