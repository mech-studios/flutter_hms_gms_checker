import Flutter
import UIKit

public class SwiftFlutterHmsGmsCheckerPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "flutter_hms_gms_checker", binaryMessenger: registrar.messenger())
    let instance = SwiftFlutterHmsGmsCheckerPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
   result(false)
  }
}
