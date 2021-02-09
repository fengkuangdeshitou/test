//
//  ViewController.m
//  Nav
//
//  Created by maiyou on 2020/11/28.
//

#import "ViewController.h"
#import "MainViewController.h"
#import "Nav-Swift.h"
#import "Header.h"

#define log(x) printf("this is test: "#x" = %d",x)
#define text(t) NSLog(@""#t" text t is %@",t)
#define power(x) x*x
#define pow1 power(x);
#define pow2 power(x+1);

#define RGBA(r, g, b, a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define RGB(r, g, b) RGBA(r, g, b, 1.0f)
#define funcM(x) {\
log(x);\
}

#define GLOBEL_NAV_TITLE(TITLE) {\
    UILabel * label = [[UILabel alloc] init];\
    label.text = TITLE;\
    label.textColor = [UIColor whiteColor];\
    label.textAlignment = 1;\
    label.font = [UIFont systemFontOfSize:18];\
    [label sizeToFit];\
    self.navigationItem.titleView = label;\
}

static NSString * const kCellIdentifity = @"cell";

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
    GLOBEL_NAV_TITLE(@"首页");
    //    self.navigationController.hidesBarsOnSwipe = YES;
//    self.navigationController.hidesBarsOnTap = YES;
//    self.navigationController.hidesBarsWhenVerticallyCompact = YES;
    
    
    
    UIView * view = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    view.backgroundColor = RGB(130, 130, 130);
    [self.view addSubview:view];
    
//    funcM(10+1);
    
    int x = 2;
    
    NSLog(@"%d", power(x));
    
    int value1 = pow1(x);
    NSLog(@"%d",value1);
    
    int value2 = pow2(x);
    NSLog(@"%d",value2);
    
    text(@"aaa");

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
    
    for (int i=0; i<5; i++) {
        [self test];
    }
    
    
    int a = 10;
    
    int const b = 20;
    
    int *p = &a;
    
    int c = 100;
    
    p = &c;
    
    *p = 5;
    
    NSLog(@"%d,%d,%d,%p",a,b,c,p);
    
    UILabel * title = [[UILabel alloc] init];
         title.text = @"Article title";
         title.backgroundColor = UIColor.redColor;
         title.frame = CGRectMake(0, 0, 100, 50);
         [self.view addSubview:title];
        [self changeTitlte:title];
        NSLog(@"%@", title);
    
    int z[3];
    
    SubTest * test = [[SubTest alloc] init];
    
//    [test add:1];
//    [test add:2];
//    [test add:3];
//    [test add:4];
    
//    [[[[test add:1] add:2] add:3] add:4];
    
    test.add(1).add(2).add(3).add(4);
    
    NSLog(@"%d",test.result);
    
    test.frameBlock = ^CGRect(CGSize ScreenSize,CGRect frame) {
        NSLog(@"frame=%@",NSStringFromCGRect(frame));
        return CGRectMake(300, 300, ScreenSize.width, 100);
    };
}

- (void)changeTitlte:(UILabel *)label
{
//    [*label setText: @"New article title"];
//    [*label setBackgroundColor: UIColor.blueColor];
//    [*label removeFromSuperview];
//    *label = nil;
}

- (void)test{
    // static 修饰局部变量时，变量被称为静态局部变量，存储在静态存储区，由于存储在静态存储区，所以这块内存知道程序结束才会销毁，静态局部变量的声明周期是整个源程序，但是他只在声明他的代码块课件，也是就说他的作用域是声明他的代码块
    /**
     
     static
     1、修饰局部变量时，将局部变量本来存储在栈区变为静态存储区，也改变了生命周期
     2、修饰全局变量时，将作用域由整个程序变为自己文件可见
     
     */
    static int a = 0;
    a++;
    NSLog(@"a=%d",a);
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
