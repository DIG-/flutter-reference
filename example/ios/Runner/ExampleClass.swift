@objc protocol ExampleClass {
  var name: String { get }
}

class Apple: ExampleClass {
  var name: String = "Apple"
}

class Orange: ExampleClass {
  var name: String = "Orange"
}

class Banana: ExampleClass {
  var name: String = "Banana"
}

class NotFruit: ExampleClass {
  var name: String
  init(_ name: String) {
    self.name = name
  }
}
