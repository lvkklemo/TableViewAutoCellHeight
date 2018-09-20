//
//  AutoCellFirstController.m
//  TableViewAutoCellHeight
//
//  Created by 宇航 on 2018/9/20.
//  Copyright © 2018年 HWD. All rights reserved.
//

#import "AutoCellFirstController.h"
#import "AutoCellFirstCell.h"

@interface AutoCellFirstController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView * tableView;
//总数据修改
@property (nonatomic,strong) NSMutableArray *dataSouse;
@end

@implementation AutoCellFirstController

- (NSMutableArray *)dataSouse{
    
    if (_dataSouse == nil) {
        _dataSouse = [NSMutableArray array];
    }
    return _dataSouse;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"OC自适应高度";
    //数据
    NSArray * array = @[@"1.NBA新赛季",@"2.迈克尔-乔丹在篮球领域的成就是毋庸置疑的，而在商业联盟，乔丹也是首屈一指的天才。除了众所周知的AJ球鞋，乔丹作为夏洛特黄蜂队的大老板，市值已经翻了三四倍。而乔丹还投资了MLB球队迈阿密马林鱼队，与库班一同投资多家体育科技公司，并且投资了汽车销售店和多家餐馆",@"3.库里一哥爱IT 詹皇科比涉猎广",@"4.经历休赛期的运作，西部各队实力稳中有升，竞争将会更加残酷。但库里对勇士信心十足，他表示不会为西部目前的局势感到担忧，他们的目标就是打出顶级的表现，完成三连冠的霸业",@"",@"5.库里对勇士信心十足，他表示不会为西部目前的局势感到担忧，他们的目标就是打出顶级的表现，完成三连冠的霸业"];
    [self.dataSouse addObjectsFromArray:array];
    
    [self tableView];
}

//tableView懒加载
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0,  self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
        _tableView.delegate=self;
        _tableView.dataSource=self;
        _tableView.showsVerticalScrollIndicator=NO;
        _tableView.backgroundColor = [UIColor groupTableViewBackgroundColor];
        [self.view addSubview:_tableView];
        
        //开启自动计算高度
        //【重点】注意千万不要实现行高的代理方法，否则无效：heightForRowAt
        _tableView.rowHeight = UITableViewAutomaticDimension;
        _tableView.estimatedRowHeight = 44;
    }
    
    return _tableView;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSouse.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.01;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.01;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *identifierhot = @"cell";
    AutoCellFirstCell * cell = [tableView dequeueReusableCellWithIdentifier:identifierhot];
    if (!cell){
        cell = [[AutoCellFirstCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifierhot];
        /* 忽略点击效果 */
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    }
   cell.stringTitle = self.dataSouse[indexPath.row];
    return cell;
    
}

@end

