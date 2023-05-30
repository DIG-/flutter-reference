public class References {

  public static let shared = References()

  private init() {}

  private var refs: [String: AnyObject] = [:]

  public func add<T: AnyObject>(_ t: T) -> String {
    var id = ""
    repeat {
      id = UUID().uuidString
    } while self.refs.keys.contains(id)
    self.refs[id] = t
    return id
  }

  public static func add<T: AnyObject>(_ t: T) -> String {
    return shared.add(t)
  }

  public func remove(_ id: String) -> Bool {
    return self.refs.removeValue(forKey: id) != nil
  }

  public static func remove(_ id: String) -> Bool {
    return shared.remove(id)
  }

  public func get<T>(_: T.Type, _ id: String) throws -> T {
    if let item = self.refs[id] {
      if let typed = item as? T {
        return typed
      }
      throw ForceCastException(item, T.self)
    }
    throw ReferenceNotFound(id: id)
  }

  public func get<T>(_ id: String) throws -> T {
    return try get(T.self, id)
  }

  public static func get<T>(_ id: String) throws -> T {
    return try shared.get(T.self, id)
  }

  public static func get<T>(_ t: T.Type, _ id: String) throws -> T {
    return try shared.get(t, id)
  }

  internal func clear() {
    self.refs.removeAll()
  }

}
