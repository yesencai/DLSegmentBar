//
//  DLSegmentBarConfig.m
//  XMGSegmentBar
//
//  Created by yesencai@163.com on 2016/11/26.
//  Copyright © 2016年 yesencai@163.com. All rights reserved.
//

#import "DLSegmentBarConfig.h"

@implementation DLSegmentBarConfig

+ (instancetype)defaultConfig {
    
    DLSegmentBarConfig *config = [[DLSegmentBarConfig alloc] init];
    config.segmentBarBackColor = [UIColor clearColor];
    config.itemFont = [UIFont systemFontOfSize:15];
    config.itemNormalColor = [UIColor lightGrayColor];
    config.itemSelectColor = [UIColor redColor];
    
    config.indicatorColor = [UIColor redColor];
    config.indicatorHeight = 2;
    config.indicatorExtraW = 10;
    
    return config;
    
}

    - (DLSegmentBarConfig *(^)(UIColor *))itemNC
    {
        
        return ^(UIColor *color) {
            self.itemNormalColor = color;
            return self;
        };
        
    }
    
    - (DLSegmentBarConfig *(^)(UIColor *))itemSC
    {
        
        return ^(UIColor *color) {
            self.itemSelectColor = color;
            return self;
        };
        
    }

    
    - (DLSegmentBarConfig *(^)(CGFloat))indicatorEW
    {
        return ^(CGFloat w) {
            self.indicatorExtraW = w;
            return self;
        };
    }
    

//- (DLSegmentBarConfig *(^)(UIColor *))itemNC {
//
//    return ^(UIColor *color){
//        self.itemNormalColor = color;
//        return self;
//    };
//
//}
//
//-(DLSegmentBarConfig *(^)(UIColor *))itemSC {
//    return ^(UIColor *color){
//        self.itemSelectColor = color;
//        return self;
//    };
//}


@end
