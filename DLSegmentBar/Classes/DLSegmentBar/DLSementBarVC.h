//
//  XMGSementBarVC.h
//  XMGSegmentBar
//
//  Created by yesencai@163.com on 2016/11/26.
//  Copyright © 2016年 yesencai@163.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DLSegmentBar.h"
@interface DLSementBarVC : UIViewController


@property (nonatomic, weak) DLSegmentBar *segmentBar;


- (void)setUpWithItems: (NSArray <NSString *>*)items childVCs: (NSArray <UIViewController *>*)childVCs;


@end
