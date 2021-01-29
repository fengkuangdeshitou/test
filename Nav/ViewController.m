//
//  ViewController.m
//  Nav
//
//  Created by maiyou on 2020/11/28.
//

#import "ViewController.h"
#import "MainViewController.h"
#import "Nav-Swift.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)UITableView * tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

//    self.navigationItem.searchController = [[UISearchController alloc] initWithSearchResultsController:nil];
    [UIScrollView appearance].contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    [self.view addSubview:self.tableView];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    self.navigationItem.title = @"标题";
//    self.navigationController.hidesBarsOnSwipe = YES;
//    self.navigationController.hidesBarsOnTap = YES;
//    self.navigationController.hidesBarsWhenVerticallyCompact = YES;
    

    
#ifdef Nav
    #if NavDeveloper
        NSLog(@"tager:Nav-----developer");
    #elif NavDebug
        NSLog(@"tager:Nav-----Debug");
    #elif AppStore
        NSLog(@"tager:Nav------AppStore");
    #else
        NSLog(@"tager:Nav-----Release");
    #endif
#elif NewNav
    #if NewNavDeveloper
        NSLog(@"tager:NewNav-----developer");
    #elif NewNavDebug
        NSLog(@"tager:NewNav-----Debug");
    #else
        NSLog(@"tager:NewNav-----Release");
    #endif
#elif Talk
    #if TalkDeveloper
        NSLog(@"tager:Talk-----developer");
    #elif TalkDebug
        NSLog(@"tager:Talk-----Debug");
    #else
        NSLog(@"tager:Talk-----Release");
    #endif
#else
    #if AAppDeveloper
        NSLog(@"tager:AApp-----developer");
    #elif AAppDebug
        NSLog(@"tager:AApp-----Debug");
    #else
        NSLog(@"tager:AApp-----Release");
    #endif
#endif
    
}

- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleInsetGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * cellIdentify = @"cell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentify forIndexPath:indexPath];
    cell.textLabel.text = [NSString stringWithFormat:@"%ld-%@",indexPath.section,NSLocalizedStringFromTable(@"Done", @"Localizable1111", @"完成")];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    PersonViewController * person = [[PersonViewController alloc] init];
    person.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:person animated:YES];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 10;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 188;
}

@end
