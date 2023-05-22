public class UnwrapException: LocalizedError {
  public let errorDescription: String?
  public init(_ description: String) {
    self.errorDescription = description
  }
  public convenience init(name: String) {
    self.init("\(name) is nil")
  }
}

public class ForceCastException: LocalizedError {
  public let errorDescription: String?
  public init(_ description: String?) {
    self.errorDescription = description
  }
  public convenience init<T>(_ item: AnyObject, _ target: T.Type) {
    self.init("\(type(of: item)) cannot be cast into \(target)")
  }
}

public class ReferenceNotFound: LocalizedError {
  public let errorDescription: String?
  internal init(id: String) {
    self.errorDescription = "Reference #\(id) not found"
  }
}
