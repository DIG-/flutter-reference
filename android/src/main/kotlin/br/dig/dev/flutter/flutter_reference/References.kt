package br.dig.dev.flutter.flutter_reference

import java.util.UUID

object References {

    @JvmStatic
    private val refs = mutableMapOf<String, Any>()

    @JvmStatic
    fun <T : Any> add(t: T): String {
        var id: String
        do {
            id = UUID.randomUUID().toString()
        } while (refs.containsKey(id))
        refs[id] = t
        return id
    }

    @JvmStatic
    fun remove(id: String): Boolean {
        return refs.remove(id) != null
    }

    @JvmStatic
    fun <T : Any> get(id: String, clazz: Class<T>): T {
        val item = requireNotNull(refs[id]) { "Reference #$id not found" }
        if (!clazz.isInstance(item)) {
            throw ClassCastException("${item.javaClass.canonicalName} cannot be cast to ${clazz.canonicalName}")
        }
        @Suppress("UNCHECKED_CAST")
        return item as T
    }

    inline fun <reified T : Any> get(id: String): T = get(id, T::class.java)

    @JvmStatic
    internal fun clear() {
        refs.clear()
    }

}