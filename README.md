# NumberSpellOutFormatter

[![CI Status](http://img.shields.io/travis/Dmitry Matyukhin/NumberSpellOutFormatter.svg?style=flat)](https://travis-ci.org/Dmitry Matyukhin/NumberSpellOutFormatter)
[![Version](https://img.shields.io/cocoapods/v/NumberSpellOutFormatter.svg?style=flat)](http://cocoapods.org/pods/NumberSpellOutFormatter)
[![License](https://img.shields.io/cocoapods/l/NumberSpellOutFormatter.svg?style=flat)](http://cocoapods.org/pods/NumberSpellOutFormatter)
[![Platform](https://img.shields.io/cocoapods/p/NumberSpellOutFormatter.svg?style=flat)](http://cocoapods.org/pods/NumberSpellOutFormatter)


Allows to spell out numbers in different languages and with many options, such as,
ordinal numbers and whereever it is applicable, in masculine or feminine and in different
grammatical cases.


## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

Objective-C
```
NSLocale *selectedLocale = [NSLocale localeWithLocaleIdentifier:@"ru"];
DMNumberSpellOutFormatter *formatter = [[DMNumberSpellOutFormatter alloc] initWithLocale: selectedLocale];

[formatter setRuleSet:@"%spellout-ordinal-neuter-genitive"];

NSLog(@"%s", [formatter stringFromInt: 55]);
```

Output:
```
пятьдесят пятого
```

## Requirements

## Installation

NumberSpellOutFormatter is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "NumberSpellOutFormatter"
```

## Author

Dmitry Matyukhin, dimatu@gmail.com

## License

NumberSpellOutFormatter is available under the MIT license. See the LICENSE file for more info.
