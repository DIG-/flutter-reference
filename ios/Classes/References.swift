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

  public func get<T>(_ id: String) throws -> T {
    let item = self.refs[id]
    if item == nil {
      throw ReferenceNotFound(id: id)
    }
    if !(item is T) {
      throw ForceCastException(item!, T.self)
    }
    return item as! T
  }

  public static func get<T>(_ id: String) throws -> T {
    return try shared.get<T>(id)
  }

  internal func clear() {
    self.refs.removeAll()
  }

}
