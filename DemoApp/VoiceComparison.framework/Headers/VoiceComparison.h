//
//  VoiceComparison.h
//  VoiceComparison
//
//  Copyright © 2019 DigitalGalaxy. All rights reserved.
//

#import <UIKit/UIKit.h>

//! Project version number for VoiceComparison.
FOUNDATION_EXPORT double VoiceComparisonVersionNumber;

//! Project version string for VoiceComparison.
FOUNDATION_EXPORT const unsigned char VoiceComparisonVersionString[];

NS_ASSUME_NONNULL_BEGIN

typedef void (^VoiceComparisonCallback)(NSInteger stage, NSString* text);
typedef enum VoiceComparisonResultFormat { VoiceComparisonResultFormatText, VoiceComparisonResultFormatJson } VoiceComparisonResultFormat;

@interface VoiceComparison : NSObject
+(void)setupWith:(nonnull NSString*)email uuid:(nonnull NSString*)key;
+(NSString*)compareWithResultFormat:(VoiceComparisonResultFormat)format wav1:(nonnull NSString*)wav1 wav2:(nonnull NSString*)wav2 text:(nonnull NSString*)text;
+(void)compareWithResultFormat:(VoiceComparisonResultFormat)format callback:(VoiceComparisonCallback)callback wav1:(nonnull NSString*)wav1 wav2:(nonnull NSString*)wav2 text:(nonnull NSString*)text;
@end

NS_ASSUME_NONNULL_END

