//
//  KScrollViewController.m
//  TableViewAutoCellHeight
//
//  Created by 宇航 on 2018/10/31.
//  Copyright © 2018年 HWD. All rights reserved.
//

#import "KScrollViewController.h"

@interface KScrollViewController ()
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottonConstraint;

@end

@implementation KScrollViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    //https://www.jianshu.com/p/c2f5b7bd5176
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    self.bottonConstraint.constant = 1220;
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
