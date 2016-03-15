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

/**  Setup shadow without state is workable only for UIButton
 *   not workable for AHButton. For AHButton and its subclass use setShadowColor:offset:opacity:radius:forState: instead
 */
- (void)setShadowColor:(UIColor *)color offset:(CGSize)size opacity:(float)opacity radius:(float)radius UI_APPEARANCE_SELECTOR;

/**  Setup border and corner radius without state is workable only for UIButton
 *   not workable for AHButton. For AHButton and its subclass use setCornerRadius:borderWidth:borderColor:forState: instead
 */
- (void)setCornerRadius:(float)radius borderWidth:(float)width borderColor:(UIColor *)color UI_APPEARANCE_SELECTOR;

@end
