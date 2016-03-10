# ButtonAppearance

[![CI Status](http://img.shields.io/travis/Alex Hsieh/ButtonAppearance.svg?style=flat)](https://travis-ci.org/Alex Hsieh/ButtonAppearance)
[![Version](https://img.shields.io/cocoapods/v/ButtonAppearance.svg?style=flat)](http://cocoapods.org/pods/ButtonAppearance)
[![License](https://img.shields.io/cocoapods/l/ButtonAppearance.svg?style=flat)](http://cocoapods.org/pods/ButtonAppearance)
[![Platform](https://img.shields.io/cocoapods/p/ButtonAppearance.svg?style=flat)](http://cocoapods.org/pods/ButtonAppearance)

## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.

If you need different border color or shadow color on different control state, subclass AHButton is required.

![Button shadow changed with state](/image/1.gif)
````objective-C
[self.buttonFromStoryBoard setShadowColor:shadowColor  offset:CGSizeMake(0, 3.0) opacity:1.0 radius:1.0 forState:UIControlStateNormal];
[self.buttonFromStoryBoard setShadowColor:buttonColor  offset:CGSizeMake(0, 3.0) opacity:1.0 radius:1.0 forState:UIControlStateHighlighted];
````

![Button border changed with state](/image/2.gif)
````objective-C
[self.buttonFromStoryBoard2 setCornerRadius:10.0 borderWidth:1.0 borderColor:[UIColor blackColor] forState:UIControlStateNormal];
[self.buttonFromStoryBoard2 setCornerRadius:10.0 borderWidth:1.0 borderColor:[UIColor grayColor] forState:UIControlStateHighlighted];
````

If you only need to change UIButton background color or background gradient on different control state, use category UIbutton+Appearance. 

![Button background color changed with state](/image/3.gif)
````objective-C
[button3 setBackgroundColor:[UIColor yellowColor] forState:UIControlStateNormal];
[button3 setBackgroundColor:[UIColor greenColor] forState:UIControlStateHighlighted];
````

![Button background gradient changed with state](/image/4.gif)
````objective-C
[button4 setBackgroundGradient:@[[UIColor grayColor],[UIColor blackColor]] forState:UIControlStateNormal];
[button4 setBackgroundGradient:@[[UIColor lightGrayColor],[UIColor blackColor]] forState:UIControlStateHighlighted];
````

## Requirements
ARC only; iOS 5.0+ / OSX 10.7+

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
