//
//  ViewController.m
//  My3DTouch
//
//  Created by admin on 16/9/7.
//  Copyright © 2016年 admin. All rights reserved.
//

#import "ZSRViewController.h"
#import "ZSRPreviewController.h"
#import "ZSRDetailController.h"
#import "ZSRBaiduController.h"

#define kScreenWidth  [UIScreen mainScreen].bounds.size.width
#define kScreenHeight  [UIScreen mainScreen].bounds.size.height

@interface ZSRViewController ()<UIViewControllerPreviewingDelegate,UITableViewDataSource,UITableViewDelegate>

@property (strong, nonatomic)UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *dataSource;
@property (nonatomic, strong) NSIndexPath *indexPath;

@end

@implementation ZSRViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCompose target:self action:@selector(gotoBaidu)];
    
    self.dataSource = [[NSMutableArray alloc]init];
    for (int i = 0; i < 30; i++) {
        [self.dataSource addObject:[NSString stringWithFormat:@"数据%d",i]];
    }
    [self createTableView];
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 9) {
        if (self.traitCollection.forceTouchCapability == UIForceTouchCapabilityAvailable){
            [self registerForPreviewingWithDelegate:self sourceView:self.tableView];
        }
    }
}

-(void)createTableView{
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    tableView.dataSource = self;
    tableView.delegate = self;
    self.tableView = tableView;
    [self.view addSubview:tableView];
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSource.count;
}


#pragma mark - UITableViewDelegate

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString* ID = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.text = [self.dataSource objectAtIndex:[indexPath row]];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    ZSRDetailController *VC = [[ZSRDetailController alloc] init];
    VC.index = indexPath.row;
    [self.navigationController pushViewController:VC animated:YES];
}


#pragma mark - UIViewControllerPreviewingDelegate
-(void)previewingContext:(id<UIViewControllerPreviewing>)previewingContext commitViewController:(UIViewController *)viewControllerToCommit{
    [self tableView:self.tableView didSelectRowAtIndexPath:self.indexPath];

}

-(UIViewController *)previewingContext:(id<UIViewControllerPreviewing>)previewingContext viewControllerForLocation:(CGPoint)location{

    NSIndexPath* indexPath = [self.tableView indexPathForRowAtPoint:location];
    UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
    self.indexPath = indexPath;
    
    if (!cell) {
        return nil;
    }
    previewingContext.sourceRect = cell.frame;
    ZSRPreviewController *vc = [[ZSRPreviewController alloc] init];
    vc.preferredContentSize = CGSizeMake(kScreenWidth, indexPath.row * 30 + 30);
    vc.index = [indexPath row];
    
    return vc;
}

#pragma mark - private

-(BOOL)prefersStatusBarHidden{
    return YES;
}

-(void)gotoBaidu{
    ZSRBaiduController *controller = [[ZSRBaiduController alloc] init];
    [self.navigationController pushViewController:controller animated:YES];
}
@end
