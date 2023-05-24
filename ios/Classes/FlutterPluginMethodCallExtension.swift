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
  public func argument<T: Any>() throws -> T? {
    if let argument = arguments {
      if let typed = argument as? T {
        return typed
      }
      throw ForceCastException(argument, T.self)
    } else {
      return nil
    }
  }

  public func argument<T: Any>(_ key: String) throws -> T? {
    if arguments == nil {
      return nil
    }
    if let map = arguments as? [String: Any] {
      if let item = map[key] {
        if let typed = item as? T {
          return typed
        }
        throw ForceCastException(item, T.self)
      } else {
        return nil
      }
    }
    throw ForceCastException(arguments!, [String: Any].self)
  }
}

extension Optional where Wrapped: Any {
  public func unwrap() throws -> Wrapped {
    if let item = self {
      return item
    }
    throw UnwrapException(name: "Optional")
  }

  public func unwrap(_ message: () -> String) throws -> Wrapped {
    if let item = self {
      return item
    }
    throw UnwrapException(message())
  }
}
