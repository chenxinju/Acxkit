//
//  UIView+AxcBadgeView.m
//  AxcUIKit
//
//  Created by Axc on 2017/7/14.
//  Copyright © 2017年 Axc_5324. All rights reserved.
//

#import "UIView+BadgeInteractionView.h"

#import <objc/runtime.h>

#import "UIView+AxcExtension.h"


static NSString * const kbadgeInteractionView = @"AxcUI_BadgeInteractionView";
static NSString * const kbadgeInteractionPoint = @"axcUI_badgeInteractionPoint";
static NSString * const kbadgeInteractionText = @"axcUI_badgeInteractionText";

@implementation UIView (BadgeInteractionView)


- (void)setAxcUI_badgeInteractionText:(NSString *)axcUI_badgeInteractionText{
    [self willChangeValueForKey:kbadgeInteractionText];
    objc_setAssociatedObject(self, &kbadgeInteractionText,
                             axcUI_badgeInteractionText,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self didChangeValueForKey:kbadgeInteractionText];
    self.axcUI_badgeInteractionView.axcUI_text = axcUI_badgeInteractionText;
}

- (NSString *)axcUI_badgeInteractionText{
    return self.axcUI_badgeInteractionView.axcUI_text;
}


- (void)setAxcUI_badgeInteractionPoint:(CGPoint)axcUI_badgeInteractionPoint{
    [self willChangeValueForKey:kbadgeInteractionPoint];
    objc_setAssociatedObject(self, &kbadgeInteractionPoint,
                             [NSValue valueWithCGPoint:axcUI_badgeInteractionPoint],
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self didChangeValueForKey:kbadgeInteractionPoint];
    self.axcUI_badgeInteractionView.center = axcUI_badgeInteractionPoint;
}

- (CGPoint)axcUI_badgeInteractionPoint{
    return self.axcUI_badgeInteractionView.center;
}



- (void)setAxcUI_badgeInteractionView:(AxcUI_BadgeInteractionView *)axcUI_badgeInteractionView{
    [self willChangeValueForKey:kbadgeInteractionView];
    objc_setAssociatedObject(self, &kbadgeInteractionView,
                             axcUI_badgeInteractionView,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self didChangeValueForKey:kbadgeInteractionView];
}

- (AxcUI_BadgeInteractionView *)axcUI_badgeInteractionView{
    AxcUI_BadgeInteractionView *badgeView = objc_getAssociatedObject(self, &kbadgeInteractionView);
    if (!badgeView) {
        badgeView = [[AxcUI_BadgeInteractionView alloc] init];
        badgeView.axcUI_Size = CGSizeMake(40, 40);
        badgeView.axcUI_X = self.axcUI_Width - badgeView.axcUI_Size.width;
        badgeView.axcUI_Y = 0;
        badgeView.axcUI_font = [UIFont systemFontOfSize:13];
        badgeView.axcUI_text = @"0";
        badgeView.axcUI_hiddenWhenZero = NO;
        [self addSubview:badgeView];
        [self setAxcUI_badgeInteractionView:badgeView];
    }
    return badgeView;
}





@end
