//
//  XMGSementBarVC.m
//  XMGSegmentBar
//
//  Created by yesencai@163.com on 2016/11/26.
//  Copyright © 2016年 yesencai@163.com. All rights reserved.
//

#import "DLSementBarVC.h"
#import "UIView+DLSegmentBar.h"

@interface DLSementBarVC ()<DLSegmentBarDelegate, UIScrollViewDelegate>

@property (nonatomic, weak) UIScrollView *contentView;

@end

@implementation DLSementBarVC
- (DLSegmentBar *)segmentBar {
    if (!_segmentBar) {
        DLSegmentBar *segmentBar = [DLSegmentBar segmentBarWithFrame:CGRectZero];
        segmentBar.delegate = self;
        segmentBar.backgroundColor = [UIColor brownColor];
        [self.view addSubview:segmentBar];
        _segmentBar = segmentBar;
        
    }
    return _segmentBar;
}

- (UIScrollView *)contentView {
    if (!_contentView) {
        
        UIScrollView *contentView = [[UIScrollView alloc] init];
        contentView.delegate = self;
        contentView.pagingEnabled = YES;
        [self.view addSubview:contentView];
        _contentView = contentView;
    }
    return _contentView;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
}


- (void)setUpWithItems: (NSArray <NSString *>*)items childVCs: (NSArray <UIViewController *>*)childVCs {
    
    
    NSAssert(items.count != 0 || items.count == childVCs.count, @"个数不一致, 请自己检查");
    
    self.segmentBar.items = items;
    
    [self.childViewControllers makeObjectsPerformSelector:@selector(removeFromParentViewController)];
    
    // 添加几个自控制器
    // 在contentView, 展示子控制器的视图内容
    for (UIViewController *vc in childVCs) {
        [self addChildViewController:vc];
    }
    
    //
    self.contentView.contentSize = CGSizeMake(items.count * self.view.dl_width, 0);
    
    self.segmentBar.selectIndex = 0;
    
    
    
}


- (void)showChildVCViewsAtIndex: (NSInteger)index {
    
    if (self.childViewControllers.count == 0 || index < 0 || index > self.childViewControllers.count - 1) {
        return;
    }
    
    UIViewController *vc = self.childViewControllers[index];
    vc.view.frame = CGRectMake(index * self.contentView.dl_width, 0, self.contentView.dl_width, self.contentView.dl_height);
    [self.contentView addSubview:vc.view];
    
    // 滚动到对应的位置
    [self.contentView setContentOffset:CGPointMake(index * self.contentView.dl_width, 0) animated:YES];
    
}


- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    if (self.segmentBar.superview == self.view) {
        self.segmentBar.frame = CGRectMake(0, 60, self.view.dl_width, 35);
        
        CGFloat contentViewY = self.segmentBar.dl_y + self.segmentBar.dl_height;
        CGRect contentFrame = CGRectMake(0, contentViewY, self.view.dl_width, self.view.dl_height - contentViewY);
        self.contentView.frame = contentFrame;
        self.contentView.contentSize = CGSizeMake(self.childViewControllers.count * self.view.dl_width, 0);

        return;
    }
    
    
    CGRect contentFrame = CGRectMake(0, 0,self.view.dl_width,self.view.dl_height);
    self.contentView.frame = contentFrame;
     self.contentView.contentSize = CGSizeMake(self.childViewControllers.count * self.view.dl_width, 0);
    
    
    // 其他的控制器视图, 大小
    // 遍历所有的视图, 重新添加, 重新进行布局
    // 注意: 1个视图
    //
    
    self.segmentBar.selectIndex = self.segmentBar.selectIndex;
    
}

#pragma mark - 选项卡代理方法
- (void)segmentBar:(DLSegmentBar *)segmentBar didSelectIndex:(NSInteger)toIndex fromIndex:(NSInteger)fromIndex
{
    NSLog(@"%zd----%zd", fromIndex, toIndex);
    [self showChildVCViewsAtIndex:toIndex];
}


#pragma mark - UIScrollViewDelegate

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    
    // 计算最后的索引
    NSInteger index = self.contentView.contentOffset.x / self.contentView.dl_width;
    
    //    [self showChildVCViewsAtIndex:index];
    self.segmentBar.selectIndex = index;
    
}

@end
