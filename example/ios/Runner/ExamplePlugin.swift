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
      handle(
        call, result,
        action: { it in
          let instance: ExampleClass
          switch Int.random(in: 0..<4) {
          case 0: instance = Apple()
          case 1: instance = Banana()
          case 2: instance = Orange()
          case 3: instance = NotFruit("NotFruit")
          default: instance = NotFruit("Error")
          }
          return References.add(instance)
        })

    case "name":
      handle(
        call, result,
        action: { it in
          let instance: ExampleClass = try References.get(it.arguments as! String)
          return instance.name
        })

    default:
      result(FlutterMethodNotImplemented)
    }
  }
}
