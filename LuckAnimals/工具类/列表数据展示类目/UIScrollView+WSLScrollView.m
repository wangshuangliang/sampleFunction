//
//  UIScrollView+WSLScrollView.m
//  WSLTool
//
//  Created by wsl 王 on 2018/8/4.
//  Copyright © 2018年 wsl 王. All rights reserved.
//

#import "UIScrollView+WSLScrollView.h"

static const void *dataArrKey = "dataArrKey";
static const void *delagateKey = "delegateKey";
static const void *curPageKey = "curPageKey";
static const void *warmingStrKey = "warmingStrKey";

@implementation UIScrollView (WSLScrollView)

//设置属性
//数组
- (NSMutableArray *)dataArr
{
    return objc_getAssociatedObject(self, dataArrKey);
}

- (void)setDataArr:(NSMutableArray *)dataArr
{
    objc_setAssociatedObject(self, dataArrKey, dataArr, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

//提醒字符串
- (NSString *)warmingStr
{
    return objc_getAssociatedObject(self, warmingStrKey);
}

- (void)setWarmingStr:(NSString *)warmingStr
{
    objc_setAssociatedObject(self, warmingStrKey, warmingStr, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

//代理
- (id<WSLScrollViewDelegate>)wSLScrollViewDelegate
{
    WSLWeakObjectContainer *container = objc_getAssociatedObject(self, delagateKey);
    return container.weakObject;
}

- (void)setWSLScrollViewDelegate:(id<WSLScrollViewDelegate>)wSLScrollViewDelegate
{
    if (wSLScrollViewDelegate) {
        
        objc_setAssociatedObject(self, delagateKey,[[WSLWeakObjectContainer alloc] initWithWeakObject:wSLScrollViewDelegate], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
}

//设置当前页数
- (int)curPage
{
    return [objc_getAssociatedObject(self, curPageKey) intValue];
}

- (void)setCurPage:(int)curPage
{
    objc_setAssociatedObject(self, curPageKey, @(curPage), OBJC_ASSOCIATION_ASSIGN);
}

//执行下拉刷新
- (void)beginRefreshWithNeedLoadMore:(BOOL)isLoadMore WarmingStr:(NSString *)warmingStr
{
    //初始化数组
    if (!self.dataArr) {
        
        self.dataArr = [[NSMutableArray alloc] init];
    }
    self.warmingStr = @"";
    self.emptyDataSetSource = self;
    self.emptyDataSetDelegate = self;
    self.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        
        //执行网络请求
        self.curPage = 1;
        [self getDataFromRequesWithRefreshType:(RefreshNewStart) WarmingStr:warmingStr];
        self.mj_footer.state = MJRefreshStateIdle;
    }];
    [self.mj_header beginRefreshing];
    
    if (isLoadMore) {
        
        self.mj_footer =  [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
            //执行网络请求
            self.curPage ++;
            [self getDataFromRequesWithRefreshType:(RefreshLoadMore) WarmingStr:warmingStr];
        }];
    }
    //先隐藏上拉加载
    self.mj_footer.hidden = YES;
}

//执行网络请求
- (void)getDataFromRequesWithRefreshType:(RefreshType)refreshType
                                 WarmingStr:(NSString *)warmingStr

{
    if (self.wSLScrollViewDelegate && [self.wSLScrollViewDelegate respondsToSelector:@selector(getRequestParaSet:refreshType:)]) {
        
        NSDictionary * dic = [self.wSLScrollViewDelegate getRequestParaSet:self refreshType:refreshType];
        NSLog(@"==%@",dic);
    }
    if (refreshType == RefreshNewStart){
        
        [self.dataArr removeAllObjects];
    }
    //获取model对象class(放网络请求)
    if (self.wSLScrollViewDelegate && [self.wSLScrollViewDelegate respondsToSelector:@selector(getModelClass:)]) {
        
        NSString * modelClass = [self.wSLScrollViewDelegate getModelClass:self];
        Class c = NSClassFromString(modelClass);
        for (int i = 0; i < 10; i ++) {
            
            id model = [c yy_modelWithJSON:@{@"name":@"王小二",@"describ":@"获取model对象class(放网络请求),获取model对象class(放网络请求),获取model对象class(放网络请求),获取model对象class(放网络请求)"}];
            [self.dataArr addObject:model];
        }
        self.warmingStr = warmingStr;
    }
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        if ([self isKindOfClass:[UITableView class]]) {
            
            [(UITableView *)self reloadData];
        }
        
        if ([self isKindOfClass:[UICollectionView class]]) {
            
            [(UICollectionView *)self reloadData];
        }
        [self.mj_header endRefreshing];
        [self.mj_footer endRefreshing];
    });
}

//代理方法
#pragma mark - 空数据显示
- (NSAttributedString *)descriptionForEmptyDataSet:(UIScrollView *)scrollView {
    
    NSString *text = self.warmingStr;
    if (self.dataArr.count == 0) {
        
        self.mj_footer.hidden = YES;
    } else {
        
        self.mj_footer.hidden = NO;
    }
    NSMutableParagraphStyle *paragraph = [NSMutableParagraphStyle new];
    paragraph.lineBreakMode = NSLineBreakByWordWrapping;
    paragraph.alignment = NSTextAlignmentCenter;
    
    NSDictionary *attributes = @{
                                 NSFontAttributeName:[UIFont systemFontOfSize:14.0f],
                                 NSForegroundColorAttributeName:[UIColor lightGrayColor],
                                 NSParagraphStyleAttributeName:paragraph
                                 };
    
    return [[NSAttributedString alloc] initWithString:text attributes:attributes];
}

- (BOOL)emptyDataSetShouldAllowScroll:(UIScrollView *)scrollView
{
    return YES;
}

@end

#pragma mark - WSLWeakObjectContainer
@interface WSLWeakObjectContainer()

@end

//辅助类
@implementation WSLWeakObjectContainer

- (instancetype)initWithWeakObject:(id)object
{
    self = [super init];
    if (self) {
        _weakObject = object;
    }
    return self;
}

@end
