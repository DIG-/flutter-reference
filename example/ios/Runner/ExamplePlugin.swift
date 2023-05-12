import flutter_reference

class ExamplePlugin: NSObject, FlutterPlugin {
  static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(
      name: "example_plugin", binaryMessenger: registrar.messenger())
    let instance = ExamplePlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "create":
      let instance: ExampleClass
      switch Int.random(in: 0..<4) {
      case 0: instance = Apple()
      case 1: instance = Banana()
      case 2: instance = Orange()
      case 3: instance = NotFruit("NotFruit")
      default: instance = NotFruit("Error")
      }
      result(References.add(instance))

    case "name":
      let instance: ExampleClass = References.get(call.arguments as! String)
      result(instance.name)

    default:
      result(FlutterMethodNotImplemented)
    }
  }
}
