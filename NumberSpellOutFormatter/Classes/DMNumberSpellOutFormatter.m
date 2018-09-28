//
//  DMNumberSpellOutFormatter.m
//
//  Created by Dmitry Matyukhin on 29/01/2017.
//  Copyright © 2017 Dmitry Matyukhin. All rights reserved.
//

#import "DMNumberSpellOutFormatter.h"

#define U_DISABLE_RENAMING 1
#define U_HAVE_LIB_SUFFIX 1
#define U_LIB_SUFFIX_C_NAME_STRING "fg"
#define U_HIDE_DEPRECATED_API
#include "unum.h"

@interface DMNumberSpellOutFormatter ()
{
    UNumberFormat *_nf;
    
    BOOL _hasFetchedRuleSets;
    NSArray<NSString *> *_cachedRuleSets;
}

@end

@implementation DMNumberSpellOutFormatter

- (instancetype _Nonnull)init {
    DMNumberSpellOutFormatter* currentLocale = [self initWithLocale:[NSLocale currentLocale]];
    if (currentLocale) {
        return currentLocale;
    }
    
    return [self initWithLocale:[NSLocale localeWithLocaleIdentifier:@"en"]];
}

- (instancetype _Nullable)initWithLocale:(NSLocale * _Nonnull)locale {
    self = [super init];
    if (self == nil) return nil;
    
    UErrorCode status = U_ZERO_ERROR;
    const char *localeId = [locale.localeIdentifier cStringUsingEncoding:NSASCIIStringEncoding];
    _nf = unum_open(UNUM_SPELLOUT, nil, 0, localeId, nil, &status);
    
    if (NULL == _nf) {
        return nil;
    }
    
    if (status == U_USING_DEFAULT_WARNING) {
        unum_close(_nf);
        _nf = NULL;
        
        return nil;
    }
    
    return self;
}

- (void)dealloc {
    if (_nf) {
        unum_close(_nf);
        _nf = NULL;
    }
}

- ( NSArray<NSString *> * _Nonnull )availableRuleSets {
    if (_hasFetchedRuleSets) {
        return _cachedRuleSets;
    }
    
    UErrorCode status = U_ZERO_ERROR;
    
    
    _hasFetchedRuleSets = YES;
    
    int32_t len = unum_getTextAttribute(_nf, UNUM_PUBLIC_RULESETS, nil, 0, &status);
    
    if (len == 0) {
        _cachedRuleSets = [NSArray array];
        return _cachedRuleSets;
    }
    
    UChar *ubuffer = (UChar *)malloc((len + 1) * sizeof(UChar));
    if (ubuffer == NULL) {
        @throw NSMallocException;
    }
    
    status = U_ZERO_ERROR;
    unum_getTextAttribute(_nf, UNUM_PUBLIC_RULESETS, ubuffer, len + 1, &status);
    
    NSString *ruleSetsString = [[NSString alloc] initWithBytesNoCopy:ubuffer length:len * sizeof(UChar) encoding:NSUTF16LittleEndianStringEncoding freeWhenDone:YES];
    
    if ([ruleSetsString hasSuffix:@";"]) {
        ruleSetsString = [ruleSetsString substringToIndex:ruleSetsString.length - 1];
    }
    
    _cachedRuleSets = [ruleSetsString componentsSeparatedByString:@";"];
    
    return _cachedRuleSets;
}

- (BOOL)setRuleSet:(NSString *)ruleSetName {
    NSData* ruleSetData = [ruleSetName dataUsingEncoding:NSUTF16LittleEndianStringEncoding];
    
    UErrorCode status = U_ZERO_ERROR;
    unum_setTextAttribute(_nf,
                          UNUM_DEFAULT_RULESET,
                          (const UChar *)ruleSetData.bytes, (int32_t)ruleSetData.length / sizeof(UChar),
                          &status);
    
    return U_SUCCESS(status);
}

- (NSString * _Nullable)stringFromInt:(int32_t)number {
    UErrorCode status = U_ZERO_ERROR;
    int32_t len = unum_format(_nf, number, nil, 0, nil, &status);
    if (len == 0) {
        return nil;
    }
    
    UChar *buffer = (UChar *)malloc((len + 1) * sizeof(UChar));
    
    status = U_ZERO_ERROR;
    unum_format(_nf, number, buffer, len + 1, nil, &status);
    
    return [[NSString alloc] initWithBytesNoCopy:buffer length:len * sizeof(UChar)
                                        encoding:NSUTF16LittleEndianStringEncoding freeWhenDone:YES];
}

@end
