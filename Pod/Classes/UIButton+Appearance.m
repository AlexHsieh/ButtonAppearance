//
//  UIButton+Appearance.m
//
//  Created by Alex Hsieh on 3/3/16.
//  Copyright © 2016 Alex Hsieh. All rights reserved.
//

#import "UIButton+Appearance.h"
#import <objc/runtime.h>

@implementation UIButton (Appearance)

- (void)setBackgroundColor:(UIColor *)color forState:(UIControlState)state {
    [self saveAndSetBackgroundImage:[self imageWithColor:color] forState:state];
}


- (void)setBackgroundGradient:(NSArray *)colorArray forState:(UIControlState)state {
    [self saveAndSetBackgroundImage:[self imageWithGradient:[self gradient:colorArray]] forState:state];
}

- (void)setShadowColor:(UIColor *)color offset:(CGSize)size opacity:(float)opacity radius:(float)radius {
    
    self.layer.shadowPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:self.layer.cornerRadius].CGPath;
    self.layer.shadowColor = color.CGColor;
    self.layer.shadowOffset = size;
    self.layer.shadowOpacity = opacity;
    self.layer.shadowRadius = radius;
    
}

- (void)setCornerRadius:(float)radius borderWidth:(float)width borderColor:(UIColor *)color {
    self.layer.cornerRadius = radius;
    self.layer.borderColor = color.CGColor;
    self.layer.borderWidth = width;
    
    if (self.layer.shadowColor) {
        self.layer.shadowPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:self.layer.cornerRadius].CGPath;
    }
    
    [self.backgroundImageDictionary enumerateKeysAndObjectsUsingBlock:^(NSNumber *key, UIImage *image, BOOL *stop){
        [self saveAndSetBackgroundImage:image forState:key.unsignedIntegerValue];
    }];
}

- (void)saveAndSetBackgroundImage:(UIImage *)image forState:(UIControlState)state {
    if (image ) {
        NSMutableDictionary *dic = self.backgroundImageDictionary;
        if (state == UIControlStateNormal) {
            dic[@(UIControlStateNormal)] = image;
        }
        if (state & UIControlStateHighlighted) {
            dic[@(UIControlStateHighlighted)] = image;
        }
        if (state & UIControlStateSelected) {
            dic[@(UIControlStateSelected)] = image;
        }
        if (state & UIControlStateFocused) {
            dic[@(UIControlStateFocused)] = image;
        }
        self.backgroundImageDictionary = dic;
    }
    [self setBackgroundImageClippedToBounds:image forState:state];
}

- (void)setBackgroundImageClippedToBounds:(UIImage *)image forState:(UIControlState)state
{
    
    if (!( ! self.clipsToBounds && self.layer.cornerRadius != 0.0f )) {
        // Nothing special to do
        [self setBackgroundImage:image forState:state];
        return;
    }
    
    // Begin a new image that will be the new image with the rounded corners
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, NO,  [UIScreen mainScreen].scale);
    
    [[UIBezierPath bezierPathWithRoundedRect:self.bounds
                                cornerRadius:self.layer.cornerRadius] addClip];
    
    [image drawInRect:self.bounds];
    
    UIImage* clippedBackgroundImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    [self setBackgroundImage:clippedBackgroundImage forState:state];
}

- (UIImage *)imageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, [UIScreen mainScreen].scale);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *outputImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();    
    return outputImage;
}

- (UIImage *)imageWithGradient:(CAGradientLayer *)layer {
    UIGraphicsBeginImageContextWithOptions(layer.frame.size, NO, [UIScreen mainScreen].scale);
    
    [layer renderInContext:UIGraphicsGetCurrentContext()];
    
    UIImage *outputImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return outputImage;
}

- (CAGradientLayer*)gradient:(NSArray *)colorArray{
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = CGRectMake(0, 0, 1.0f, 1.0f);
    NSMutableArray *cgColorArr = [NSMutableArray arrayWithCapacity:colorArray.count];
    for (UIColor *color in colorArray) {
        if (![color isKindOfClass:[UIColor class]]) {
            return nil;
        }
        [cgColorArr addObject:(id)color.CGColor];
    }
    
    NSMutableArray *locArr = [NSMutableArray arrayWithCapacity:cgColorArr.count];
    float gap = cgColorArr.count-1 == 0 ? 1.0/cgColorArr.count-1 : 1;
    for (int i = 0; i < cgColorArr.count; i++) {
        [locArr addObject:@(0+gap*i)];
    }
    
    gradientLayer.colors = cgColorArr.copy;
    gradientLayer.locations = locArr.copy;
    
    return gradientLayer;
}

- (void)setBackgroundImageDictionary:(NSMutableDictionary *)object {
    objc_setAssociatedObject(self, @selector(backgroundImageDictionary), object, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSMutableDictionary *)backgroundImageDictionary {
    NSMutableDictionary *dic = objc_getAssociatedObject(self, @selector(backgroundImageDictionary));
    if (!dic) {
        dic = [NSMutableDictionary dictionary];
    }
    return dic;
}

@end
