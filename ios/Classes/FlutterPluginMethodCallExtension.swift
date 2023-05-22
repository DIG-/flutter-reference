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

extension FlutterMethodCall {
  public func argument<T: AnyObject>() throws -> T? {
    if let arg = arguments {
      if arg is T {
        return arg as? T
      } else {
        throw ForceCastException(from: type(of: arguments), T.self)
      }
    } else {
      return nil
    }
  }

  public func argument<T: AnyObject>(_ key: String) throws -> T? {
    if arguments == nil {
      return nil
    }
    let map = arguments as? [String: AnyObject]
    if map == nil {
      throw ForceCastException(arguments! as AnyObject, [String: AnyObject].self)
    }
    let item = map![key]
    if item == nil {
      return nil
    }
    if item is T {
      return item as? T
    }
    throw ForceCastException(item!, T.self)
  }
}
