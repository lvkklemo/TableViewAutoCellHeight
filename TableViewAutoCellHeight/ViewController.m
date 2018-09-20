//
//  ViewController.m
//  TableViewAutoCellHeight
//
//  Created by 宇航 on 2018/9/20.
//  Copyright © 2018年 HWD. All rights reserved.
//

#import "ViewController.h"
#import "AutoCellFirstController.h"

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

@end
