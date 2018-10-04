//
//  SnapshotScrollViewVC.m
//  TYSnapshotScroll
//
//  Created by Tony on 2016/7/11.
//  Copyright © 2016年 TonyReet. All rights reserved.
//

#import "SnapshotScrollViewVC.h"

@interface SnapshotScrollViewVC ()
<
    UIWebViewDelegate
>

@property (nonatomic,strong) UITableView *tableView;

@property (nonatomic,copy) NSArray *dataSourceArr;
@end

@implementation SnapshotScrollViewVC
- (void)viewDidLoad {
    [super viewDidLoad];


    self.dataSourceArr = @[@"UIWebView保存为图片",@"UITableView保存为图片",@"WKWebView保存为图片",@"UIScrollView保存为图片",@"UICollectionView保存为图片"];
    
    [self tableViewInit];
}


-(void )tableViewInit{
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    
    self.tableView.delegate = (id)self;
    self.tableView.dataSource = (id)self;
    self.tableView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.tableView];
    
    [self.tableView reloadData];
}


#pragma mark - delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSourceArr.count;
}

- (CGFloat )tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellID = @"ViewControllerCell";
    
    UITableViewCell *cell = (UITableViewCell*)[tableView dequeueReusableCellWithIdentifier:cellID];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.textLabel.text = self.dataSourceArr[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UIViewController *nextVc;
    if (indexPath.row == 0) {
        nextVc = [NSClassFromString(@"TYWebViewVc") new];
        
    }else if(indexPath.row == 1){
        nextVc = [NSClassFromString(@"TYTableViewVc") new];
    }else if(indexPath.row == 2){
        nextVc = [NSClassFromString(@"TYWKWebViewVc") new];
    }else if(indexPath.row == 3){
        nextVc = [NSClassFromString(@"TYScrollViewVc") new];
    }else if(indexPath.row == 4){
        nextVc = [NSClassFromString(@"TYCollectionViewVc") new];
    }
    
    if (nextVc != nil) {
        [self.navigationController pushViewController:nextVc animated:YES];
    }
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
@end
