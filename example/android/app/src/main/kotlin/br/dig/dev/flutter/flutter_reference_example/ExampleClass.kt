package br.dig.dev.flutter.flutter_reference_example

sealed interface ExampleClass {
    val name: String
}

object Apple : ExampleClass {
    override val name: String
        get() = "Apple"
}

object Orange : ExampleClass {
    override val name: String
        get() = "Orange"
}

object Banana : ExampleClass {
    override val name: String
        get() = "Banana"
}

class NotFruit(override val name: String) : ExampleClass