@file:Suppress("UnusedReceiverParameter", "unused")

package br.dig.dev.flutter.flutter_reference

import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import kotlinx.coroutines.MainScope
import kotlinx.coroutines.launch

@FunctionalInterface
interface MethodCallHandlerAction<T> {
    fun action(call: MethodCall): T?
}

fun <T> MethodCallHandler.handle(
    call: MethodCall,
    result: MethodChannel.Result,
    action: MethodCallHandlerAction<T>
) {
    val content = try {
        action.action(call)
    } catch (t: Throwable) {
        result.error(t.javaClass.name, t.message, null)
        return
    }
    result.success(if (content is Unit) null else content)
}

fun <T> MethodCallHandler.handle(
    call: MethodCall,
    result: MethodChannel.Result,
    action: suspend (MethodCall) -> T
) {
    MainScope().launch {
        val content = try {
            action(call)
        } catch (t: Throwable) {
            result.error(t.javaClass.name, t.message, null)
            return@launch
        }
        result.success(if (content is Unit) null else content)
    }
}