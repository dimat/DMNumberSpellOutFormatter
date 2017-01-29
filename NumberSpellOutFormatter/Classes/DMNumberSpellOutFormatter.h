//
//  OrdinalFormatter.h
//  ordinalNumbersiOS
//
//  Created by Dmitry Matyukhin on 29/01/2017.
//  Copyright © 2017 Dmitry Matyukhin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DMNumberSpellOutFormatter : NSObject

- (instancetype _Nonnull)init;
- (instancetype _Nullable)initWithLocale:(NSLocale * _Nonnull)locale;
- (NSArray<NSString *> * _Nonnull)availableRuleSets;
- (BOOL)setRuleSet:(NSString * _Nonnull)ruleSetName;
- (NSString * _Nullable)stringFromInt:(int32_t)number;

@end
