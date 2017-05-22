//
//  DLSegmentBarConfig.h
//  XMGSegmentBar
//
//  Created by yesencai@163.com on 2016/11/26.
//  Copyright © 2016年 yesencai@163.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface DLSegmentBarConfig : NSObject


+ (instancetype)defaultConfig;

/** 北京颜色 */
@property (nonatomic, strong) UIColor *segmentBarBackColor;

@property (nonatomic, strong) UIColor *itemNormalColor;
@property (nonatomic, strong) UIColor *itemSelectColor;
@property (nonatomic, strong) UIFont *itemFont;

@property (nonatomic, strong) UIColor *indicatorColor;

@property (nonatomic, assign) CGFloat indicatorHeight;
@property (nonatomic, assign) CGFloat indicatorExtraW;

    // 内部实现, 在这个里面写, 外界, 只负责调用
    // 功能, 改变 itemNormalColor 的值
    //
@property (nonatomic, copy, readonly) DLSegmentBarConfig *(^itemNC)(UIColor *color);
@property (nonatomic, copy, readonly) DLSegmentBarConfig *(^itemSC)(UIColor *color);
@property (nonatomic, copy, readonly) DLSegmentBarConfig *(^indicatorEW)(CGFloat w);
    
    

// 链式编程的改法
//- (DLSegmentBarConfig *(^)(UIColor *color))itemNC;
//- (DLSegmentBarConfig *(^)(UIColor *color))itemSC;



@end
