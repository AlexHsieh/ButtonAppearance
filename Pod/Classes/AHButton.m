//
//  AHButton.m
//  Pods
//
//  Created by Alex Hsieh on 3/9/16.
//
//

#import "AHButton.h"
#import <objc/runtime.h>

@interface AHButtonAttribute : NSObject
@property (copy) UIColor *shadowColor;
@property (assign) CGSize shadowOffset;
@property (assign) float shadowOpacity;
@property (assign) float shadowRadius;
@property (assign) float cornerRadius;
@property (copy) UIColor *borderColor;
@property (assign) float borderWidth;

@end

@implementation AHButtonAttribute
@end


@interface AHButton ()
@property (nonatomic,strong) NSMutableDictionary *shadowAttributesDictionary;
@end

@implementation AHButton

- (void)setHighlighted:(BOOL)highlighted {
    [super setHighlighted:highlighted];

    AHButtonAttribute *attr = [self shadowAttributeForState:highlighted?UIControlStateHighlighted:UIControlStateNormal];
    [self setButtonAttr:attr];
}

- (void)setSelected:(BOOL)selected {
    [super setSelected:selected];
    
    AHButtonAttribute *attr = [self shadowAttributeForState:selected?UIControlStateSelected:UIControlStateNormal];
    [self setButtonAttr:attr];
}


- (void)setShadowColor:(UIColor *)color offset:(CGSize)size opacity:(float)opacity radius:(float)radius forState:(UIControlState)state {

    AHButtonAttribute *shadow = [self shadowAttributeForState:state];
    shadow.shadowColor = color;
    shadow.shadowOffset = size;
    shadow.shadowOpacity = opacity;
    shadow.shadowRadius = radius;

    if (state == UIControlStateNormal) {
        [self setButtonAttr:shadow];
    }
    [self setShadowAttributes:shadow forState:state];
    
}

- (void)setCornerRadius:(float)radius borderWidth:(float)width borderColor:(UIColor *)color forState:(UIControlState)state {
    
    AHButtonAttribute *shadow = [self shadowAttributeForState:state];
    shadow.cornerRadius = radius;
    shadow.borderColor = color;
    shadow.borderWidth = width;
    
    if (state == UIControlStateNormal) {
        [self setButtonAttr:shadow];
    }
    [self setShadowAttributes:shadow forState:state];
    
    NSMutableDictionary *dic = objc_getAssociatedObject(self, NSSelectorFromString(@"backgroundImageDictionary"));

    if (dic) {
        [dic enumerateKeysAndObjectsUsingBlock:^(NSNumber *key, UIImage *image, BOOL *stop){
            NSMethodSignature *sig = [AHButton instanceMethodSignatureForSelector:NSSelectorFromString(@"saveAndSetBackgroundImage:forState:")];
            NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:sig];
            [invocation setTarget:self];
            [invocation setSelector:NSSelectorFromString(@"saveAndSetBackgroundImage:forState:")];
            [invocation setArgument:&image atIndex:2];
            UIControlState state = key.unsignedIntegerValue;
            [invocation setArgument:&state atIndex:3];
            [invocation invoke];
        }];
    }
}

- (void)setButtonAttr:(AHButtonAttribute *)attr {

    self.layer.shadowPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:attr.cornerRadius].CGPath;
    self.layer.shadowColor = attr.shadowColor.CGColor;
    self.layer.shadowOffset = attr.shadowOffset;
    self.layer.shadowOpacity = attr.shadowOpacity;
    self.layer.shadowRadius = attr.shadowRadius;
    
    self.layer.cornerRadius = attr.cornerRadius;
    self.layer.borderColor = attr.borderColor.CGColor;
    self.layer.borderWidth = attr.borderWidth;

}

- (void)setShadowAttributes:(AHButtonAttribute *)attr forState:(UIControlState)state {
    if (!attr) {
        return;
    }
    
    if (state == UIControlStateNormal) {
        [self.shadowAttributesDictionary setObject:attr forKey:@(UIControlStateNormal)];
    }
    if (state & UIControlStateHighlighted) {
        [self.shadowAttributesDictionary setObject:attr forKey:@(UIControlStateHighlighted)];
    }
    if (state & UIControlStateSelected) {
        [self.shadowAttributesDictionary setObject:attr forKey:@(UIControlStateSelected)];
    }
    if (state & UIControlStateFocused) {
        [self.shadowAttributesDictionary setObject:attr forKey:@(UIControlStateFocused)];
    }
    
}

- (AHButtonAttribute *)shadowAttributeForState:(UIControlState)state {
    AHButtonAttribute *attr = [self.shadowAttributesDictionary objectForKey:@(state)];
    if (!attr) {
        attr = [[AHButtonAttribute alloc]init];
    }
    return attr;
}

- (NSMutableDictionary *)shadowAttributesDictionary {
    if (!_shadowAttributesDictionary) {
        _shadowAttributesDictionary = [NSMutableDictionary dictionary];
    }
    return _shadowAttributesDictionary;
}


@end
