//
//  ViewController.m
//  TableViewAutoCellHeight
//
//  Created by 宇航 on 2018/9/20.
//  Copyright © 2018年 HWD. All rights reserved.
//

#import "ViewController.h"
#import "AutoCellFirstController.h"
#import "ScrollViewTextController.h"
#import "ScrollViewTextTwoController.h"
#import "KScrollViewController.h"
#import "ScrollViewThreeController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)hqAutoCellDirstDidClick:(id)sender {
    AutoCellFirstController*vc=[[AutoCellFirstController alloc] init];
    vc.title=@"cell";
    vc.view.backgroundColor=[UIColor whiteColor];
    [self.navigationController pushViewController:vc animated:YES];
}
- (IBAction)hqScrollViewTextDidClick:(id)sender {
    ScrollViewTextController*vc=[[ScrollViewTextController alloc] init];
    vc.title=@"scrollView约束";
    vc.view.backgroundColor=[UIColor whiteColor];
    [self.navigationController pushViewController:vc animated:YES];
}
- (IBAction)hqScrollViewXibDidClick:(id)sender {
    ScrollViewTextTwoController*vc=[[ScrollViewTextTwoController alloc] init];
    vc.title=@"scrollView约束(xib)";
    vc.view.backgroundColor=[UIColor whiteColor];
    [self.navigationController pushViewController:vc animated:YES];
}
- (IBAction)hqScrollView2XibDidClick:(id)sender {
    KScrollViewController*vc=[[KScrollViewController alloc] init];
    vc.title=@"scrollView约束2(xib)";
    vc.view.backgroundColor=[UIColor whiteColor];
    [self.navigationController pushViewController:vc animated:YES];
}
- (IBAction)hqScrollView3DidClick:(id)sender {
    ScrollViewThreeController*vc=[[ScrollViewThreeController alloc] init];
    vc.title=@"scrollView约束3(xib)";
    vc.view.backgroundColor=[UIColor whiteColor];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
