//
//  AHButton.h
//  Pods
//
//  Created by Alex Hsieh on 3/9/16.
//
//

#import <UIKit/UIKit.h>
#import "UIButton+Appearance.h"

@interface AHButton : UIButton

- (void)setShadowColor:(UIColor *)color offset:(CGSize)size opacity:(float)opacity radius:(float)radius forState:(UIControlState)state UI_APPEARANCE_SELECTOR;

- (void)setCornerRadius:(float)radius borderWidth:(float)width borderColor:(UIColor *)color forState:(UIControlState)state UI_APPEARANCE_SELECTOR;

@end
