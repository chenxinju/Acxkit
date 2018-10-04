//
//  NSString+AxcReplaceRichText.m
//  AxcUIKit
//
//  Created by Axc on 2017/7/6.
//  Copyright © 2017年 Axc_5324. All rights reserved.
//

#import "NSString+AxcReplaceRichText.h"

#import "UIColor+AxcColor.h"

@implementation NSString (AxcReplaceRichText)

- (NSMutableAttributedString *)AxcUI_markWords:(NSString *)markWords
                                     withColor:(UIColor *)color
                                 MarkWordsFont:(UIFont *)font{
    return [self AxcUI_markWords:markWords
                   addAttributes:@{NSFontAttributeName:font,
                                   NSForegroundColorAttributeName:color}
                         options:NSCaseInsensitiveSearch];
}

- (NSMutableAttributedString *)AxcUI_markWords:(NSString *)markWords
                                     withColor:(UIColor *)color{
    return [self AxcUI_markWords:markWords
                   addAttributes:@{NSForegroundColorAttributeName:color}
                         options:NSCaseInsensitiveSearch];
}

- (NSMutableAttributedString *)AxcUI_markWords:(NSString *)markWords
                                 MarkWordsFont:(UIFont *)font{
    return [self AxcUI_markWords:markWords
                   addAttributes:@{NSFontAttributeName:font}
                         options:NSCaseInsensitiveSearch];
}

- (NSMutableAttributedString *)AxcUI_markWords:(NSString *)markWords
                                 addAttributes:(NSDictionary<NSString *, id> *)attrs{
    return [self AxcUI_markWords:markWords
                   addAttributes:attrs
                         options:NSCaseInsensitiveSearch];
}

- (NSMutableAttributedString *)AxcUI_markWords:(NSString *)markWords
                                 MarkWordsFont:(UIFont *)font
                                       options:(NSStringCompareOptions)mask{
    return [self AxcUI_markWords:markWords
                   addAttributes:@{NSFontAttributeName:font}
                         options:mask];
}

- (NSMutableAttributedString *)AxcUI_markWords:(NSString *)markWords
                                     withColor:(UIColor *)color
                                       options:(NSStringCompareOptions)mask{
    return [self AxcUI_markWords:markWords
                   addAttributes:@{NSForegroundColorAttributeName:color}
                         options:mask];
}

- (NSMutableAttributedString *)AxcUI_markWords:(NSString *)markWords
                                     withColor:(UIColor *)color
                                 MarkWordsFont:(UIFont *)font
                                       options:(NSStringCompareOptions)mask{
    return [self AxcUI_markWords:markWords
                   addAttributes:@{NSFontAttributeName:font,
                                   NSForegroundColorAttributeName:color}
                         options:mask];
}

- (NSMutableAttributedString *)AxcUI_markWords:(NSString *)markWords
                                 addAttributes:(NSDictionary<NSString *, id> *)attrs
                                       options:(NSStringCompareOptions)mask{
    if (!markWords) {
        return nil;
    }
    NSMutableAttributedString *mutableAttributedStr = [[NSMutableAttributedString alloc] initWithString:self];
    NSRange searchRange = NSMakeRange(0, [self length]);
    NSRange range;
    //拿到所有的相同字符的range
    while
        ((range = [self rangeOfString:markWords options:mask
                                range:searchRange]).location != NSNotFound) {
            //改变多次搜索时searchRange的位置
            searchRange = NSMakeRange(NSMaxRange(range), [self length] - NSMaxRange(range));
            //设置富文本
            [mutableAttributedStr addAttributes:attrs range:range];
        }
    return mutableAttributedStr;
}

@end
