//
//  DMTransliterator.h
//  NumberSpellOutFormatter
//
//  Created by Dmitry Matyukhin on 28/09/2018.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, DMTransliteratorDirection) {
    DMTransliteratorDirection_Forward = 0,
    DMTransliteratorDirection_Reverse = 1,
};

@protocol DMTransliteratorProtocol <NSObject>

- (NSString * _Nonnull) transliterate:(NSString * _Nonnull)str;

@end

@interface DMTransliterator : NSObject<DMTransliteratorProtocol>

+ (NSArray<NSString *> * _Nonnull)availableTransliterations;

- (instancetype _Nullable)initWithId:(NSString * _Nonnull)transliteratorId direction:(DMTransliteratorDirection)direction;

- (NSString * _Nonnull) transliterate:(NSString * _Nonnull)str;

@property (class, nonatomic, assign, readonly) DMTransliterator* toLatin;

+ (NSObject<DMTransliteratorProtocol>*)toLatin:(NSString * _Nonnull)fromLanguage;

@end

NS_ASSUME_NONNULL_END
