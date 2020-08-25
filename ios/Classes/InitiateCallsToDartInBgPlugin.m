#import "InitiateCallsToDartInBgPlugin.h"
#if __has_include(<initiate_calls_to_dart_in_bg/initiate_calls_to_dart_in_bg-Swift.h>)
#import <initiate_calls_to_dart_in_bg/initiate_calls_to_dart_in_bg-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "initiate_calls_to_dart_in_bg-Swift.h"
#endif

@implementation InitiateCallsToDartInBgPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftInitiateCallsToDartInBgPlugin registerWithRegistrar:registrar];
}
@end
