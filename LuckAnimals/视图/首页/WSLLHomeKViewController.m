//
//  WSLLHomeKViewController.m
//  LuckAnimals
//
//  Created by wsl 王 on 2018/8/8.
//  Copyright © 2018年 wsl 王. All rights reserved.
//

#import "WSLLHomeKViewController.h"
#import "WSLLKHomeCollectionViewCell.h"

@interface WSLLHomeKViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic,strong) UICollectionView * jjLCollectView;

@end

@implementation WSLLHomeKViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self creatUI];
}

#pragma mark - 创建视图
- (void)creatUI
{
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    flowLayout.sectionInset =UIEdgeInsetsMake(0,0,0, 0);
    flowLayout.headerReferenceSize =CGSizeMake(self.view.frame.size.width,0);
    self.jjLCollectView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:flowLayout];
    self.jjLCollectView.backgroundColor = kColorRGB(247, 247, 247);
    self.jjLCollectView.delegate = self;
    self.jjLCollectView.dataSource = self;
    [self.jjLCollectView registerNib:[UINib nibWithNibName:@"WSLLKHomeCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"CELL"];
    [self.jjLCollectView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header"];
    self.jjLCollectView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.jjLCollectView];
    self.jjLCollectView.showsVerticalScrollIndicator = NO;
}

#pragma mark - collectView代理方法
- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return 12;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    WSLLKHomeCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CELL" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat height = self.jjLCollectView.frame.size.width - 20;
    return CGSizeMake(height / 3, (height / 3) + 20);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(5, 5, 5, 5);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 1;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
