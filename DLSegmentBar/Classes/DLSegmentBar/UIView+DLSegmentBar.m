//
//  UIView+DLSegmentBar.m
//
//  Created by yesencai@163.com on 16/8/2.
//  Copyright © 2016年 yesencai@163.com. All rights reserved.
//

#import "UIView+DLSegmentBar.h"

@implementation UIView (DLSegmentBar)



-(void)setDl_centerX:(CGFloat)dl_centerX {
    CGPoint center = self.center;
    center.x = dl_centerX;
    self.center = center;
}

-(CGFloat)dl_centerX {
    return self.center.x;
}

-(void)setDl_centerY:(CGFloat)dl_centerY{
    CGPoint center = self.center;
    center.y = dl_centerY;
    self.center = center;
}

-(CGFloat)dl_centerY {
    return self.center.y;
}


-(CGFloat)dl_x{
    return self.frame.origin.x;
}

-(void)setDl_x:(CGFloat)dl_x {
    CGRect temp = self.frame;
    temp.origin.x = dl_x;
    self.frame = temp;
}

-(CGFloat)dl_y{
    return self.frame.origin.y;
}

-(void)setDl_y:(CGFloat)dl_y {
    CGRect temp = self.frame;
    temp.origin.y = dl_y;
    self.frame = temp;
}

-(CGFloat)dl_width{
    return self.frame.size.width;
}

-(void)setDl_width:(CGFloat)dl_width {
    CGRect temp = self.frame;
    temp.size.width = dl_width;
    self.frame = temp;
}


-(CGFloat)dl_height{
    return self.frame.size.height;
}

-(void)setDl_height:(CGFloat)dl_height {
    CGRect temp = self.frame;
    temp.size.height = dl_height;
    self.frame = temp;
}


@end
