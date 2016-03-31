# ButtonAppearance

[![CI Status](http://img.shields.io/travis/AlexHsieh/ButtonAppearance.svg?style=flat)](https://travis-ci.org/AlexHsieh/ButtonAppearance)
[![Version](https://img.shields.io/cocoapods/v/ButtonAppearance.svg?style=flat)](http://cocoapods.org/pods/ButtonAppearance)
[![License](https://img.shields.io/cocoapods/l/ButtonAppearance.svg?style=flat)](http://cocoapods.org/pods/ButtonAppearance)
[![Platform](https://img.shields.io/cocoapods/p/ButtonAppearance.svg?style=flat)](http://cocoapods.org/pods/ButtonAppearance)

## Usage


If you need different border color or shadow color on different control state, subclass AHButton is required.

![Shadow changed with state](/image/1.gif)
````objective-C
[self.buttonFromStoryBoard setShadowColor:shadowColor  offset:CGSizeMake(0, 3.0) opacity:1.0 radius:1.0 forState:UIControlStateNormal];
[self.buttonFromStoryBoard setShadowColor:buttonColor  offset:CGSizeMake(0, 3.0) opacity:1.0 radius:1.0 forState:UIControlStateHighlighted];
````

![Border changed with state](/image/2.gif)
````objective-C
[self.buttonFromStoryBoard2 setCornerRadius:10.0 borderWidth:1.0 borderColor:[UIColor blackColor] forState:UIControlStateNormal];
[self.buttonFromStoryBoard2 setCornerRadius:10.0 borderWidth:1.0 borderColor:[UIColor grayColor] forState:UIControlStateHighlighted];
````

===========================

If you only need to change UIButton background color or background gradient on different control state, use category UIbutton+Appearance. 

![Background color changed with state](/image/3.gif)
````objective-C
[button3 setBackgroundColor:[UIColor yellowColor] forState:UIControlStateNormal];
[button3 setBackgroundColor:[UIColor greenColor] forState:UIControlStateHighlighted];
````

![Background gradient changed with state](/image/4.gif)
````objective-C
[button4 setBackgroundGradient:@[[UIColor grayColor],[UIColor blackColor]] forState:UIControlStateNormal];
[button4 setBackgroundGradient:@[[UIColor lightGrayColor],[UIColor blackColor]] forState:UIControlStateHighlighted];
````

![Border and shadow changed with state:](/image/5.gif)
````objective-C
AHButton *button5 = [[AHButton alloc] initWithFrame:CGRectMake(0, 0, 280, 45)];
[button5 setShadowColor:normalShadowColor offset:CGSizeMake(0, 3.0) opacity:1.0 radius:0 forState:UIControlStateNormal];
[button5 setShadowColor:highlightShadowColor offset:CGSizeMake(0, 3.0) opacity:1.0 radius:0 forState:UIControlStateHighlighted];
[button5 setCornerRadius:5.0 borderWidth:1.0 borderColor:[UIColor blackColor] forState:UIControlStateNormal];
[button5 setCornerRadius:10.0 borderWidth:1.0 borderColor:[UIColor brownColor] forState:UIControlStateHighlighted];
````

===========================

There are couple hint here if you can't find it work well.
1. Use UIButtonTypeCustom
2. If you use autolayout, archieved button size may not be the same as you see on the nib. It could be this reason to make button background not right. Try log it to see if the size is what you expected.



## Requirements
ARC only; iOS 8.0+ 

## Installation

via Cocoa pods
ButtonAppearance is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "ButtonAppearance"
```

## Author

Alex Hsieh, alex.kyhsieh@gmail.com

## License

ButtonAppearance is available under the MIT license. See the LICENSE file for more info.
