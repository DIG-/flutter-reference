import Flutter

extension FlutterPlugin {
  public func handle<T>(
    _ call: FlutterMethodCall,
    _ result: FlutterResult,
    action: (FlutterMethodCall) throws -> T
  ) {
    let content: T
    do {
      content = try action(call)
    } catch {
      result(
        FlutterError(code: "\(type(of: error))", message: error.localizedDescription, details: nil)
      )
      return
    }
    result(content is Void ? nil : content)
  }
}
