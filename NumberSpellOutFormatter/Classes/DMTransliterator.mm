//
//  DMTransliterator.m
//  NumberSpellOutFormatter
//
//  Created by Dmitry Matyukhin on 28/09/2018.
//

#import "DMTransliterator.h"

#define U_DISABLE_RENAMING 1
#define U_HAVE_LIB_SUFFIX 1
#define U_LIB_SUFFIX_C_NAME_STRING "fg"
#define U_HIDE_DEPRECATED_API
#include "unum.h"
#include "translit.h"
#include "strenum.h"

#import "NSString+Japanese.h"

@interface DMJapaneseTransliterator : NSObject<DMTransliteratorProtocol>

@end

@implementation DMJapaneseTransliterator

- (NSString * _Nonnull) transliterate:(NSString * _Nonnull)str {
    return [str stringByTransliteratingJapaneseToRomajiWithWordSeperator:@" "];
}

@end

@interface DMTransliterator ()
{
    Transliterator *_transliterator;
}

@end

@implementation DMTransliterator

+ (NSArray<NSString *> * _Nonnull)availableTransliterations {
    UErrorCode ec = U_ZERO_ERROR;
    StringEnumeration* avail = Transliterator::getAvailableIDs(ec);
    
    NSMutableArray<NSString *> * list = [NSMutableArray array];
    
    while (const UnicodeString *transId = avail->snext(ec)) {
        const UChar* buf = transId->getBuffer();
        int32_t len = transId->length();
        
        NSString *transIdString = [[NSString alloc] initWithBytes:(void * _Nonnull)buf length:len * sizeof(UChar) encoding:NSUTF16LittleEndianStringEncoding];
        
        [list addObject:transIdString];
    }
    
    delete avail;
    
    return list;
}

+ (instancetype)toLatin {
    return [[DMTransliterator alloc] initWithId:@"Any-Latin" direction:DMTransliteratorDirection_Forward];
}

+ (NSObject<DMTransliteratorProtocol>*)toLatin:(NSString * _Nonnull)fromLanguage {
    if ([fromLanguage hasPrefix:@"ja"]) {
        return [[DMJapaneseTransliterator alloc] init];
    }
    
    return [DMTransliterator toLatin];
}

- (instancetype _Nullable)initWithId:(NSString * _Nonnull)transliteratorId direction:(DMTransliteratorDirection)direction {
    UErrorCode ec = U_ZERO_ERROR;
    
    NSData* idData = [transliteratorId dataUsingEncoding:NSUTF16LittleEndianStringEncoding];

    UnicodeString idString = UnicodeString((UChar *)idData.bytes, (int32_t)transliteratorId.length);
    
    Transliterator *t = Transliterator::createInstance(idString, (UTransDirection) direction, ec);
    
    if (!t) {
        return nil;
    }
    
    _transliterator = t;
    return self;
}

- (void)dealloc
{
    if (_transliterator) {
        delete _transliterator;
    }
}

- (NSString * _Nonnull) transliterate:(NSString * _Nonnull)str {
    
    NSData* strData = [str dataUsingEncoding:NSUTF16LittleEndianStringEncoding];
    
    UnicodeString uniStr = UnicodeString((UChar *)strData.bytes, (int32_t)str.length);
    
    _transliterator->transliterate(uniStr);
    
    NSString *resultString = [[NSString alloc] initWithBytes:(void * _Nonnull)uniStr.getBuffer()
                                                      length:uniStr.length() * sizeof(UChar)
                                                    encoding:NSUTF16LittleEndianStringEncoding];
    
    return resultString;
}

@end
