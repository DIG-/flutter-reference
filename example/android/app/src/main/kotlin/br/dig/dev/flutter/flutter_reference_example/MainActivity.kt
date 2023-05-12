package br.dig.dev.flutter.flutter_reference_example

import android.os.Bundle
import io.flutter.embedding.android.FlutterActivity

class MainActivity : FlutterActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        flutterEngine?.plugins?.add(ExamplePlugin())
    }
}
