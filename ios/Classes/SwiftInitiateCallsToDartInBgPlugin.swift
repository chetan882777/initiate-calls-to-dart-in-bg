import Flutter
import UIKit

public class SwiftInitiateCallsToDartInBgPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "initiate_calls_to_dart_in_bg", binaryMessenger: registrar.messenger())
    let instance = SwiftInitiateCallsToDartInBgPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    result("iOS " + UIDevice.current.systemVersion)
  }
}
