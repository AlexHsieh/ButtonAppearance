//
//  UIButton+Appearance.h
//
//  Created by Alex Hsieh on 3/3/16.
//  Copyright © 2016 Alex Hsieh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (Appearance)

- (void)setBackgroundColor:(UIColor *)color forState:(UIControlState)state UI_APPEARANCE_SELECTOR;

- (void)setBackgroundGradient:(NSArray *)colorArray forState:(UIControlState)state UI_APPEARANCE_SELECTOR;

- (void)setShadowColor:(UIColor *)color offset:(CGSize)size opacity:(float)opacity radius:(float)radius UI_APPEARANCE_SELECTOR;

- (void)setCornerRadius:(float)radius borderWidth:(float)width borderColor:(UIColor *)color UI_APPEARANCE_SELECTOR;

@end
