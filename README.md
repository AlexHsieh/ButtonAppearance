# ButtonAppearance

[![CI Status](http://img.shields.io/travis/Alex Hsieh/ButtonAppearance.svg?style=flat)](https://travis-ci.org/Alex Hsieh/ButtonAppearance)
[![Version](https://img.shields.io/cocoapods/v/ButtonAppearance.svg?style=flat)](http://cocoapods.org/pods/ButtonAppearance)
[![License](https://img.shields.io/cocoapods/l/ButtonAppearance.svg?style=flat)](http://cocoapods.org/pods/ButtonAppearance)
[![Platform](https://img.shields.io/cocoapods/p/ButtonAppearance.svg?style=flat)](http://cocoapods.org/pods/ButtonAppearance)

## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.

If you only need to change UIButton background color or background gradient  on different control state, use category UIbutton+Appearance. 




If you need different border color or shadow color on different control state, subclass AHButton is required.

![Button shadow changed with state][/image/1.gif]
'[self.buttonFromStoryBoard setShadowColor:shadowColor  offset:CGSizeMake(0, 3.0) opacity:1.0 radius:1.0 forState:UIControlStateNormal];'
'[self.buttonFromStoryBoard setShadowColor:buttonColor  offset:CGSizeMake(0, 3.0) opacity:1.0 radius:1.0 forState:UIControlStateHighlighted];'

![Button border changed with state][/image/2.gif]
'[self.buttonFromStoryBoard2 setCornerRadius:10.0 borderWidth:1.0 borderColor:[UIColor blackColor] forState:UIControlStateNormal];'
'[self.buttonFromStoryBoard2 setCornerRadius:10.0 borderWidth:1.0 borderColor:[UIColor grayColor] forState:UIControlStateHighlighted];'



## Requirements

## Installation

ButtonAppearance is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "ButtonAppearance"
```

## Author

Alex Hsieh, alex.kyhsieh@gmail.com

## License

ButtonAppearance is available under the MIT license. See the LICENSE file for more info.
