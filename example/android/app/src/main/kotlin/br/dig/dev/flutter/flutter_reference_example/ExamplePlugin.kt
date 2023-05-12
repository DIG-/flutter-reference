package br.dig.dev.flutter.flutter_reference_example

import br.dig.dev.flutter.flutter_reference.References
import br.dig.dev.flutter.flutter_reference.handle
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import java.security.SecureRandom

class ExamplePlugin : FlutterPlugin, MethodChannel.MethodCallHandler {

    private lateinit var channel: MethodChannel

    override fun onAttachedToEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(binding.binaryMessenger, "example_plugin")
        channel.setMethodCallHandler(this)
    }

    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        return when (call.method) {
            "create" -> handle(call, result) {
                val instance = when (SecureRandom().nextInt(4)) {
                    0 -> Apple
                    1 -> Banana
                    2 -> Orange
                    3 -> NotFruit("NotFruit")
                    else -> NotFruit("Error")
                }
                References.add(instance)
            }

            "name" -> handle(call, result) {
                val instance = References.get<ExampleClass>(it.arguments<String>()!!)
                instance.name
            }

            else -> result.notImplemented()
        }
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }

}