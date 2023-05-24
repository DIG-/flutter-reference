import Flutter
import UIKit

public class FlutterReferencePlugin: NSObject, FlutterPlugin {
  private let refs = References.shared
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(
      name: "flutter_reference", binaryMessenger: registrar.messenger())
    let instance = FlutterReferencePlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "dispose":
      handle(call, result, action: { it in return try refs.remove(it.argument().unwrap()) })
    default:
      result(FlutterMethodNotImplemented)
    }
  }
}
