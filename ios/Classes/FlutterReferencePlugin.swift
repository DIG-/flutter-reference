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
      result(refs.remove(call.arguments as! String))
    default:
      result(FlutterMethodNotImplemented)
    }
  }
}
