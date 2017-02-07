# NumberSpellOutFormatter

[![CI Status](http://img.shields.io/travis/dimat/DMNumberSpellOutFormatter.svg?style=flat)](https://travis-ci.org/dimat/DMNumberSpellOutFormatter)
[![Version](https://img.shields.io/cocoapods/v/NumberSpellOutFormatter.svg?style=flat)](http://cocoapods.org/pods/NumberSpellOutFormatter)
[![License](https://img.shields.io/cocoapods/l/NumberSpellOutFormatter.svg?style=flat)](http://cocoapods.org/pods/NumberSpellOutFormatter)
[![Platform](https://img.shields.io/cocoapods/p/NumberSpellOutFormatter.svg?style=flat)](http://cocoapods.org/pods/NumberSpellOutFormatter)

Allows to spell out numbers in different languages and with many options. Unlike the standard `NSNumberFormatter` it also supports ordinal numbers with any additional modes that are applicable for specific language, such as gender (feminine and masculine) and grammatical cases.

## IMPORTANT
At the moment library uses ICU library that is shipped with iOS, however, the used API is not part of the iOS's publicly supported subsets.
Therefore, last time when I tried to submit an app with it to AppStore, I received:

> **Non-public API usage:**
> 
> The app references non-public symbols in Frameworks/NumberSpellOutFormatter.framework/NumberSpellOutFormatter: _unum_close, _unum_format, _unum_getTextAttribute, _unum_open, _unum_setTextAttribute


The solution is to recompile ICU4C and embed it with the Framework. It should be done by the end of March, but if anyone could contribute, it would be very welcomed.

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

Objective-C
```Objective-C
NSLocale *selectedLocale = [NSLocale localeWithLocaleIdentifier:@"ru"];
DMNumberSpellOutFormatter *formatter = [[DMNumberSpellOutFormatter alloc] initWithLocale: selectedLocale];

[formatter setRuleSet:@"%spellout-ordinal-neuter-genitive"];

NSLog(@"%s", [formatter stringFromInt: 55]);
```

Swift:

If there is `use_frameworks!` in `Podfile`, then add

```swift
import NumberSpellOutFormatter
```

```swift
if let formatter = DMNumberSpellOutFormatter(locale: Locale(identifier: "ru")) {
    formatter.setRuleSet("%spellout-ordinal-neuter-genitive")
    print(formatter.string(from: 55)!)
}
```

Output:
```
пятьдесят пятого
```

For English locale:
```
fifty-fifth
```

For example, here is the list of supported rule sets for some languages:

### English

- Numbering Year
- Numbering
- Numbering Verbose
- Cardinal
- Cardinal Verbose
- Ordinal
- Ordinal Verbose

### Spanish

- Numbering Year
- Numbering
- Cardinal Masculine
- Cardinal Feminine
- Ordinal Masculine Adjective
- Ordinal Masculine Plural
- Ordinal Masculine
- Ordinal Feminine Plural
- Ordinal Feminine

### Italian

- Numbering Year
- Numbering
- Cardinal Masculine
- Cardinal Feminine
- Ordinal Masculine
- Ordinal Feminine

### Russian

- Numbering Year
- Numbering
- Cardinal Masculine
- Cardinal Neuter
- Cardinal Feminine
- Cardinal Plural
- Cardinal Masculine Genitive
- Cardinal Neuter Genitive
- Cardinal Feminine Genitive
- Cardinal Plural Genitive
- Cardinal Masculine Dative
- Cardinal Neuter Dative
- Cardinal Feminine Dative
- Cardinal Plural Dative
- Cardinal Masculine Accusative
- Cardinal Neuter Accusative
- Cardinal Feminine Accusative
- Cardinal Plural Accusative
- Cardinal Masculine Locative
- Cardinal Neuter Locative
- Cardinal Feminine Locative
- Cardinal Plural Locative
- Cardinal Masculine Ablative
- Cardinal Neuter Ablative
- Cardinal Feminine Ablative
- Cardinal Plural Ablative
- Ordinal Masculine
- Ordinal Neuter
- Ordinal Feminine
- Ordinal Plural
- Ordinal Masculine Genitive
- Ordinal Neuter Genitive
- Ordinal Feminine Genitive
- Ordinal Plural Genitive
- Ordinal Masculine Dative
- Ordinal Neuter Dative
- Ordinal Feminine Dative
- Ordinal Plural Dative
- Ordinal Masculine Accusative
- Ordinal Neuter Accusative
- Ordinal Feminine Accusative
- Ordinal Plural Accusative
- Ordinal Masculine Locative
- Ordinal Neuter Locative
- Ordinal Feminine Locative
- Ordinal Plural Locative
- Ordinal Masculine Ablative
- Ordinal Neuter Ablative
- Ordinal Feminine Ablative
- Ordinal Plural Ablative

### French

- Numbering Year
- Numbering
- Cardinal Masculine
- Cardinal Feminine
- Ordinal Masculine Plural
- Ordinal Masculine
- Ordinal Feminine Plural
- Ordinal Feminine

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
