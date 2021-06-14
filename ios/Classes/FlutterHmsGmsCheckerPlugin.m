#import "FlutterHmsGmsCheckerPlugin.h"
#if __has_include(<flutter_hms_gms_checker/flutter_hms_gms_checker-Swift.h>)
#import <flutter_hms_gms_checker/flutter_hms_gms_checker-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "flutter_hms_gms_checker-Swift.h"
#endif

@implementation FlutterHmsGmsCheckerPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFlutterHmsGmsCheckerPlugin registerWithRegistrar:registrar];
}
@end
